import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:garno_music/features/main/domain/models/track.dart';
import 'package:garno_music/features/main/domain/repository/a_together_listening_repository.dart';
import 'package:garno_music/features/main/domain/services/a_together_listening_service.dart';
import 'package:signalr_netcore/hub_connection_builder.dart';
import 'package:signalr_netcore/signalr_client.dart';

import '../../../../common/models/server_response.dart';
import '../../../authorization/domain/services/authorization_api_service.dart';
import '../../../profile/domain/models/user.dart';

class TogetherListeningService implements ITogetherListeningService {
  final ITogetherListeningRepository _repository;
  bool _isMaintainer = false;
  StreamController<User> _streamNewJoinedController = StreamController<User>();
  StreamController<String> _streamStartPlayingController =
      StreamController<String>();
  StreamController<String> _streamPausePlayingController =
      StreamController<String>();
  StreamController<String> _streamResumePlayingController =
      StreamController<String>();
  StreamController _streamDisconnectedController = StreamController();
  StreamController<String> _streamDisconnectedUserController =
      StreamController<String>();

  HubConnection? _hubConnection;
  String _code = '';
  final List<User> _users = [];

  TogetherListeningService({required ITogetherListeningRepository repository})
      : _repository = repository;

  @override
  bool get isMaintainer => _isMaintainer;
  @override
  Stream<User> get onNewJoined => _streamNewJoinedController.stream;
  @override
  Stream<String> get onStartPlaying => _streamStartPlayingController.stream;
  @override
  Stream<String> get onPausePlaying => _streamPausePlayingController.stream;
  @override
  Stream<String> get onResumePlaying => _streamResumePlayingController.stream;
  @override
  Stream get onDisconnected => _streamDisconnectedController.stream;
  @override
  Stream<String> get onDisconnectedUser =>
      _streamDisconnectedUserController.stream;

  @override
  bool isConnected() {
    if (_hubConnection == null) {
      return false;
    }

    return _hubConnection!.state == HubConnectionState.Connected;
  }

  @override
  String getCode() {
    return _code;
  }

  @override
  List<User> getUsers() => _users;

  @override
  Future<String> createRoom() async {
    await _buildHubConnection();

    var res = await _hubConnection!
        .invoke('CreateRoom', args: [AuthorizationService.currentUser!.email]);
    _code = res.toString();

    _configureStream();
    _isMaintainer = true;
    return _code;
  }

  @override
  Future<(bool isSuccses, String error)> connectToRoom(String code) async {
    try {
      await _buildHubConnection();

      _code = code;
      var usersJson = await _hubConnection!.invoke('JoinRoom',
          args: [code, AuthorizationService.currentUser!.email]);

      if (usersJson.toString().startsWith('ERROR;')) {
        return (false, usersJson.toString().replaceFirst("ERROR;", ""));
      }
      _users.addAll(List.from(jsonDecode(usersJson.toString()))
          .map((i) => User.fromJson(i))
          .toList());

      _configureStream();
      _isMaintainer = false;
      return (true, '');
    } on Exception catch (e) {
      debugPrint(e.toString());
      return (false, e.toString());
    }
  }

  @override
  Future disconnectFromRoom() async {
    _users.clear();
    _code = '';
    _flushStream();
    await _hubConnection?.stop();
    _hubConnection = null;
  }

  @override
  Future playTogether(Track track) async {
    var res = await _hubConnection!
        .invoke('StartPlayingTrack', args: [_code, jsonEncode(track.toJson())]);
    debugPrint(res.toString());
  }

  @override
  Future resumePlaying() async {
    await _hubConnection!.invoke('ResumePlayingTrack', args: [_code]);
  }

  @override
  Future stopPlaying() async {
    await _hubConnection!.invoke('StopPlayingTrack', args: [_code]);
  }

  Future _buildHubConnection() async {
    if (_hubConnection != null) {
      await _hubConnection!.stop();
    }

    _hubConnection = HubConnectionBuilder()
        .withUrl('http://192.168.0.183:5065/togetherListening')
        .build();

    await _hubConnection!.start();
  }

  void _configureStream() {
    _hubConnection!.on('NEW_JOINED', (data) {
      var user = User.fromJson(jsonDecode(data!.first));
      _users.add(user);
      _streamNewJoinedController.sink.add(user);
    });

    _hubConnection!.on('START_PLAY', (data) {
      _streamStartPlayingController.sink.add(data!.first.toString());
    });

    _hubConnection!.on('RESUME_PLAY', (data) {
      _streamResumePlayingController.sink
          .add(data?.firstOrNull?.toString() ?? '');
    });

    _hubConnection!.on('PAUSE_PLAY', (data) {
      _streamPausePlayingController.sink
          .add(data?.firstOrNull?.toString() ?? '');
    });

    _hubConnection!.on('DISCONNECTED', (data) {
      _streamDisconnectedController.sink.add(0);
    });

    _hubConnection!.on('USER_DISCONNECTED', (data) {
      _streamDisconnectedUserController.sink
          .add(data?.firstOrNull.toString() ?? '');
    });
  }

  void _flushStream() {
    _streamNewJoinedController.close();
    _streamStartPlayingController.close();
    _streamPausePlayingController.close();
    _streamResumePlayingController.close();
    _streamDisconnectedController.close();
    _streamDisconnectedUserController.close();

    _streamNewJoinedController = StreamController<User>();
    _streamStartPlayingController = StreamController<String>();
    _streamPausePlayingController = StreamController<String>();
    _streamResumePlayingController = StreamController<String>();
    _streamDisconnectedController = StreamController();
    _streamDisconnectedUserController = StreamController<String>();
  }
}

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garno_music/features/main/domain/models/track.dart';
import 'package:garno_music/features/main/domain/repository/a_together_listening_repository.dart';
import 'package:garno_music/features/main/domain/services/a_together_listening_service.dart';
import 'package:signalr_netcore/hub_connection_builder.dart';
import 'package:signalr_netcore/signalr_client.dart';

import '../../../../common/models/server_response.dart';

class TogetherListeningService implements ITogetherListeningService {
  final ITogetherListeningRepository _repository;
  final StreamController<String> _streamNewJoinedController =
      StreamController<String>();
  final StreamController<String> _streamStartPlayingController =
      StreamController<String>();
  final StreamController<String> _streamPausePlayingController =
      StreamController<String>();
  final StreamController<String> _streamResumePlayingController =
      StreamController<String>();
  HubConnection? _hubConnection;
  String _code = '';

  TogetherListeningService({required ITogetherListeningRepository repository})
      : _repository = repository;

  Stream<String> get onNewJoined => _streamNewJoinedController.stream;
  Stream<String> get onStartPlaying => _streamStartPlayingController.stream;
  Stream<String> get onPausePlaying => _streamPausePlayingController.stream;
  Stream<String> get onResumePlaying => _streamResumePlayingController.stream;

  @override
  bool isConnected() {
    if (_hubConnection == null) {
      return false;
    }

    return _hubConnection!.state == HubConnectionState.Connected;
  }

  @override
  Future<ServerResponse<String>> getCode() async {
    var res = _repository.getCode();
    return res;
  }

  @override
  Future connectToRoom(String code) async {
    try {
      if (_hubConnection != null) {
        await _hubConnection!.stop();
      }
      _code = code;
      _hubConnection = HubConnectionBuilder()
          .withUrl('http://192.168.0.183:5065/togetherListening')
          .build();

      await _hubConnection!.start();

      Future.microtask(() async =>
          await _hubConnection!.invoke('JoinRoom', args: [code, 'testname']));

      _hubConnection!.on('NEW_JOINED', (data) {
        _streamNewJoinedController.sink.add(data!.first.toString());
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
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Future playTogether(Track track) async {
    Future.microtask(() async => await _hubConnection!.invoke(
        'StartPlayingTrack',
        args: [_code, jsonEncode(track.toJson())]));
  }

  @override
  void resumePlaying() {
    Future.microtask(() async =>
        await _hubConnection!.invoke('ResumePlayingTrack', args: [_code]));
  }

  @override
  void stopPlaying() {
    Future.microtask(() async =>
        await _hubConnection!.invoke('StopPlayingTrack', args: [_code]));
  }
}

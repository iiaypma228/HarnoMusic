import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:garno_music/features/main/domain/models/track.dart';
import 'package:meta/meta.dart';

import '../../../profile/domain/models/user.dart';
import '../../domain/services/a_player_service.dart';
import '../../domain/services/a_together_listening_service.dart';

part 'player_event.dart';
part 'player_state.dart';

class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  final IPlayerService _service;
  final ITogetherListeningService _togetherService;
  final List<StreamSubscription> _subscriptions = [];

  PlayerBloc(this._service, this._togetherService) : super(PlayerInitial()) {
    on<LoadLastTrackEvent>(_onPlayerInitial);
    on<PlayTrackEvent>(_onPlayTrack);
    on<PausePlayingEvent>(_onPauseTrack);
    on<ResumePlayerEvent>(_onResumeTrack);
    on<JoinToRoomEvent>(_onJoinRoomEvent);
    on<CreateRoomEvent>(_onCreateRoom);
    on<GetRoomStateEvent>(_onLoadRoomState);
    on<LeaveRoomEvent>(_onLeaveRoom);
    on<_UserJoinedEvent>((event, emit) {
      emit(UserConnectedToRoom(user: event.user));
    });
    on<_UserDisconnectedEvent>((event, emit) {
      emit(UserDisconnectedFromRoom(user: event.user));
    });
  }

  Future _onPlayerInitial(
      LoadLastTrackEvent event, Emitter<PlayerState> emit) async {
    var lastTrack = await _service.getLastTrack();
    if (lastTrack != null) {
      lastTrack.imageSource = Image.network(lastTrack.image);
      emit(PlayingStopState(track: lastTrack));
    }
  }

  Future _onPlayTrack(PlayTrackEvent event, Emitter<PlayerState> emit) async {
    if (_togetherService.isConnected() && _togetherService.isMaintainer) {
      await _togetherService.playTogether(event.track);
    }
    await _service.play(event.track);
    emit(StartPlayingTrackState(track: event.track));
  }

  Future _onPauseTrack(
      PausePlayingEvent event, Emitter<PlayerState> emit) async {
    if (_togetherService.isConnected() && _togetherService.isMaintainer) {
      await _togetherService.stopPlaying();
    }
    await _service.pause();
    emit(PlayingStopState(track: _service.currentTrack!));
  }

  Future _onResumeTrack(
      ResumePlayerEvent event, Emitter<PlayerState> emit) async {
    if (_togetherService.isConnected() && _togetherService.isMaintainer) {
      await _togetherService.resumePlaying();
    }
    await _service.resume();
    emit(PlayingResumeState(track: _service.currentTrack!));
  }

  Future _onLoadRoomState(
      GetRoomStateEvent event, Emitter<PlayerState> emit) async {
    emit(RoomStateLoaded(
        code: _togetherService.getCode(), users: _togetherService.getUsers()));
  }

  Future _onJoinRoomEvent(
      JoinToRoomEvent event, Emitter<PlayerState> emit) async {
    emit(ConnectingToRoomState());
    var isSuccess = await _togetherService.connectToRoom(event.code);
    if (!isSuccess.$1) {
      emit(ConnectingToRoomError(error: isSuccess.$2));
      return;
    }

    //start play
    _subscriptions.add(_togetherService.onStartPlaying.listen((data) async {
      var track = Track.fromJson(jsonDecode(data));
      track.imageSource = Image.network(track.image);
      //await _service.play(track);
      add(PlayTrackEvent(track: track));
    }));

    //pause play
    _subscriptions.add(_togetherService.onPausePlaying.listen((data) async {
      //await _service.pause();
      add(PausePlayingEvent());
    }));

    //resume play
    _subscriptions.add(_togetherService.onResumePlaying.listen((data) async {
      await _service.resume();
      add(ResumePlayerEvent());
    }));

    //new join
    _subscriptions.add(_togetherService.onNewJoined.listen((user) {
      add(_UserJoinedEvent(user: user));
    }));

    //disconnected
    _subscriptions.add(_togetherService.onDisconnected.listen((data) async {
      add(LeaveRoomEvent());
    }));

    //disconnected user
    _subscriptions.add(_togetherService.onDisconnectedUser.listen((data) async {
      add(_UserDisconnectedEvent(user: User.fromJson(jsonDecode(data))));
    }));

    emit(ConnectingToRoomSuccess(
        code: event.code, users: _togetherService.getUsers()));
  }

  Future _onCreateRoom(CreateRoomEvent event, Emitter<PlayerState> emit) async {
    emit(RoomCreatingState());
    var code = await _togetherService.createRoom();
    //await Future.delayed(const Duration(seconds: 2));
    _subscriptions.add(_togetherService.onNewJoined.listen((user) {
      add(_UserJoinedEvent(user: user));
    }));
    emit(RoomCreatedState(code: code));
  }

  Future _onLeaveRoom(LeaveRoomEvent event, Emitter<PlayerState> emit) async {
    for (var subscription in _subscriptions) {
      await subscription.cancel();
    }
    _subscriptions.clear();
    await _togetherService.disconnectFromRoom();
    await _onLoadRoomState(GetRoomStateEvent(), emit);
  }
}

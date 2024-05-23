import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:garno_music/features/main/domain/models/track.dart';
import 'package:meta/meta.dart';

import '../../domain/services/a_player_service.dart';
import '../../domain/services/a_together_listening_service.dart';

part 'player_event.dart';
part 'player_state.dart';

class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  final IPlayerService _service;
  final ITogetherListeningService _togetherService;

  PlayerBloc(this._service, this._togetherService) : super(PlayerInitial()) {
    on<LoadLastTrackEvent>(_onPlayerInitial);
    on<PlayTrackEvent>(_onPlayTrack);
    on<PausePlayingEvent>(_onPauseTrack);
    on<ResumePlayerEvent>(_onResumeTrack);
    on<JoinToRoomEvent>(_onJoinRoomEvent);
  }

  void _onJoinRoomEvent(
      JoinToRoomEvent event, Emitter<PlayerState> emit) async {
    emit(ConnectingToRoomState());
    await _togetherService.connectToRoom(event.code);
    emit(ConnectingToRoomSuccess());
    _togetherService.onStartPlaying.listen((data) async {
      var track = Track.fromJson(jsonDecode(data));
      await _service.play(track);
      emit(StartPlayingTrackState(track: track));
    });
    _togetherService.onPausePlaying.listen((data) async {
      await _service.pause();
      emit(PlayingStopState(track: _service.currentTrack!));
    });
    _togetherService.onResumePlaying.listen((data) async {
      await _service.resume();
      emit(PlayingResumeState(track: _service.currentTrack!));
    });
  }

  void _onPlayerInitial(
      LoadLastTrackEvent event, Emitter<PlayerState> emit) async {
    var lastTrack = await _service.getLastTrack();
    if (lastTrack != null) {
      emit(PlayingStopState(track: lastTrack));
    }
  }

  Future _onPlayTrack(PlayTrackEvent event, Emitter<PlayerState> emit) async {
    if (_togetherService.isConnected()) {
      Future.microtask(
          () async => await _togetherService.playTogether(event.track));
    }
    await _service.play(event.track);
    emit(StartPlayingTrackState(track: event.track));
  }

  Future _onPauseTrack(
      PausePlayingEvent event, Emitter<PlayerState> emit) async {
    if (_togetherService.isConnected()) {
      _togetherService.stopPlaying();
    }
    await _service.pause();
    emit(PlayingStopState(track: _service.currentTrack!));
  }

  Future _onResumeTrack(
      ResumePlayerEvent event, Emitter<PlayerState> emit) async {
    if (_togetherService.isConnected()) {
      _togetherService.resumePlaying();
    }
    await _service.resume();
    emit(PlayingResumeState(track: _service.currentTrack!));
  }
}

part of 'player_bloc.dart';

@immutable
abstract class PlayerState {}

class PlayerInitial extends PlayerState {}

class ConnectingToRoomState extends PlayerState {}

class ConnectingToRoomSuccess extends PlayerState {}

class LastTrackPlayingState extends PlayerState {
  LastTrackPlayingState({required this.lastTrack});
  final Track lastTrack;
}

class StartPlayingTrackState extends PlayerState {
  StartPlayingTrackState({required this.track});
  final Track track;
}

class PlayingStopState extends PlayerState {
  PlayingStopState({required this.track});
  final Track track;
}

class PlayingResumeState extends PlayerState {
  PlayingResumeState({required this.track});

  final Track track;
}

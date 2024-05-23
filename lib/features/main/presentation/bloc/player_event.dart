part of 'player_bloc.dart';

@immutable
abstract class PlayerEvent {}

class PlayTrackEvent extends PlayerEvent {
  PlayTrackEvent({required this.track});
  final Track track;
}

class PausePlayingEvent extends PlayerEvent {}

class ResumePlayerEvent extends PlayerEvent {}

class LoadLastTrackEvent extends PlayerEvent {}

class JoinToRoomEvent extends PlayerEvent {
  JoinToRoomEvent({required this.code});
  final String code;
}

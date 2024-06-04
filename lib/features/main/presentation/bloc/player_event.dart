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

class CreateRoomEvent extends PlayerEvent {}

class JoinToRoomEvent extends PlayerEvent {
  JoinToRoomEvent({required this.code});
  final String code;
}

class GetRoomStateEvent extends PlayerEvent {}

class LeaveRoomEvent extends PlayerEvent {}

class _UserJoinedEvent extends PlayerEvent {
  _UserJoinedEvent({required this.user});
  final User user;
}

class _UserDisconnectedEvent extends PlayerEvent {
  _UserDisconnectedEvent({required this.user});
  final User user;
}

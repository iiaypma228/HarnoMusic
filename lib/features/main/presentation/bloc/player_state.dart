part of 'player_bloc.dart';

@immutable
abstract class PlayerState {}

class PlayerInitial extends PlayerState {}

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

class RoomStateLoading extends PlayerState {}

class RoomStateLoaded extends PlayerState {
  RoomStateLoaded(
      {required this.code, required this.users, required this.chatHistory});
  final String code;
  final List<User> users;
  final List<ChatHistory> chatHistory;
}

class RoomCreatingState extends PlayerState {}

class RoomCreatedState extends PlayerState {
  RoomCreatedState({required this.code});
  final String code;
}

class ConnectingToRoomState extends PlayerState {}

class ConnectingToRoomSuccess extends PlayerState {
  ConnectingToRoomSuccess(
      {required this.code, required this.users, required this.chatHistory});
  final String code;
  final List<User> users;
  final List<ChatHistory> chatHistory;
}

class ConnectingToRoomError extends PlayerState {
  ConnectingToRoomError({required this.error});
  final String error;
}

class UserConnectedToRoom extends PlayerState {
  UserConnectedToRoom({required this.user});
  final User user;
}

class UserDisconnectedFromRoom extends PlayerState {
  UserDisconnectedFromRoom({required this.user});
  final User user;
}

class NewRoomMessage extends PlayerState {
  NewRoomMessage({required this.message});
  final ChatHistory message;
}

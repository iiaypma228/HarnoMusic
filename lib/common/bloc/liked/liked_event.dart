part of 'liked_bloc.dart';

@immutable
abstract class LikedEvent {}

class LoadLikedEvent extends LikedEvent {}

class AddLikeEvent extends LikedEvent {
  AddLikeEvent({required this.track});
  final Track track;
}

class RemoveLikeEvent extends LikedEvent {
  RemoveLikeEvent({required this.track});
  final Track track;
}

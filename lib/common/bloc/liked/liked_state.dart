part of 'liked_bloc.dart';

@immutable
abstract class LikedState {}

class LikedInitial extends LikedState {}

class LikedRemove extends LikedState {
  LikedRemove({required this.track});
  final Track track;
}

class LikedAdded extends LikedState {
  LikedAdded({required this.track});
  final Track track;
}

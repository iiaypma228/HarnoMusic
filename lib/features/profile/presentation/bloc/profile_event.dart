part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {}

class SetProfileAvatar extends ProfileEvent {
  SetProfileAvatar({required this.image});
  final File image;
}

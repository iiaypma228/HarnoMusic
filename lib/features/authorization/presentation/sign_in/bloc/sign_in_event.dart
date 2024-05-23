part of 'sign_in_bloc.dart';

@immutable
abstract class SignInEvent {}

class DoSignInEvent extends SignInEvent {
  DoSignInEvent({required this.username, required this.password});

  final String username;
  final String password;
}

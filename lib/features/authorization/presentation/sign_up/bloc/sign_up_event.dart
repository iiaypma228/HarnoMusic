part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpEvent {}

class DoSignUpEvent extends SignUpEvent {
  DoSignUpEvent(
      {required this.email, required this.name, required this.password});

  final String email;
  final String name;
  final String password;
}

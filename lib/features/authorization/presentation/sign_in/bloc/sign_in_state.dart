part of 'sign_in_bloc.dart';

@immutable
abstract class SignInState {}

class SignInInitial extends SignInState {}

class SignInSuccess extends SignInState {}

class SignInLoading extends SignInState {}

class SignInError extends SignInState {
  SignInError({required this.error});
  final String error;
}

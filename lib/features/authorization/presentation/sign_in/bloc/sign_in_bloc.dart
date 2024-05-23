import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/services/a_authorization_service.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final IAuthorizationService _service;

  SignInBloc(this._service) : super(SignInInitial()) {
    on<SignInEvent>((event, emit) {});
    on<DoSignInEvent>(_onSignIn);
  }

  _onSignIn(DoSignInEvent event, Emitter<SignInState> emit) async {
    emit(SignInLoading());
    var result = await _service.signIn(event.username, event.password);

    if (result.isSuccess) {
      emit(SignInSuccess());
    } else {
      emit(SignInError(error: result.errorMessage ?? ''));
    }
  }
}

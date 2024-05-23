import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../domain/services/a_authorization_service.dart';
part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final IAuthorizationService _service;

  SignUpBloc(this._service) : super(SignUpInitial()) {
    on<SignUpEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<DoSignUpEvent>(_onSignUp);
  }

  _onSignUp(DoSignUpEvent event, Emitter<SignUpState> emit) async {
    emit(SignUpLoading());
    var res = await _service.signUp(event.name, event.email, event.password);

    if (res.isSuccess) {
      emit(SignUpSuccess());
    } else {
      emit(SignUpError(error: res.errorMessage ?? ''));
    }
  }
}

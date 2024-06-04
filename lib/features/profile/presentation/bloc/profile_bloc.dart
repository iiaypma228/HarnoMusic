import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:garno_music/features/profile/domain/models/user.dart';
import 'package:meta/meta.dart';

import '../../domain/service/a_user_service.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final IUserService _service;

  ProfileBloc(this._service) : super(ProfileInitial()) {
    on<SetProfileAvatar>(_onSetAvatar);
  }

  Future _onSetAvatar(
      SetProfileAvatar event, Emitter<ProfileState> emit) async {
    await _service.setAvatar(event.image);
    emit(ProfileAvatarSetSuccess());
  }
}

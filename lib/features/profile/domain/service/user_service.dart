import 'dart:io';

import 'package:flutter/material.dart';
import 'package:garno_music/common/models/server_response.dart';
import 'package:garno_music/features/authorization/domain/services/authorization_api_service.dart';
import 'package:garno_music/features/main/domain/models/track.dart';
import 'package:garno_music/features/profile/domain/models/track_history.dart';
import 'package:garno_music/features/profile/domain/repository/a_user_repository.dart';
import 'package:garno_music/features/profile/domain/service/a_user_service.dart';

class UserService implements IUserService {
  UserService({required IUserRepository repository}) : _repository = repository;

  final IUserRepository _repository;

  @override
  Future setAvatar(File image) async {
    var user = await _repository.setAvatar(image);
    if (user.isSuccess) {
      AuthorizationService.currentUser = user.data;
    }
  }

  @override
  Future<ServerResponse<List<TrackHistory>>> getHistoryTracks() async {
    var res = await _repository.getHistoryTracks();
    if (res.isSuccess) {
      res.data
          ?.forEach((e) => e.track.imageSource = Image.network(e.track.image));
    }

    return res;
  }

  @override
  Future<ServerResponse> saveHistoryTrack(Track track) async {
    return await _repository.saveHistoryTrack(track);
  }
}

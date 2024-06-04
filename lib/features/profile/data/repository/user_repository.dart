import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:garno_music/common/models/server_response.dart';
import 'package:garno_music/features/main/domain/models/track.dart';
import 'package:garno_music/features/profile/data/datasource/a_user_datasource.dart';
import 'package:garno_music/features/profile/domain/models/track_history.dart';
import 'package:garno_music/features/profile/domain/models/user.dart';
import 'package:garno_music/features/profile/domain/repository/a_user_repository.dart';

class UserRepository implements IUserRepository {
  UserRepository({required IUserDatasource datasource})
      : _datasource = datasource;

  final IUserDatasource _datasource;

  @override
  Future<ServerResponse<User>> setAvatar(File image) async {
    try {
      var res = await _datasource.setAvatar(image);

      if (res.statusCode == 200) {
        return ServerResponse<User>(
            isSuccess: true, data: User.fromJson(res.data), errorMessage: '');
      }
      return ServerResponse<User>(
          isSuccess: false, data: null, errorMessage: res.data);
    } on DioException catch (e) {
      return ServerResponse<User>(
          isSuccess: false,
          data: null,
          errorMessage: e.response?.data ?? e.message);
    }
  }

  @override
  Future<ServerResponse<List<TrackHistory>>> getHistoryTracks() async {
    try {
      var res = await _datasource.getHistoryTracks();

      if (res.statusCode == 200) {
        var r = List.from(res.data)
            .map((dynamic i) => TrackHistory.fromJson(i))
            .toList();
        return ServerResponse<List<TrackHistory>>(
            isSuccess: true, data: r, errorMessage: '');
      }
      return ServerResponse<List<TrackHistory>>(
          isSuccess: false, data: null, errorMessage: res.data);
    } on DioException catch (e) {
      return ServerResponse<List<TrackHistory>>(
          isSuccess: false,
          data: null,
          errorMessage: e.response?.data ?? e.message);
    }
  }

  @override
  Future<ServerResponse> saveHistoryTrack(Track track) async {
    try {
      var res = await _datasource.saveHistoryTrack(track);

      if (res.statusCode == 200) {
        return ServerResponse(isSuccess: true, data: 0, errorMessage: '');
      }
      return ServerResponse(
          isSuccess: false, data: null, errorMessage: res.data);
    } on DioException catch (e) {
      return ServerResponse(
          isSuccess: false,
          data: null,
          errorMessage: e.response?.data ?? e.message);
    }
  }
}

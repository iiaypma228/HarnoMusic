import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/src/response.dart';
import 'package:garno_music/features/main/domain/models/track.dart';
import 'package:garno_music/features/profile/data/datasource/a_user_datasource.dart';

class UserApiDatasource implements IUserDatasource {
  UserApiDatasource({required Dio dio}) : _dio = dio;
  final Dio _dio;

  @override
  Future<Response> setAvatar(File file) async {
    String fileName = file.path.split('/').last;
    FormData formData = FormData.fromMap({
      "image": await MultipartFile.fromFile(file.path, filename: fileName),
    });

    return await _dio.post(
      '/api/user/setAvatar',
      data: formData,
      options: Options(headers: {
        "Content-Type": "multipart/form-data",
      }),
    );
  }

  @override
  Future<Response> getHistoryTracks() async {
    return await _dio.get('/api/track/history');
  }

  @override
  Future<Response> saveHistoryTrack(Track track) async {
    return await _dio.post('/api/track/history', data: track.toJson());
  }
}

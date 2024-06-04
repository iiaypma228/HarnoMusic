import 'dart:io';

import 'package:dio/dio.dart';
import 'package:garno_music/features/main/domain/models/track.dart';

abstract interface class IUserDatasource {
  Future<Response> setAvatar(File file);
  Future<Response> getHistoryTracks();
  Future<Response> saveHistoryTrack(Track track);
}

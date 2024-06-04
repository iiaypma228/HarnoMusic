import 'package:dio/dio.dart';

import '../../domain/models/album.dart';

abstract interface class ITrackDatasource {
  Future<Response> getNewTracks(int skip, int take);
  Future<Response> getTracksByTags(int skip, int take, String tags);
  Future<Response> getTracksByQuery(int skip, int take, String query);
}

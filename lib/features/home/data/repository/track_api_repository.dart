import 'package:dio/dio.dart';
import 'package:garno_music/features/home/data/datasource/a_track_datasource.dart';
import 'package:garno_music/features/home/domain/repository/track_repository.dart';

import '../../../../common/models/server_response.dart';
import '../../../main/domain/models/track.dart';

class TrackApiRepository implements ITrackRepository {
  final ITrackDatasource _datasource;
  TrackApiRepository({required ITrackDatasource datasource})
      : _datasource = datasource;

  @override
  Future<ServerResponse<List<Track>>> getNewTracks(int skip, int take) async {
    try {
      var result = await _datasource.getNewTracks(skip, take);
      if (result.statusCode == 200) {
        var r = List.from(result.data)
            .map((dynamic i) => Track.fromJson(i))
            .toList();
        return ServerResponse<List<Track>>(
            isSuccess: true, data: r, errorMessage: '');
      }
      return ServerResponse<List<Track>>(
          isSuccess: false, data: null, errorMessage: result.data);
    } on DioException catch (e) {
      return ServerResponse<List<Track>>(
          isSuccess: false,
          data: null,
          errorMessage: e.response?.data ?? e.message);
    }
  }

  @override
  Future<ServerResponse<List<Track>>> getTracksByTag(
      int skip, int take, String tags) async {
    try {
      var result = await _datasource.getTracksByTags(skip, take, tags);
      if (result.statusCode == 200) {
        var r = List.from(result.data)
            .map((dynamic i) => Track.fromJson(i))
            .toList();
        return ServerResponse<List<Track>>(
            isSuccess: true, data: r, errorMessage: '');
      }
      return ServerResponse<List<Track>>(
          isSuccess: false, data: null, errorMessage: result.data);
    } on DioException catch (e) {
      return ServerResponse<List<Track>>(
          isSuccess: false,
          data: null,
          errorMessage: e.response?.data ?? e.message);
    }
  }
}

import 'package:dio/dio.dart';
import 'package:garno_music/features/home/data/datasource/a_album_datasource.dart';
import 'package:garno_music/features/home/data/datasource/a_track_datasource.dart';
import 'package:garno_music/features/home/domain/models/album.dart';

class TrackApiDatasource implements ITrackDatasource {
  TrackApiDatasource({required Dio dio}) : _dio = dio;
  final Dio _dio;

  @override
  Future<Response> getNewTracks(int skip, int take) async {
    var result = await _dio.get('/api/track/newTracks',
        queryParameters: {'skip': skip, 'take': take});
    return result;
  }

  @override
  Future<Response> getTracksByTags(int skip, int take, String tags) async {
    var result = await _dio.get('/api/track/trackByTags',
        queryParameters: {'skip': skip, 'take': take, 'tags': tags});
    return result;
  }

  @override
  Future<Response> getTracksByQuery(int skip, int take, String query) async {
    var result = await _dio.get('/api/track/trackByQuery',
        queryParameters: {'skip': skip, 'take': take, 'query': query});
    return result;
  }
}

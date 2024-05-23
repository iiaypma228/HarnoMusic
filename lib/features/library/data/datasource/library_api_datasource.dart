import 'package:dio/dio.dart';
import 'package:garno_music/features/library/data/datasource/i_library_datasource.dart';
import 'package:garno_music/features/main/domain/models/track.dart';
import 'package:on_audio_query/on_audio_query.dart';

class LibraryApiDatasource implements ILibraryDatasource {
  LibraryApiDatasource({required Dio dio}) : _dio = dio;
  final Dio _dio;
  final OnAudioQuery _audioQuery = OnAudioQuery();
  @override
  Future<List<SongModel>> getLocalTracks() async {
    var tracks = await _audioQuery.querySongs();

    return tracks;
  }

  @override
  Future<Response> getLikeTracks() async {
    return await _dio.get('/api/track/likeTracks');
  }

  @override
  Future<Response> saveLikeTrack(Track track) async {
    return await _dio.post('/api/track/likeTracks', data: track.toJson());
  }

  @override
  Future<Response> deleteLikeTrack(Track track) async {
    //likeTracks
    return await _dio.delete('/api/track/likeTracks', data: track.toJson());
  }
}

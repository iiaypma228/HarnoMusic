import 'package:dio/dio.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../../../main/domain/models/track.dart';

abstract interface class ILibraryDatasource {
  Future<List<SongModel>> getLocalTracks();
  Future<Response> getLikeTracks();
  Future<Response> saveLikeTrack(Track track);
  Future<Response> deleteLikeTrack(Track track);
}

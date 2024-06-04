import 'dart:io';

import 'package:dio/dio.dart';
import 'package:garno_music/features/library/data/datasource/i_library_datasource.dart';
import 'package:garno_music/features/main/domain/models/track.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:path_provider/path_provider.dart';

class LibraryApiDatasource implements ILibraryDatasource {
  LibraryApiDatasource({required Dio dio}) : _dio = dio;
  final Dio _dio;
  final OnAudioQuery _audioQuery = OnAudioQuery();
  @override
  Future<List<SongModel>> getLocalTracks() async {
    final directory = await getExternalStorageDirectory();
    final path = Directory('${directory?.path}/Music');

    var tracks = await _audioQuery.querySongs();
    var savedTracks = await _audioQuery.querySongs(path: path.path);
    tracks.addAll(savedTracks);

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

  @override
  Future<Response> createPlayList(String name) async {
    return await _dio
        .post('/api/playlist/newPlayList', queryParameters: {'name': name});
  }

  @override
  Future<Response> getPlayListTracks(int playListId) async {
    return await _dio.post('/api/playlist/playlistTracks',
        queryParameters: {'id': playListId});
  }

  @override
  Future<Response> getPlayLists() async {
    return await _dio.get('/api/playlist/myPlaylists');
  }

  @override
  Future<Response> downloadTrack(String url, String fileName) async {
    final directory = await getExternalStorageDirectory();
    final path = Directory('${directory?.path}/Music');
    if (!(await path.exists())) {
      await path.create();
    }
    final filePath = '${path.path}/$fileName';
    var res = await _dio.download(url, filePath);
    var isScanned = await _audioQuery.scanMedia(filePath);
    return res;
  }

  @override
  Future<Response> addTrackToPlayList(Track track, int playListId) async {
    return await _dio.post('/api/playlist/addTrackToPlayList',
        data: track.toJson(), queryParameters: {'playListId': playListId});
  }
}

import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:garno_music/common/models/server_response.dart';
import 'package:garno_music/features/library/data/datasource/i_library_datasource.dart';
import 'package:garno_music/features/library/domain/repository/i_library_repository.dart';
import 'package:garno_music/features/main/domain/models/track.dart';
import 'package:on_audio_query/on_audio_query.dart';

class LibraryRepository implements ILibraryRepository {
  final ILibraryDatasource _datasource;

  LibraryRepository({required ILibraryDatasource datasource})
      : _datasource = datasource;

  final OnAudioQuery _audioQuery = OnAudioQuery();

  @override
  Future<List<Track>> getLocalTracks() async {
    try {
      var result = await _datasource.getLocalTracks();

      var tracksFuture = result
          .map((el) async => Track(
              id: el.id,
              name: el.title,
              duration: el.duration == null || el.duration == 0
                  ? 0
                  : el.duration! ~/ 1000,
              artistName: el.artist ?? '',
              albumName: el.album ?? '',
              albumId: el.albumId ?? 0,
              audioUrl: el.data,
              albumImage: '',
              image: '',
              source: DeviceFileSource(el.data)))
          .toList();

      var track = <Track>[];

      for (int i = 0; i < tracksFuture.length; i++) {
        var tr = await tracksFuture[i];

        var imageMap =
            await _audioQuery.queryArtwork(tr.albumId ?? 0, ArtworkType.ALBUM);
        if (imageMap != null) {
          tr.imageSource = Image.memory(imageMap);
        }
        track.add(tr);
      }

      return track;
    } catch (e) {
      debugPrint('ERROR WHEN LOAD LOCAL TRACKS $e');
      return [];
    }
  }

  @override
  Future<ServerResponse<List<Track>>> getLikesTrack() async {
    try {
      var res = await _datasource.getLikeTracks();

      if (res.statusCode == 200) {
        var resultList =
            List.from(res.data).map((dynamic i) => Track.fromJson(i)).toList();
        return ServerResponse<List<Track>>(
            isSuccess: true, data: resultList, errorMessage: '');
      }
      return ServerResponse<List<Track>>(
          isSuccess: false, data: null, errorMessage: res.data);
    } on DioException catch (e) {
      return ServerResponse<List<Track>>(
          isSuccess: false,
          data: null,
          errorMessage: e.response?.data ?? e.message);
    }
  }

  @override
  Future<ServerResponse> saveLikeTrack(Track track) async {
    try {
      var res = await _datasource.saveLikeTrack(track);

      if (res.statusCode == 200) {
        return ServerResponse(isSuccess: true, data: true, errorMessage: '');
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

  @override
  Future<ServerResponse> deleteLikeTrack(Track track) async {
    try {
      var res = await _datasource.deleteLikeTrack(track);

      if (res.statusCode == 200) {
        return ServerResponse(isSuccess: true, data: true, errorMessage: '');
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

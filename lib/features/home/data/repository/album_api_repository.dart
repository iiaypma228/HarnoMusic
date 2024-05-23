import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:garno_music/common/models/server_response.dart';
import 'package:garno_music/features/home/data/datasource/a_album_datasource.dart';
import 'package:garno_music/features/home/domain/models/album.dart';
import 'package:garno_music/features/home/domain/repository/album_repository.dart';

class AlbumApiRepository implements IAlbumRepository {
  final IAlbumDatasource _datasource;
  AlbumApiRepository({required IAlbumDatasource datasource})
      : _datasource = datasource;

  @override
  Future<ServerResponse<List<Album>>> getNewAlbums(int skip, int take) async {
    try {
      var result = await _datasource.getNewAlbums(skip, take);
      if (result.statusCode == 200) {
        var r = List.from(result.data)
            .map((dynamic i) => Album.fromJson(i))
            .toList();
        return ServerResponse<List<Album>>(
            isSuccess: true, data: r, errorMessage: '');
      }
      return ServerResponse<List<Album>>(
          isSuccess: false, data: null, errorMessage: result.data);
    } on DioException catch (e) {
      return ServerResponse<List<Album>>(
          isSuccess: false,
          data: null,
          errorMessage: e.response?.data ?? e.message);
    }
  }
}

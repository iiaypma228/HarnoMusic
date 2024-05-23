import 'package:dio/dio.dart';
import 'package:garno_music/features/home/data/datasource/a_album_datasource.dart';
import 'package:garno_music/features/home/domain/models/album.dart';

class AlbumApiDatasource implements IAlbumDatasource {
  AlbumApiDatasource({required Dio dio}) : _dio = dio;
  final Dio _dio;

  @override
  Future<Response> getNewAlbums(int skip, int take) async {
    var result = await _dio.get('/api/album/newAlbums',
        queryParameters: {'skip': skip, 'take': take});
    return result;
  }
}

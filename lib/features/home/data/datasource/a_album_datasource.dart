import 'package:dio/dio.dart';

import '../../domain/models/album.dart';

abstract interface class IAlbumDatasource {
  Future<Response> getNewAlbums(int skip, int take);
}

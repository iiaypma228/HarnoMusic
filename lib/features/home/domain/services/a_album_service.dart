import 'package:garno_music/common/models/server_response.dart';

import '../models/album.dart';

abstract interface class IAlbumService {
  Future<ServerResponse<List<Album>>> getNextNewAlbums();
}

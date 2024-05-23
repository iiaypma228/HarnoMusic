import '../../../../common/models/server_response.dart';
import '../models/album.dart';

abstract interface class IAlbumRepository {
  Future<ServerResponse<List<Album>>> getNewAlbums(int skip, int take);
}

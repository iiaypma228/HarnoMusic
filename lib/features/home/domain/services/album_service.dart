import 'package:garno_music/common/models/server_response.dart';
import 'package:garno_music/features/home/domain/models/album.dart';
import 'package:garno_music/features/home/domain/repository/album_repository.dart';
import 'package:garno_music/features/home/domain/services/a_album_service.dart';

class AlbumService implements IAlbumService {
  final IAlbumRepository _repository;
  final int _take = 10;
  int _skip = 0;

  AlbumService({required IAlbumRepository repository})
      : _repository = repository;

  @override
  Future<ServerResponse<List<Album>>> getNextNewAlbums() async {
    var res = await _repository.getNewAlbums(_skip, _take);
    if (res.isSuccess && res.data!.isNotEmpty) {
      _skip += _take;
    }
    return res;
  }
}

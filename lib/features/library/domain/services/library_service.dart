import 'package:garno_music/features/library/domain/models/play_list.dart';
import 'package:garno_music/features/library/domain/repository/i_library_repository.dart';
import 'package:garno_music/features/library/domain/services/I_library_service.dart';

import '../../../../common/models/server_response.dart';
import '../../../../generated/l10n.dart';
import '../../../main/domain/models/track.dart';

class LibraryService implements ILibraryService {
  final ILibraryRepository _repository;

  LibraryService({required ILibraryRepository repository})
      : _repository = repository;

  @override
  Future<PlayList> getLocalPlayList() async {
    var res = await _repository.getLocalTracks();
    return PlayList(
        id: -1, name: S.current.localFiles, userId: -1, tracks: res);
  }

  @override
  Future<ServerResponse<PlayList>> getLikedPlayList() async {
    var res = await _repository.getLikesTrack();
    if (res.isSuccess) {
      var playList = PlayList(
          id: -2, name: S.current.likesTrack, userId: -1, tracks: res.data!);
      return ServerResponse<PlayList>(
          isSuccess: true, data: playList, errorMessage: '');
    }

    return ServerResponse<PlayList>(
        isSuccess: false, data: null, errorMessage: res.errorMessage);
  }

  @override
  Future<ServerResponse> saveLikeTrack(Track track) async {
    return await _repository.saveLikeTrack(track);
  }

  @override
  Future<ServerResponse> deleteLikeTrack(Track track) async {
    return await _repository.deleteLikeTrack(track);
  }
}

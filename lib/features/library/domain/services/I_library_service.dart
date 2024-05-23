import 'package:garno_music/features/library/domain/models/play_list.dart';
import '../../../../common/models/server_response.dart';
import '../../../main/domain/models/track.dart';

abstract interface class ILibraryService {
  Future<PlayList> getLocalPlayList();
  Future<ServerResponse<PlayList>> getLikedPlayList();
  Future<ServerResponse> saveLikeTrack(Track track);
  Future<ServerResponse> deleteLikeTrack(Track track);
}

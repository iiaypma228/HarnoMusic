import '../../../../common/models/server_response.dart';
import '../../../main/domain/models/track.dart';
import '../models/play_list.dart';

abstract interface class ILibraryRepository {
  Future<List<Track>> getLocalTracks();
  Future<ServerResponse<List<Track>>> getLikesTrack();
  Future<ServerResponse<List<PlayList>>> getPlayLists();
  Future<ServerResponse<PlayList>> createPlayList(String name);
  Future<ServerResponse<List<Track>>> getPlayListTracks(int playListId);
  Future<ServerResponse> saveLikeTrack(Track track);
  Future<ServerResponse> deleteLikeTrack(Track track);
  Future<ServerResponse> downloadTrack(String url, String filename);
  Future<ServerResponse> addTrackToPlayList(Track track, PlayList playList);
}

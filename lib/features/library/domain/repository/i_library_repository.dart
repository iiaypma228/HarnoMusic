import '../../../../common/models/server_response.dart';
import '../../../main/domain/models/track.dart';

abstract interface class ILibraryRepository {
  Future<List<Track>> getLocalTracks();
  Future<ServerResponse<List<Track>>> getLikesTrack();
  Future<ServerResponse> saveLikeTrack(Track track);
  Future<ServerResponse> deleteLikeTrack(Track track);
}

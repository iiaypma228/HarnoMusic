import '../../../../common/models/server_response.dart';
import '../../../main/domain/models/track.dart';
import '../models/album.dart';

abstract interface class ITrackRepository {
  Future<ServerResponse<List<Track>>> getNewTracks(int skip, int take);
  Future<ServerResponse<List<Track>>> getTracksByTag(
      int skip, int take, String tags);
  Future<ServerResponse<List<Track>>> getTrackByQuery(
      int skip, int take, String query);
}

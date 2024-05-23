import 'package:garno_music/common/models/server_response.dart';

import '../../../main/domain/models/track.dart';
import '../models/album.dart';

abstract interface class ITrackService {
  Future<ServerResponse<List<Track>>> getNextNewTracks();
  Future<ServerResponse<List<Track>>> getTracksByTags(String tags);
  Future<ServerResponse<List<Track>>> getNextTracksByTags();
}

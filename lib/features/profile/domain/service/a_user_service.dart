import 'dart:io';

import 'package:garno_music/features/profile/domain/models/track_history.dart';

import '../../../../common/models/server_response.dart';
import '../../../main/domain/models/track.dart';

abstract interface class IUserService {
  Future setAvatar(File image);
  Future<ServerResponse<List<TrackHistory>>> getHistoryTracks();
  Future<ServerResponse> saveHistoryTrack(Track track);
}

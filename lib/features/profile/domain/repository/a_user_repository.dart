import 'dart:io';

import 'package:garno_music/features/main/domain/models/track.dart';
import 'package:garno_music/features/profile/domain/models/track_history.dart';
import 'package:garno_music/features/profile/domain/models/user.dart';

import '../../../../common/models/server_response.dart';

abstract interface class IUserRepository {
  Future<ServerResponse<User>> setAvatar(File image);
  Future<ServerResponse<List<TrackHistory>>> getHistoryTracks();
  Future<ServerResponse> saveHistoryTrack(Track track);
}

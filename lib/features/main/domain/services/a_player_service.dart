import 'dart:async';

import '../models/track.dart';

abstract interface class IPlayerService {
  Stream<Duration> get onPositionChanged;
  Stream<Duration> get onDurationChanged;
  Track? get currentTrack;
  Future play(Track track);
  Future resume();
  Future pause();
  Future<Track?> getLastTrack();
}

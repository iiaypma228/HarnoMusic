import 'dart:convert';

import 'package:garno_music/features/main/domain/models/track.dart';
import 'package:garno_music/features/main/domain/services/a_player_service.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:garno_music/features/profile/domain/service/a_user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String lastTrackJsonKey = 'last_track_json';

class PlayerService implements IPlayerService {
  final AudioPlayer _player;
  final IUserService _profileService;
  Track? _currentTrack;

  PlayerService({required AudioPlayer player, required IUserService service})
      : _player = player,
        _profileService = service;

  @override
  Stream<Duration> get onDurationChanged => _player.onDurationChanged;

  @override
  Stream<Duration> get onPositionChanged => _player.onPositionChanged;

  @override
  Track? get currentTrack => _currentTrack;

  @override
  Future play(Track track) async {
    _currentTrack = track;

    track.source ??= UrlSource(track.audioUrl);

    await _player.play(track.source!);
    Future.microtask(() async => await _saveAsLatTrack(track));
    Future.microtask(() async => await _profileService.saveHistoryTrack(track));
  }

  @override
  Future pause() async {
    await _player.pause();
  }

  @override
  Future resume() async {
    await _player.resume();
  }

  @override
  Future<Track?> getLastTrack() async {
    var sharedPreferences = await SharedPreferences.getInstance();

    var json = sharedPreferences.getString(lastTrackJsonKey);
    if (json == null || json.isEmpty) {
      return null;
    }

    return Track.fromJson(jsonDecode(json));
  }

  Future _saveAsLatTrack(Track track) async {
    var sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(lastTrackJsonKey, jsonEncode(track.toJson()));
  }
}

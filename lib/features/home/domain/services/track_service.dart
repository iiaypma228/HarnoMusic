import 'package:flutter/material.dart';
import 'package:garno_music/common/helpers/string_extensions.dart';
import 'package:garno_music/common/models/server_response.dart';
import 'package:garno_music/features/home/domain/repository/track_repository.dart';
import 'package:garno_music/features/home/domain/services/a_track_service.dart';
import 'package:audioplayers/audioplayers.dart';
import '../../../main/domain/models/track.dart';

class TrackService implements ITrackService {
  final ITrackRepository _repository;
  final int _takeNewTracks = 200;
  int _skipNewTracks = 0;
  String? _currentTag;
  final int _takeTracksByTags = 200;
  int _skipTracksByTags = 0;

  TrackService({required ITrackRepository repository})
      : _repository = repository;

  @override
  Future<ServerResponse<List<Track>>> getNextNewTracks() async {
    var res = await _repository.getNewTracks(_skipNewTracks, _takeNewTracks);
    if (res.isSuccess && res.data!.isNotEmpty) {
      _skipNewTracks += _takeNewTracks;
      for (var i in res.data!) {
        i.source = UrlSource(i.audioUrl);
        i.imageSource = Image.network(i.image);
      }
    }
    return res;
  }

  @override
  Future<ServerResponse<List<Track>>> getTracksByTags(String tags) async {
    if (_currentTag != tags) {
      _skipTracksByTags = 0;
    }

    var res = await _repository.getTracksByTag(
        _skipTracksByTags, _takeTracksByTags, tags);
    if (res.isSuccess && res.data!.isNotEmpty) {
      _skipTracksByTags += _takeTracksByTags;
      for (var i in res.data!) {
        i.source = UrlSource(i.audioUrl);
        i.imageSource = Image.network(i.image);
      }
    }
    return res;
  }

  @override
  Future<ServerResponse<List<Track>>> getNextTracksByTags() async {
    if (_currentTag.isNullOrEmpty) {
      throw Exception(
          'Current tag is empty! Before call this, your need call a getTracksByTags()!');
    }
    var res = await _repository.getTracksByTag(
        _skipTracksByTags, _takeTracksByTags, _currentTag!);
    if (res.isSuccess && res.data!.isNotEmpty) {
      _skipTracksByTags += _takeTracksByTags;
      for (var i in res.data!) {
        i.source = UrlSource(i.audioUrl);
        i.imageSource = Image.network(i.image);
      }
    }
    return res;
  }
}

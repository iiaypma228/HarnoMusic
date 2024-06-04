import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:garno_music/common/models/json_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'track.g.dart';

@JsonSerializable()
class Track implements IJsonModel<Track> {
  Track(
      {required this.id,
      required this.name,
      required this.duration,
      required this.artistName,
      required this.albumName,
      required this.albumId,
      required this.audioUrl,
      required this.audioDownload,
      required this.albumImage,
      required this.image,
      this.source,
      this.imageSource});

  factory Track.fromJson(Map<String, dynamic> json) => _$TrackFromJson(json);

  final int id;
  final String name;
  final int duration;
  final String artistName;
  final String? albumName;
  final int albumId;
  final String audioUrl;
  final String? audioDownload;
  final String albumImage;
  final String image;
  @JsonKey(includeToJson: false, includeFromJson: false)
  Source? source;
  @JsonKey(includeToJson: false, includeFromJson: false)
  Image? imageSource;
  @override
  Track fromJson(Map<String, dynamic> json) => _$TrackFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TrackToJson(this);
}

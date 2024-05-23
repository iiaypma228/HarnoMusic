import 'package:flutter/material.dart';
import 'package:garno_music/common/models/json_model.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../main/domain/models/track.dart';
import '../../../profile/domain/models/user.dart';
part 'play_list.g.dart';

@JsonSerializable()
class PlayList implements IJsonModel<PlayList> {
  PlayList(
      {required this.id,
      required this.name,
      required this.userId,
      required this.tracks,
      this.user,
      this.imageUrl,
      this.image});

  final int id;
  final String name;
  final int userId;
  final User? user;
  final String? imageUrl;

  @JsonKey(includeFromJson: false, includeToJson: false)
  final Image? image;
  final List<Track> tracks;

  factory PlayList.fromJson(Map<String, dynamic> json) =>
      _$PlayListFromJson(json);

  factory PlayList.empty() => PlayList(id: 0, name: '', userId: 0, tracks: []);

  @override
  PlayList fromJson(Map<String, dynamic> json) => _$PlayListFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PlayListToJson(this);
}

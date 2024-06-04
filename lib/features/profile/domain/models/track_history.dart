import 'package:auto_route/annotations.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../common/models/json_model.dart';
import '../../../main/domain/models/track.dart';
part 'track_history.g.dart';

@JsonSerializable()
class TrackHistory implements IJsonModel<TrackHistory> {
  TrackHistory(
      {required this.id,
      required this.trackId,
      required this.track,
      required this.date});

  final int id;
  final int trackId;
  final Track track;
  final DateTime date;

  factory TrackHistory.fromJson(Map<String, dynamic> json) =>
      _$TrackHistoryFromJson(json);

  @override
  TrackHistory fromJson(Map<String, dynamic> json) =>
      _$TrackHistoryFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TrackHistoryToJson(this);
}

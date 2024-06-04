// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrackHistory _$TrackHistoryFromJson(Map<String, dynamic> json) => TrackHistory(
      id: (json['id'] as num).toInt(),
      trackId: (json['trackId'] as num).toInt(),
      track: Track.fromJson(json['track'] as Map<String, dynamic>),
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$TrackHistoryToJson(TrackHistory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'trackId': instance.trackId,
      'track': instance.track,
      'date': instance.date.toIso8601String(),
    };

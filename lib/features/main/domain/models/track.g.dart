// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Track _$TrackFromJson(Map<String, dynamic> json) => Track(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      duration: (json['duration'] as num).toInt(),
      artistName: json['artistName'] as String,
      albumName: json['albumName'] as String?,
      albumId: (json['albumId'] as num).toInt(),
      audioUrl: json['audioUrl'] as String,
      audioDownload: json['audioDownload'] as String?,
      albumImage: json['albumImage'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$TrackToJson(Track instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'duration': instance.duration,
      'artistName': instance.artistName,
      'albumName': instance.albumName,
      'albumId': instance.albumId,
      'audioUrl': instance.audioUrl,
      'audioDownload': instance.audioDownload,
      'albumImage': instance.albumImage,
      'image': instance.image,
    };

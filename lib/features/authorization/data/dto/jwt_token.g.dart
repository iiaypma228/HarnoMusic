// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jwt_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JwtTokenDto _$JwtTokenDtoFromJson(Map<String, dynamic> json) => JwtTokenDto(
      access_token: json['access_token'] as String,
      username: json['username'] as String,
      expires: DateTime.parse(json['expires'] as String),
    );

Map<String, dynamic> _$JwtTokenDtoToJson(JwtTokenDto instance) =>
    <String, dynamic>{
      'access_token': instance.access_token,
      'username': instance.username,
      'expires': instance.expires.toIso8601String(),
    };

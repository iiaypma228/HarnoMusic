import 'package:garno_music/common/models/json_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'jwt_token.g.dart';

@JsonSerializable()
class JwtTokenDto implements IJsonModel<JwtTokenDto> {
  JwtTokenDto(
      {required this.access_token,
      required this.username,
      required this.expires});

  factory JwtTokenDto.fromJson(Map<String, dynamic> json) =>
      _$JwtTokenDtoFromJson(json);

  final String access_token;
  final String username;
  final DateTime expires;

  @override
  JwtTokenDto fromJson(Map<String, dynamic> json) =>
      _$JwtTokenDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$JwtTokenDtoToJson(this);
}

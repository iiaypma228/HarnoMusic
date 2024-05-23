import 'package:json_annotation/json_annotation.dart';

import '../../../../common/models/json_model.dart';
part 'user.g.dart';

@JsonSerializable()
class UserDto implements IJsonModel<UserDto> {
  UserDto(
      {required this.username, required this.email, required this.password});

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  final String email;
  final String username;
  final String password;

  @override
  UserDto fromJson(Map<String, dynamic> json) => _$UserDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UserDtoToJson(this);
}

import 'package:garno_music/common/models/json_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class User implements IJsonModel<User> {
  User(
      {required this.id,
      required this.email,
      required this.username,
      required this.password,
      this.avatar});
  final int id;
  final String email;
  final String username;
  final String password;
  final String? avatar;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  @override
  User fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

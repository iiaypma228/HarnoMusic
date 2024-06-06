import 'package:garno_music/common/models/json_model.dart';
import 'package:garno_music/features/profile/domain/models/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'chat_history.g.dart';

@JsonSerializable()
class ChatHistory implements IJsonModel<ChatHistory> {
  ChatHistory({required this.date, required this.user, required this.message});

  factory ChatHistory.fromJson(Map<String, dynamic> json) =>
      _$ChatHistoryFromJson(json);

  final DateTime date;
  final User user;
  final String message;

  @override
  ChatHistory fromJson(Map<String, dynamic> json) =>
      _$ChatHistoryFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ChatHistoryToJson(this);
}

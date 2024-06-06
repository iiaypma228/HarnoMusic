import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hicons/flutter_hicons.dart';
import 'package:garno_music/common/widget/text_field.dart';
import 'package:garno_music/features/main/presentation/widget/message_row.dart';

import '../../../../common/di/init.dart';
import '../../domain/models/chat_history.dart';
import '../bloc/player_bloc.dart';

class RoomChat extends StatefulWidget {
  const RoomChat({super.key, required this.chat});
  final List<ChatHistory> chat;
  @override
  State<RoomChat> createState() => _RoomChatState();
}

class _RoomChatState extends State<RoomChat> {
  final _bloc = sl<PlayerBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlayerBloc, PlayerState>(
      bloc: _bloc,
      listener: (context, state) {},
      builder: (context, state) {
        return ListView.builder(
            itemCount: widget.chat.length,
            itemBuilder: (context, index) {
              return MessageRow(message: widget.chat[index]);
              //return Text('test');
            });
      },
    );
  }
}

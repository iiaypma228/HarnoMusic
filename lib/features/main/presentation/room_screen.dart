import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hicons/flutter_hicons.dart';
import 'package:garno_music/common/helpers/string_extensions.dart';
import 'package:garno_music/common/widget/logo.dart';
import 'package:garno_music/common/widget/main_back_button.dart';
import 'package:garno_music/features/authorization/domain/services/authorization_api_service.dart';
import 'package:garno_music/features/main/presentation/widget/connected_user_row.dart';
import 'package:garno_music/features/main/presentation/widget/current_room.dart';
import 'package:garno_music/features/main/presentation/widget/leave_room_button.dart';
import 'package:garno_music/features/main/presentation/widget/not_connected.dart';

import '../../../common/di/init.dart';
import '../../../common/widget/base_state.dart';
import '../../profile/domain/models/user.dart';
import 'bloc/player_bloc.dart';

@RoutePage()
class RoomScreen extends StatefulWidget {
  const RoomScreen({super.key});

  @override
  State<RoomScreen> createState() => _RoomScreenState();
}

class _RoomScreenState extends ABaseState<RoomScreen> {
  bool isMaintainer = false;
  String code = '';
  List<User> users = [];

  final _bloc = sl<PlayerBloc>();

  @override
  void initState() {
    super.initState();
    _bloc.add(GetRoomStateEvent());
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: EdgeInsets.all(8.0),
      child: BlocBuilder<PlayerBloc, PlayerState>(
        bloc: _bloc,
        builder: (context, state) {
          if (state is RoomStateLoaded) {
            code = state.code;
            users = state.users;
          }

          if (state is UserConnectedToRoom) {
            if (!users.any((user) => state.user.id == user.id)) {
              users.add(state.user);
            }
          }

          if (state is UserDisconnectedFromRoom) {
            users.remove(state.user);
          }

          if (state is ConnectingToRoomSuccess || state is RoomCreatedState) {
            isMaintainer = state is RoomCreatedState;
            code = state is ConnectingToRoomSuccess
                ? state.code
                : (state as RoomCreatedState).code;
            return buildBody();
          }

          if (code.isNullOrEmpty) {
            return _buildNotConnected();
          } else {
            return buildBody();
          }
        },
      ),
    )));
  }

  Widget buildBody() {
    return Column(
      children: [
        const Row(
          children: [MainBackButton(), Spacer(), Logo(), Spacer()],
        ),
        const SizedBox(
          height: 20,
        ),
        CurrentRoom(code: code),
        const LeaveRoomButton(),
        ConnectedUserRow(
          user: AuthorizationService.currentUser!,
          isMaintainer: isMaintainer,
        ),
        SizedBox(
          height: 300,
          child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return ConnectedUserRow(
                  user: users[index],
                  isMaintainer: isMaintainer,
                );
              }),
        )
      ],
    );
  }

  Widget _buildNotConnected() {
    return const Column(children: [
      Row(
        children: [MainBackButton(), Spacer(), Logo(), Spacer()],
      ),
      Spacer(),
      NotConnected(),
      Spacer(),
    ]);
  }
}

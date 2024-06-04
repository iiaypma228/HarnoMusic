import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garno_music/common/widget/base_state.dart';
import 'package:garno_music/common/widget/loading.dart';
import 'package:garno_music/features/main/presentation/bloc/player_bloc.dart';
import 'package:garno_music/router/router.dart';

import '../../../../common/di/init.dart';
import '../../../../generated/l10n.dart';

class NotConnected extends StatefulWidget {
  const NotConnected({super.key});

  @override
  State<NotConnected> createState() => _NotConnectedState();
}

class _NotConnectedState extends ABaseState<NotConnected> {
  final _bloc = sl<PlayerBloc>();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          S.of(context).youListenMusicSingle,
          style: theme.textTheme.labelLarge,
        ),
        Text(S.of(context).goCorrectThis, style: theme.textTheme.labelLarge),
        const SizedBox(
          height: 10,
        ),
        //
        buildCreateRoomButton(),
        //
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 50,
          width: 200,
          child: ElevatedButton(
            onPressed: () =>
                AutoRouter.of(context).push(const InputCodeRoomRoute()),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff9456F9),
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
            ),
            child: Text(
              S.of(context).joinToRoom,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildCreateRoomButton() {
    return BlocBuilder<PlayerBloc, PlayerState>(
      bloc: _bloc,
      builder: (context, state) {
        var isConnecting = state is RoomCreatingState;

/*        if (state is RoomCreatedState) {
          AutoRouter.of(context).back();
        }*/

        return SizedBox(
          height: 50,
          width: 200,
          child: ElevatedButton(
            onPressed: isConnecting ? null : () => _bloc.add(CreateRoomEvent()),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff9456F9),
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
            ),
            child: isConnecting
                ? const Loading()
                : Text(
                    S.of(context).createRoom,
                    style: TextStyle(color: Colors.white),
                  ),
          ),
        );
      },
    );
  }
}

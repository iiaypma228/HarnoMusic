import 'package:flutter/material.dart';
import 'package:flutter_hicons/flutter_hicons.dart';
import 'package:garno_music/features/main/presentation/bloc/player_bloc.dart';

import '../../../../common/di/init.dart';
import '../../../../generated/l10n.dart';

class LeaveRoomButton extends StatefulWidget {
  const LeaveRoomButton({super.key});

  @override
  State<LeaveRoomButton> createState() => _LeaveRoomButtonState();
}

class _LeaveRoomButtonState extends State<LeaveRoomButton> {
  final _bloc = sl<PlayerBloc>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: ElevatedButton(
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
              onPressed: () => _bloc.add(LeaveRoomEvent()),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Hicons.logout_bold,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    S.of(context).leaveRoom,
                    style: const TextStyle(color: Colors.black),
                  )
                ],
              )),
        )
      ],
    );
  }
}

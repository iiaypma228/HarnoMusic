import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hicons/flutter_hicons.dart';
import 'package:garno_music/common/widget/playing_button.dart';

import '../../../../common/di/init.dart';
import '../../domain/models/track.dart';
import '../bloc/player_bloc.dart';

class PlayerButtons extends StatefulWidget {
  const PlayerButtons({super.key, required this.track});

  final Track track;

  @override
  State<PlayerButtons> createState() => _PlayerButtonsState();
}

class _PlayerButtonsState extends State<PlayerButtons> {
  final _bloc = sl<PlayerBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerBloc, PlayerState>(
      bloc: _bloc,
      builder: (context, state) {
        bool isPlaying =
            state is PlayingResumeState || state is StartPlayingTrackState;

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(Hicons.repeate_3_light_outline)),
            IconButton(
              onPressed: () {},
              icon: const Icon(Hicons.previous_bold),
              color: const Color(0xff363636),
            ),
            SizedBox(
              height: 70,
              width: 70,
              child: PlayingButton(
                track: widget.track,
                iconColor: Colors.white,
                buttonStyle: ButtonStyle(
                  backgroundColor:
                      WidgetStateProperty.all(const Color(0xff9456F9)),
                  shape: WidgetStateProperty.all(const CircleBorder()),
                ),
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(Hicons.next_bold),
                color: const Color(0xff363636)),
            IconButton(
                onPressed: () {},
                icon: const Icon(Hicons.shuffle_2_light_outline)),
          ],
        );
      },
    );
  }
}

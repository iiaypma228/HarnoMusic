import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hicons/flutter_hicons.dart';

import '../../features/main/domain/models/track.dart';
import '../../features/main/presentation/bloc/player_bloc.dart';
import '../di/init.dart';

class PlayingButton extends StatefulWidget {
  const PlayingButton(
      {super.key, required this.track, this.buttonStyle, this.iconColor});
  final ButtonStyle? buttonStyle;
  final Color? iconColor;
  final Track track;

  @override
  State<PlayingButton> createState() => _PlayingButtonState();
}

class _PlayingButtonState extends State<PlayingButton> {
  @override
  Widget build(BuildContext context) {
    final _bloc = sl<PlayerBloc>();

    return BlocBuilder<PlayerBloc, PlayerState>(
      bloc: _bloc,
      builder: (context, state) {
        late VoidCallback onPressed;
        late Icon icon;

        if (state is PlayingStopState && state.track.id == widget.track.id) {
          onPressed = () {
            _bloc.add(ResumePlayerEvent());
          };
          icon = const Icon(Hicons.play_bold);
        } else if (state is PlayingResumeState &&
            state.track.id == widget.track.id) {
          onPressed = () {
            _bloc.add(PausePlayingEvent());
          };
          icon = const Icon(Hicons.pause_bold);
        } else if (state is StartPlayingTrackState &&
            state.track.id == widget.track.id) {
          onPressed = () {
            _bloc.add(PausePlayingEvent());
          };
          icon = const Icon(Hicons.pause_bold);
        } else {
          onPressed = () {
            _bloc.add(PlayTrackEvent(track: widget.track));
          };
          icon = const Icon(Hicons.play_bold);
        }

        return Container(
          decoration: widget.buttonStyle == null
              ? BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  image: DecorationImage(
                      image: widget.track.imageSource?.image ??
                          Image.asset('assets/images/music_note.png').image,
                      fit: BoxFit.cover),
                )
              : null,
          child: IconButton(
            onPressed: onPressed,
            color: widget.iconColor,
            icon: icon,
            iconSize: 20,
            style: widget.buttonStyle ??
                ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all(Colors.transparent)),
          ),
        );
      },
    );
  }
}

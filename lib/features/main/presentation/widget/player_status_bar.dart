import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hicons/flutter_hicons.dart';
import 'package:garno_music/common/widget/auto_scrolled_text.dart';
import 'package:garno_music/common/widget/liked_button.dart';
import 'package:garno_music/common/widget/more_action_button.dart';
import 'package:garno_music/router/router.dart';

import '../../../../common/di/init.dart';
import '../../../../common/widget/base_state.dart';
import '../../domain/models/track.dart';
import '../bloc/player_bloc.dart';

class PlayerStatusBar extends StatefulWidget {
  PlayerStatusBar({super.key});

  Track? _track;

  @override
  State<PlayerStatusBar> createState() => _PlayerStatusBarState();
}

class _PlayerStatusBarState extends ABaseState<PlayerStatusBar> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final _bloc = sl<PlayerBloc>();

    return BlocBuilder<PlayerBloc, PlayerState>(
      bloc: _bloc,
      builder: (context, state) {
        _handleState(context, state, _bloc);
        return GestureDetector(
            onTap: () =>
                AutoRouter.of(context).push(PlayerRoute(track: widget._track)),
            child: ListTile(
              selectedColor: theme.bottomNavigationBarTheme.backgroundColor,
              selectedTileColor: theme.bottomNavigationBarTheme.backgroundColor,
              selected: true,
              tileColor: const Color(0xffE6E6E6),
              leading: widget._track?.imageSource ??
                  Image.asset('assets/images/music_note.png'),
              title: Text(
                widget._track?.name ?? '',
                style: theme.textTheme.labelMedium,
              ),
              subtitle: Text(widget._track?.artistName ?? '',
                  style: theme.textTheme.labelSmall),
              trailing: widget._track != null
                  ? MoreActionButton(track: widget._track!)
                  : null,
            ));
      },
    );
  }

  void _handleState(BuildContext context, PlayerState state, PlayerBloc bloc) {
    if (state is StartPlayingTrackState) {
      widget._track = state.track;
    }
    if (state is PlayingStopState) {
      widget._track = state.track;
    }

    if (state is PlayingResumeState) {
      widget._track = state.track;
    }

    if (widget._track == null) {
      bloc.add(LoadLastTrackEvent());
    }
  }
}

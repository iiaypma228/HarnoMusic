import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hicons/flutter_hicons.dart';
import 'package:garno_music/router/router.dart';

import '../../../../common/di/init.dart';
import '../../../../generated/l10n.dart';
import '../../../library/presentation/bloc/library_bloc.dart';

class LikeTracks extends StatefulWidget {
  const LikeTracks({super.key});

  @override
  State<LikeTracks> createState() => _LikeTracksState();
}

class _LikeTracksState extends State<LikeTracks> {
  final _bloc = sl<LibraryBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LibraryBloc, LibraryState>(
      bloc: _bloc,
      builder: (context, state) {
        if (state is LibraryLoadedState) {
          return ListTile(
            leading: const Icon(Hicons.heart_1_light_outline),
            title: Text(S.of(context).likesTrack),
            subtitle: Text(
                '${state.likedTracks.tracks.length} ${S.of(context).tracks}'),
            onTap: () => AutoRouter.of(context)
                .push(PlayListRoute(playList: state.likedTracks)),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

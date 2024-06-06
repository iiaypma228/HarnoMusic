import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hicons/flutter_hicons.dart';
import 'package:garno_music/features/library/domain/models/play_list.dart';
import 'package:garno_music/router/router.dart';

import '../../../../common/bloc/liked/liked_bloc.dart';
import '../../../../common/di/init.dart';
import '../../../../generated/l10n.dart';
import '../../../library/presentation/bloc/library_bloc.dart';
import '../../../main/domain/models/track.dart';

class LikeTracks extends StatefulWidget {
  const LikeTracks({super.key});

  @override
  State<LikeTracks> createState() => _LikeTracksState();
}

class _LikeTracksState extends State<LikeTracks> {
  final _bloc = sl<LibraryBloc>();
  final _likedBloc = sl<LikedBloc>();
  late PlayList _likeTracks;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LibraryBloc, LibraryState>(
      bloc: _bloc,
      builder: (context, stateLibrary) {
        if (stateLibrary is LibraryLoadedState) {
          _likeTracks = stateLibrary.likedTracks;
          return BlocConsumer<LikedBloc, LikedState>(
            listener: (context, state) {
              if (state is LikedAdded) {
                _likeTracks.tracks.add(state.track);
              }

              if (state is LikedRemove) {
                _likeTracks.tracks.remove(state.track);
              }
            },
            bloc: _likedBloc,
            builder: (context, state) {
              return ListTile(
                leading: const Icon(Hicons.heart_1_light_outline),
                title: Text(S.of(context).likesTrack),
                subtitle: Text(
                    '${stateLibrary.likedTracks.tracks.length} ${S.of(context).tracks}'),
                onTap: () => AutoRouter.of(context)
                    .push(PlayListRoute(playList: stateLibrary.likedTracks)),
              );
            },
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

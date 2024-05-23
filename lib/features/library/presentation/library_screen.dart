import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hicons/flutter_hicons.dart';
import 'package:garno_music/common/bloc/liked/liked_bloc.dart';
import 'package:garno_music/common/widget/loading.dart';
import 'package:garno_music/features/library/domain/models/play_list.dart';
import 'package:garno_music/features/library/presentation/bloc/library_bloc.dart';
import 'package:garno_music/features/library/presentation/widget/liked_music.dart';
import 'package:garno_music/features/library/presentation/widget/local_music.dart';

import '../../../common/di/init.dart';
import '../../../common/widget/base_state.dart';
import '../../../common/widget/logo.dart';
import '../../../generated/l10n.dart';
import '../../main/presentation/bloc/player_bloc.dart';

@RoutePage()
class LibraryScreen extends StatefulWidget {
  LibraryScreen({super.key});

  bool isLoading = false;
  PlayList local = PlayList.empty();
  PlayList liked = PlayList.empty();
  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends ABaseState<LibraryScreen> {
  @override
  void initState() {
    super.initState();
    _bloc.add(LoadLibraryEvent());
  }

  final _likedBloc = sl<LikedBloc>();
  final _bloc = sl<LibraryBloc>();
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: BlocBuilder<LibraryBloc, LibraryState>(
        bloc: _bloc,
        builder: (context, state) {
          widget.isLoading = state is LibraryLoadingState;
          if (state is LibraryLoadedState) {
            widget.liked = state.likedTracks;
            widget.local = state.localTracks;
          }

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
            child: widget.isLoading
                ? const Loading()
                : Column(
                    children: [
                      Row(
                        children: [
                          Spacer(),
                          Text(
                            S.of(context).myLibrary,
                            style: theme.textTheme.labelLarge,
                          ),
                          Spacer(),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Hicons.search_2_light_outline)),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Hicons.add_light_outline,
                              size: 30,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      LocalMusic(localTracks: widget.local),
                      _getLikedMusicBody(),
                    ],
                  ),
          );
        },
      ),
    );
  }

  Widget _getLikedMusicBody() {
    return BlocBuilder<LikedBloc, LikedState>(
      bloc: _likedBloc,
      builder: (context, state) {
        if (state is LikedAdded &&
            !widget.liked.tracks.any((e) => state.track.id == e.id)) {
          widget.liked.tracks.add(state.track);
        }

        if (state is LikedRemove) {
          widget.liked.tracks.remove(state.track);
        }

        return LikedMusic(likedTracks: widget.liked);
      },
    );
  }
}

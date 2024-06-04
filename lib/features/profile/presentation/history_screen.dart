import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hicons/flutter_hicons.dart';
import 'package:garno_music/common/widget/loading.dart';
import 'package:garno_music/features/library/domain/models/play_list.dart';
import 'package:garno_music/features/profile/presentation/bloc/track_history/track_history_bloc.dart';
import 'package:garno_music/router/router.dart';

import '../../../common/di/init.dart';
import '../../../common/widget/track_list.dart';
import '../../library/presentation/widget/sort_list.dart';

@RoutePage()
class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final _bloc = sl<TrackHistoryBloc>();

  @override
  void initState() {
    _bloc.add(LoadTrackHistory());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<TrackHistoryBloc, TrackHistoryState>(
            bloc: _bloc,
            builder: (context, state) {
              if (state is TrackHistoryLoading) {
                return const Loading();
              } else if (state is TrackHistoryLoaded) {
                return _getBody(state);
              }
              return const Placeholder();
            }),
      ),
    );
  }

  Widget _getBody(TrackHistoryLoaded state) {
    var playList = PlayList(
        id: 0,
        name: 'Історія',
        userId: 0,
        tracks: state.history.map((e) => e.track).toList());
    return Column(
      children: [
        Container(
          color: const Color(0xffAAAAAA).withOpacity(0.13),
          child: Row(
            children: [
              const BackButton(),
              const Spacer(),
              Text(playList.name),
              const Spacer(),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Hicons.search_1_light_outline)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: SortList(tracks: playList.tracks, onSorted: (tracks) {}),
        ),
        TrackList(
          tracks: playList.tracks,
        ),
      ],
    );
  }
}

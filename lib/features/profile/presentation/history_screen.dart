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
import '../../library/presentation/widget/search_track_delegate.dart';
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
    return BlocBuilder<TrackHistoryBloc, TrackHistoryState>(
        bloc: _bloc,
        builder: (context, state) {
          if (state is TrackHistoryLoading) {
            return const Scaffold(
              body: Loading(),
            );
          } else if (state is TrackHistoryLoaded) {
            return _getBody(state);
          }
          return const Placeholder();
        });
  }

  Widget _getBody(TrackHistoryLoaded state) {
    var playList = PlayList(
        id: 0,
        name: 'Історія',
        userId: 0,
        tracks: state.history.map((e) => e.track).toList());

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                showSearch(
                    context: context,
                    delegate: SearchTrackPlayListDelegate(
                        playLists: playList.tracks));
              },
              icon: const Icon(Hicons.search_1_light_outline))
        ],
        title: Text(playList.name),
        leading: const BackButton(),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: SortList(
            tracks: playList.tracks,
            builder: (context) => TrackList(
              needExpanded: false,
              tracks: playList.tracks,
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hicons/flutter_hicons.dart';
import 'package:garno_music/common/widget/track_list.dart';
import 'package:garno_music/features/library/domain/models/play_list.dart';
import 'package:garno_music/features/library/presentation/widget/search_track_delegate.dart';
import 'package:garno_music/features/library/presentation/widget/sort_list.dart';

import '../../../common/di/init.dart';
import '../../search/presentation/widget/search_track_delegate.dart';

@RoutePage()
class PlayListScreen extends StatefulWidget {
  const PlayListScreen({super.key, required this.playList});

  final PlayList playList;

  @override
  State<PlayListScreen> createState() => _PlayListScreenState();
}

class _PlayListScreenState extends State<PlayListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                showSearch(
                    context: context,
                    delegate: SearchTrackPlayListDelegate(
                        playLists: widget.playList.tracks));
              },
              icon: const Icon(Hicons.search_1_light_outline))
        ],
        title: Text(widget.playList.name),
        leading: const BackButton(),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: SortList(
            tracks: widget.playList.tracks,
            builder: (context) => TrackList(
              needExpanded: false,
              tracks: widget.playList.tracks,
            ),
          ),
        ),
      ),
    );
  }
}

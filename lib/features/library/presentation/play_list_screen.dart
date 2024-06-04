import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hicons/flutter_hicons.dart';
import 'package:garno_music/common/widget/track_list.dart';
import 'package:garno_music/features/library/domain/models/play_list.dart';
import 'package:garno_music/features/library/presentation/widget/sort_list.dart';

import '../../../common/di/init.dart';

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
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: const Color(0xffAAAAAA).withOpacity(0.13),
              child: Row(
                children: [
                  const BackButton(),
                  const Spacer(),
                  Text(widget.playList.name),
                  const Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Hicons.search_1_light_outline)),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.more_vert))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: SortList(
                  tracks: widget.playList.tracks, onSorted: (tracks) {}),
            ),
            TrackList(
              tracks: widget.playList.tracks,
            ),
          ],
        ),
      ),
    );
  }
}

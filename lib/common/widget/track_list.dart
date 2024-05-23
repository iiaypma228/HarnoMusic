import 'package:flutter/material.dart';
import 'package:garno_music/common/widget/base_state.dart';

import '../../features/main/domain/models/track.dart';
import 'track_row.dart';

class TrackList extends StatefulWidget {
  const TrackList(
      {super.key,
      required this.tracks,
      this.itemBuilder,
      this.needExpanded = true})
      : _isSliver = false;

  const TrackList.sliver(
      {super.key,
      this.itemBuilder,
      required this.tracks,
      this.needExpanded = false})
      : _isSliver = true;
  final bool needExpanded;
  final _isSliver;

  final NullableIndexedWidgetBuilder? itemBuilder;
  final List<Track> tracks;

  @override
  State<TrackList> createState() => _TrackListState();
}

class _TrackListState extends ABaseState<TrackList> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return getBody();
  }

  Widget getBody() {
    var list = getList();
    if (widget.needExpanded) {
      return Expanded(child: list);
    }
    return list;
  }

  Widget getList() {
    if (widget._isSliver) {
      return SliverList.separated(
          itemCount: widget.tracks.length,
          itemBuilder: getItemBuilder(),
          separatorBuilder: getSeparatorBuilder());
    } else {
      return ListView.separated(
          itemCount: widget.tracks.length,
          padding: EdgeInsets.zero,
          separatorBuilder: getSeparatorBuilder(),
          itemBuilder: getItemBuilder());
    }
  }

  IndexedWidgetBuilder getSeparatorBuilder() {
    return (context, index) => const Divider(
          height: 0,
        );
  }

  NullableIndexedWidgetBuilder getItemBuilder() {
    return widget.itemBuilder ??
        (context, index) {
          final track = widget.tracks[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
            child: TrackRow(
              track: track,
              showLikeButton: false,
              titleTextStyle:
                  const TextStyle(fontSize: 18, color: Colors.black),
            ),
          );
        };
  }
}

import 'package:flutter/material.dart';
import 'package:garno_music/common/helpers/duration_extensions.dart';
import 'package:garno_music/common/widget/playing_button.dart';

import '../../features/main/domain/models/track.dart';
import 'liked_button.dart';

class TrackRow extends StatefulWidget {
  const TrackRow({
    super.key,
    required this.track,
    this.showLikeButton = true,
    this.titleTextStyle,
    this.subTitleTextStyle,
  });

  final Track track;

  final bool showLikeButton;
  final TextStyle? titleTextStyle;
  final TextStyle? subTitleTextStyle;

  @override
  State<TrackRow> createState() => _TrackRowState();
}

class _TrackRowState extends State<TrackRow> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      tileColor: Colors.transparent,
      leading: PlayingButton(track: widget.track),
      titleTextStyle: widget.titleTextStyle ??
          const TextStyle(
              color: Colors.black, fontWeight: FontWeight.w800, fontSize: 20),
      title: Text(
        widget.track.name,
      ),
      subtitleTextStyle: widget.subTitleTextStyle ??
          const TextStyle(fontSize: 15, color: Color(0xff838383)),
      subtitle: Text(
        widget.track.artistName,
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(Duration(seconds: widget.track.duration).totalDuration),
          if (widget.showLikeButton) LikedButton(track: widget.track),
        ],
      ),
    );
  }
}

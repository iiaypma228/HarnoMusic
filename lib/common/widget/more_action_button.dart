import 'package:flutter/material.dart';
import 'package:flutter_hicons/flutter_hicons.dart';
import 'package:garno_music/common/widget/more_track_action_bottom_sheet_bar.dart';

import '../../features/main/domain/models/track.dart';

class MoreActionButton extends StatefulWidget {
  const MoreActionButton({super.key, required this.track});

  final Track track;

  @override
  State<MoreActionButton> createState() => _MoreActionButtonState();
}

class _MoreActionButtonState extends State<MoreActionButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => showModalBottomSheet(
              context: context,
              builder: (context) =>
                  MoreTrackActionBottomSheetBar(track: widget.track),
            ),
        icon: const Icon(Icons.more_vert));
  }
}

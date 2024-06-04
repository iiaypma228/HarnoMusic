import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hicons/flutter_hicons.dart';

import '../../../../common/widget/base_state.dart';
import '../../../../generated/l10n.dart';
import '../../../../router/router.dart';
import '../../domain/models/play_list.dart';

class PlayListRow extends StatefulWidget {
  const PlayListRow({super.key, required this.playList, this.onTap});

  final VoidCallback? onTap;
  final PlayList playList;

  @override
  State<PlayListRow> createState() => _PlayListRowState();
}

class _PlayListRowState extends ABaseState<PlayListRow> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListTile(
      onTap: () => widget.onTap != null
          ? widget.onTap!()
          : AutoRouter.of(context)
              .navigate(PlayListRoute(playList: widget.playList)),
      contentPadding: EdgeInsets.zero,
      leading: Container(
          width: 50,
          height: 50,
          decoration: widget.playList.image == null
              ? const BoxDecoration(color: Color(0xff303030))
              : null,
          child: widget.playList.tracks.isNotEmpty
              ? Image.network(widget.playList.tracks.first.image)
              : const Icon(
                  Hicons.folder_1_bold,
                  color: Color(0xff9456F9),
                  size: 30,
                )),
      title: Text(
        widget.playList.name,
        style: theme.textTheme.titleMedium,
      ),
      subtitle: Text(
        '${widget.playList.tracks.length} ${S.of(context).tracks}',
        style: theme.textTheme.titleSmall,
      ),
    );
  }
}

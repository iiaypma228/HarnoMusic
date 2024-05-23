import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hicons/flutter_hicons.dart';
import 'package:garno_music/router/router.dart';

import '../../../../common/di/init.dart';
import '../../../../common/widget/base_state.dart';
import '../../../../generated/l10n.dart';
import '../../../main/domain/models/track.dart';
import '../../domain/models/play_list.dart';
import '../bloc/library_bloc.dart';

class LocalMusic extends StatefulWidget {
  const LocalMusic({super.key, required this.localTracks});

  final PlayList localTracks;

  @override
  State<LocalMusic> createState() => _LocalMusicState();
}

class _LocalMusicState extends ABaseState<LocalMusic> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListTile(
      onTap: widget.localTracks != null
          ? () => AutoRouter.of(context)
              .navigate(PlayListRoute(playList: widget.localTracks!))
          : null,
      contentPadding: EdgeInsets.zero,
      leading: Container(
          width: 50,
          height: 50,
          decoration: const BoxDecoration(color: Color(0xff303030)),
          child: const Icon(
            Hicons.folder_1_bold,
            color: Color(0xff9456F9),
            size: 30,
          )),
      title: Text(
        S.of(context).localFiles,
        style: theme.textTheme.titleMedium,
      ),
      subtitle: Text(
        '${widget.localTracks?.tracks.length} ${S.of(context).tracks}',
        style: theme.textTheme.titleSmall,
      ),
    );
  }
}

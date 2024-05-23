import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hicons/flutter_hicons.dart';
import 'package:garno_music/router/router.dart';

import '../../../../common/di/init.dart';
import '../../../../common/widget/base_state.dart';
import '../../../../generated/l10n.dart';
import '../../domain/models/play_list.dart';
import '../bloc/library_bloc.dart';

class LikedMusic extends StatefulWidget {
  const LikedMusic({super.key, required this.likedTracks});

  final PlayList likedTracks;

  @override
  State<LikedMusic> createState() => _LocalMusicState();
}

class _LocalMusicState extends ABaseState<LikedMusic> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListTile(
      onTap: widget.likedTracks != null
          ? () => AutoRouter.of(context)
              .navigate(PlayListRoute(playList: widget.likedTracks!))
          : null,
      contentPadding: EdgeInsets.zero,
      leading: Container(
          width: 50,
          height: 50,
          decoration: const BoxDecoration(color: Color(0xff303030)),
          child: const Icon(
            Hicons.heart_1_bold,
            color: Color(0xff9456F9),
            size: 30,
          )),
      title: Text(
        S.of(context).likesTrack,
        style: theme.textTheme.titleMedium,
      ),
      subtitle: Text(
        '${widget.likedTracks?.tracks.length} ${S.of(context).tracks}',
        style: theme.textTheme.titleSmall,
      ),
    );
  }
}

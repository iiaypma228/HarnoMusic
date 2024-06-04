import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hicons/flutter_hicons.dart';
import 'package:garno_music/router/router.dart';

import '../../../../generated/l10n.dart';

class TrackHistory extends StatefulWidget {
  const TrackHistory({super.key});

  @override
  State<TrackHistory> createState() => _TrackHistoryState();
}

class _TrackHistoryState extends State<TrackHistory> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Hicons.time_circle_6_light_outline),
      title: Text(S.of(context).listenHistory),
      //subtitle: Text(_getNameLocale()),
      onTap: () => AutoRouter.of(context).push(const HistoryRoute()),
    );
  }
}

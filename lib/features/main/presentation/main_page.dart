import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart' as cu;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hicons/flutter_hicons.dart';
import 'package:garno_music/common/bloc/liked/liked_bloc.dart';
import 'package:garno_music/features/main/presentation/widget/player_status_bar.dart';
import 'package:garno_music/router/router.dart';

import '../../../common/di/init.dart';
import '../domain/models/track.dart';
import 'bloc/player_bloc.dart';

@RoutePage()
class MainPage extends StatefulWidget {
  MainPage({super.key});
  Track? _currentTrack;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _bloc = sl<PlayerBloc>();

  @override
  void initState() {
    super.initState();
    sl<LikedBloc>().add(LoadLikedEvent());
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: [
        const HomeRoute(),
        SearchRoute(),
        LibraryRoute(),
        const ProfileRoute()
      ],
      builder: (context, screen) {
        final tabsRouter = AutoTabsRouter.of(context);
        return BlocBuilder<PlayerBloc, PlayerState>(
          bloc: _bloc,
          builder: (context, state) {
            if (state is StartPlayingTrackState) {
              widget._currentTrack = state.track;
            }
            return Scaffold(
              body: screen,
              bottomNavigationBar: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  PlayerStatusBar(),
                  BottomNavigationBar(
                    onTap: (index) => tabsRouter.setActiveIndex(index),
                    currentIndex: tabsRouter.activeIndex,
                    unselectedItemColor: const Color(0xff808080),
                    selectedItemColor: const Color(0xff9456F9),
                    items: const [
                      BottomNavigationBarItem(
                          icon: Icon(Hicons.home_2_bold), label: ''),
                      BottomNavigationBarItem(
                          icon: Icon(Hicons.discovery_1_light_outline),
                          label: ''),
                      BottomNavigationBarItem(
                          icon: Icon(Hicons.heart_1_light_outline), label: ''),
                      BottomNavigationBarItem(
                          icon: Icon(Hicons.profile_1_light_outline),
                          label: ''),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

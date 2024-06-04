import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:garno_music/features/library/domain/models/play_list.dart';
import '../features/authorization/presentation/sign_in/sign_in_screen.dart';
import '../features/authorization/presentation/sign_up/sign_up_screen.dart';
import '../features/home/presentation/home_screen.dart';
import '../features/library/presentation/create_playlist_screen.dart';
import '../features/library/presentation/library_screen.dart';
import '../features/library/presentation/play_list_screen.dart';
import '../features/main/domain/models/track.dart';
import '../features/main/presentation/input_code_room_screen.dart';
import '../features/main/presentation/main_page.dart';
import '../features/main/presentation/player_screen.dart';
import '../features/main/presentation/room_screen.dart';
import '../features/profile/presentation/history_screen.dart';
import '../features/profile/presentation/profile_screen.dart';
import '../features/search/presentation/search_screen.dart';
import '../features/search/presentation/track_by_genres_screen.dart';
import '../features/search/presentation/widget/genres.dart';
import '../features/welcome/presentation/welcome_screen.dart';
part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: WelcomeRoute.page, initial: true),
        AutoRoute(page: SignInRoute.page),
        AutoRoute(page: SignUpRoute.page),
        AutoRoute(page: PlayerRoute.page),
        AutoRoute(page: PlayListRoute.page),
        AutoRoute(page: TrackByGenresRoute.page),
        AutoRoute(page: RoomRoute.page),
        AutoRoute(page: InputCodeRoomRoute.page),
        AutoRoute(page: CreatePlaylistRoute.page),
        AutoRoute(page: HistoryRoute.page),
        AutoRoute(page: MainRoute.page, children: [
          AutoRoute(page: HomeRoute.page),
          AutoRoute(page: SearchRoute.page),
          AutoRoute(page: LibraryRoute.page),
          AutoRoute(page: ProfileRoute.page),
        ]),
      ];
}

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    CreatePlaylistRoute.name: (routeData) {
      final args = routeData.argsAs<CreatePlaylistRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CreatePlaylistScreen(
          key: args.key,
          playLists: args.playLists,
        ),
      );
    },
    HistoryRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HistoryScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    InputCodeRoomRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const InputCodeRoomScreen(),
      );
    },
    LibraryRoute.name: (routeData) {
      final args = routeData.argsAs<LibraryRouteArgs>(
          orElse: () => const LibraryRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: LibraryScreen(key: args.key),
      );
    },
    MainRoute.name: (routeData) {
      final args =
          routeData.argsAs<MainRouteArgs>(orElse: () => const MainRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MainPage(key: args.key),
      );
    },
    PlayListRoute.name: (routeData) {
      final args = routeData.argsAs<PlayListRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PlayListScreen(
          key: args.key,
          playList: args.playList,
        ),
      );
    },
    PlayerRoute.name: (routeData) {
      final args = routeData.argsAs<PlayerRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PlayerScreen(
          key: args.key,
          track: args.track,
        ),
      );
    },
    ProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileScreen(),
      );
    },
    RoomRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: RoomScreen(),
      );
    },
    SearchRoute.name: (routeData) {
      final args = routeData.argsAs<SearchRouteArgs>(
          orElse: () => const SearchRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SearchScreen(key: args.key),
      );
    },
    SignInRoute.name: (routeData) {
      final args = routeData.argsAs<SignInRouteArgs>(
          orElse: () => const SignInRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SignInScreen(key: args.key),
      );
    },
    SignUpRoute.name: (routeData) {
      final args = routeData.argsAs<SignUpRouteArgs>(
          orElse: () => const SignUpRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SignUpScreen(key: args.key),
      );
    },
    TrackByGenresRoute.name: (routeData) {
      final args = routeData.argsAs<TrackByGenresRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TrackByGenresScreen(
          key: args.key,
          model: args.model,
        ),
      );
    },
    WelcomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const WelcomeScreen(),
      );
    },
  };
}

/// generated route for
/// [CreatePlaylistScreen]
class CreatePlaylistRoute extends PageRouteInfo<CreatePlaylistRouteArgs> {
  CreatePlaylistRoute({
    Key? key,
    required List<PlayList> playLists,
    List<PageRouteInfo>? children,
  }) : super(
          CreatePlaylistRoute.name,
          args: CreatePlaylistRouteArgs(
            key: key,
            playLists: playLists,
          ),
          initialChildren: children,
        );

  static const String name = 'CreatePlaylistRoute';

  static const PageInfo<CreatePlaylistRouteArgs> page =
      PageInfo<CreatePlaylistRouteArgs>(name);
}

class CreatePlaylistRouteArgs {
  const CreatePlaylistRouteArgs({
    this.key,
    required this.playLists,
  });

  final Key? key;

  final List<PlayList> playLists;

  @override
  String toString() {
    return 'CreatePlaylistRouteArgs{key: $key, playLists: $playLists}';
  }
}

/// generated route for
/// [HistoryScreen]
class HistoryRoute extends PageRouteInfo<void> {
  const HistoryRoute({List<PageRouteInfo>? children})
      : super(
          HistoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'HistoryRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [InputCodeRoomScreen]
class InputCodeRoomRoute extends PageRouteInfo<void> {
  const InputCodeRoomRoute({List<PageRouteInfo>? children})
      : super(
          InputCodeRoomRoute.name,
          initialChildren: children,
        );

  static const String name = 'InputCodeRoomRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LibraryScreen]
class LibraryRoute extends PageRouteInfo<LibraryRouteArgs> {
  LibraryRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          LibraryRoute.name,
          args: LibraryRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LibraryRoute';

  static const PageInfo<LibraryRouteArgs> page =
      PageInfo<LibraryRouteArgs>(name);
}

class LibraryRouteArgs {
  const LibraryRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'LibraryRouteArgs{key: $key}';
  }
}

/// generated route for
/// [MainPage]
class MainRoute extends PageRouteInfo<MainRouteArgs> {
  MainRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          MainRoute.name,
          args: MainRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const PageInfo<MainRouteArgs> page = PageInfo<MainRouteArgs>(name);
}

class MainRouteArgs {
  const MainRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'MainRouteArgs{key: $key}';
  }
}

/// generated route for
/// [PlayListScreen]
class PlayListRoute extends PageRouteInfo<PlayListRouteArgs> {
  PlayListRoute({
    Key? key,
    required PlayList playList,
    List<PageRouteInfo>? children,
  }) : super(
          PlayListRoute.name,
          args: PlayListRouteArgs(
            key: key,
            playList: playList,
          ),
          initialChildren: children,
        );

  static const String name = 'PlayListRoute';

  static const PageInfo<PlayListRouteArgs> page =
      PageInfo<PlayListRouteArgs>(name);
}

class PlayListRouteArgs {
  const PlayListRouteArgs({
    this.key,
    required this.playList,
  });

  final Key? key;

  final PlayList playList;

  @override
  String toString() {
    return 'PlayListRouteArgs{key: $key, playList: $playList}';
  }
}

/// generated route for
/// [PlayerScreen]
class PlayerRoute extends PageRouteInfo<PlayerRouteArgs> {
  PlayerRoute({
    Key? key,
    required dynamic track,
    List<PageRouteInfo>? children,
  }) : super(
          PlayerRoute.name,
          args: PlayerRouteArgs(
            key: key,
            track: track,
          ),
          initialChildren: children,
        );

  static const String name = 'PlayerRoute';

  static const PageInfo<PlayerRouteArgs> page = PageInfo<PlayerRouteArgs>(name);
}

class PlayerRouteArgs {
  const PlayerRouteArgs({
    this.key,
    required this.track,
  });

  final Key? key;

  final dynamic track;

  @override
  String toString() {
    return 'PlayerRouteArgs{key: $key, track: $track}';
  }
}

/// generated route for
/// [ProfileScreen]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RoomScreen]
class RoomRoute extends PageRouteInfo<void> {
  const RoomRoute({List<PageRouteInfo>? children})
      : super(
          RoomRoute.name,
          initialChildren: children,
        );

  static const String name = 'RoomRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SearchScreen]
class SearchRoute extends PageRouteInfo<SearchRouteArgs> {
  SearchRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          SearchRoute.name,
          args: SearchRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static const PageInfo<SearchRouteArgs> page = PageInfo<SearchRouteArgs>(name);
}

class SearchRouteArgs {
  const SearchRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'SearchRouteArgs{key: $key}';
  }
}

/// generated route for
/// [SignInScreen]
class SignInRoute extends PageRouteInfo<SignInRouteArgs> {
  SignInRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          SignInRoute.name,
          args: SignInRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const PageInfo<SignInRouteArgs> page = PageInfo<SignInRouteArgs>(name);
}

class SignInRouteArgs {
  const SignInRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'SignInRouteArgs{key: $key}';
  }
}

/// generated route for
/// [SignUpScreen]
class SignUpRoute extends PageRouteInfo<SignUpRouteArgs> {
  SignUpRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          SignUpRoute.name,
          args: SignUpRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const PageInfo<SignUpRouteArgs> page = PageInfo<SignUpRouteArgs>(name);
}

class SignUpRouteArgs {
  const SignUpRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'SignUpRouteArgs{key: $key}';
  }
}

/// generated route for
/// [TrackByGenresScreen]
class TrackByGenresRoute extends PageRouteInfo<TrackByGenresRouteArgs> {
  TrackByGenresRoute({
    Key? key,
    required GenresModel model,
    List<PageRouteInfo>? children,
  }) : super(
          TrackByGenresRoute.name,
          args: TrackByGenresRouteArgs(
            key: key,
            model: model,
          ),
          initialChildren: children,
        );

  static const String name = 'TrackByGenresRoute';

  static const PageInfo<TrackByGenresRouteArgs> page =
      PageInfo<TrackByGenresRouteArgs>(name);
}

class TrackByGenresRouteArgs {
  const TrackByGenresRouteArgs({
    this.key,
    required this.model,
  });

  final Key? key;

  final GenresModel model;

  @override
  String toString() {
    return 'TrackByGenresRouteArgs{key: $key, model: $model}';
  }
}

/// generated route for
/// [WelcomeScreen]
class WelcomeRoute extends PageRouteInfo<void> {
  const WelcomeRoute({List<PageRouteInfo>? children})
      : super(
          WelcomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'WelcomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

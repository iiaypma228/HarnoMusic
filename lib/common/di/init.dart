import 'package:audioplayers/audioplayers.dart';
import 'package:dio/dio.dart';
import 'package:garno_music/common/bloc/liked/liked_bloc.dart';
import 'package:garno_music/common/config.dart';
import 'package:garno_music/features/authorization/data/datasource/a_authorization_datasource.dart';
import 'package:garno_music/features/authorization/data/datasource/authorization_api_datasource.dart';
import 'package:garno_music/features/authorization/data/repository/authorization_repository.dart';
import 'package:garno_music/features/authorization/domain/repository/sign_in_repository.dart';
import 'package:garno_music/features/authorization/domain/services/a_authorization_service.dart';
import 'package:garno_music/features/authorization/domain/services/authorization_api_service.dart';
import 'package:garno_music/features/authorization/presentation/sign_in/bloc/sign_in_bloc.dart';
import 'package:garno_music/features/authorization/presentation/sign_up/bloc/sign_up_bloc.dart';
import 'package:garno_music/features/home/data/datasource/a_album_datasource.dart';
import 'package:garno_music/features/home/data/datasource/a_track_datasource.dart';
import 'package:garno_music/features/home/data/datasource/album_api_datasource.dart';
import 'package:garno_music/features/home/data/datasource/track_api_datasource.dart';
import 'package:garno_music/features/home/data/repository/album_api_repository.dart';
import 'package:garno_music/features/home/data/repository/track_api_repository.dart';
import 'package:garno_music/features/home/domain/repository/album_repository.dart';
import 'package:garno_music/features/home/domain/repository/track_repository.dart';
import 'package:garno_music/features/home/domain/services/a_album_service.dart';
import 'package:garno_music/features/home/domain/services/a_track_service.dart';
import 'package:garno_music/features/home/domain/services/album_service.dart';
import 'package:garno_music/features/home/domain/services/track_service.dart';
import 'package:garno_music/features/home/presentation/bloc/album_bloc.dart';
import 'package:garno_music/features/library/data/datasource/i_library_datasource.dart';
import 'package:garno_music/features/library/data/datasource/library_api_datasource.dart';
import 'package:garno_music/features/library/data/repository/library_repository.dart';
import 'package:garno_music/features/library/domain/repository/i_library_repository.dart';
import 'package:garno_music/features/library/domain/services/I_library_service.dart';
import 'package:garno_music/features/library/domain/services/library_service.dart';
import 'package:garno_music/features/library/presentation/bloc/download/download_bloc.dart';
import 'package:garno_music/features/library/presentation/bloc/library_bloc.dart';
import 'package:garno_music/features/main/data/datasource/a_together_listening_datasource.dart';
import 'package:garno_music/features/main/data/datasource/together_listening_api_datasource.dart';
import 'package:garno_music/features/main/data/repository/together_listening_repository.dart';
import 'package:garno_music/features/main/domain/repository/a_together_listening_repository.dart';
import 'package:garno_music/features/main/domain/services/a_player_service.dart';
import 'package:garno_music/features/main/domain/services/a_together_listening_service.dart';
import 'package:garno_music/features/main/domain/services/player_service.dart';
import 'package:garno_music/features/main/domain/services/together_listening_service.dart';
import 'package:garno_music/features/main/presentation/bloc/player_bloc.dart';
import 'package:garno_music/features/profile/data/datasource/a_user_datasource.dart';
import 'package:garno_music/features/profile/data/datasource/user_api_datasource.dart';
import 'package:garno_music/features/profile/data/repository/user_repository.dart';
import 'package:garno_music/features/profile/domain/repository/a_user_repository.dart';
import 'package:garno_music/features/profile/domain/service/a_user_service.dart';
import 'package:garno_music/features/profile/domain/service/user_service.dart';
import 'package:garno_music/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:garno_music/features/profile/presentation/bloc/track_history/track_history_bloc.dart';
import 'package:garno_music/features/search/presentation/bloc/genres/genres_bloc.dart';
import 'package:garno_music/features/search/presentation/bloc/search_bloc.dart';
import 'package:garno_music/features/welcome/domain/services/a_welcome_service.dart';
import 'package:garno_music/features/welcome/domain/services/welcome_service.dart';
import 'package:get_it/get_it.dart';

import '../../features/home/presentation/bloc/track/track_bloc.dart';

final sl = GetIt.instance;

Future<void> initDI() async {
  //BLOC
  sl
    ..registerFactory(() => SignInBloc(sl()))
    ..registerFactory(() => SignUpBloc(sl()))
    ..registerLazySingleton(() => PlayerBloc(sl(), sl()))
    ..registerLazySingleton(() => AlbumBloc(sl()))
    ..registerLazySingleton(() => TrackBloc(sl()))
    ..registerLazySingleton(() => LikedBloc(sl()))
    ..registerLazySingleton(() => LibraryBloc(sl()))
    ..registerLazySingleton(() => SearchBloc(sl()))
    ..registerLazySingleton(() => GenresBloc(sl()))
    ..registerLazySingleton(() => ProfileBloc(sl()))
    ..registerLazySingleton(() => DownloadBloc(sl()))
    ..registerLazySingleton(() => TrackHistoryBloc(sl()))
    //SERVICE
    ..registerLazySingleton<IAuthorizationService>(
        () => AuthorizationService(sl(), repository: sl()))
    ..registerLazySingleton<IPlayerService>(
        () => PlayerService(player: sl(), service: sl()))
    ..registerLazySingleton<IAlbumService>(() => AlbumService(repository: sl()))
    ..registerLazySingleton<ITrackService>(() => TrackService(repository: sl()))
    ..registerLazySingleton<IWelcomeService>(
        () => WelcomeService(sl(), dio: sl()))
    ..registerLazySingleton<ITogetherListeningService>(
        () => TogetherListeningService(repository: sl()))
    ..registerLazySingleton<ILibraryService>(
        () => LibraryService(repository: sl()))
    ..registerLazySingleton<IUserService>(() => UserService(repository: sl()))
    //REPOSITORY
    ..registerLazySingleton<IAuthorizationRepository>(
        () => AuthorizationApiRepository(datasource: sl()))
    ..registerLazySingleton<IAlbumRepository>(
        () => AlbumApiRepository(datasource: sl()))
    ..registerLazySingleton<ITrackRepository>(
        () => TrackApiRepository(datasource: sl()))
    ..registerLazySingleton<ITogetherListeningRepository>(
        () => TogetherListeningRepository(datasource: sl()))
    ..registerLazySingleton<ILibraryRepository>(
        () => LibraryRepository(datasource: sl()))
    ..registerLazySingleton<IUserRepository>(
        () => UserRepository(datasource: sl()))
    //Datasource
    ..registerLazySingleton<IAuthorizationDatasource>(
        () => AuthorizationApiDatasource(dio: sl()))
    ..registerLazySingleton<IAlbumDatasource>(
        () => AlbumApiDatasource(dio: sl()))
    ..registerLazySingleton<ITrackDatasource>(
        () => TrackApiDatasource(dio: sl()))
    ..registerLazySingleton<ITogetherListeningDatasource>(
        () => TogetherListeningApiDatasource(dio: sl()))
    ..registerLazySingleton<ILibraryDatasource>(
        () => LibraryApiDatasource(dio: sl()))
    ..registerLazySingleton<IUserDatasource>(() => UserApiDatasource(dio: sl()))
    //utils
    ..registerLazySingleton(
        () => Dio(BaseOptions(baseUrl: API_URL, validateStatus: (s) => true)))
    ..registerLazySingleton(() => AudioPlayer());
}

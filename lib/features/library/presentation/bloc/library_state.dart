part of 'library_bloc.dart';

@immutable
abstract class LibraryState {}

class LibraryInitial extends LibraryState {}

class LibraryLoadingState extends LibraryState {}

class LibraryLoadedState extends LibraryState {
  LibraryLoadedState(
      {required this.localTracks,
      required this.likedTracks,
      required this.playLists});
  final PlayList localTracks;
  final PlayList likedTracks;
  final List<PlayList> playLists;
}

class PlayListCreating extends LibraryState {}

class PlayListCreated extends LibraryState {
  PlayListCreated({required this.newPlayList});
  final PlayList newPlayList;
}

class PlayListTracksLoading extends LibraryState {}

class PlayListTracksLoaded extends LibraryState {
  PlayListTracksLoaded({required this.tracks});
  final List<Track> tracks;
}

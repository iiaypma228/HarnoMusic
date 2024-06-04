part of 'library_bloc.dart';

@immutable
abstract class LibraryEvent {}

class LoadLibraryEvent extends LibraryEvent {}

class CreatePlayListEvent extends LibraryEvent {
  CreatePlayListEvent({required this.name});
  final String name;
}

class LoadPlayListTracksEvent extends LibraryEvent {
  LoadPlayListTracksEvent({required this.playListId});
  final int playListId;
}

class AddTrackToPlayList extends LibraryEvent {
  AddTrackToPlayList({required this.track, required this.playList});
  final Track track;
  final PlayList playList;
}

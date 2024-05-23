part of 'album_bloc.dart';

@immutable
abstract class AlbumState {}

class AlbumInitial extends AlbumState {}

class AlbumLoading extends AlbumState {}

class AlbumLoaded extends AlbumState {
  AlbumLoaded({required this.albums});
  final List<Album> albums;
}

class AlbumLoadError extends AlbumState {
  AlbumLoadError({required this.error});

  final String error;
}

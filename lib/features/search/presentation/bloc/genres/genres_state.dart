part of 'genres_bloc.dart';

@immutable
abstract class GenresState {}

class GenresInitial extends GenresState {}

class GenresLoading extends GenresState {}

class GenresLoaded extends GenresState {
  GenresLoaded({required this.tracks});
  final List<Track> tracks;
}

class GenresLoadedError extends GenresState {
  GenresLoadedError({required this.error});
  final String error;
}

part of 'genres_bloc.dart';

@immutable
abstract class GenresEvent {}

class LoadGenres extends GenresEvent {
  LoadGenres({required this.tags});
  final String tags;
}

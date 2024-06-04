part of 'search_bloc.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchByQueryLoading extends SearchState {}

class SearchByQueryLoaded extends SearchState {
  SearchByQueryLoaded({required this.tracks});
  final List<Track> tracks;
}

class SearchByQueryError extends SearchState {
  SearchByQueryError({required this.error});
  final String error;
}

part of 'search_bloc.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchByTagsLoaded extends SearchState {
  SearchByTagsLoaded({required this.tracks});
  final List<Track> tracks;
}

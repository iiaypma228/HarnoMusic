part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}

class SearchByTags extends SearchEvent {
  SearchByTags({required this.tags});
  final String tags;
}

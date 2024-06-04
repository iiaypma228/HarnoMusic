part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}

class SearchByQuery extends SearchEvent {
  SearchByQuery({required this.query});

  final String query;
}

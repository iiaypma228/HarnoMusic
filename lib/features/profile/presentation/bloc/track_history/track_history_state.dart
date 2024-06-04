part of 'track_history_bloc.dart';

@immutable
abstract class TrackHistoryState {}

class TrackHistoryInitial extends TrackHistoryState {}

class TrackHistoryLoading extends TrackHistoryState {}

class TrackHistoryLoaded extends TrackHistoryState {
  TrackHistoryLoaded({required this.history});
  final List<TrackHistory> history;
}

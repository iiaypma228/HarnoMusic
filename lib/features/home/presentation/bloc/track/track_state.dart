part of 'track_bloc.dart';

@immutable
abstract class TrackState {}

class TrackInitial extends TrackState {}

class TrackLoadingState extends TrackState {}

class TrackLoadedState extends TrackState {
  TrackLoadedState({required this.tracks});
  final List<Track> tracks;
}

class TrackLoadError extends TrackState {
  TrackLoadError({required this.error});
  final String error;
}

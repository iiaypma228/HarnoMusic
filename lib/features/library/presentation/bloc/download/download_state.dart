part of 'download_bloc.dart';

@immutable
abstract class DownloadState {}

class DownloadInitial extends DownloadState {}

class TrackDownloadingState extends DownloadState {
  TrackDownloadingState({required this.track});
  final Track track;
}

class TrackDownloadedState extends DownloadState {}

class TrackDownloadFailureState extends DownloadState {}

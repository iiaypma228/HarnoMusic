part of 'download_bloc.dart';

@immutable
abstract class DownloadEvent {}

class DownloadTrack extends DownloadEvent {
  DownloadTrack({required this.track});
  final Track track;
}

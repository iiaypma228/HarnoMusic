import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../main/domain/models/track.dart';
import '../../../domain/services/I_library_service.dart';

part 'download_event.dart';
part 'download_state.dart';

class DownloadBloc extends Bloc<DownloadEvent, DownloadState> {
  final ILibraryService _service;

  DownloadBloc(this._service) : super(DownloadInitial()) {
    on<DownloadTrack>(_onDownloadTrack);
  }

  Future _onDownloadTrack(
      DownloadTrack event, Emitter<DownloadState> emit) async {
    emit(TrackDownloadingState(track: event.track));
    var res = await _service.downloadTrack(event.track);

    if (res.isSuccess) {
      emit(TrackDownloadedState());
    } else {
      emit(TrackDownloadFailureState());
    }
  }
}

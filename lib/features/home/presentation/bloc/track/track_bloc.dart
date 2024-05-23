import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../main/domain/models/track.dart';
import '../../../domain/services/a_track_service.dart';

part 'track_event.dart';
part 'track_state.dart';

class TrackBloc extends Bloc<TrackEvent, TrackState> {
  final ITrackService _service;

  TrackBloc(this._service) : super(TrackInitial()) {
    on<LoadTrackEvent>(_loadTrack);
  }

  void _loadTrack(LoadTrackEvent event, Emitter<TrackState> emit) async {
    emit(TrackLoadingState());
    var result = await _service.getNextNewTracks();
    if (result.isSuccess) {
      emit(TrackLoadedState(tracks: result.data ?? []));
    } else {
      emit(TrackLoadError(error: result.errorMessage ?? ''));
    }
  }
}

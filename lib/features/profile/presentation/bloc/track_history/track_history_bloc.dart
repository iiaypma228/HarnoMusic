import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/models/track_history.dart';
import '../../../domain/service/a_user_service.dart';

part 'track_history_event.dart';
part 'track_history_state.dart';

class TrackHistoryBloc extends Bloc<TrackHistoryEvent, TrackHistoryState> {
  final IUserService _service;

  TrackHistoryBloc(this._service) : super(TrackHistoryInitial()) {
    on<LoadTrackHistory>(_onLoadHistory);
  }

  Future _onLoadHistory(
      LoadTrackHistory state, Emitter<TrackHistoryState> emit) async {
    emit(TrackHistoryLoading());
    var tracks = await _service.getHistoryTracks();
    if (tracks.isSuccess) {
      emit(TrackHistoryLoaded(history: tracks.data!));
    }
  }
}

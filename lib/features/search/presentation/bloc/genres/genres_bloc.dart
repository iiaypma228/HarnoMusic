import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../home/domain/services/a_track_service.dart';
import '../../../../main/domain/models/track.dart';

part 'genres_event.dart';
part 'genres_state.dart';

class GenresBloc extends Bloc<GenresEvent, GenresState> {
  final ITrackService _service;

  GenresBloc(this._service) : super(GenresInitial()) {
    on<GenresEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<LoadGenres>(_onLoadGenres);
  }

  void _onLoadGenres(LoadGenres event, Emitter<GenresState> emit) async {
    emit(GenresLoading());
    var tracks = await _service.getTracksByTags(event.tags);

    if (tracks.isSuccess) {
      emit(GenresLoaded(tracks: tracks.data ?? []));
    } else {
      emit(GenresLoadedError(error: tracks.errorMessage ?? ''));
    }
  }
}

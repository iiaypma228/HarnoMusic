import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:garno_music/features/home/domain/services/a_track_service.dart';
import 'package:meta/meta.dart';

import '../../../main/domain/models/track.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final ITrackService _service;

  SearchBloc(this._service) : super(SearchInitial()) {
    on<SearchByQuery>(_onSearchByQuery);
  }

  Future _onSearchByQuery(
      SearchByQuery event, Emitter<SearchState> emit) async {
    emit(SearchByQueryLoading());
    var res = await _service.getTracksByQuery(event.query);
    if (res.isSuccess) {
      emit(SearchByQueryLoaded(tracks: res.data ?? []));
    } else {
      emit(SearchByQueryError(error: res.errorMessage ?? ''));
    }
  }
}

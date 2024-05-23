import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:garno_music/common/models/server_response.dart';
import 'package:meta/meta.dart';

import '../../../main/domain/models/track.dart';
import '../../domain/models/play_list.dart';
import '../../domain/services/I_library_service.dart';

part 'library_event.dart';
part 'library_state.dart';

class LibraryBloc extends Bloc<LibraryEvent, LibraryState> {
  final ILibraryService _service;

  LibraryBloc(this._service) : super(LibraryInitial()) {
    on<LibraryEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<LoadLibraryEvent>(_onLoadLibrary);
  }

  void _onLoadLibrary(
      LoadLibraryEvent event, Emitter<LibraryState> emit) async {
    emit(LibraryLoadingState());
    List<dynamic> data = await Future.wait(
        [_service.getLocalPlayList(), _service.getLikedPlayList()]);

    PlayList localTracks = data[0] ?? [];
    ServerResponse<PlayList> likedTracks = data[1] ?? [];

    emit(LibraryLoadedState(
        localTracks: localTracks,
        likedTracks: likedTracks.data ?? PlayList.empty(),
        playLists: const []));
  }
}

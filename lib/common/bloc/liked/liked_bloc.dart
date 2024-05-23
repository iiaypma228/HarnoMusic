import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:garno_music/features/main/domain/models/track.dart';
import 'package:meta/meta.dart';

import '../../../features/library/domain/services/I_library_service.dart';

part 'liked_event.dart';
part 'liked_state.dart';

class LikedBloc extends Bloc<LikedEvent, LikedState> {
  final ILibraryService _service;

  LikedBloc(this._service) : super(LikedInitial()) {
    on<LoadLikedEvent>(_onLoadLiked);
    on<AddLikeEvent>(_onLikedAdd);
    on<RemoveLikeEvent>(_onLikedRemove);
  }

  void _onLoadLiked(LoadLikedEvent event, Emitter<LikedState> emit) async {
    var tracks = await _service.getLikedPlayList();
    if (tracks.isSuccess) {
      for (var e in tracks.data!.tracks) {
        _onLikedAdd(AddLikeEvent(track: e), emit);
      }
    }
  }

  void _onLikedAdd(AddLikeEvent event, Emitter<LikedState> emit) async {
    emit(LikedAdded(track: event.track));
    await _service.saveLikeTrack(event.track);
  }

  void _onLikedRemove(RemoveLikeEvent event, Emitter<LikedState> emit) async {
    emit(LikedRemove(track: event.track));
    await _service.deleteLikeTrack(event.track);
  }
}

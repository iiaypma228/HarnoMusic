import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../domain/models/album.dart';
import '../../domain/services/a_album_service.dart';

part 'album_event.dart';
part 'album_state.dart';

class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  final IAlbumService _service;

  AlbumBloc(this._service) : super(AlbumInitial()) {
    on<LoadAlbumEvent>(_loadNewAlbums);
  }

  void _loadNewAlbums(LoadAlbumEvent event, Emitter<AlbumState> emit) async {
    emit(AlbumLoading());
    var albums = await _service.getNextNewAlbums();
    if (albums.isSuccess) {
      emit(AlbumLoaded(albums: albums.data ?? []));
    } else {
      emit(AlbumLoadError(error: albums.errorMessage ?? ''));
    }
  }
}

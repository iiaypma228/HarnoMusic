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
  PlayList _localMusic = PlayList.empty();
  PlayList _likedMusic = PlayList.empty();
  final List<PlayList> _playLists = [];
  //final List<L>
  LibraryBloc(this._service) : super(LibraryInitial()) {
    on<LoadLibraryEvent>(_onLoadLibrary);
    on<CreatePlayListEvent>(_onCreatePlayList);
    on<LoadPlayListTracksEvent>(_onLoadPlayListTracks);
    on<AddTrackToPlayList>(_onAddTrackToPlayList);
  }

  void _onLoadLibrary(
      LoadLibraryEvent event, Emitter<LibraryState> emit) async {
    emit(LibraryLoadingState());
    List<dynamic> data = await Future.wait([
      _service.getLocalPlayList(),
      _service.getLikedPlayList(),
      _service.getPlayLists()
    ]);

    PlayList localTracks = data[0] ?? [];
    ServerResponse<PlayList> likedTracks = data[1] ?? [];
    ServerResponse<List<PlayList>> playLists = data[2] ?? [];

    _localMusic = localTracks;
    _likedMusic = likedTracks.data ?? PlayList.empty();
    _playLists.clear();
    _playLists.addAll(playLists.data ?? []);

    emit(LibraryLoadedState(
        localTracks: _localMusic,
        likedTracks: _likedMusic,
        playLists: _playLists));
  }

  void _onCreatePlayList(
      CreatePlayListEvent event, Emitter<LibraryState> emit) async {
    emit(PlayListCreating());
    var playList = await _service.createPlayList(event.name);
    emit(PlayListCreated(newPlayList: playList.data!));
    _playLists.add(playList.data!);
    emit(LibraryLoadedState(
        localTracks: _localMusic,
        likedTracks: _likedMusic,
        playLists: _playLists));
  }

  void _onLoadPlayListTracks(
      LoadPlayListTracksEvent event, Emitter<LibraryState> emit) async {
    emit(PlayListTracksLoading());
    var tracks = await _service.getPlayListTracks(event.playListId);
    emit(PlayListTracksLoaded(tracks: tracks.data!));
  }

  Future _onAddTrackToPlayList(
      AddTrackToPlayList event, Emitter<LibraryState> emit) async {
    await _service.addTrackToPlayList(event.track, event.playList);

    _playLists
        .where((e) => e.id == event.playList.id)
        .first
        .tracks
        .add(event.track);

    emit(LibraryLoadedState(
        localTracks: _localMusic,
        likedTracks: _likedMusic,
        playLists: _playLists));
  }
}

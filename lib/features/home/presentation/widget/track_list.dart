import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garno_music/common/widget/error_load.dart';
import 'package:garno_music/common/widget/track_row.dart';
import 'package:garno_music/features/main/presentation/bloc/player_bloc.dart';

import '../../../../common/di/init.dart';
import '../../../main/domain/models/track.dart';
import '../bloc/track/track_bloc.dart';

class TrackList extends StatefulWidget {
  TrackList({super.key});

  final List<Track> _tracks = [];

  bool _isLoading = false;

  @override
  State<TrackList> createState() => _TrackListState();
}

class _TrackListState extends State<TrackList> {
  final _bloc = sl<TrackBloc>()..add(LoadTrackEvent());
  final _playerBloc = sl<PlayerBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrackBloc, TrackState>(
      bloc: _bloc,
      builder: (context, state) {
        _handleState(context, state);
        if (state is TrackLoadError) {
          return ErrorLoad(onRetry: () => _bloc.add(LoadTrackEvent()));
        }

        return widget._isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                shrinkWrap: true,
                itemCount: widget._tracks.length,
                itemBuilder: (context, index) {
                  final track = widget._tracks[index];
                  return TrackRow(track: track);
                });
      },
    );
  }

  void _handleState(BuildContext context, TrackState state) {
    widget._isLoading = state is TrackLoadingState;

    if (state is TrackLoadedState) {
      widget._tracks.addAll(state.tracks);
    }
  }
}

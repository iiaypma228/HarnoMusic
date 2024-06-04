import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hicons/flutter_hicons.dart';
import 'package:garno_music/common/widget/liked_button.dart';
import 'package:garno_music/features/library/presentation/bloc/library_bloc.dart';
import 'package:garno_music/features/library/presentation/widget/search_play_list_delegate.dart';
import 'package:garno_music/features/main/domain/models/track.dart';
import 'package:share_plus/share_plus.dart';

import '../../features/library/presentation/bloc/download/download_bloc.dart';
import '../di/init.dart';

class MoreTrackActionBottomSheetBar extends StatefulWidget {
  const MoreTrackActionBottomSheetBar({super.key, required this.track});

  final Track track;

  @override
  State<MoreTrackActionBottomSheetBar> createState() => _MoreTrackActionState();
}

class _MoreTrackActionState extends State<MoreTrackActionBottomSheetBar> {
  final _downloadBloc = sl<DownloadBloc>();
  final _libraryBloc = sl<LibraryBloc>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          LikedButton(track: widget.track),
          _buildAddToPlayList(),
          _downloadButton(),
          ListTile(
            leading: Icon(Icons.share),
            title: Text('Поділитися'),
            onTap: _shareMusic,
          ),
        ],
      ),
    );
  }

  Widget _downloadButton() {
    return BlocBuilder<DownloadBloc, DownloadState>(
      bloc: _downloadBloc,
      builder: (context, state) {
        var isLoading = state is TrackDownloadingState &&
            (state as TrackDownloadingState).track.id == widget.track.id;
        return ListTile(
          leading: Icon(Hicons.download_light_outline),
          title: Text('Завантажити на пристрій'),
          trailing: isLoading ? const CircularProgressIndicator() : null,
          onTap: isLoading
              ? null
              : () {
                  _downloadBloc.add(DownloadTrack(track: widget.track));
                },
        );
      },
    );
  }

  Widget _buildAddToPlayList() {
    return BlocBuilder<LibraryBloc, LibraryState>(
      bloc: _libraryBloc,
      builder: (context, state) {
        return ListTile(
          leading: Icon(Hicons.add_light_outline),
          title: Text('Додати в плей ліст'),
          onTap: () {
            if (state is LibraryLoadedState) {
              showSearch(
                  context: context,
                  delegate: SearchPlayListDelegate(
                      playLists: state.playLists
                          .where((e) =>
                              !e.tracks.any((t) => t.id == widget.track.id))
                          .toList(),
                      onTap: (playlist) {
                        _libraryBloc.add(AddTrackToPlayList(
                            track: widget.track, playList: playlist));
                        Navigator.of(context).pop();
                      }));
            }
          },
        );
      },
    );
  }

  void _shareMusic() {
    Share.shareUri(Uri(path: widget.track.audioUrl));
  }
}

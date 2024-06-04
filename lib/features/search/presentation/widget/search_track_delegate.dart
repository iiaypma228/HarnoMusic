import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garno_music/common/widget/loading.dart';
import 'package:garno_music/common/widget/track_row.dart';

import '../../../../common/di/init.dart';
import '../../../main/domain/models/track.dart';
import '../bloc/search_bloc.dart';

class SearchTrackDelegate extends SearchDelegate<String> {
  List<Track> _tracks = [];
  final _bloc = sl<SearchBloc>();

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => Navigator.of(context).pop(),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildList();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildList();
  }

  Widget _buildList() {
    _bloc.add(SearchByQuery(query: query));
    return BlocBuilder<SearchBloc, SearchState>(
      bloc: _bloc,
      builder: (context, state) {
        if (state is SearchByQueryLoading) {
          return const Loading();
        }

        if (state is SearchByQueryLoaded) {
          _tracks = state.tracks;
        }

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: _tracks.length,
            itemBuilder: (context, index) {
              return TrackRow(track: _tracks[index]);
            },
          ),
        );
      },
    );
  }
}

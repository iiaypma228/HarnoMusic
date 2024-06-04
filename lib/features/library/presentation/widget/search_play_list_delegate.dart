import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garno_music/features/library/domain/models/play_list.dart';
import 'package:garno_music/features/library/presentation/bloc/library_bloc.dart';
import 'package:garno_music/features/library/presentation/widget/paly_list_row.dart';

import '../../../../common/di/init.dart';

class SearchPlayListDelegate extends SearchDelegate<String> {
  SearchPlayListDelegate({required this.playLists, this.onTap});

  final List<PlayList> playLists;
  final void Function(PlayList)? onTap;
  List<PlayList> _searchedList = [];

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
    _searchedList = playLists
        .where((i) => i.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      child: ListView.builder(
          itemCount: _searchedList.length,
          itemBuilder: (context, index) {
            if (onTap != null) {
              return PlayListRow(
                playList: _searchedList[index],
                onTap: () => onTap!(_searchedList[index]),
              );
            }
            return PlayListRow(playList: _searchedList[index]);
          }),
    ));
  }
}

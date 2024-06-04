import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';
import '../../../main/domain/models/track.dart';

class SearchBar extends StatefulWidget {
  const SearchBar(
      {super.key,
      required this.tracks,
      required this.onSearched,
      this.searchedWhereText});

  final Function(List<Track> result) onSearched;
  final List<Track> tracks;
  final String? searchedWhereText;

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_focusNode);
    });

    return TextField(
      focusNode: _focusNode,
      style: const TextStyle(color: Color(0xff616161)),
      onChanged: (text) => searchTracks(text),
      cursorColor: const Color(0xff9456F9),
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xffE6E6E6),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff383838)),
        ),
        focusedBorder: OutlineInputBorder(),
        hintText:
            '${S.of(context).findHere}: ${widget.searchedWhereText ?? ''}',
        contentPadding: EdgeInsets.symmetric(horizontal: 5),
      ),
    );
  }

  void searchTracks(String text) {
    text = text.toLowerCase();
    var res = widget.tracks
        .where((t) =>
            t.name.toLowerCase().contains(text) ||
            t.artistName.toLowerCase().contains(text) ||
            (t.albumName?.toLowerCase() ?? '').contains(text))
        .toList();
    widget.onSearched(res);
  }
}

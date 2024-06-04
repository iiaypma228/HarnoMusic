import 'package:flutter/material.dart';
import 'package:flutter_hicons/flutter_hicons.dart';

import '../../../main/domain/models/track.dart';

enum _SortType { Date, Author, Alphabet }

class SortList extends StatelessWidget {
  SortList({super.key, required this.tracks, required this.onSorted});
  final List<Track> tracks;
  final void Function(List<Track>) onSorted;

  String _currentSortedText = 'Немає';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _buildSortedButton(context),
      ],
    );
  }

  Widget _buildSortedButton(BuildContext context) {
    return IconButton(
        onPressed: () {
          _showBottomBar(context);
          tracks.sort((a, b) => a.name.compareTo(b.name));
          onSorted(tracks);
        },
        icon: Row(
          children: [Icon(Hicons.swap_1_light_outline), Text('По алфавиту')],
        ));
  }

  void _showBottomBar(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: const EdgeInsets.all(16.0),
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.share),
                  title: Text('Немає'),
                ),
                ListTile(
                  leading: Icon(Icons.share),
                  title: Text('За назвою'),
                ),
                ListTile(
                  leading: Icon(Icons.share),
                  title: Text('За виконавцем'),
                ),
                ListTile(
                  leading: Icon(Icons.share),
                  title: Text('За тривалість'),
                ),
              ],
            ),
          );
        });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_hicons/flutter_hicons.dart';

import '../../../main/domain/models/track.dart';

enum _SortType { Date, Author, Alphabet }

class SortList extends StatefulWidget {
  SortList({super.key, required this.tracks, required this.builder});
  final WidgetBuilder builder;
  final List<Track> tracks;
  String _currentSortable = 'Немає';
  @override
  State<SortList> createState() => _SortListState();
}

class _SortListState extends State<SortList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          _buildSortedButton(context),
          Expanded(
            child: Container(child: widget.builder(context)),
          )
        ],
      ),
    );
  }

  Widget _buildSortedButton(BuildContext context) {
    return IconButton(
        onPressed: () {
          _showBottomBar(context);
        },
        icon: Row(
          children: [
            const Icon(Hicons.swap_1_light_outline),
            Text(widget._currentSortable)
          ],
        ));
  }

  void _showBottomBar(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.close),
                  title: Text('Немає'),
                  onTap: () {
                    setState(() {
                      // widget.tracks.sort((a, b) => a.name.compareTo(b.name));
                      widget._currentSortable = 'Немає';
                    });
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.sort_by_alpha),
                  title: Text('За назвою'),
                  onTap: () {
                    setState(() {
                      widget.tracks.sort((a, b) => a.name.compareTo(b.name));
                      widget._currentSortable = 'За назвою';
                    });
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.sort_by_alpha),
                  title: Text('За виконавцем'),
                  onTap: () {
                    setState(() {
                      widget.tracks
                          .sort((a, b) => a.artistName.compareTo(b.artistName));
                      widget._currentSortable = 'За виконавцем';
                    });
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.sort),
                  title: Text('За тривалість'),
                  onTap: () {
                    setState(() {
                      widget.tracks
                          .sort((a, b) => a.duration.compareTo(b.duration));
                      widget._currentSortable = 'За тривалість';
                    });
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
  }
}

import 'package:flutter/material.dart';
import 'package:garno_music/features/home/presentation/widget/album_list.dart';
import 'package:garno_music/features/home/presentation/widget/track_list.dart';

class NewsTab extends StatefulWidget {
  const NewsTab({super.key});

  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AlbumList(),
        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Треки',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        ConstrainedBox(
            constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height / 3.2,
                minHeight: 56.0),
            child: TrackList()),
      ],
    );
  }
}

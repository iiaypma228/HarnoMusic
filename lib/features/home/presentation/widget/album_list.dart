import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garno_music/common/widget/base_state.dart';
import 'package:garno_music/common/widget/error_load.dart';
import 'package:garno_music/features/home/presentation/bloc/album_bloc.dart';

import '../../../../common/di/init.dart';
import '../../domain/models/album.dart';

class AlbumList extends StatefulWidget {
  AlbumList({super.key});

  bool _isLoading = false;
  final List<Album> _albums = [];

  @override
  State<AlbumList> createState() => _AlbumListState();
}

class _AlbumListState extends ABaseState<AlbumList> {
  final _bloc = sl<AlbumBloc>()..add(LoadAlbumEvent());

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3,
      child: BlocBuilder<AlbumBloc, AlbumState>(
        bloc: _bloc,
        builder: (context, state) {
          _handleState(context, state);

          if (state is AlbumLoadError) {
            return ErrorLoad(onRetry: () => _bloc.add(LoadAlbumEvent()));
          }

          return widget._isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget._albums.length,
                  itemBuilder: (context, index) {
                    final item = widget._albums[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius:
                                BorderRadius.circular(15), // Image border
                            child: SizedBox.fromSize(
                              size: Size.fromRadius(100), // Image radius
                              child: Image.network(item.imageUrl,
                                  fit: BoxFit.cover),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            textAlign: TextAlign.left,
                            item.name,
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          ),
                          Text(
                            textAlign: TextAlign.left,
                            item.artistName,
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                fontSize: 12),
                          )
                        ],
                      ),
                    );
                  });
        },
      ),
    );
  }

  void _handleState(BuildContext context, AlbumState state) {
    widget._isLoading = state is AlbumLoading;
    if (state is AlbumLoaded) {
      widget._albums.addAll(state.albums);
    }
  }
}

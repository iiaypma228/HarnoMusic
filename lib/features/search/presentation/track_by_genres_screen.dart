import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hicons/flutter_hicons.dart';
import 'package:garno_music/common/widget/loading.dart';
import 'package:garno_music/common/widget/track_row.dart';
import 'package:garno_music/features/search/presentation/widget/search_bar.dart'
    as sb;
import 'package:garno_music/features/search/presentation/widget/genres.dart';

import '../../../common/di/init.dart';
import '../../main/domain/models/track.dart';
import 'bloc/genres/genres_bloc.dart';

@RoutePage()
class TrackByGenresScreen extends StatefulWidget {
  TrackByGenresScreen({super.key, required this.model});

  final GenresModel model;
  final List<Track> tracks = [];
  bool isLoading = false;

  @override
  State<TrackByGenresScreen> createState() => _TrackByGenresScreenState();
}

class _TrackByGenresScreenState extends State<TrackByGenresScreen> {
  final _bloc = sl<GenresBloc>();

  var _showSearchBar = false;
  List<Track>? searchedList;

  @override
  void initState() {
    _bloc.add(LoadGenres(tags: widget.model.tag));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: widget.model.color.withOpacity(0.5),
      body: SafeArea(
        child: BlocConsumer<GenresBloc, GenresState>(
          listener: _handleState,
          bloc: _bloc,
          builder: (context, state) {
            return CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                    expandedHeight:
                        300.0, // Height of the app bar when it is expanded
                    flexibleSpace: FlexibleSpaceBar(
                      titlePadding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 15),
                      title: Text(
                        widget.model.name,
                        style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      background: Image.asset(
                        "assets/images/${widget.model.art}", // URL of the image
                        fit: BoxFit.cover,
                      ),
                    ),
                    pinned: true,
                    leading: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        if (_showSearchBar) {
                          setState(() => _showSearchBar = false);
                          searchedList = null;
                        } else {
                          AutoRouter.of(context).back();
                        }
                      },
                    ),
                    actions: [
                      if (!_showSearchBar)
                        IconButton(
                            onPressed: () {
                              setState(() => _showSearchBar = true);
                            },
                            icon: const Icon(Hicons.search_2_light_outline)),
                    ],
                    title: Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (_showSearchBar)
                            Container(
                              alignment: Alignment.center,
                              width: 200,
                              height: 35,
                              child: sb.SearchBar(
                                onSearched: (tracks) {
                                  setState(() => searchedList = tracks);
                                },
                                tracks: widget.tracks,
                              ),
                            )
                        ],
                      ),
                    )),
                widget.isLoading
                    ? const SliverFillRemaining(
                        child:
                            SizedBox(width: 100, height: 100, child: Loading()))
                    : _getList()
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _getList() {
    var currentList = widget.tracks;

    if (searchedList != null) {
      currentList = searchedList!;
    }

    return SliverList(
        delegate: SliverChildBuilderDelegate(
      (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TrackRow(track: currentList[index]),
        );
      },
      childCount: currentList.length, // 1000 list items
    ));
  }

  void _handleState(BuildContext context, GenresState state) {
    widget.isLoading = state is GenresLoading;
    if (state is GenresLoaded) {
      widget.tracks.addAll(state.tracks);
    }
  }
}

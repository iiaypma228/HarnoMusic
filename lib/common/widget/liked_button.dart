import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hicons/flutter_hicons.dart';

import '../../features/main/domain/models/track.dart';
import '../bloc/liked/liked_bloc.dart';
import '../di/init.dart';

class LikedButton extends StatefulWidget {
  LikedButton({super.key, required this.track});

  final Track track;
  bool _isLiked = false;
  @override
  State<LikedButton> createState() => _LikedButtonState();
}

class _LikedButtonState extends State<LikedButton> {
  final _bloc = sl<LikedBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LikedBloc, LikedState>(
      bloc: _bloc,
      builder: (context, state) {
        if (state is LikedAdded && state.track.id == widget.track.id) {
          widget._isLiked = true;
          return IconButton(
              onPressed: () {
                _bloc.add(RemoveLikeEvent(track: widget.track));
              },
              icon: Icon(Hicons.heart_1_bold, color: Color(0xff9456F9)));
        } else if (state is LikedRemove && state.track.id == widget.track.id) {
          widget._isLiked = false;
          return IconButton(
              onPressed: () {
                _bloc.add(AddLikeEvent(track: widget.track));
              },
              icon: Icon(Hicons.heart_1_light_outline));
        } else if (widget._isLiked) {
          return IconButton(
              onPressed: () {
                _bloc.add(RemoveLikeEvent(track: widget.track));
              },
              icon: Icon(Hicons.heart_1_bold, color: Color(0xff9456F9)));
        } else {
          return IconButton(
              onPressed: () {
                _bloc.add(AddLikeEvent(track: widget.track));
              },
              icon: Icon(Hicons.heart_1_light_outline));
        }
      },
    );
  }
}

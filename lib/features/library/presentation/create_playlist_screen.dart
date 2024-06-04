import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garno_music/common/helpers/string_extensions.dart';
import 'package:garno_music/common/widget/base_state.dart';
import 'package:garno_music/common/widget/loading.dart';
import 'package:garno_music/features/library/presentation/bloc/library_bloc.dart';

import '../../../common/di/init.dart';
import '../../../generated/l10n.dart';
import '../domain/models/play_list.dart';

@RoutePage()
class CreatePlaylistScreen extends StatefulWidget {
  const CreatePlaylistScreen({super.key, required this.playLists});

  final List<PlayList> playLists;

  @override
  State<CreatePlaylistScreen> createState() => _CreatePlaylistScreenState();
}

class _CreatePlaylistScreenState extends ABaseState<CreatePlaylistScreen> {
  final _bloc = sl<LibraryBloc>();
  bool _isLoading = false;
  final _focusNode = FocusNode();
  String _playListName = '';

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<LibraryBloc, LibraryState>(
          bloc: _bloc,
          builder: (context, state) {
            _isLoading = state is PlayListCreating;

            if (state is PlayListCreated ||
                (state is LibraryLoadedState && !_playListName.isNullOrEmpty)) {
              AutoRouter.of(context).back();
            }

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: 200,
                      child: Text(
                        'Введіть назву плейліста',
                        textAlign: TextAlign.center,
                        style: theme.textTheme.labelLarge,
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 290,
                    child: TextField(
                      onChanged: (t) => _playListName = t,
                      focusNode: _focusNode,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  _buildButtons()
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildButtons() {
    if (_isLoading) {
      return const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Loading(),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 50,
            width: 110,
            child: ElevatedButton(
              onPressed: () => AutoRouter.of(context).back(),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white38,
                shadowColor: Colors.transparent,
                side: BorderSide(color: Colors.black),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
              ),
              child: const Text(
                'Відміна',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            height: 50,
            width: 120,
            child: ElevatedButton(
              onPressed: () {
                if (_playListName.isNullOrEmpty) {
                  showMessage(context, S.of(context).inputPlayListName);
                  return;
                }

                if (widget.playLists.any((i) => i.name == _playListName)) {
                  showMessage(context, S.of(context).nameAlreadyUsed);
                  return;
                }

                _bloc.add(CreatePlayListEvent(name: _playListName));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff9456F9),
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
              ),
              child: Text(
                S.of(context).createPlayList,
                style: const TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      );
    }
  }
}

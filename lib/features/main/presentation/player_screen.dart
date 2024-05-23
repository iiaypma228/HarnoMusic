import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hicons/flutter_hicons.dart';
import 'package:garno_music/common/helpers/duration_extensions.dart';
import 'package:garno_music/common/widget/liked_button.dart';
import 'package:garno_music/common/widget/main_back_button.dart';
import 'package:garno_music/features/main/domain/services/a_player_service.dart';

import '../../../common/di/init.dart';
import '../../../common/widget/base_state.dart';
import '../../../generated/l10n.dart';
import '../domain/models/track.dart';
import 'bloc/player_bloc.dart';
import 'widget/player_buttons.dart';

@RoutePage()
class PlayerScreen extends StatefulWidget {
  PlayerScreen({super.key, required track}) : _track = track;

  Track _track;

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends ABaseState<PlayerScreen> {
  final _bloc = sl<PlayerBloc>();
  final _playerService = sl<IPlayerService>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: _getBody()),
    );
  }

  Widget _getBody() {
    return BlocBuilder<PlayerBloc, PlayerState>(
      bloc: _bloc,
      builder: (context, state) {
        if (state is StartPlayingTrackState) {
          widget._track = state.track;
        }

        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const MainBackButton(),
                  Text(
                    S.of(context).nowPlaying,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  IconButton(
                      onPressed: _showBottomSheetBar,
                      icon: const Icon(Icons.more_vert))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(30), // Image border
                child: SizedBox.fromSize(
                  size: Size(
                      MediaQuery.of(context).size.width - 60,
                      MediaQuery.of(context).size.height /
                          2.15), // Image radius
                  child: widget._track.imageSource ??
                      Image.asset('assets/images/music_note.png'),
                ),
              ),
              ListTile(
                title: Text(
                  widget._track?.name ?? '',
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                    fontSize: 22,
                  ),
                ),
                subtitle: Text(widget._track?.artistName ?? ''),
                trailing: widget._track != null
                    ? LikedButton(track: widget._track!)
                    : null,
              ),
              StreamBuilder(
                  stream: _playerService.onPositionChanged,
                  builder: (context, data) {
                    return Column(
                      children: [
                        Slider(
                          thumbColor: const Color(0xff5C5C5C),
                          activeColor: Color(0xff434343),
                          overlayColor:
                              WidgetStateProperty.all(const Color(0xff434343)),
                          value: data.data?.inSeconds.toDouble() ?? 0,
                          max: Duration(seconds: widget._track?.duration ?? 60)
                              .inSeconds
                              .toDouble(),
                          onChanged: (value) {},
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                data.data.totalDuration,
                                style: const TextStyle(
                                    fontSize: 15, color: Color(0xff404040)),
                              ),
                              Text(
                                  Duration(seconds: widget._track.duration)
                                      .totalDuration,
                                  style: const TextStyle(
                                      fontSize: 15, color: Color(0xff404040)))
                            ],
                          ),
                        ),
                        PlayerButtons(
                          track: widget._track,
                        ),
                      ],
                    );
                  }),
            ],
          ),
        );
      },
    );
  }

  void _showBottomSheetBar() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Wrap(
            children: [
              ListTile(
                onTap: () {
                  _showInputDialog(context);
                },
                leading: Icon(Hicons.add_bold),
                title: Text('Підєднатися до кімнати'),
              ),
              ListTile(
                leading: Icon(Hicons.add_bold),
                title: Text('Створити кімнату'),
              ),
            ],
          );
        });
  }

  // Функция для отображения диалога с полем ввода
  void _showInputDialog(BuildContext context) {
    TextEditingController textController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Введіть код кімнати'),
          content: TextField(
            controller: textController,
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                String inputText = textController.text;
                print('Entered text: $inputText');
                _bloc.add(JoinToRoomEvent(code: inputText));
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

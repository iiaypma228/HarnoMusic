import 'dart:io';

import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hicons/flutter_hicons.dart';
import 'package:garno_music/features/profile/presentation/widget/header_profile.dart';
import 'package:garno_music/features/profile/presentation/widget/like_tracks.dart';
import 'package:garno_music/features/profile/presentation/widget/locale_switcher.dart';
import 'package:garno_music/features/profile/presentation/widget/logout.dart';
import 'package:garno_music/features/profile/presentation/widget/theme_switcher.dart';
import 'package:garno_music/features/profile/presentation/widget/track_history.dart';
import 'package:garno_music/main.dart';
import 'package:image_picker/image_picker.dart';
import '../../../common/di/init.dart';
import '../../../generated/l10n.dart';
import 'bloc/profile_bloc.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final picker = ImagePicker();
  final _bloc = sl<ProfileBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HarnoMusicApp.of(context)?.theme == ThemeMode.light
          ? const Color(0xffE6E6E6)
          : Colors.black45,
      body: SafeArea(
        child: BlocBuilder<ProfileBloc, ProfileState>(
          bloc: _bloc,
          builder: (context, state) {
            return Column(
              children: [
                const HeaderProfile(),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: ListView(
                      children: [
                        ListTile(
                          onTap: () => _pickImage(ImageSource.gallery),
                          leading: const Icon(Hicons.user_tag_light_outline),
                          title: Text(S.of(context).changeAvatar),
                        ),
                        const LikeTracks(),
                        const TrackHistory(),
                        const ThemeSwitcher(),
                        const LocaleSwitcher(),
                        const Logout(),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _bloc.add(SetProfileAvatar(image: File(pickedFile.path)));
      });
    }
  }
}

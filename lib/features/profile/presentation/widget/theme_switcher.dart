import 'package:flutter/material.dart';
import 'package:flutter_hicons/flutter_hicons.dart';
import 'package:garno_music/main.dart';

class ThemeSwitcher extends StatefulWidget {
  const ThemeSwitcher({super.key});

  @override
  State<ThemeSwitcher> createState() => _ThemeSwitcherState();
}

class _ThemeSwitcherState extends State<ThemeSwitcher> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: Switch(
        splashRadius: 0.0,
        // boolean variable value
        value: HarnoMusicApp.of(context)!.theme == ThemeMode.dark,
        // changes the state of the switch
        onChanged: (value) => setState(() {
          HarnoMusicApp.of(context)!
              .setTheme(value ? ThemeMode.dark : ThemeMode.light);
        }),
      ), // ,
      title: Text('Використовувати темну тему'),
      leading: Icon(Hicons.palette_light_outline),
    );
  }
}

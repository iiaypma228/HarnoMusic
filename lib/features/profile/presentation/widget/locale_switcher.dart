import 'package:flutter/material.dart';
import 'package:flutter_hicons/flutter_hicons.dart';
import 'package:garno_music/main.dart';

import '../../../../generated/l10n.dart';

class LocaleSwitcher extends StatefulWidget {
  const LocaleSwitcher({super.key});

  @override
  State<LocaleSwitcher> createState() => _LocaleSwitcherState();
}

class _LocaleSwitcherState extends State<LocaleSwitcher> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Hicons.website_light_outline),
      title: Text(S.of(context).appLanguage),
      subtitle: Text(_getNameLocale()),
      onTap: () => _showListDialog(context),
    );
  }

  String _getNameLocale() {
    var locale = HarnoMusicApp.of(context)?.locale;

    switch (locale?.languageCode) {
      case 'uk':
        return 'Українська';
      case 'en':
        return 'English';
      default:
        return '';
    }
  }

  void _showListDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(S.of(context).selectLanguge),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView(
              children: [
                ListTile(
                  title: const Text('Українська'),
                  onTap: () {
                    HarnoMusicApp.of(context)?.setLocale(const Locale('uk'));
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                    title: const Text('English'),
                    onTap: () {
                      HarnoMusicApp.of(context)?.setLocale(const Locale('en'));
                      Navigator.of(context).pop();
                    })
              ],
            ),
          ),
        );
      },
    );
  }
}

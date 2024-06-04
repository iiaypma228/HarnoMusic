import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:garno_music/common/theme/dark/theme.dart';
import 'package:garno_music/router/router.dart';

import 'common/di/init.dart';
import 'common/theme/light/theme.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDI();
/*  SharedPreferences preferences = await SharedPreferences.getInstance();
  await preferences.clear();*/
  runApp(HarnoMusicApp());
}

class HarnoMusicApp extends StatefulWidget {
  HarnoMusicApp({super.key});

  static _HarnoMusicAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_HarnoMusicAppState>();

  @override
  State<HarnoMusicApp> createState() => _HarnoMusicAppState();
}

class _HarnoMusicAppState extends State<HarnoMusicApp> {
  Locale _locale = const Locale('uk');
  ThemeMode _theme = ThemeMode.light;

  Locale get locale => _locale;
  ThemeMode get theme => _theme;

  void setLocale(Locale value) {
    setState(() {
      _locale = value;
    });
  }

  void setTheme(ThemeMode value) {
    setState(() {
      _theme = value;
    });
  }

  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: getLightTheme(),
      darkTheme: getDarkTheme(),
      themeMode: _theme,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: _locale,
      title: 'garno_music',
      routerConfig: _router.config(),
    );
  }
}

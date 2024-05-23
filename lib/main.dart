import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:garno_music/common/theme/dark/theme.dart';
import 'package:garno_music/features/welcome/presentation/welcome_screen.dart';
import 'package:garno_music/router/router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'common/di/init.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDI();
/*  SharedPreferences preferences = await SharedPreferences.getInstance();
  await preferences.clear();*/
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _router = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: getDarkTheme(),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: S.delegate.supportedLocales,
      title: 'garno_music',
      routerConfig: _router.config(),
    );
  }
}

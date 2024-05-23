import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
part 'button_theme.dart';
part 'text_theme.dart';
part 'elevated_button_theme.dart';
part 'thumb_theme.dart';

ThemeData getDarkTheme() {
  return ThemeData(
    fontFamily: 'Satoshi',
    iconTheme: const IconThemeData(color: Color(0xff6C6C6C)),
    textTheme: _getTextTheme(),
    buttonTheme: _getButtonTheme(),
    elevatedButtonTheme: _getElevatedButtonTheme(),
    sliderTheme: _getSliderTheme(),
    useMaterial3: true,
  );
}

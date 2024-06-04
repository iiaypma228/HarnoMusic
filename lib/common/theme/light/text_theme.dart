part of 'theme.dart';

TextTheme _getTextTheme() {
  return TextTheme(
    bodyMedium: _getBodyMediumTextStyle(),
    bodySmall: _getBodySmallTextStyle(),
    labelLarge: _getLabelLargeTextStyle(),
    labelSmall: _getLabelSmallTextStyle(),
    labelMedium: _getLabelMediumTextStyle(),
  );
}

TextStyle _getBodyMediumTextStyle() {
  return const TextStyle(
    color: Color(0xff383838),
    fontSize: 20,
  );
}

TextStyle _getBodySmallTextStyle() {
  return const TextStyle(
    color: Color(0xff797979),
    fontSize: 15,
  );
}

TextStyle _getTitleSmallTextStyle() {
  return const TextStyle(
    color: Colors.white,
  );
}

TextStyle _getTitleMediumTextStyle() {
  return const TextStyle(color: Colors.white);
}

TextStyle _getTitleLargeTextStyle() {
  return const TextStyle(color: Colors.white);
}

TextStyle _getLabelLargeTextStyle() {
  return const TextStyle(
      color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold);
}

TextStyle _getLabelMediumTextStyle() {
  return const TextStyle(color: Colors.black, fontSize: 18);
}

TextStyle _getLabelSmallTextStyle() {
  return const TextStyle(
      color: Colors.black, fontSize: 16, fontWeight: FontWeight.w300);
}

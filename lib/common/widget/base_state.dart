import 'package:flutter/material.dart';

abstract class ABaseState<T extends StatefulWidget> extends State<T> {
  ThemeData? _theme;
  ThemeData get theme => _theme!;

  @override
  @mustCallSuper
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    return const Placeholder();
  }
}

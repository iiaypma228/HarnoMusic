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

  void showMessageAfterBuilding(BuildContext context, String message) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );
    });
  }

  void showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}

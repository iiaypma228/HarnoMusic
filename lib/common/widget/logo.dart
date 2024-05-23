import 'package:flutter/material.dart';

import '../../generated/l10n.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  final textStyle = const TextStyle(
      color: Color(0xff6237A8), fontSize: 16, fontWeight: FontWeight.w800);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(S.of(context).harno, style: textStyle),
        const SizedBox(width: 10),
        const Image(
            width: 30, height: 30, image: AssetImage("assets/images/logo.png")),
        const SizedBox(width: 10),
        Text(
          S.of(context).musicHarno,
          style: textStyle,
        )
      ],
    );
  }
}

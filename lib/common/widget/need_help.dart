import 'package:flutter/material.dart';

import '../../generated/l10n.dart';

class NeedHelp extends StatefulWidget {
  const NeedHelp({super.key});

  @override
  State<NeedHelp> createState() => _NeedHelpState();
}

class _NeedHelpState extends State<NeedHelp> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${S.of(context).ifNeedAnyHelp} ',
          style: const TextStyle(fontSize: 12),
        ),
        InkWell(
          child: Text(S.of(context).clickHere,
              style: const TextStyle(fontSize: 12, color: Color(0xff9456F9))),
        )
      ],
    );
  }
}

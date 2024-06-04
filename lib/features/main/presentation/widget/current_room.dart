import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hicons/flutter_hicons.dart';
import 'package:garno_music/common/widget/base_state.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../generated/l10n.dart';

class CurrentRoom extends StatefulWidget {
  const CurrentRoom({super.key, required this.code});

  final String code;
  @override
  State<CurrentRoom> createState() => _CurrentRoomState();
}

class _CurrentRoomState extends ABaseState<CurrentRoom> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: SizedBox(
            height: 110,
            child: Card(
              color: Color(0xff9456F9),
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Hicons.group_1_bold, color: Colors.black),
                      Text(
                        S.of(context).currentRoom,
                        style: theme.textTheme.labelLarge,
                      )
                    ],
                  ),
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          widget.code,
                          style: TextStyle(fontSize: 30, color: Colors.black),
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: copyCode,
                          icon: const Icon(
                            Hicons.document_justify_center_1_bold,
                            color: Colors.black,
                          )),
                      IconButton(
                          onPressed: shareCode,
                          icon: const Icon(
                            Icons.share,
                            color: Colors.black,
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void copyCode() {
    Clipboard.setData(ClipboardData(text: widget.code));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(S.of(context).codeCopySuccses)),
    );
  }

  void shareCode() {
    Share.share(
        'Давай слухати музику разом зі мною у HarnoMusic!\nПід\'єднуйся за кодом ${widget.code}');
  }
}

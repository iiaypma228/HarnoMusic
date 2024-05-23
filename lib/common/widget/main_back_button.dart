import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hicons/flutter_hicons.dart';

class MainBackButton extends StatelessWidget {
  const MainBackButton({super.key, this.color});

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30,
      height: 30,
      child: IconButton(
          style: ButtonStyle(
              backgroundColor:
                  WidgetStateProperty.all(color ?? const Color(0xffE8E8E8))),
          padding: EdgeInsets.zero,
          onPressed: () => AutoRouter.of(context).back(),
          icon: const Icon(
            Hicons.left_2_bold,
            color: Color(0xff414141),
            //size: 15,
          )),
    );
  }
}

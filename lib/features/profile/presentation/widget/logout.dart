import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hicons/flutter_hicons.dart';
import 'package:garno_music/router/router.dart';

import '../../../../generated/l10n.dart';

class Logout extends StatefulWidget {
  const Logout({super.key});

  @override
  State<Logout> createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Hicons.logout_light_outline),
      title: Text(S.of(context).logoutFromApp),
      onTap: () => {AutoRouter.of(context).replace(SignInRoute())},
    );
  }
}

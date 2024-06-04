import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hicons/flutter_hicons.dart';
import 'package:garno_music/common/config.dart';
import 'package:garno_music/common/helpers/string_extensions.dart';
import 'package:garno_music/features/authorization/domain/services/authorization_api_service.dart';

import '../../../../generated/l10n.dart';
import '../../../profile/domain/models/user.dart';

class ConnectedUserRow extends StatefulWidget {
  const ConnectedUserRow(
      {super.key, required this.user, required this.isMaintainer});
  final bool isMaintainer;
  final User user;

  @override
  State<ConnectedUserRow> createState() => _ConnectedUserRowState();
}

class _ConnectedUserRowState extends State<ConnectedUserRow> {
  @override
  Widget build(BuildContext context) {
    final isCurrent = AuthorizationService.currentUser == widget.user;

    return ListTile(
      leading: ClipOval(
        child: widget.user.avatar != null
            ? Image.network(
                API_URL + widget.user.avatar!,
                fit: BoxFit.cover,
                width: 50,
                height: 50,
              )
            : Image.asset(
                'assets/images/no_avatar.png',
                fit: BoxFit.cover,
                width: 50,
                height: 50,
              ),
      ),
      title:
          Text(widget.user.username + (isCurrent ? S.of(context).itsYou : '')),
      trailing: isCurrent || !widget.isMaintainer
          ? null
          : ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.redAccent),
              ),
              onPressed: () {},
              child: Text(S.of(context).kickUser),
            ),
    );
  }
}

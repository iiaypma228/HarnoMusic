import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:garno_music/common/widget/base_state.dart';
import 'package:garno_music/features/search/presentation/widget/genres.dart';
import 'package:garno_music/features/search/presentation/widget/search_track_delegate.dart';

import '../../../generated/l10n.dart';

@RoutePage()
class SearchScreen extends StatefulWidget {
  SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ABaseState<SearchScreen> {
  final inputBorder = const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(30)),
    borderSide: BorderSide(color: Color(0xffC2C2C2)),
  );

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          children: [
            Text(
              S.of(context).search,
              style: theme.textTheme.labelLarge,
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
              child: TextField(
                readOnly: true,
                onTap: () => showSearch(
                  context: context,
                  delegate: SearchTrackDelegate(),
                ),
                style: const TextStyle(color: Color(0xff616161)),
                decoration: InputDecoration(
                  border: inputBorder,
                  focusedBorder: inputBorder,
                  hintText: S.of(context).whatDoYouWantListen,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Genres(),
          ],
        ),
      ),
    );
  }
}

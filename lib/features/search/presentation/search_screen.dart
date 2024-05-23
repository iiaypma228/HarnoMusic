import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:garno_music/common/widget/base_state.dart';
import 'package:garno_music/features/search/presentation/widget/genres.dart';

@RoutePage()
class SearchScreen extends StatefulWidget {
  SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ABaseState<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          children: [
            Text(
              'Пошук',
              style: theme.textTheme.labelLarge,
            ),
            SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
              child: TextField(
                style: TextStyle(color: Color(0xff616161)),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xffE6E6E6),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff383838)),
                  ),
                  hintText: 'Що бажаєте послухати?',
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

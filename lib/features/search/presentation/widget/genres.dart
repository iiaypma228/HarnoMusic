import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garno_music/features/search/presentation/bloc/search_bloc.dart';
import 'package:garno_music/features/search/presentation/bloc/search_bloc.dart';
import 'package:garno_music/router/router.dart';

import '../../../../common/di/init.dart';
import '../../../../common/widget/base_state.dart';
import '../../../../generated/l10n.dart';

class GenresModel {
  final String name;
  final Color color;
  final String art;
  final String tag;
  GenresModel(
      {required this.name,
      required this.color,
      required this.art,
      required this.tag});
}

class Genres extends StatefulWidget {
  Genres({super.key});

  List<GenresModel> getModels(BuildContext context) {
    return [
      GenresModel(
          tag: 'pop',
          name: S.of(context).popGenre,
          color: const Color(0xff148a08),
          art: 'pop_art.jpg'),
      GenresModel(
          tag: 'hip-hop',
          name: S.of(context).hipHop,
          color: const Color(0xff503750),
          art: 'hip-hop_art.jpg'),
      GenresModel(
          tag: 'rock',
          name: S.of(context).rockGenre,
          color: const Color(0xffd84000),
          art: 'rock_art.jpg'),
      GenresModel(
          tag: S.of(context).kpopGenre,
          name: 'K-pop',
          color: const Color(0xff006450),
          art: 'k-pop_art.jpg'),
      GenresModel(
          tag: 'metal',
          name: S.of(context).metalGenre,
          color: const Color(0xffe91429),
          art: 'metal_art.jpg'),
      GenresModel(
          tag: 'jaz',
          name: S.of(context).jazGenre,
          color: const Color(0xff777777),
          art: 'jaz_art.jpg'),
      GenresModel(
          tag: 'classic',
          name: S.of(context).classicGenre,
          color: const Color(0xff7d4b32),
          art: 'classic_art.jpg'),
      GenresModel(
          tag: 'pank',
          name: S.of(context).pankGenre,
          color: const Color(0xff1e3264),
          art: 'pank_art.jpg'),
      GenresModel(
          tag: 'blues',
          name: S.of(context).bluesGenre,
          color: const Color(0xffb06239),
          art: 'blues_art.jpg'),
      GenresModel(
          tag: 'funk',
          name: 'Фанк',
          color: const Color(0xffe61e32),
          art: 'funk_art.jpg'),
      GenresModel(
          tag: 'country',
          name: S.of(context).countryGenre,
          color: const Color(0xffd84000),
          art: 'country_art.jpg'),
      GenresModel(
          tag: 'soul',
          name: S.of(context).soulGenre,
          color: const Color(0xffdc148c),
          art: 'soul_art.jpg')
    ];
  }

  @override
  State<Genres> createState() => _GenresState();
}

class _GenresState extends ABaseState<Genres> {
  final _bloc = sl<SearchBloc>();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var genres = widget.getModels(context);
    return BlocBuilder<SearchBloc, SearchState>(
      bloc: _bloc,
      builder: (context, state) {
        return Expanded(
          child: GridView.builder(
            itemCount: genres.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 10, childAspectRatio: 1.5),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => AutoRouter.of(context)
                    .push(TrackByGenresRoute(model: genres[index])),
                child: Card(
                    color: genres[index].color,
                    child: Stack(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 10),
                          width: 150,
                          child: Text(genres[index].name,
                              style: theme.textTheme.titleLarge!.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Positioned(
                          bottom: 2, // Сдвигаем картинку вниз на 20 пунктов
                          right: -10, // Сдвигаем картинку вправо на 20 пунктов
                          child: Transform.rotate(
                            angle:
                                0.5, // Угол поворота в радианах, чтобы наклонить картинку
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    20.0), // Скругляем углы изображения
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5.0),
                                child: Image.asset(
                                  'assets/images/${genres[index].art}', // Ваша ссылка на изображение
                                  width: 70,
                                  height: 70,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              );
            },
          ),
        );
      },
    );
  }
}

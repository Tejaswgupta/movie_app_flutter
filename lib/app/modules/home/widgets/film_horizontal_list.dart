import 'package:yshare/components/card_film.dart';
import 'package:yshare/model/film.dart';
import 'package:flutter/material.dart';

class FilmHorizontalList extends StatelessWidget {
  const FilmHorizontalList({
    Key key,
    @required this.films,
    @required this.color,
  }) : super(key: key);

  final Color color;
  final List<Film> films;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(100),
        ),
        color: color,
      ),
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: films.length,
          itemBuilder: (context, index) {
            return CardFilm(film: films[index]);
          }),
    );
  }
}

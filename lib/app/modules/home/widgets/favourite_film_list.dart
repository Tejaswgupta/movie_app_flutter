import 'package:yshare/model/film.dart';
import 'package:yshare/provider/api.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../components/card_film.dart';

class FavouriteFilmList extends StatelessWidget {
  final List<int> filmsId;
  final Color color;
  const FavouriteFilmList({
    Key key,
    @required this.filmsId,
    @required this.color,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          filmsId.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text('Favourites Films',
                      style: TextStyle(
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontSize: 20,
                      )),
                )
              : Container(),
          Container(
            height: filmsId.isEmpty ? 0 : 250,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(100)),
                color: color),
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: filmsId.length,
              itemBuilder: (context, index) {
                var id = filmsId[index];
                return FutureBuilder<Film>(
                    future: Api().getFilmById(id.toString()),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data.posterPath == null) {
                          return Container();
                        } else {
                          return CardFilm(film: snapshot.data);
                        }
                      } else {
                        return CircularProgressIndicator();
                      }
                    });
              },
            ),
          )
        ],
      ),
    );
  }
}

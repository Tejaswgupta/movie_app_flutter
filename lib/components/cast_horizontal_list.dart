import 'package:yshare/app/modules/film_page/widgets/person_cast_card.dart';
import 'package:yshare/model/film.dart';
import 'package:yshare/model/film_credit.dart';
import 'package:yshare/provider/api.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CastHorizontalList extends StatelessWidget {
  const CastHorizontalList({
    Key key,
    @required this.film,
  }) : super(key: key);

  final Film film;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FilmCredit>(
      future: Api().getFilmCredits(film.id.toString()),
      builder: (context, snapshot) {
        var filmCredit = snapshot.data;
        if (snapshot.hasData) {
          return SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 12.0, top: 10, bottom: 12),
                  child: Text('Casting',
                      style: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 18)),
                ),
                Container(
                  height: 140,
                  child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: filmCredit.cast.length,
                      itemBuilder: (context, index) {
                        var cast = filmCredit.cast[index];
                        if (cast.profilePath == '' ||
                            cast.profilePath == null) {
                          return Container();
                        } else {
                          return PersonCastCard(cast: cast);
                        }
                      }),
                ),
              ],
            ),
          );
        } else {
          return SliverToBoxAdapter(
              child: Center(
            child: CircularProgressIndicator(),
          ));
        }
      },
    );
  }
}

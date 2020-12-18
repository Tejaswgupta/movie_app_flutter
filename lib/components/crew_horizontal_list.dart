import 'package:yshare/app/modules/film_page/widgets/person_crew_card.dart';
import 'package:yshare/model/film.dart';
import 'package:yshare/model/film_credit.dart';
import 'package:yshare/provider/api.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CrewHorizontalList extends StatelessWidget {
  const CrewHorizontalList({
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
          if (filmCredit.crew != null && filmCredit.crew.isNotEmpty) {
            return SliverToBoxAdapter(
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 12.0, top: 10, bottom: 12),
                    child: Text('Crew',
                        style: TextStyle(
                            color: Colors.black87,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontSize: 18)),
                  ),
                  Container(
                    height: 140,
                    child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: filmCredit.crew.length,
                        itemBuilder: (context, index) {
                          var crew = filmCredit.crew[index];
                          return PersonCrewCard(crew: crew);
                        }),
                  ),
                ],
              ),
            );
          } else {
            return Container(
              child: Center(
                child: Text('No'),
              ),
            );
          }
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

import 'package:yshare/app/modules/film_page/widgets/person_crew_card.dart';
import 'package:yshare/model/film_credit.dart';
import 'package:yshare/provider/api.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FilmPageCrewList extends StatelessWidget {
  final String id;
  const FilmPageCrewList({
    Key key,
    @required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: FutureBuilder<FilmCredit>(
          future: Api().getFilmCredits(id),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Center(
                  child: Text('do you have internet access ?'),
                );
                break;
              case ConnectionState.active:
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(),
                );
                break;
              case ConnectionState.done:
                if (snapshot.data is FilmCredit) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 12.0, top: 10, bottom: 12),
                        child: Text('Crew',
                            style: TextStyle(
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontSize: 18)),
                      ),
                      Container(
                        height: 140,
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data.crew.length,
                          itemBuilder: (context, index) {
                            return PersonCrewCard(
                                crew: snapshot.data.crew[index]);
                          },
                        ),
                      ),
                    ],
                  );
                } else {
                  return Center(
                    child: Text('something wrong happenmed'),
                  );
                }
                break;
              default:
                return Center(
                  child: Text('something wrong happenmed'),
                );
            }
          }),
    );
  }
}

import 'package:yshare/components/card_film.dart';
import 'package:yshare/model/film.dart';
import 'package:yshare/provider/api.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FilmRecommendationList extends StatelessWidget {
  const FilmRecommendationList({
    Key key,
    @required this.id,
    this.color,
  }) : super(key: key);

  final String id;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: FutureBuilder<List<Film>>(
          future: Api().getRecommendations(id),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Center(
                  child: Text('do you have internet access?'),
                );
                break;
              case ConnectionState.active:
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(),
                );
                break;

              case ConnectionState.done:
                if (snapshot.data is List<Film>) {
                  if (snapshot.data.isNotEmpty) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text('Recommendations',
                              style: TextStyle(
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Container(
                            height: 250,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100)),
                                color: color),
                            child: ListView.builder(
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: snapshot.data.length,
                                itemBuilder: (context, index) {
                                  return CardFilm(film: snapshot.data[index]);
                                })),
                      ],
                    );
                  } else {
                    return Container();
                  }
                } else {
                  return Center(
                    child: Text('something wrong happened'),
                  );
                }
                break;
              default:
                return Center(
                  child: CircularProgressIndicator(),
                );
            }
          }),
    );
  }
}

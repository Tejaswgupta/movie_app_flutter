import 'package:yshare/components/card_film.dart';
import 'package:yshare/model/actor_participation.dart';
import 'package:yshare/provider/api.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ActorMovieListWidget extends StatelessWidget {
  final String id;
  final Color color;

  const ActorMovieListWidget({Key key, @required this.id, @required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: FutureBuilder<ActorParticipation>(
        future: Api().getActorParticipation(id),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Container();
              break;
            case ConnectionState.active:
            case ConnectionState.waiting:
              return Container(
                child: Center(child: CircularProgressIndicator()),
              );
              break;
            case ConnectionState.done:
              if (snapshot.data is ActorParticipation) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      child: Text(
                        'Movies',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                        ),
                      ),
                    ),
                    Container(
                      height: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          color: color),
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          itemCount: snapshot.data.cast.length,
                          itemBuilder: (context, index) {
                            return CardFilm(film: snapshot.data.cast[index]);
                          }),
                    )
                  ],
                );
              } else {
                return Container();
              }
              break;
            default:
              return Container();
          }
        },
      ),
    );
  }
}

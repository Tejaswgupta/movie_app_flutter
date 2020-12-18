import 'package:yshare/components/card_film.dart';
import 'package:yshare/model/actor_participation.dart';
import 'package:yshare/provider/api.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ActorParticipationWidget extends StatelessWidget {
  final String id;
  final Color color;

  const ActorParticipationWidget({
    Key key,
    @required this.id,
    @required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: FutureBuilder<ActorParticipation>(
          future: Api().getActorParticipation(id),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Center(child: Text('Have internet connection'));
                break;
              case ConnectionState.active:
              case ConnectionState.waiting:
                return Container();
                break;

              case ConnectionState.done:
                if (snapshot.data is ActorParticipation) {
                  if (snapshot.data.crew.isNotEmpty) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text('Participations',
                              style: TextStyle(
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Container(
                          height: 300,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
                              color: color),
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              physics: BouncingScrollPhysics(),
                              itemCount: snapshot.data.crew.length,
                              itemBuilder: (context, index) {
                                return CardFilm(
                                    film: snapshot.data.crew[index]);
                              }),
                        )
                      ],
                    );
                  } else {
                    return Container();
                  }
                } else {
                  return Center(child: Text('Have internet connection'));
                }
                break;
              default:
                return Center(child: Text('Have internet connection'));
            }
          }),
    );
  }
}

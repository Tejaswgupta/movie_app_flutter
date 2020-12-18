import 'package:yshare/model/actor_details.dart';
import 'package:yshare/model/actor_participation.dart';
import 'package:yshare/provider/api.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ActorInfoWidget extends StatelessWidget {
  final ActorDetails actorDetails;

  const ActorInfoWidget({Key key, this.actorDetails}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Text(
            actorDetails.name,
            style: TextStyle(
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontSize: 36,
                fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'participations',
                    style: TextStyle(
                        color: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .color
                            .withOpacity(0.6),
                        fontSize: 12,
                        fontWeight: FontWeight.w200,
                        fontFamily: GoogleFonts.poppins().fontFamily),
                  ),
                  FutureBuilder<ActorParticipation>(
                      future: Api()
                          .getActorParticipation(actorDetails.id.toString()),
                      builder: (context, snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.none:
                            return Container();
                            break;
                          case ConnectionState.active:
                          case ConnectionState.waiting:
                            return Center(child: CircularProgressIndicator());
                            break;
                          case ConnectionState.done:
                            if (snapshot.data is ActorParticipation) {
                              return Text(
                                snapshot.data.cast.length.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily:
                                        GoogleFonts.poppins().fontFamily),
                              );
                            } else {
                              return Container();
                            }
                            break;
                          default:
                            return Container();
                        }
                      })
                ],
              ),
              Column(children: [
                Text(
                  'birthday',
                  style: TextStyle(
                      color: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .color
                          .withOpacity(0.6),
                      fontSize: 12,
                      fontWeight: FontWeight.w200,
                      fontFamily: GoogleFonts.poppins().fontFamily),
                ),
                Text(
                  DateFormat(DateFormat.ABBR_MONTH_DAY)
                      .format(DateTime.parse(actorDetails.birthday)),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.poppins().fontFamily),
                )
              ]),
              Column(
                children: [
                  Text(
                    'popularity',
                    style: TextStyle(
                        color: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .color
                            .withOpacity(0.6),
                        fontSize: 12,
                        fontWeight: FontWeight.w200,
                        fontFamily: GoogleFonts.poppins().fontFamily),
                  ),
                  Text(
                    actorDetails.popularity.toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: GoogleFonts.poppins().fontFamily),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

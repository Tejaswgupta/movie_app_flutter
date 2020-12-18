import 'package:yshare/app/modules/home/widgets/person_favourite_card.dart';
import 'package:yshare/model/actor_details.dart';
import 'package:yshare/provider/api.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FavouriteActorList extends StatelessWidget {
  final Color color;
  final List<int> actorsId;

  const FavouriteActorList({
    Key key,
    @required this.color,
    @required this.actorsId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          actorsId.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text('Favourites Actors',
                      style: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 20)),
                )
              : Container(),
          Container(
            height: actorsId.isEmpty ? 0 : 250,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(100)),
                color: color),
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: actorsId.length,
                itemBuilder: (context, index) {
                  var id = actorsId[index];
                  return FutureBuilder<ActorDetails>(
                      future: Api().getActorDetails(id.toString()),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          if (snapshot.data.profilePath == null) {
                            return Container();
                          } else {
                            return PersonFavouriteCard(
                                actorDetails: snapshot.data);
                          }
                        } else {
                          return CircularProgressIndicator();
                        }
                      });
                }),
          )
        ],
      ),
    );
  }
}

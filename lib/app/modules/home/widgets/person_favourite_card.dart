import 'package:yshare/model/actor_details.dart';
import 'package:yshare/provider/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

class PersonFavouriteCard extends StatelessWidget {
  const PersonFavouriteCard({
    Key key,
    @required this.actorDetails,
  }) : super(key: key);

  final ActorDetails actorDetails;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () => Modular.to.pushNamed(
              '/actorPage/${actorDetails.id}',
            ),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              borderOnForeground: false,
              elevation: 10,
              clipBehavior: Clip.antiAlias,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  '$IMAGE_BASE_URL${actorDetails.profilePath}',
                  fit: BoxFit.cover,
                  height: 150,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Text(
              '${actorDetails.name}',
              style: TextStyle(
                fontSize: 12,
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.fade,
              maxLines: 2,
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}

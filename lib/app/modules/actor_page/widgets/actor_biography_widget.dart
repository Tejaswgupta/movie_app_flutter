import 'package:yshare/model/actor_details.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ActorBiographyWidget extends StatelessWidget {
  final ActorDetails actorDetails;

  const ActorBiographyWidget({Key key, this.actorDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ExpansionTile(
        initiallyExpanded: false,
        childrenPadding: const EdgeInsets.all(10),
        title: Text('Biography'),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
            child: Text(actorDetails.biography,
                style:
                    TextStyle(fontFamily: GoogleFonts.openSans().fontFamily)),
          )
        ],
      ),
    );
  }
}

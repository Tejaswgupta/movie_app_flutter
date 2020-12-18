import 'package:yshare/model/crew.dart';
import 'package:yshare/provider/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PersonCrewCard extends StatelessWidget {
  const PersonCrewCard({
    Key key,
    @required this.crew,
  }) : super(key: key);

  final Crew crew;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 140,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                borderOnForeground: false,
                elevation: 10,
                clipBehavior: Clip.antiAlias,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: crew.profilePath != null
                      ? Image.network(
                          '$IMAGE_BASE_URL${crew.profilePath}',
                          fit: BoxFit.cover,
                          height: 100,
                        )
                      : Image.asset(
                          crew.gender == 2
                              ? 'assets/images/male_placeholder.jpg'
                              : 'assets/images/female_placeholder.jpg',
                          fit: BoxFit.cover,
                          height: 100,
                        ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2.0),
              child: Text(
                '${crew.name}',
                style: TextStyle(
                  fontSize: 10,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.fade,
                maxLines: 2,
                softWrap: true,
              ),
            ),
          ],
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../provider/constants.dart';

class ChipList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        Padding(
          padding:
              const EdgeInsets.only(left: 20.0, top: 10, right: 20, bottom: 10),
          child: Text(
            'Genres',
            style: TextStyle(
                fontFamily: GoogleFonts.poppins().fontFamily, fontSize: 20),
          ),
        ),
        Center(
          child: Container(
            height: 70,
            padding: EdgeInsets.symmetric(vertical: 5),
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemBuilder: (context, index) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: InkWell(
                  onTap: () =>
                      Modular.to.pushNamed('/genrePage/${GENRES[index]['id']}'),
                  child: Chip(
                      elevation: 6,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      label: Text(GENRES[index]['name'],
                          style: TextStyle(
                              fontFamily: GoogleFonts.poppins().fontFamily))),
                ),
              ),
            ),
          ),
        ),
        Container(
          height: 70,
          padding: EdgeInsets.symmetric(vertical: 5),
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: 6,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            itemBuilder: (context, index) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: InkWell(
                onTap: () => Modular.to
                    .pushNamed('/genrePage/${GENRES[index + 6]['id']}'),
                child: Chip(
                    elevation: 6,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    label: Text(GENRES[index + 6]['name'],
                        style: TextStyle(
                            fontFamily: GoogleFonts.poppins().fontFamily))),
              ),
            ),
          ),
        ),
        Container(
          height: 70,
          padding: EdgeInsets.symmetric(vertical: 5),
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: 6,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            itemBuilder: (context, index) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: InkWell(
                onTap: () => Modular.to
                    .pushNamed('/genrePage/${GENRES[index + 12]['id']}'),
                child: Chip(
                    elevation: 6,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    label: Text(GENRES[index + 12]['name'],
                        style: TextStyle(
                            fontFamily: GoogleFonts.poppins().fontFamily))),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

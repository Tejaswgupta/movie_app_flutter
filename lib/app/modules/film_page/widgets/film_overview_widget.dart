import 'package:yshare/model/film.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FilmOverviewWidget extends StatelessWidget {
  final Film film;

  const FilmOverviewWidget({
    Key key,
    this.film,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          film.overview,
          textAlign: TextAlign.justify,
          style: TextStyle(fontFamily: GoogleFonts.poppins().fontFamily),
        ),
      ),
    );
  }
}

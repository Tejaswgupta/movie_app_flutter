import 'package:yshare/app/modules/actor_page/widgets/card_tv_widget.dart';
import 'package:yshare/model/tv_participation.dart';
import 'package:yshare/provider/api.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ActorTvParticipationWidget extends StatelessWidget {
  final String id;
  final Color color;

  const ActorTvParticipationWidget({
    Key key,
    this.id,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: FutureBuilder<List<TvParticipation>>(
          future: Api().getPersonTvParticipations(id),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Center(child: Text('none'));
                break;
              case ConnectionState.active:
              case ConnectionState.waiting:
                return Container();
                break;
              case ConnectionState.done:
                if (snapshot.data is List<TvParticipation>) {
                  if (snapshot.data.isNotEmpty) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text('Tv Participations',
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
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                return CardTvWidget(
                                    tvParticipation: snapshot.data[index]);
                              }),
                        )
                      ],
                    );
                  } else {
                    return Container();
                  }
                } else {
                  return Container();
                }
                break;
              default:
                return Container();
            }
          }),
    );
  }
}

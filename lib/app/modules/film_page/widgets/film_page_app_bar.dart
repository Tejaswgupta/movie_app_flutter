import 'package:bot_toast/bot_toast.dart';
import 'package:yshare/app/modules/film_page/film_page_controller.dart';
import 'package:yshare/model/film.dart';
import 'package:yshare/provider/constants.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class FilmPageAppBar extends StatelessWidget {
  final FilmPageController controller;
  final Film film;

  FilmPageAppBar({
    @required this.controller,
    @required this.film,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SliverAppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconTheme.of(context),
        expandedHeight: 400,
        pinned: true,
        brightness: ThemeData().brightness,
        actions: [
          Observer(
            builder: (context) => IconButton(
              icon: controller.appController.favouriteFilms.contains(film.id)
                  ? Icon(
                      EvaIcons.star,
                      color: Colors.amber[800],
                    )
                  : Icon(
                      EvaIcons.starOutline,
                      color: Colors.amber[800],
                    ),
              onPressed: () {
                controller.appController.addFilmIntoFavourites(film.id);

                controller.appController.favouriteFilms.contains(film.id)
                    ? BotToast.showNotification(
                        title: (cancelFunc) => Wrap(
                          direction: Axis.horizontal,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                EvaIcons.heart,
                                color: Colors.red,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:
                                  Text('${film.title} added in favourites !'),
                            ),
                          ],
                        ),
                      )
                    : BotToast.showNotification(
                        title: (cancelFunc) => Wrap(
                          direction: Axis.horizontal,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                EvaIcons.heartOutline,
                                color: Colors.red,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  '${film.title} removed from favourites !'),
                            ),
                          ],
                        ),
                      );
              },
            ),
          ),
          IconButton(
            icon: controller.appController.isDark
                ? Icon(EvaIcons.sun)
                : Icon(
                    EvaIcons.moon,
                    color: Colors.black,
                  ),
            onPressed: () {
              controller.appController.changeTheme();
            },
          )
        ],
        flexibleSpace: Row(
          children: [
            Container(
              width: width * 0.2,
            ),
            Container(
              child: ClipRRect(
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(120)),
                child: film.posterPath == null
                    ? Container()
                    : Image.network(
                        IMAGE_BASE_URL + film.posterPath,
                        fit: BoxFit.fitWidth,
                      ),
              ),
              width: width * 0.8,
            ),
          ],
        ));
  }
}

import 'package:bot_toast/bot_toast.dart';
import 'package:yshare/app/modules/actor_page/actor_page_controller.dart';
import 'package:yshare/model/actor_details.dart';
import 'package:yshare/provider/constants.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ActorPageAppBar extends StatelessWidget {
  final ActorPageController controller;
  final dynamic id;
  final ActorDetails actorDetails;

  const ActorPageAppBar({
    Key key,
    @required this.controller,
    @required this.id,
    @required this.actorDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SliverAppBar(
      actions: [
        Observer(
          builder: (_) {
            return IconButton(
              icon: controller.appController.subscribedActors
                      .contains(int.parse(id))
                  ? Icon(
                      EvaIcons.star,
                      color: Colors.amber[800],
                    )
                  : Icon(
                      EvaIcons.starOutline,
                      color: Colors.amber[800],
                    ),
              onPressed: () {
                controller.appController.addActorInFavourites(int.parse(id));
                controller.appController.subscribedActors
                        .contains(int.parse(id))
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
                              child: Text(
                                  '${actorDetails.name} added in favourites !'),
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
                                  '${actorDetails.name} removed from favourites !'),
                            ),
                          ],
                        ),
                      );
              },
            );
          },
        ),
        Observer(builder: (_) {
          return IconButton(
              icon: controller.appController.isDark
                  ? Icon(EvaIcons.sun)
                  : Icon(EvaIcons.moon),
              onPressed: () => controller.appController.changeTheme());
        })
      ],
      backgroundColor: Colors.transparent,
      iconTheme: IconTheme.of(context),
      expandedHeight: 400,
      pinned: true,
      brightness: ThemeData().brightness,
      flexibleSpace: Row(
        children: [
          Container(
            width: width * 0.2,
          ),
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(120)),
              child: Image.network(
                IMAGE_BASE_URL + actorDetails.profilePath,
                fit: BoxFit.fitWidth,
              ),
            ),
            width: width * 0.8,
          )
        ],
      ),
    );
  }
}

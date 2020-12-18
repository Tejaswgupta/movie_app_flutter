import 'package:yshare/app/modules/home/widgets/chips_lists.dart';
import 'package:yshare/app/modules/home/widgets/favourite_actor_list.dart';
import 'package:yshare/app/modules/home/widgets/favourite_film_list.dart';
import 'package:yshare/app/modules/home/widgets/form_search_field.dart';
import 'package:yshare/app/modules/home/widgets/home_app_bar.dart';
import 'package:yshare/app/modules/home/widgets/popular_list.dart';
import 'package:yshare/app/modules/home/widgets/top_rated_list.dart';
import 'package:yshare/app/modules/home/widgets/trending_films_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({Key key, this.title = 'Home'}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      body: Observer(
        builder: (_) {
          return Stack(children: [
            CustomScrollView(
              slivers: [
                HomeAppBar(),
                FormSearchField(),
                TrendingFilmList(
                  color: Colors.purple[300],
                ),
                FavouriteFilmList(
                    color: Colors.green[800],
                    filmsId: controller.appController.favouriteFilms),
                FavouriteActorList(
                  actorsId: controller.appController.subscribedActors,
                  color: Colors.blue[400],
                ),
                ChipList(),
                PopularList(
                  color: Colors.orange,
                ),
                TopRatedList(
                  color: Colors.pink[400],
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                  ),
                )
              ],
              physics: BouncingScrollPhysics(),
            ),
          ]);
        },
      ),
    );
  }
}

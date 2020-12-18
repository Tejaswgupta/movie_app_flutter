import 'package:yshare/app/app_widget.dart';
import 'package:yshare/app/modules/actor_page/actor_page_page.dart';
import 'package:yshare/app/modules/film_page/film_page_page.dart';
import 'package:yshare/app/modules/genre_page/genre_page_page.dart';
import 'package:yshare/app/modules/home/home_module.dart';
import 'package:yshare/app/modules/popular_page/popular_page_page.dart';
import 'package:yshare/app/modules/search_page/search_page_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:yshare/app/modules/top_rated_page/top_rated_page_page.dart';
import 'package:yshare/app/modules/trending_page/trending_page_page.dart';

import 'app_controller.dart';
import 'modules/actor_page/actor_page_controller.dart';
import 'modules/film_page/film_page_controller.dart';
import 'modules/genre_page/genre_page_controller.dart';
import 'modules/popular_page/popular_page_controller.dart';
import 'modules/search_page/search_page_controller.dart';
import 'modules/top_rated_page/top_rated_page_controller.dart';
import 'modules/trending_page/trending_page_controller.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => TopRatedPageController(i.get<AppController>())),
        Bind((i) => PopularPageController(i.get<AppController>())),
        Bind((i) => TrendingPageController(i.get<AppController>())),
        Bind((i) => SearchPageController(i.get<AppController>())),
        Bind((i) => ActorPageController(i.get<AppController>())),
        Bind((i) => GenrePageController(i.get<AppController>())),
        Bind((i) => FilmPageController(i.get<AppController>())),
        Bind((i) => AppController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          Modular.initialRoute,
          module: HomeModule(),
        ),
        ModularRouter(
          '/filmPage/:id',
          child: (context, args) => FilmPagePage(
            id: args.params['id'],
          ),
        ),
        ModularRouter(
          '/genrePage/:id',
          child: (context, args) => GenrePagePage(
            id: args.params['id'],
          ),
        ),
        ModularRouter(
          '/actorPage/:id',
          child: (context, args) => ActorPagePage(
            id: args.params['id'],
          ),
        ),
        ModularRouter(
          '/searchFilmPage/:name',
          child: (context, args) => SearchPagePage(name: args.params['name']),
        ),
        ModularRouter(
          '/trendingFilms',
          child: (context, args) => TrendingPagePage(),
        ),
        ModularRouter(
          '/popularFilms',
          child: (context, args) => PopularPagePage(),
        ),
        ModularRouter(
          '/topRatedFilms',
          child: (context, args) => TopRatedPagePage(),
        ),
      ];

  @override
  Widget get bootstrap => AppWidget(
        controller: to.get<AppController>(),
      );

  static Inject get to => Inject<AppModule>.of();
}

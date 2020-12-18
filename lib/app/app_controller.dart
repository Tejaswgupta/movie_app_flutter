import 'package:yshare/provider/api.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app_controller.g.dart';

class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {
  Api api;

  _AppControllerBase() {
    api = Api();
    loadTheme();
    loadFavouriteFilms();
    loadSubscribedActors();
  }

  @observable
  ThemeData themeType;

  @observable
  List<int> subscribedActors = [];

  @observable
  List<int> favouriteFilms = [];

  @computed
  bool get isDark => themeType.brightness == Brightness.dark;

  @action
  void changeTheme() {
    if (isDark) {
      themeType = ThemeData.light();
    } else {
      themeType = ThemeData.dark();
    }
    saveThemePreferences();
  }

  void saveThemePreferences() {
    SharedPreferences.getInstance().then((instance) {
      instance.setBool('isDark', isDark);
    });
  }

  @action
  Future<void> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('isDark') && prefs.getBool('isDark')) {
      themeType = ThemeData.dark();
    } else {
      themeType = ThemeData.light();
    }
  }

  List<String> listIntegerToString(List<int> array) {
    var stringArray = <String>[];
    array.map((e) {
      stringArray.add(e.toString());
    }).toList();
    return stringArray;
  }

  void saveListInSharedPreferences() {
    SharedPreferences.getInstance().then((instance) {
      instance.setStringList(
          'favouriteFilms', listIntegerToString(favouriteFilms));
    });
  }

  @action
  Future<void> loadFavouriteFilms() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('favouriteFilms')) {
      var films = prefs.getStringList('favouriteFilms');
      films.map((e) {
        favouriteFilms.add(int.parse(e));
      }).toList();
    }
  }

  @action
  Future<void> loadSubscribedActors() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('subscribedActors')) {
      var actors = prefs.getStringList('subscribedActors');
      actors.map((e) {
        subscribedActors.add(int.parse(e));
      }).toList();
    }
  }

  @action
  void addFilmIntoFavourites(int filmId) {
    if (!favouriteFilms.contains(filmId)) {
      favouriteFilms = List.from(favouriteFilms..add(filmId));
      saveListInSharedPreferences();
    } else {
      favouriteFilms = List.from(favouriteFilms..remove(filmId));
      saveListInSharedPreferences();
    }
  }

  void saveSubscribedActors() {
    SharedPreferences.getInstance().then((instance) {
      instance.setStringList(
          'subscribedActors', listIntegerToString(subscribedActors));
    });
  }

  @action
  void addActorInFavourites(int actorId) {
    if (!subscribedActors.contains(actorId)) {
      subscribedActors = List.from(subscribedActors..add(actorId));
      saveSubscribedActors();
    } else {
      subscribedActors = List.from(subscribedActors..remove(actorId));
      saveSubscribedActors();
    }
  }
}

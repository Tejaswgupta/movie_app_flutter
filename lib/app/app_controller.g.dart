// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppController on _AppControllerBase, Store {
  Computed<bool> _$isDarkComputed;

  @override
  bool get isDark => (_$isDarkComputed ??=
          Computed<bool>(() => super.isDark, name: '_AppControllerBase.isDark'))
      .value;

  final _$themeTypeAtom = Atom(name: '_AppControllerBase.themeType');

  @override
  ThemeData get themeType {
    _$themeTypeAtom.reportRead();
    return super.themeType;
  }

  @override
  set themeType(ThemeData value) {
    _$themeTypeAtom.reportWrite(value, super.themeType, () {
      super.themeType = value;
    });
  }

  final _$subscribedActorsAtom =
      Atom(name: '_AppControllerBase.subscribedActors');

  @override
  List<int> get subscribedActors {
    _$subscribedActorsAtom.reportRead();
    return super.subscribedActors;
  }

  @override
  set subscribedActors(List<int> value) {
    _$subscribedActorsAtom.reportWrite(value, super.subscribedActors, () {
      super.subscribedActors = value;
    });
  }

  final _$favouriteFilmsAtom = Atom(name: '_AppControllerBase.favouriteFilms');

  @override
  List<int> get favouriteFilms {
    _$favouriteFilmsAtom.reportRead();
    return super.favouriteFilms;
  }

  @override
  set favouriteFilms(List<int> value) {
    _$favouriteFilmsAtom.reportWrite(value, super.favouriteFilms, () {
      super.favouriteFilms = value;
    });
  }

  final _$loadThemeAsyncAction = AsyncAction('_AppControllerBase.loadTheme');

  @override
  Future<void> loadTheme() {
    return _$loadThemeAsyncAction.run(() => super.loadTheme());
  }

  final _$loadFavouriteFilmsAsyncAction =
      AsyncAction('_AppControllerBase.loadFavouriteFilms');

  @override
  Future<void> loadFavouriteFilms() {
    return _$loadFavouriteFilmsAsyncAction
        .run(() => super.loadFavouriteFilms());
  }

  final _$loadSubscribedActorsAsyncAction =
      AsyncAction('_AppControllerBase.loadSubscribedActors');

  @override
  Future<void> loadSubscribedActors() {
    return _$loadSubscribedActorsAsyncAction
        .run(() => super.loadSubscribedActors());
  }

  final _$_AppControllerBaseActionController =
      ActionController(name: '_AppControllerBase');

  @override
  void changeTheme() {
    final _$actionInfo = _$_AppControllerBaseActionController.startAction(
        name: '_AppControllerBase.changeTheme');
    try {
      return super.changeTheme();
    } finally {
      _$_AppControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addFilmIntoFavourites(int filmId) {
    final _$actionInfo = _$_AppControllerBaseActionController.startAction(
        name: '_AppControllerBase.addFilmIntoFavourites');
    try {
      return super.addFilmIntoFavourites(filmId);
    } finally {
      _$_AppControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addActorInFavourites(int actorId) {
    final _$actionInfo = _$_AppControllerBaseActionController.startAction(
        name: '_AppControllerBase.addActorInFavourites');
    try {
      return super.addActorInFavourites(actorId);
    } finally {
      _$_AppControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
themeType: ${themeType},
subscribedActors: ${subscribedActors},
favouriteFilms: ${favouriteFilms},
isDark: ${isDark}
    ''';
  }
}

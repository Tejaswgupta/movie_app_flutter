// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genre_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GenrePageController on _GenrePageControllerBase, Store {
  final _$filmsAtom = Atom(name: '_GenrePageControllerBase.films');

  @override
  ObservableList<Film> get films {
    _$filmsAtom.reportRead();
    return super.films;
  }

  @override
  set films(ObservableList<Film> value) {
    _$filmsAtom.reportWrite(value, super.films, () {
      super.films = value;
    });
  }

  final _$actualPageAtom = Atom(name: '_GenrePageControllerBase.actualPage');

  @override
  int get actualPage {
    _$actualPageAtom.reportRead();
    return super.actualPage;
  }

  @override
  set actualPage(int value) {
    _$actualPageAtom.reportWrite(value, super.actualPage, () {
      super.actualPage = value;
    });
  }

  final _$genreIdAtom = Atom(name: '_GenrePageControllerBase.genreId');

  @override
  String get genreId {
    _$genreIdAtom.reportRead();
    return super.genreId;
  }

  @override
  set genreId(String value) {
    _$genreIdAtom.reportWrite(value, super.genreId, () {
      super.genreId = value;
    });
  }

  final _$genreNameAtom = Atom(name: '_GenrePageControllerBase.genreName');

  @override
  String get genreName {
    _$genreNameAtom.reportRead();
    return super.genreName;
  }

  @override
  set genreName(String value) {
    _$genreNameAtom.reportWrite(value, super.genreName, () {
      super.genreName = value;
    });
  }

  final _$fetchFilmsByGenreAsyncAction =
      AsyncAction('_GenrePageControllerBase.fetchFilmsByGenre');

  @override
  Future<void> fetchFilmsByGenre() {
    return _$fetchFilmsByGenreAsyncAction.run(() => super.fetchFilmsByGenre());
  }

  final _$_GenrePageControllerBaseActionController =
      ActionController(name: '_GenrePageControllerBase');

  @override
  void setActualPage(dynamic actualPage) {
    final _$actionInfo = _$_GenrePageControllerBaseActionController.startAction(
        name: '_GenrePageControllerBase.setActualPage');
    try {
      return super.setActualPage(actualPage);
    } finally {
      _$_GenrePageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setGenreId(dynamic genreId) {
    final _$actionInfo = _$_GenrePageControllerBaseActionController.startAction(
        name: '_GenrePageControllerBase.setGenreId');
    try {
      return super.setGenreId(genreId);
    } finally {
      _$_GenrePageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setGenreName(dynamic genreName) {
    final _$actionInfo = _$_GenrePageControllerBaseActionController.startAction(
        name: '_GenrePageControllerBase.setGenreName');
    try {
      return super.setGenreName(genreName);
    } finally {
      _$_GenrePageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
films: ${films},
actualPage: ${actualPage},
genreId: ${genreId},
genreName: ${genreName}
    ''';
  }
}

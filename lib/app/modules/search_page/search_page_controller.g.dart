// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SearchPageController on _SearchPageControllerBase, Store {
  final _$searchNameAtom = Atom(name: '_SearchPageControllerBase.searchName');

  @override
  String get searchName {
    _$searchNameAtom.reportRead();
    return super.searchName;
  }

  @override
  set searchName(String value) {
    _$searchNameAtom.reportWrite(value, super.searchName, () {
      super.searchName = value;
    });
  }

  final _$filmsAtom = Atom(name: '_SearchPageControllerBase.films');

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

  final _$actualPageAtom = Atom(name: '_SearchPageControllerBase.actualPage');

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

  final _$fetchFilmsAsyncAction =
      AsyncAction('_SearchPageControllerBase.fetchFilms');

  @override
  Future<void> fetchFilms() {
    return _$fetchFilmsAsyncAction.run(() => super.fetchFilms());
  }

  final _$_SearchPageControllerBaseActionController =
      ActionController(name: '_SearchPageControllerBase');

  @override
  void setSearchName(String searchName) {
    final _$actionInfo = _$_SearchPageControllerBaseActionController
        .startAction(name: '_SearchPageControllerBase.setSearchName');
    try {
      return super.setSearchName(searchName);
    } finally {
      _$_SearchPageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setActualPage(dynamic actualPage) {
    final _$actionInfo = _$_SearchPageControllerBaseActionController
        .startAction(name: '_SearchPageControllerBase.setActualPage');
    try {
      return super.setActualPage(actualPage);
    } finally {
      _$_SearchPageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
searchName: ${searchName},
films: ${films},
actualPage: ${actualPage}
    ''';
  }
}

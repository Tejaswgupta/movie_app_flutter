import 'package:yshare/app/app_controller.dart';
import 'package:yshare/model/film.dart';
import 'package:yshare/provider/api.dart';
import 'package:mobx/mobx.dart';

part 'search_page_controller.g.dart';

class SearchPageController = _SearchPageControllerBase
    with _$SearchPageController;

abstract class _SearchPageControllerBase with Store {
  final AppController appController;

  _SearchPageControllerBase(this.appController);

  @observable
  String searchName;

  @observable
  ObservableList<Film> films = ObservableList<Film>();

  final Api api = Api();

  @observable
  int actualPage = 1;

  @action
  void setSearchName(String searchName) => this.searchName = searchName;

  @action
  void setActualPage(actualPage) => this.actualPage = actualPage;

  @action
  Future<void> fetchFilms() async {
    var response = await api.searchFilm(searchName, actualPage);
    for (var film in response) {
      films.add(film);
    }
  }
}

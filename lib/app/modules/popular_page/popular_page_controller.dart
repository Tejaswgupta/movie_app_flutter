import 'package:mobx/mobx.dart';
import 'package:yshare/app/app_controller.dart';
import 'package:yshare/model/film.dart';
import 'package:yshare/provider/api.dart';

part 'popular_page_controller.g.dart';

class PopularPageController = _PopularPageControllerBase
    with _$PopularPageController;

abstract class _PopularPageControllerBase with Store {
  final AppController appController;
  _PopularPageControllerBase(this.appController);

  @observable
  ObservableList<Film> films = ObservableList<Film>();

  final Api api = Api();

  @observable
  int actualPage = 1;

  @action
  void setActualPage(actualPage) => this.actualPage = actualPage;

  @action
  Future<void> fetchPopularFilms() async {
    var response = await api.getPopular(actualPage);
    for (var film in response) {
      films.add(film);
    }
  }
}

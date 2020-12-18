import 'package:mobx/mobx.dart';
import 'package:yshare/app/app_controller.dart';
import 'package:yshare/model/film.dart';
import 'package:yshare/provider/api.dart';

part 'trending_page_controller.g.dart';

class TrendingPageController = _TrendingPageControllerBase
    with _$TrendingPageController;

abstract class _TrendingPageControllerBase with Store {
  final AppController appController;

  _TrendingPageControllerBase(this.appController);

  @observable
  ObservableList<Film> films = ObservableList<Film>();

  final Api api = Api();

  @observable
  int actualPage = 1;

  @action
  void setActualPage(actualPage) => this.actualPage = actualPage;

  @action
  Future<void> fetchTredingFilms() async {
    var response = await api.getTrendingFilms(actualPage);
    for (var film in response) {
      films.add(film);
    }
  }
}

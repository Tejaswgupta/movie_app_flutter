import 'package:mobx/mobx.dart';
import 'package:yshare/app/app_controller.dart';
import 'package:yshare/model/film.dart';
import 'package:yshare/provider/api.dart';

part 'top_rated_page_controller.g.dart';

class TopRatedPageController = _TopRatedPageControllerBase
    with _$TopRatedPageController;

abstract class _TopRatedPageControllerBase with Store {
  final AppController appController;

  _TopRatedPageControllerBase(this.appController);

  @observable
  ObservableList<Film> films = ObservableList<Film>();

  final Api api = Api();

  @observable
  int actualPage = 1;

  @action
  void setActualPage(actualPage) => this.actualPage = actualPage;

  @action
  Future<void> fetchTopRated() async {
    var response = await api.getPopular(actualPage);
    for (var film in response) {
      films.add(film);
    }
  }
}

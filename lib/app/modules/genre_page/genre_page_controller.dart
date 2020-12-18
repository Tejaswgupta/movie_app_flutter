import 'package:yshare/app/app_controller.dart';
import 'package:yshare/model/film.dart';
import 'package:yshare/provider/api.dart';
import 'package:mobx/mobx.dart';

part 'genre_page_controller.g.dart';

class GenrePageController = _GenrePageControllerBase with _$GenrePageController;

abstract class _GenrePageControllerBase with Store {
  final AppController appController;

  _GenrePageControllerBase(this.appController);

  @observable
  ObservableList<Film> films = ObservableList<Film>();

  final Api api = Api();

  @observable
  int actualPage = 1;

  @observable
  String genreId;

  @observable
  String genreName;

  @action
  void setActualPage(actualPage) => this.actualPage = actualPage;

  @action
  void setGenreId(genreId) => this.genreId = genreId;

  @action
  void setGenreName(genreName) => this.genreName = genreName;

  @action
  Future<void> fetchFilmsByGenre() async {
    var response = await api.getFilmByGenre(genreId, actualPage);
    for (var film in response) {
      films.add(film);
    }
  }
}

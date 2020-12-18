import 'package:yshare/app/app_controller.dart';
import 'package:mobx/mobx.dart';

part 'film_page_controller.g.dart';

class FilmPageController = _FilmPageControllerBase with _$FilmPageController;

abstract class _FilmPageControllerBase with Store {
  _FilmPageControllerBase(this.appController);

  final AppController appController;
}

import 'package:yshare/app/app_controller.dart';
import 'package:mobx/mobx.dart';

part 'actor_page_controller.g.dart';

class ActorPageController = _ActorPageControllerBase with _$ActorPageController;

abstract class _ActorPageControllerBase with Store {
  final AppController appController;

  _ActorPageControllerBase(this.appController);
}

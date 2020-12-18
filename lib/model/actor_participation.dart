import 'package:yshare/model/film.dart';
import 'package:json_annotation/json_annotation.dart';

part 'actor_participation.g.dart';

@JsonSerializable(createFactory: true, createToJson: true)
class ActorParticipation {
  List<Film> cast;
  List<Film> crew;
  int id;
  ActorParticipation({this.cast, this.crew, this.id});

  factory ActorParticipation.fromJson(Map<String, dynamic> json) =>
      _$ActorParticipationFromJson(json);
  Map<String, dynamic> toJson() => _$ActorParticipationToJson(this);

  @override
  String toString() => 'ActorParticipation(cast: $cast, crew: $crew, id: $id)';
}

import 'package:json_annotation/json_annotation.dart';

import 'cast.dart';
import 'crew.dart';

part 'film_credit.g.dart';

@JsonSerializable(createFactory: true, createToJson: true)
class FilmCredit {
  int id;
  List<Cast> cast;
  List<Crew> crew;

  FilmCredit({this.id, this.cast, this.crew});

  factory FilmCredit.fromJson(Map<String, dynamic> json) =>
      _$FilmCreditFromJson(json);
  Map<String, dynamic> toJson() => _$FilmCreditToJson(this);

  @override
  String toString() => 'FilmCredit(id: $id, cast: $cast, crew: $crew)';
}

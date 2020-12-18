import 'package:json_annotation/json_annotation.dart';

part 'actor_details.g.dart';

@JsonSerializable(createFactory: true, createToJson: true)
class ActorDetails {
  String birthday;
  @JsonKey(name: 'known_for_department')
  String knownForDepartment;
  String deathday;
  int id;
  String name;
  @JsonKey(name: 'also_known_as')
  List<String> alsoKnownAs;
  int gender;
  String biography;
  num popularity;
  @JsonKey(name: 'place_of_birth')
  String placeOfBirth;
  @JsonKey(name: 'profile_path')
  String profilePath;
  bool adult;
  @JsonKey(name: 'imdb_id')
  String imdbId;
  String homepage;

  ActorDetails(
      {this.birthday,
      this.knownForDepartment,
      this.deathday,
      this.id,
      this.name,
      this.alsoKnownAs,
      this.gender,
      this.biography,
      this.popularity,
      this.placeOfBirth,
      this.profilePath,
      this.adult,
      this.imdbId,
      this.homepage});

  factory ActorDetails.fromJson(Map<String, dynamic> json) =>
      _$ActorDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$ActorDetailsToJson(this);

  @override
  String toString() {
    return 'ActorDetails(birthday: $birthday, knownForDepartment: $knownForDepartment, deathday: $deathday, id: $id, name: $name, alsoKnownAs: $alsoKnownAs, gender: $gender, biography: $biography, popularity: $popularity, placeOfBirth: $placeOfBirth, profilePath: $profilePath, adult: $adult, imdbId: $imdbId, homepage: $homepage)';
  }
}

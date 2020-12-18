import 'package:json_annotation/json_annotation.dart';

part 'cast.g.dart';

@JsonSerializable(createFactory: true, createToJson: true)
class Cast {
  @JsonKey(name: 'cast_id')
  int castId;
  String character;
  @JsonKey(name: 'credit_key')
  String creditId;
  int gender;
  int id;
  String name;
  int order;
  @JsonKey(name: 'profile_path')
  String profilePath;

  Cast(
      {this.castId,
      this.character,
      this.creditId,
      this.gender,
      this.id,
      this.name,
      this.order,
      this.profilePath});

  factory Cast.fromJson(Map<String, dynamic> json) => _$CastFromJson(json);
  Map<String, dynamic> toJson() => _$CastToJson(this);

  @override
  String toString() {
    return 'Cast(castId: $castId, character: $character, creditId: $creditId, gender: $gender, id: $id, name: $name, order: $order, profilePath: $profilePath)';
  }
}

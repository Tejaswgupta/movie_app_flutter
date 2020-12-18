import 'package:json_annotation/json_annotation.dart';

part 'crew.g.dart';

@JsonSerializable(createFactory: true, createToJson: true)
class Crew {
  @JsonKey(name: 'credit_id')
  String creditId;
  String department;
  int gender;
  int id;
  String job;
  String name;
  @JsonKey(name: 'profile_path')
  String profilePath;

  Crew(
      {this.creditId,
      this.department,
      this.gender,
      this.id,
      this.job,
      this.name,
      this.profilePath});

  factory Crew.fromJson(Map<String, dynamic> json) => _$CrewFromJson(json);
  Map<String, dynamic> toJson() => _$CrewToJson(this);

  @override
  String toString() {
    return 'Crew(creditId: $creditId, department: $department, gender: $gender, id: $id, job: $job, name: $name, profilePath: $profilePath)';
  }
}

import 'package:json_annotation/json_annotation.dart';

part 'production_countries.g.dart';

@JsonSerializable(createFactory: true, createToJson: true)
class ProductionCountries {
  String iso31661;
  String name;
  ProductionCountries({this.iso31661, this.name});

  factory ProductionCountries.fromJson(Map<String, dynamic> json) =>
      _$ProductionCountriesFromJson(json);
  Map<String, dynamic> toJson() => _$ProductionCountriesToJson(this);

  @override
  String toString() => 'ProductionCountries(iso31661: $iso31661, name: $name)';
}

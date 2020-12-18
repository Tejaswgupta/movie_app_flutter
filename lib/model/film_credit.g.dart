// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'film_credit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilmCredit _$FilmCreditFromJson(Map<String, dynamic> json) {
  return FilmCredit(
    id: json['id'] as int,
    cast: (json['cast'] as List)
        ?.map(
            (e) => e == null ? null : Cast.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    crew: (json['crew'] as List)
        ?.map(
            (e) => e == null ? null : Crew.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$FilmCreditToJson(FilmCredit instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cast': instance.cast,
      'crew': instance.crew,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actor_participation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActorParticipation _$ActorParticipationFromJson(Map<String, dynamic> json) {
  return ActorParticipation(
    cast: (json['cast'] as List)
        ?.map(
            (e) => e == null ? null : Film.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    crew: (json['crew'] as List)
        ?.map(
            (e) => e == null ? null : Film.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    id: json['id'] as int,
  );
}

Map<String, dynamic> _$ActorParticipationToJson(ActorParticipation instance) =>
    <String, dynamic>{
      'cast': instance.cast,
      'crew': instance.crew,
      'id': instance.id,
    };

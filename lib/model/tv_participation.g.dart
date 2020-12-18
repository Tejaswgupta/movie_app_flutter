// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_participation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TvParticipation _$TvParticipationFromJson(Map<String, dynamic> json) {
  return TvParticipation(
    creditId: json['credit_id'] as String,
    originalName: json['original_name'] as String,
    id: json['id'] as int,
    genreIds: (json['genre_ids'] as List)?.map((e) => e as int)?.toList(),
    character: json['character'] as String,
    name: json['name'] as String,
    posterPath: json['poster_path'] as String,
    voteCount: json['vote_count'] as int,
    voteAverage: (json['vote_average'] as num)?.toDouble(),
    popularity: (json['popularity'] as num)?.toDouble(),
    episodeCount: json['episode_count'] as int,
    originalLanguage: json['original_language'] as String,
    firstAirDate: json['first_air_date'] as String,
    backdropPath: json['backdrop_path'] as String,
    overview: json['overview'] as String,
    originCountry:
        (json['origin_country'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$TvParticipationToJson(TvParticipation instance) =>
    <String, dynamic>{
      'credit_id': instance.creditId,
      'original_name': instance.originalName,
      'id': instance.id,
      'genre_ids': instance.genreIds,
      'character': instance.character,
      'name': instance.name,
      'poster_path': instance.posterPath,
      'vote_count': instance.voteCount,
      'vote_average': instance.voteAverage,
      'popularity': instance.popularity,
      'episode_count': instance.episodeCount,
      'original_language': instance.originalLanguage,
      'first_air_date': instance.firstAirDate,
      'backdrop_path': instance.backdropPath,
      'overview': instance.overview,
      'origin_country': instance.originCountry,
    };

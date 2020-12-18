// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'film.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Film _$FilmFromJson(Map<String, dynamic> json) {
  return Film(
    id: json['id'] as int,
    video: json['video'] as bool,
    voteCount: json['vote_count'] as int,
    voteAverage: (json['vote_average'] as num)?.toDouble(),
    title: json['title'] as String,
    releaseDate: json['release_date'] as String,
    originalLanguage: json['original_language'] as String,
    originalTitle: json['original_title'] as String,
    genreIds: (json['genres'] as List)
        ?.map(
            (e) => e == null ? null : Genre.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    backdropPath: json['backdrop_path'] as String,
    adult: json['adult'] as bool,
    overview: json['overview'] as String,
    posterPath: json['poster_path'] as String,
    popularity: (json['popularity'] as num)?.toDouble(),
    mediaType: json['media_type'] as String,
    tagline: json['tagline'] as String,
    revenue: json['revenue'] as int,
    runtime: json['runtime'] as int,
  )
    ..productionCompanies = (json['production_companies'] as List)
        ?.map((e) => e == null
            ? null
            : ProductionCompanies.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..productionCountries = (json['production_countries'] as List)
        ?.map((e) => e == null
            ? null
            : ProductionCountries.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$FilmToJson(Film instance) => <String, dynamic>{
      'id': instance.id,
      'video': instance.video,
      'vote_count': instance.voteCount,
      'vote_average': instance.voteAverage,
      'title': instance.title,
      'release_date': instance.releaseDate,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'genres': instance.genreIds,
      'backdrop_path': instance.backdropPath,
      'adult': instance.adult,
      'overview': instance.overview,
      'poster_path': instance.posterPath,
      'tagline': instance.tagline,
      'revenue': instance.revenue,
      'runtime': instance.runtime,
      'popularity': instance.popularity,
      'media_type': instance.mediaType,
      'production_companies': instance.productionCompanies,
      'production_countries': instance.productionCountries,
    };

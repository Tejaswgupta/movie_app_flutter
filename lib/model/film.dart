import 'package:json_annotation/json_annotation.dart';

import 'genre.dart';
import 'production_companies.dart';
import 'production_countries.dart';

part 'film.g.dart';

@JsonSerializable(
  createFactory: true,
  createToJson: true,
)
class Film {
  int id;
  bool video;
  @JsonKey(name: 'vote_count')
  int voteCount;
  @JsonKey(name: 'vote_average')
  double voteAverage;
  String title;
  @JsonKey(name: 'release_date')
  String releaseDate;
  @JsonKey(name: 'original_language')
  String originalLanguage;
  @JsonKey(name: 'original_title')
  String originalTitle;
  @JsonKey(name: 'genres')
  List<Genre> genreIds;
  @JsonKey(name: 'backdrop_path')
  String backdropPath;
  bool adult;
  String overview;
  @JsonKey(name: 'poster_path')
  String posterPath;
  String tagline;
  int revenue;
  int runtime;
  double popularity;
  @JsonKey(name: 'media_type')
  String mediaType;
  @JsonKey(name: 'production_companies')
  List<ProductionCompanies> productionCompanies;
  @JsonKey(name: 'production_countries')
  List<ProductionCountries> productionCountries;
  Film(
      {this.id,
      this.video,
      this.voteCount,
      this.voteAverage,
      this.title,
      this.releaseDate,
      this.originalLanguage,
      this.originalTitle,
      this.genreIds,
      this.backdropPath,
      this.adult,
      this.overview,
      this.posterPath,
      this.popularity,
      this.mediaType,
      this.tagline,
      this.revenue,
      this.runtime});

  factory Film.fromJson(Map<String, dynamic> json) => _$FilmFromJson(json);
  Map<String, dynamic> toJson() => _$FilmToJson(this);

  @override
  String toString() {
    return 'Film(id: $id, video: $video, voteCount: $voteCount, voteAverage: $voteAverage, title: $title, releaseDate: $releaseDate, originalLanguage: $originalLanguage, originalTitle: $originalTitle, genreIds: $genreIds, backdropPath: $backdropPath, adult: $adult, overview: $overview, posterPath: $posterPath, tagline: $tagline, revenue: $revenue, runtime: $runtime, popularity: $popularity, mediaType: $mediaType, productionCompanies: $productionCompanies, productionCountries: $productionCountries)';
  }
}

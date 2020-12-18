import 'package:json_annotation/json_annotation.dart';

part 'tv_participation.g.dart';

@JsonSerializable(
  createFactory: true,
  createToJson: true,
)
class TvParticipation {
  @JsonKey(name: 'credit_id')
  String creditId;
  @JsonKey(name: 'original_name')
  String originalName;
  int id;
  @JsonKey(name: 'genre_ids')
  List<int> genreIds;
  String character;
  String name;
  @JsonKey(name: 'poster_path')
  String posterPath;
  @JsonKey(name: 'vote_count')
  int voteCount;
  @JsonKey(name: 'vote_average')
  double voteAverage;
  double popularity;
  @JsonKey(name: 'episode_count')
  int episodeCount;
  @JsonKey(name: 'original_language')
  String originalLanguage;
  @JsonKey(name: 'first_air_date')
  String firstAirDate;
  @JsonKey(name: 'backdrop_path')
  String backdropPath;
  String overview;
  @JsonKey(name: 'origin_country')
  List<String> originCountry;

  TvParticipation({
    this.creditId,
    this.originalName,
    this.id,
    this.genreIds,
    this.character,
    this.name,
    this.posterPath,
    this.voteCount,
    this.voteAverage,
    this.popularity,
    this.episodeCount,
    this.originalLanguage,
    this.firstAirDate,
    this.backdropPath,
    this.overview,
    this.originCountry,
  });

  factory TvParticipation.fromJson(Map<String, dynamic> json) =>
      _$TvParticipationFromJson(json);
  Map<String, dynamic> toJson() => _$TvParticipationToJson(this);

  @override
  String toString() {
    return 'TvParticipation(creditId: $creditId, originalName: $originalName, id: $id, genreIds: $genreIds, character: $character, name: $name, posterPath: $posterPath, voteCount: $voteCount, voteAverage: $voteAverage, popularity: $popularity, episodeCount: $episodeCount, originalLanguage: $originalLanguage, firstAirDate: $firstAirDate, backdropPath: $backdropPath, overview: $overview, originCountry: $originCountry)';
  }
}

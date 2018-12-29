import 'package:json_annotation/json_annotation.dart';

part 'Movie.g.dart';

@JsonSerializable(includeIfNull: false)
class Movie {
  bool adult;
  @JsonKey(name: "backdrop_path")
  String backdropPath;
  int budget;
  int id;
  @JsonKey(name: "original_title")
  String originalTitle;
  String overview;
  double popularity;
  String tagline;
  String title;
  @JsonKey(name: "vote_average")
  double voteAverage;
  @JsonKey(name: "vote_count")
  int voteCount;

  Movie(
      this.adult,
      this.backdropPath,
      this.budget,
      this.id,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.tagline,
      this.title,
      this.voteAverage,
      this.voteCount);

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}

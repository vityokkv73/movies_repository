import 'package:json_annotation/json_annotation.dart';
import 'package:movies_repository/MovieBrief.dart';

part 'MoviesListResult.g.dart';

@JsonSerializable(includeIfNull: false)
class MoviesListResult {
  int page;
  List<MovieBrief> results;
  @JsonKey(name: "total_results")
  int totalResults;
  @JsonKey(name: "total_pages")
  int totalPages;

  MoviesListResult(this.page, this.results, this.totalPages, this.totalResults);

  factory MoviesListResult.fromJson(Map<String, dynamic> json) => _$MoviesListResultFromJson(json);
}

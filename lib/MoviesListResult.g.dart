// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MoviesListResult.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoviesListResult _$MoviesListResultFromJson(Map<String, dynamic> json) {
  return MoviesListResult(
      json['page'] as int,
      (json['results'] as List)
          ?.map((e) =>
              e == null ? null : MovieBrief.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['total_pages'] as int,
      json['total_results'] as int);
}

Map<String, dynamic> _$MoviesListResultToJson(MoviesListResult instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('page', instance.page);
  writeNotNull('results', instance.results);
  writeNotNull('total_results', instance.totalResults);
  writeNotNull('total_pages', instance.totalPages);
  return val;
}

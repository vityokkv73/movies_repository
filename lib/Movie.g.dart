// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) {
  return Movie(
      json['adult'] as bool,
      json['backdrop_path'] as String,
      json['budget'] as int,
      json['id'] as int,
      json['original_title'] as String,
      json['overview'] as String,
      (json['popularity'] as num)?.toDouble(),
      json['tagline'] as String,
      json['title'] as String,
      (json['vote_average'] as num)?.toDouble(),
      json['vote_count'] as int);
}

Map<String, dynamic> _$MovieToJson(Movie instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('adult', instance.adult);
  writeNotNull('backdrop_path', instance.backdropPath);
  writeNotNull('budget', instance.budget);
  writeNotNull('id', instance.id);
  writeNotNull('original_title', instance.originalTitle);
  writeNotNull('overview', instance.overview);
  writeNotNull('popularity', instance.popularity);
  writeNotNull('tagline', instance.tagline);
  writeNotNull('title', instance.title);
  writeNotNull('vote_average', instance.voteAverage);
  writeNotNull('vote_count', instance.voteCount);
  return val;
}

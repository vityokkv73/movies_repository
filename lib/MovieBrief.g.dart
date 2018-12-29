// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MovieBrief.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieBrief _$MovieBriefFromJson(Map<String, dynamic> json) {
  return MovieBrief(
      json['poster_path'] as String,
      json['adult'] as bool,
      json['overview'] as String,
      json['release_date'] as String,
      (json['genre_ids'] as List)?.map((e) => e as int)?.toList(),
      json['id'] as int,
      json['original_title'] as String,
      json['original_language'] as String,
      json['title'] as String,
      json['backdrop_path'] as String,
      (json['popularity'] as num)?.toDouble(),
      json['vote_count'] as int,
      json['video'] as bool,
      (json['vote_average'] as num)?.toDouble());
}

Map<String, dynamic> _$MovieBriefToJson(MovieBrief instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('poster_path', instance.posterPath);
  writeNotNull('adult', instance.adult);
  writeNotNull('overview', instance.overview);
  writeNotNull('release_date', instance.releaseDate);
  writeNotNull('genre_ids', instance.genreIds);
  writeNotNull('id', instance.id);
  writeNotNull('original_title', instance.originalTitle);
  writeNotNull('original_language', instance.originalLanguage);
  writeNotNull('title', instance.title);
  writeNotNull('backdrop_path', instance.backdropPath);
  writeNotNull('popularity', instance.popularity);
  writeNotNull('vote_count', instance.voteCount);
  writeNotNull('video', instance.video);
  writeNotNull('vote_average', instance.voteAverage);
  return val;
}

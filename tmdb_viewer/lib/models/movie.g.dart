// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) {
  return Movie()
    ..title = json['title'] as String
    ..posterPath = json['poster_path'] as String
    ..backdropPath = json['backdrop_path'] as String
    ..overview = json['overview'] as String
    ..releaseDate = json['release_date'] == null
        ? null
        : DateTime.parse(json['release_date'] as String)
    ..genreIds = (json['genre_ids'] as List)?.map((e) => e as int)?.toList();
}

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'title': instance.title,
      'poster_path': instance.posterPath,
      'backdrop_path': instance.backdropPath,
      'overview': instance.overview,
      'release_date': instance.releaseDate?.toIso8601String(),
      'genre_ids': instance.genreIds,
    };

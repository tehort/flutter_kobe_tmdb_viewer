import 'package:json_annotation/json_annotation.dart';
import 'package:tmdb_viewer/models/genre.dart';
part 'movie.g.dart';

@JsonSerializable(explicitToJson: true)
class Movie {
  Movie();

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
  Map<String, dynamic> toJson() => _$MovieToJson(this);

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'poster_path')
  String posterPath;

  @JsonKey(name: 'backdrop_path')
  String backdropPath;

  @JsonKey(name: 'overview')
  String overview;

  @JsonKey(name: 'release_date')
  DateTime releaseDate;

  @JsonKey(name: 'genre_ids')
  List<int> genreIds;

  String genres() {
    var desc = '';

    for (var item in genreIds) {
      desc = desc + Genre.lstGenres.where((g) => g.id == item).first.name + ', ';
    }
    desc = desc.substring(0, desc.length - 2);

    return desc;
  }
}

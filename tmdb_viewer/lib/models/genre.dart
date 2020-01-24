import 'package:json_annotation/json_annotation.dart';
part 'genre.g.dart';

@JsonSerializable(explicitToJson: true)
class Genre {
  Genre();
  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);
  Map<String, dynamic> toJson() => _$GenreToJson(this);

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  static List<Genre> lstGenres;
}

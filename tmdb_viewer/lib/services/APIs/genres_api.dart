import 'package:tmdb_viewer/core/errors/error_handler.dart';
import 'package:tmdb_viewer/core/network/dio_client.dart';
import 'package:tmdb_viewer/models/genre.dart';

class GenresAPI {
  GenresAPI();

  final _dio = DioClient();
  final upcomingRoute = '/genre/movie/list';

  Future<List<Genre>> getGenres() async {
    return Genre.lstGenres = await _dio
        .get(
          upcomingRoute,
        )
        .then((res) => (res['genres'] as List<dynamic>).map((e) => Genre.fromJson(e)).toList())
        .catchError(ApiErrorHandler.handleError);
  }
}

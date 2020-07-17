import 'package:tmdb_viewer/core/errors/error_handler.dart';
import 'package:tmdb_viewer/core/network/dio_client.dart';
import 'package:tmdb_viewer/models/movie.dart';

class SearchMoviesAPI {
  SearchMoviesAPI();

  final _dio = DioClient();
  final searchRoute = '/search/movie';

  Future<List<Movie>> getMovies(String description) async {
    return _dio
        .get(
          searchRoute,
          queryParameters: {'query': '$description'},
        )
        .then((res) => (res['results'] as List<dynamic>).map((e) => Movie.fromJson(e)).toList())
        .catchError(ApiErrorHandler.handleError);
  }
}

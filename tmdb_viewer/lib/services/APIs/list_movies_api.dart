import 'package:tmdb_viewer/core/errors/error_handler.dart';
import 'package:tmdb_viewer/core/network/dio_client.dart';
import 'package:tmdb_viewer/models/movie.dart';

class ListMoviesAPI {
  ListMoviesAPI();

  final _dio = DioClient();
  final upcomingRoute = '/movie/upcoming';

  Future<List<Movie>> getUpcoming({int page = 1}) async {
    return _dio
        .get(
          upcomingRoute,
          queryParameters: {'page': '$page'},
        )
        .then((res) => (res['results'] as List<dynamic>).map((e) => Movie.fromJson(e)).toList())
        .catchError(ApiErrorHandler.handleError);
  }
}

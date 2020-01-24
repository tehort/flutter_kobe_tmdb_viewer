import 'package:mobx/mobx.dart';
import 'package:tmdb_viewer/models/movie.dart';
import 'package:tmdb_viewer/services/APIs/search_movies_api.dart';
part 'search_store.g.dart';

class SearchStore = _SearchStore with _$SearchStore;

abstract class _SearchStore with Store {
  final _searchMoviesAPI = SearchMoviesAPI();

  List<Movie> movies = [];

  @observable
  ObservableFuture<List<Movie>> fetchMoviesFuture = emptyResponse;

  @observable
  String movie = '';

  @computed
  bool get hasResults => fetchMoviesFuture != emptyResponse && fetchMoviesFuture.status == FutureStatus.fulfilled;

  static ObservableFuture<List<Movie>> emptyResponse = ObservableFuture.value([]);

  @action
  Future<List<Movie>> loadMovies() async {
    movies = [];
    final future = _searchMoviesAPI.getMovies(movie);
    fetchMoviesFuture = ObservableFuture(future);

    return movies = await future;
  }

  @action
  void setMovie(String text) {
    fetchMoviesFuture = emptyResponse;
    movie = text;
  }
}

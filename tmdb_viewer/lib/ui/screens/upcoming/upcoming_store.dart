import 'package:mobx/mobx.dart';
import 'package:tmdb_viewer/models/movie.dart';
import 'package:tmdb_viewer/services/APIs/list_movies_api.dart';
part 'upcoming_store.g.dart';

class UpcomingStore = _UpcomingStore with _$UpcomingStore;

abstract class _UpcomingStore with Store {
  final _listMoviesAPI = ListMoviesAPI();

  @observable
  int pageIndex = 1;

  @observable
  bool isLoading;

  @observable
  int pagesLimit;

  @computed
  bool get moreMoviesAvailable => pageIndex <= pagesLimit;

  @observable
  ObservableList<Movie> lstMovies = ObservableList<Movie>();

  @action
  Future loadMovies() async {
    try {
      isLoading = true;
      lstMovies.addAll(await _listMoviesAPI.getUpcoming(page: pageIndex++));
    } finally {
      isLoading = false;
    }
  }

  @action
  Future loadMoreMovies() async {
    try {
      isLoading = true;
      lstMovies.addAll(await _listMoviesAPI.getUpcoming(page: pageIndex++));
    } finally {
      isLoading = false;
    }
  }
}

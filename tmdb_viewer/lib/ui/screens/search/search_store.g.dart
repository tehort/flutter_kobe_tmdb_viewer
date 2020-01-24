// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SearchStore on _SearchStore, Store {
  Computed<bool> _$hasResultsComputed;

  @override
  bool get hasResults =>
      (_$hasResultsComputed ??= Computed<bool>(() => super.hasResults)).value;

  final _$fetchMoviesFutureAtom = Atom(name: '_SearchStore.fetchMoviesFuture');

  @override
  ObservableFuture<List<Movie>> get fetchMoviesFuture {
    _$fetchMoviesFutureAtom.context.enforceReadPolicy(_$fetchMoviesFutureAtom);
    _$fetchMoviesFutureAtom.reportObserved();
    return super.fetchMoviesFuture;
  }

  @override
  set fetchMoviesFuture(ObservableFuture<List<Movie>> value) {
    _$fetchMoviesFutureAtom.context.conditionallyRunInAction(() {
      super.fetchMoviesFuture = value;
      _$fetchMoviesFutureAtom.reportChanged();
    }, _$fetchMoviesFutureAtom, name: '${_$fetchMoviesFutureAtom.name}_set');
  }

  final _$movieAtom = Atom(name: '_SearchStore.movie');

  @override
  String get movie {
    _$movieAtom.context.enforceReadPolicy(_$movieAtom);
    _$movieAtom.reportObserved();
    return super.movie;
  }

  @override
  set movie(String value) {
    _$movieAtom.context.conditionallyRunInAction(() {
      super.movie = value;
      _$movieAtom.reportChanged();
    }, _$movieAtom, name: '${_$movieAtom.name}_set');
  }

  final _$loadMoviesAsyncAction = AsyncAction('loadMovies');

  @override
  Future<List<Movie>> loadMovies() {
    return _$loadMoviesAsyncAction.run(() => super.loadMovies());
  }

  final _$_SearchStoreActionController = ActionController(name: '_SearchStore');

  @override
  void setMovie(String text) {
    final _$actionInfo = _$_SearchStoreActionController.startAction();
    try {
      return super.setMovie(text);
    } finally {
      _$_SearchStoreActionController.endAction(_$actionInfo);
    }
  }
}

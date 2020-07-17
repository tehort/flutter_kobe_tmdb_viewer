// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upcoming_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UpcomingStore on _UpcomingStore, Store {
  Computed<bool> _$moreMoviesAvailableComputed;

  @override
  bool get moreMoviesAvailable => (_$moreMoviesAvailableComputed ??=
          Computed<bool>(() => super.moreMoviesAvailable))
      .value;

  final _$pageIndexAtom = Atom(name: '_UpcomingStore.pageIndex');

  @override
  int get pageIndex {
    _$pageIndexAtom.context.enforceReadPolicy(_$pageIndexAtom);
    _$pageIndexAtom.reportObserved();
    return super.pageIndex;
  }

  @override
  set pageIndex(int value) {
    _$pageIndexAtom.context.conditionallyRunInAction(() {
      super.pageIndex = value;
      _$pageIndexAtom.reportChanged();
    }, _$pageIndexAtom, name: '${_$pageIndexAtom.name}_set');
  }

  final _$isLoadingAtom = Atom(name: '_UpcomingStore.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.context.enforceReadPolicy(_$isLoadingAtom);
    _$isLoadingAtom.reportObserved();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.context.conditionallyRunInAction(() {
      super.isLoading = value;
      _$isLoadingAtom.reportChanged();
    }, _$isLoadingAtom, name: '${_$isLoadingAtom.name}_set');
  }

  final _$pagesLimitAtom = Atom(name: '_UpcomingStore.pagesLimit');

  @override
  int get pagesLimit {
    _$pagesLimitAtom.context.enforceReadPolicy(_$pagesLimitAtom);
    _$pagesLimitAtom.reportObserved();
    return super.pagesLimit;
  }

  @override
  set pagesLimit(int value) {
    _$pagesLimitAtom.context.conditionallyRunInAction(() {
      super.pagesLimit = value;
      _$pagesLimitAtom.reportChanged();
    }, _$pagesLimitAtom, name: '${_$pagesLimitAtom.name}_set');
  }

  final _$lstMoviesAtom = Atom(name: '_UpcomingStore.lstMovies');

  @override
  ObservableList<Movie> get lstMovies {
    _$lstMoviesAtom.context.enforceReadPolicy(_$lstMoviesAtom);
    _$lstMoviesAtom.reportObserved();
    return super.lstMovies;
  }

  @override
  set lstMovies(ObservableList<Movie> value) {
    _$lstMoviesAtom.context.conditionallyRunInAction(() {
      super.lstMovies = value;
      _$lstMoviesAtom.reportChanged();
    }, _$lstMoviesAtom, name: '${_$lstMoviesAtom.name}_set');
  }

  final _$loadMoviesAsyncAction = AsyncAction('loadMovies');

  @override
  Future<dynamic> loadMovies() {
    return _$loadMoviesAsyncAction.run(() => super.loadMovies());
  }

  final _$loadMoreMoviesAsyncAction = AsyncAction('loadMoreMovies');

  @override
  Future<dynamic> loadMoreMovies() {
    return _$loadMoreMoviesAsyncAction.run(() => super.loadMoreMovies());
  }
}

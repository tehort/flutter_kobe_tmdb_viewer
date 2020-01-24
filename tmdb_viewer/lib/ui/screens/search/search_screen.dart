import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:tmdb_viewer/core/constants/theme.dart';
import 'package:tmdb_viewer/ui/screens/search/search_store.dart';
import 'package:tmdb_viewer/ui/widgets/movie_card.dart';
import 'package:tmdb_viewer/ui/widgets/progress_indicator.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen(this._store);

  // State
  @override
  SearchScreenState createState() => SearchScreenState();

  // Route
  static const String routeName = '/searchScreen';

  // Stores
  final SearchStore _store;
}

class SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Movies'),
        backgroundColor: AppTheme.appBarBackground,
        centerTitle: true,
      ),
      backgroundColor: AppTheme.pageBackgroundColor,
      body: Column(
        children: <Widget>[
          _buildInput(),
          _buildError(),
          _buildMoviesListView(),
          _buildProgressIndicator(),
        ],
      ),
    );
  }

  Observer _buildProgressIndicator() {
    return Observer(
      builder: (_) => widget._store.fetchMoviesFuture.status == FutureStatus.pending ? MyProgressIndicator() : Container(),
    );
  }

  Widget _buildInput() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: TextField(
              autocorrect: false,
              autofocus: true,
              onSubmitted: (String movie) {
                widget._store.setMovie(movie);
                widget._store.loadMovies();
              },
            ),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: widget._store.loadMovies,
        )
      ],
    );
  }

  Widget _buildMoviesListView() {
    return Expanded(
      child: Observer(
        builder: (_) {
          if (!widget._store.hasResults) {
            return Container();
          }

          if (widget._store.movies.isEmpty) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('We could not find any movies'),
                Text(
                  widget._store.movie,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            );
          }

          return ListView.builder(
            itemCount: widget._store.movies.length,
            itemBuilder: (_, int index) {
              final movie = widget._store.movies[index];
              return MovieCard(item: movie);
            },
          );
        },
      ),
    );
  }

  Widget _buildError() {
    return Observer(
      builder: (_) => widget._store.fetchMoviesFuture.status == FutureStatus.rejected
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Icon(
                  Icons.warning,
                  color: Colors.deepOrange,
                ),
                Container(
                  width: 8,
                ),
                const Text(
                  'Failed to find movies for',
                  style: TextStyle(color: Colors.deepOrange),
                ),
                Text(
                  widget._store.movie,
                  style: const TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold),
                )
              ],
            )
          : Container(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tmdb_viewer/core/constants/theme.dart';
import 'package:tmdb_viewer/ui/screens/upcoming/upcoming_store.dart';
import 'package:tmdb_viewer/ui/widgets/movie_card.dart';
import 'package:tmdb_viewer/ui/widgets/progress_indicator.dart';

class UpcomingScreen extends StatefulWidget {
  const UpcomingScreen(this._store, {Key key}) : super(key: key);

  // State
  @override
  _UpcomingScreenState createState() => _UpcomingScreenState();

  // Route
  static const String routeName = '/upcomingScreen';

  // Stores
  final UpcomingStore _store;
}

class _UpcomingScreenState extends State<UpcomingScreen> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    widget._store.loadMovies();

    super.initState();
    _scrollController.addListener(
      () {
        if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
          widget._store.loadMoreMovies();
        }
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upcoming Movies'),
        backgroundColor: AppTheme.appBarBackground,
        centerTitle: true,
      ),
      backgroundColor: AppTheme.pageBackgroundColor,
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Observer(
      builder: (_) {
        return ListView.builder(
          itemCount: widget._store.lstMovies.length + 1,
          itemBuilder: (BuildContext context, int index) {
            if (index == widget._store.lstMovies.length) {
              return widget._store.isLoading ? MyProgressIndicator() : Container();
            } else {
              return MovieCard(item: widget._store.lstMovies[index]);
            }
          },
          controller: _scrollController,
        );
      },
    );
  }
}

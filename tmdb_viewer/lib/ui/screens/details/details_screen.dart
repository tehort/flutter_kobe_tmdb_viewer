import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tmdb_viewer/core/constants/theme.dart';
import 'package:tmdb_viewer/models/movie.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen(this._movie, {Key key}) : super(key: key);

  final Movie _movie;

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Details'),
        backgroundColor: AppTheme.appBarBackground,
        centerTitle: true,
      ),
      backgroundColor: AppTheme.pageBackgroundColor,
      body: Column(
        children: <Widget>[
          _buildHeader(),
          _buildBody(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Stack(
      children: <Widget>[
        Hero(
          child: Image.network(
            "https://image.tmdb.org/t/p/w500/${widget._movie.backdropPath}",
          ),
          tag: widget._movie.backdropPath,
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget._movie.title,
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Positioned(
          left: 0,
          bottom: 25,
          top: 25,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.network(
                "https://image.tmdb.org/t/p/w500/${widget._movie.posterPath}",
                height: 150,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            _buildReleaseDate(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(color: Colors.transparent, height: 3),
            ),
            _buildGenres(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(color: Colors.transparent, height: 3),
            ),
            _buildOverview(),
          ],
        ),
      ),
    );
  }

  Widget _buildReleaseDate() {
    return Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          child: Text(
            'Release Date',
            textAlign: TextAlign.start,
            style: TextStyle(
              color: Colors.grey.shade700,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          width: double.infinity,
          child: Text(
            DateFormat('MM/dd/yyyy').format(widget._movie.releaseDate),
            style: TextStyle(
              color: Colors.grey.shade500,
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGenres() {
    return Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          child: Text(
            'Genres',
            textAlign: TextAlign.start,
            style: TextStyle(
              color: Colors.grey.shade700,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          width: double.infinity,
          child: Text(
            widget._movie.genres(),
            style: TextStyle(
              color: Colors.grey.shade500,
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOverview() {
    return Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          child: Text(
            'Overview',
            textAlign: TextAlign.start,
            style: TextStyle(
              color: Colors.grey.shade700,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          width: double.infinity,
          child: Text(
            widget._movie.overview,
            style: TextStyle(
              color: Colors.grey.shade500,
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_viewer/core/constants/theme.dart';
import 'package:tmdb_viewer/models/movie.dart';
import 'package:tmdb_viewer/ui/screens/details/details_screen.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({Key key, @required this.item}) : super(key: key);

  final Movie item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        child: Card(
          elevation: 8,
          child: Stack(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Hero(
                  child: Image.network("https://image.tmdb.org/t/p/w500/${item.backdropPath}"),
                  tag: item.backdropPath,
                ),
              ),
              Positioned(
                top: 0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    DateFormat('MM/dd/yyyy').format(item.releaseDate),
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.grey.shade200,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    item.title,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    item.overview,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.grey.shade200,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    splashColor: AppTheme.buttonColor,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DetailsScreen(item)),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

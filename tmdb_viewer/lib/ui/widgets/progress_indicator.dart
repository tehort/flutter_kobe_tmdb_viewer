import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tmdb_viewer/core/constants/theme.dart';

class MyProgressIndicator extends StatelessWidget {
  const MyProgressIndicator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: Opacity(
              opacity: 1.0,
              child: CircularProgressIndicator(
                strokeWidth: 6.5,
                valueColor: AlwaysStoppedAnimation<Color>(AppTheme.progressHudColor),
              ),
            ),
          ),
        );
      },
    );
  }
}

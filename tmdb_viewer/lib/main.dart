import 'package:flutter/material.dart';
import 'package:tmdb_viewer/ui/screens/app/app.dart';
import 'injection_container.dart' as sl;

void main() async {
  sl.init();
  runApp(App());
}

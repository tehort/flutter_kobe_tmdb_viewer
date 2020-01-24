import 'package:flutter/material.dart';
import 'package:tmdb_viewer/injection_container.dart';
import 'package:tmdb_viewer/ui/screens/app_home/app_home_screen.dart';
import 'package:tmdb_viewer/ui/screens/app_home/tab_selector_store.dart';
import 'package:tmdb_viewer/ui/screens/search/search_screen.dart';
import 'package:tmdb_viewer/ui/screens/search/search_store.dart';
import 'package:tmdb_viewer/ui/screens/upcoming/upcoming_screen.dart';
import 'package:tmdb_viewer/ui/screens/upcoming/upcoming_store.dart';

class App extends StatelessWidget {
  @override
  Widget build(context) {
    return MaterialApp(
      title: 'The Movie Database Viewer',
      initialRoute: AppHomeScreen.routeName,
      routes: {
        AppHomeScreen.routeName: (_) => AppHomeScreen(sl.get<TabSelectorStore>()),
        SearchScreen.routeName: (_) => SearchScreen(sl.get<SearchStore>()),
        UpcomingScreen.routeName: (_) => UpcomingScreen(sl.get<UpcomingStore>()),
      },
    );
  }
}

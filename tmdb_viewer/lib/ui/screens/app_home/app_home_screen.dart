import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tmdb_viewer/core/constants/theme.dart';
import 'package:tmdb_viewer/services/APIs/genres_api.dart';
import 'package:tmdb_viewer/ui/screens/app_home/tab_selector_store.dart';
import 'package:tmdb_viewer/ui/screens/search/search_screen.dart';
import 'package:tmdb_viewer/ui/screens/search/search_store.dart';
import 'package:tmdb_viewer/ui/screens/upcoming/upcoming_screen.dart';
import 'package:tmdb_viewer/ui/screens/upcoming/upcoming_store.dart';

class AppHomeScreen extends StatefulWidget {
  const AppHomeScreen(this._tabSelectorStore, {Key key}) : super(key: key);

  // State
  @override
  _AppHomeScreenState createState() => _AppHomeScreenState();

  // Route
  static const String routeName = '/appHome';

  // Stores
  final TabSelectorStore _tabSelectorStore;

  // Tabs Management - In case new tabs are added to the app
  static final PageStorageBucket _bucket = PageStorageBucket();
  static final List<Widget> _tabs = <Widget>[
    UpcomingScreen(UpcomingStore()),
    SearchScreen(SearchStore()),
  ];
}

class _AppHomeScreenState extends State<AppHomeScreen> {
  // // Reaction to show snackbars
  // final ReactionDisposer _snackBarReactionDisposer = reaction(
  //   (_) => sl.get<GlobalErrorStore>().snackBarMessage.length,
  //   (result) => AppHomeScreen._scaffoldKey.currentState.showSnackBar(
  //     SnackBar(
  //       content: Text('${sl.get<GlobalErrorStore>().snackBarMessage.last}'),
  //       behavior: SnackBarBehavior.fixed,
  //       elevation: 0,
  //     ),
  //   ),
  // );

  // // Reaction to show error and dialogs
  // final ReactionDisposer _errorDialogsReactionDisposer = reaction(
  //   (_) => sl.get<GlobalErrorStore>().errors.length,
  //   (result) => ErrorHandler.handleError(AppHomeScreen._scaffoldKey.currentState.context, sl.get<GlobalErrorStore>().errors.last),
  // );

  @override
  void initState() {
    super.initState();
    GenresAPI().getGenres();
  }

  @override
  void dispose() {
    super.dispose();
    // _snackBarReactionDisposer();
    // _errorDialogsReactionDisposer();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Observer(
          builder: (_) {
            return Scaffold(
              body: Stack(
                children: <Widget>[
                  PageStorage(
                    child: AppHomeScreen._tabs[widget._tabSelectorStore.activeTabIndex],
                    bucket: AppHomeScreen._bucket,
                  ),
                ],
              ),
              bottomNavigationBar: buildBottomNavigationBar(widget._tabSelectorStore.activeTabIndex, context),
            );
          },
        ),
        // buildProgressHud(),
      ],
    );
  }

  Widget buildBottomNavigationBar(int activeTabIndex, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        boxShadow: [BoxShadow(color: Colors.black38, blurRadius: 8)],
      ),
      child: BottomNavigationBar(
        elevation: 0,
        backgroundColor: AppTheme.bottomNavigationBackground,
        selectedItemColor: AppTheme.bottomNavigationSelected,
        unselectedItemColor: AppTheme.bottomNavigationUnselected,
        currentIndex: activeTabIndex,
        onTap: (tabIndex) => widget._tabSelectorStore.setTabIndex(tabIndex),
        items: <BottomNavigationBarItem>[
          buildIconUpcoming(),
          buildIconSearch(),
        ],
      ),
    );
  }

  BottomNavigationBarItem buildIconUpcoming() {
    return BottomNavigationBarItem(
      title: Text('Upcoming'),
      icon: Padding(
        padding: const EdgeInsets.only(bottom: 4),
        child: Container(
          width: 50,
          child: Icon(
            FontAwesomeIcons.film,
            size: 20,
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem buildIconSearch() {
    return BottomNavigationBarItem(
      title: Text('Search'),
      icon: Padding(
        padding: const EdgeInsets.only(bottom: 4),
        child: Container(
          width: 50,
          child: Icon(
            FontAwesomeIcons.search,
            size: 20,
          ),
        ),
      ),
    );
  }
}

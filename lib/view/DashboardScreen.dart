import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:workkida/model/constants/UiConstants.dart';
import 'package:workkida/view/CategoryDashboard.dart';
import 'package:workkida/view/MyPostDashboard.dart';
import 'package:workkida/view/settings_screen.dart';

import 'CatGrid.dart';
import 'TimeLineScreen.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  int _currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Navigator(key: _navigatorKey, onGenerateRoute: generateRoute),
        bottomNavigationBar: _bottomNavigationBar(),
      ),
    );
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text(UIData.bottomHome),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          title: Text(UIData.bottomPost),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          title: Text(UIData.bottomSearch),
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text(UIData.bottomProfile)
        ),
      ],
      onTap: _onTap,
      currentIndex: _currentTabIndex,
    );
  }

  _onTap(int tabIndex) {
    switch (tabIndex) {
      case 0:
        _navigatorKey.currentState.pushReplacementNamed(UIData.bottomHome);
        break;
      case 1:
        _navigatorKey.currentState.pushReplacementNamed(UIData.bottomPost);
        break;
      case 2:
        _navigatorKey.currentState.pushReplacementNamed(UIData.bottomSearch);
        break;
      case 3:
        _navigatorKey.currentState.pushReplacementNamed(UIData.bottomProfile);
        break;
    }
    setState(() {
      _currentTabIndex = tabIndex;
    });
  }

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case UIData.bottomProfile:
        return MaterialPageRoute(builder: (context) => SettingsScreen());
      case UIData.bottomPost:
        return MaterialPageRoute(builder: (context) => MyPostScreen());
      case UIData.bottomSearch:
        return MaterialPageRoute(builder: (context) => CategoryDashScreen());
      default:
        return MaterialPageRoute(builder: (context) =>TimeLineScreen());
    }
  }
}
import 'package:flutter/material.dart';
import 'package:workkida/common/themes/theme.dart';
import 'package:workkida/configure/route.dart';
import 'package:workkida/model/constants/UiConstants.dart';

import 'CatGrid.dart';
import 'DashboardScreen.dart';



class HomeScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: UIData.appName,
      theme:  AppTheme.lightTheme,
     // home: DashboardPage(),
      routes: Routes.getRoute(),
      onGenerateRoute: (settings) => Routes.onGenerateRoute(settings),
    );
  }
}

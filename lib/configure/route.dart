import 'package:flutter/material.dart';
import 'package:workkida/view/DashboardScreen.dart';
import 'package:workkida/view/splash_page.dart';

import 'coustom_route.dart';


class Routes {
  static Map<String, WidgetBuilder> getRoute() {
    return <String, WidgetBuilder>{
      '/': (_) => SplashPage(),
      '/HomePage': (_) => DashboardPage(),
    };
  }

  static Route onGenerateRoute(RouteSettings settings) {
    final List<String> pathElements = settings.name.split('/');
    if (pathElements[0] != '' || pathElements.length == 1) {
      return null;
    }
    switch (pathElements[1]) {
      case "DetailPage":
//        return CustomRoute<bool>(            builder: (BuildContext context) => DetailPage(model: settings.arguments,));
    }
  }
}

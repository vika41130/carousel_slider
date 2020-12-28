import 'package:flutter/material.dart';
import 'package:lutoi/pages/login.page.dart';
import 'package:lutoi/tab_page/another_tab_page.dart';
import 'package:lutoi/tab_page/home_tab_page.dart';
import 'package:lutoi/tab_page/resource.page.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RoutingConfig.LOGIN:
      return MaterialPageRoute(builder: (context) => LoginPage());
    case RoutingConfig.HOME:
      return MaterialPageRoute(builder: (context) => HomeTabPage());
    case RoutingConfig.RESOURCE:
      return MaterialPageRoute(builder: (context) => ResourcePage());
    case RoutingConfig.BLANK:
      return MaterialPageRoute(builder: (context) => BlankTabPage());
    default:
      return MaterialPageRoute(builder: (context) => HomeTabPage());
  }
}

class RoutingConfig {
  static const String LOGIN = '/login';
  static const String HOME = '/';
  static const String RESOURCE = 'product';
  static const String BLANK = 'blank';
}

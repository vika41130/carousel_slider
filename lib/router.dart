import 'package:flutter/material.dart';
import 'package:lutoi/routing_constants.dart';
import 'package:lutoi/tab_page/another_tab_page.dart';
import 'package:lutoi/tab_page/home_tab_page.dart';
import 'package:lutoi/tab_page/product_tab_page.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RoutingConfig.HOME:
      return MaterialPageRoute(builder: (context) => HomeTabPage());
    case RoutingConfig.PRODUCT:
      return MaterialPageRoute(builder: (context) => ProductTabPage());
    case RoutingConfig.BLANK:
      return MaterialPageRoute(builder: (context) => BlankTabPage());
    default:
      return MaterialPageRoute(builder: (context) => HomeTabPage());
  }
}

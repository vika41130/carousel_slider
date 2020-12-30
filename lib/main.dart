import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:lutoi/home_container.dart';
import 'package:lutoi/routing/router.dart' as router;
import 'package:lutoi/routing/router.dart';

void main() {
  runApp(MyApp());
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 60.0
    ..fontSize = 20.0
    ..radius = 60.0
    ..progressColor = Colors.transparent
    ..backgroundColor = Colors.transparent
    ..indicatorColor = Colors.blue
    ..textColor = Colors.black
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
    // ..customAnimation = CustomAnimation();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: router.generateRoute,
      initialRoute: RoutingConfig.LOGIN,
      home: HomeContainer(),
      builder: EasyLoading.init(),
    );
  }
}

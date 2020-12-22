import 'package:flutter/material.dart';
import 'package:lutoi/home_container.dart';
import 'package:lutoi/router.dart' as router;
import 'package:lutoi/routing_constants.dart';

void main() {
  runApp(MyApp());
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
      initialRoute: RoutingConfig.HOME,
      home: HomeContainer(),
    );
  }
}

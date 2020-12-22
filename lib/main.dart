import 'package:flutter/material.dart';
import 'package:lutoi/home_container.dart';
import 'package:lutoi/routing/router.dart' as router;
import 'package:lutoi/routing/router.dart';

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
      initialRoute: RoutingConfig.LOGIN,
      home: HomeContainer(),
    );
  }
}

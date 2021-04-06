import 'dart:async';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  double percent = 0;
  Timer _time;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _time.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final title = 'Flutter Demo';
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: SafeArea(
          child: Container(
            child: Center(
              child: Text('Development', style: TextStyle(fontSize: 50,), textAlign: TextAlign.center,),
            ),
          ),
        ),
      );
  }
}

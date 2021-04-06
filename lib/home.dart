import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lutoi/config/colors.dart';
import 'package:percent_indicator/percent_indicator.dart';

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
    // _time = Timer.periodic(Duration(seconds: 2), (timer) {
    //   percent += 0.1;
    //   if (percent > 1.0) {
    //     percent = 1.0;
    //     _time.cancel();
    //     return;
    //   }
    //   setState(() {});
    // });
    // 
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   for (var i = 0; i < 10; i++) {
    //     Future.delayed(Duration(seconds: 1), () {
    //       percent += 0.1;
    //       setState(() {});
    //     });
    //   }
    // });
    
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
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                Spacer(),
                RaisedButton(
                  onPressed: () {
                    if (percent >= 1.0) {
                      return;
                    }
                    percent += 0.1;
                    setState(() {});
                  },
                  child: Text('Incre Percent'),
                ),
                CircularPercentIndicator(
                  radius: 120,
                  lineWidth: 15,
                  percent: percent,
                  progressColor: Colors.green,
                  backgroundColor: Colors.red,
                  // animation: true,
                  // animationDuration: 1000,
                  header: Text('Header',),
                  center: Text("100%"),
                  footer: Text('Footer'),
                ),
                SizedBox(height: 10,),
                LinearPercentIndicator(
                  lineHeight: 14.0,
                  percent: 0.8,
                  backgroundColor: Colors.grey,
                  progressColor: Colors.cyan[500],
                ),
              ],
            ),
          ),
        ),
      );
  }
}

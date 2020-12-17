import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Flutter Demo';
    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: SafeArea(
          child: Container(
            width: double.infinity,
            child: Stack(
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          // flex: 1,
                          // fit: FlexFit.tight,
                          child: DottedBorder(
                            color: Colors.black,
                            strokeWidth: 2,
                            // padding: EdgeInsets.all(10),
                            // strokeCap: StrokeCap.square,
                            dashPattern: const <double>[10, 6],
                            // borderType: BorderType.Rect,
                            child: Container(
                              padding: EdgeInsets.only(top: 20, bottom: 20),
                              child: Text(
                                'Work Remote',
                                style: TextStyle(
                                  fontSize: 50,
                                ),
                              ),
                              decoration: BoxDecoration(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Flutter Demo';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
                          child: Container(
                            padding: EdgeInsets.only(top: 20, bottom: 20),
                            child: Text(
                              'Development',
                              style: TextStyle(
                                fontSize: 50,
                              ),
                            ),
                            decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(color: Colors.black, width: 2),),
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

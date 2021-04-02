import 'package:flutter/material.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  final List<Widget> images = [
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.yellow,
    ),
    Container(
      color: Colors.black,
    ),
    Container(
      color: Colors.cyan,
    ),
    Container(
      color: Colors.blue,
    ),
    Container(
      color: Colors.grey,
    ),
  ];
  final List<String> titles = List.generate(6, (index) => index.toString());


  @override
  Widget build(BuildContext context) {
    final title = 'Flutter Testing';
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
            height: 400,
            child: Column(
              children: <Widget>[
              Expanded(
                child: Container(
                  child: VerticalCardPager(
                    textStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    titles: titles,
                    images: images,
                    onPageChanged: (page) {
                      print('-------------------------------------onPageChanged ${page}');
                    },
                    align: ALIGN.CENTER,
                    onSelectedItem: (index) {
                      print('-------------------------------------onSelectedItem ${index}');
                    },
                  ),
                ),
              ),
            ],
            ),
          ),
        ),
      ),
    );
  }
}

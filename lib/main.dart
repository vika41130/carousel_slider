import 'package:flutter/material.dart';
import 'package:lutoi/widget/buttons/button_next_1.dart';
import 'package:lutoi/widget/buttons/button_next_2.dart';
import 'package:lutoi/widget/buttons/button_pre_1.dart';
import 'package:lutoi/widget/buttons/button_pre_2.dart';
import 'package:lutoi/widget/swiper_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final title = 'Flutter Demo';
    final List<Widget> tempItems = [];
    for (var i = 0; i < 30; i++) {
    //   tempItems.add(Container(
    //       height: 60,
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.end,
    //         children: [
    //           Image(
    //             image: AssetImage('assets/images/bmw/driver1.jpg'),
    //             width: 100,
    //           ),
    //         ],
    //       ),
    //     ));
      if (i == 1 || i == 3) {
        tempItems.add(Container(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage('assets/images/bmw/driver1.jpg'),),
              Text('Index: $i Overflow'),
              Text('Value'),
            ],
          ),
          decoration:
              BoxDecoration(
              color: Colors.blue,
            ),
        ));
      } else {
        tempItems.add(Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage('assets/images/bmw/driver1.jpg'), width: 200,),
              Text('Index: $i'),
            ],
          ),
        ));
      }
    }
    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: Stack(
            children: [
              Container(
                height: 140,
              ),
              // Expanded
              // Expanded(
              //   child: SwiperWidget(
              //     itemWidth: 200,
              //     items: tempItems,
              //     numbersOfItemsVisible: 1,
              //     preLeft: 10.0,
              //     nextRight: 10.0,
              //     buttonHeight: 190,
              //     buttonWidth: 80,
              //     preButton: ButtonPre2(),
              //     nextButton: ButtonNext2(),
              //     scroll: (int activedIdx) {
              //       print('--------------activedIdx: $activedIdx');
              //     },
              //   ),
              // ),
              // Container
              Container(
                height: 200,
                width: 200,
                child: SwiperWidget(
                  itemWidth: 200,
                  itemMargin: 20.0,
                  items: tempItems,
                  numbersOfItemsVisible: 1,
                  buttonWidth: 40,
                  preButton: ButtonPre2(),
                  nextButton: ButtonNext2(),
                ),
              ),
              // Expanded(
              //   child: Text('bottom bar'),
              // ),
            ],
          )),
    );
  }
}

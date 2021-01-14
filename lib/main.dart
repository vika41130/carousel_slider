import 'package:flutter/material.dart';
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
      if (i == 15) {
        tempItems.add(Container(
          height: 150,
          // child: Text('Index: $i Overflow'),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image(image: AssetImage('assets/images/bmw/driver1.jpg'),),
              Text('Index: $i Overflow'),
              Text('Value'),
            ],
          ),
          decoration:
              BoxDecoration(
              // border: Border.all(color: Colors.black, width: 2),
              color: Colors.blue,
            ),
        ));
      } else {
        tempItems.add(Container(
          height: 100,
          // child: Image(image: AssetImage('assets/images/bmw/driver1.jpg'),),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image(image: AssetImage('assets/images/bmw/driver1.jpg'),),
            ],
          ),
          decoration:
            BoxDecoration(
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
          body: Column(
            children: [
              Container(
                height: 140,
              ),
              Expanded(
                child: SwiperWidget(
                  itemWidth: 200,
                  itemMargin: 20,
                  items: tempItems,
                  numbersOfItemsVisible: 3,
                  preBottom: 10,
                  preLeft: 10,
                  nextBottom: 10,
                  nextRight: 10,
                ),
              ),
              // Container(
              //   height: 100,
              //   child: SwiperWidget(
              //     itemWidth: 200,
              //     itemMargin: 20,
              //     items: tempItems,
              //     numbersOfItemsVisible: 3,
              //   ),
              // ),
              Expanded(
                child: Text('bottom bar'),
              ),
            ],
          )),
    );
  }
}

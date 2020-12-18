import 'dart:async';

import 'package:flutter/material.dart';

class ColorFulBox extends StatefulWidget {
  final double width;
  ColorFulBox({
    Key key,
    this.width,
  }) : super(key: key);

  @override
  _ColorFulState createState() {
    return _ColorFulState();
  }
}

class _ColorFulState extends State<ColorFulBox> {
  final int length = 9;
  final int eachLine = 3;
  List<int> items;
  Timer _timer;
  @override
  void initState() {
  items = List.generate(length, (index) => index + 1);
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 500,
      // width: 500,

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 500,
            width: 500,
            decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.black, width: 1, style: BorderStyle.solid),
            ),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: eachLine,
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Container(
                  child: RaisedButton(
                      child: Text(
                        '${items[index]}',
                        style: TextStyle(fontSize: 40),
                      ),
                      color: Colors.white,
                      textColor: Colors.black,
                      onPressed: () {
                        sort();
                      }),
                );
              },
            ),
          ),
          SizedBox(width: 10,),
          Column(
            children: [
              RaisedButton(
                child: Text(
                  'Go Around',
                  style: TextStyle(fontSize: 30),
                ),
                color: Colors.white,
                textColor: Colors.black,
                onPressed: () {
                  goAround();
                }
              ),
              SizedBox(height: 10,),
              RaisedButton(
                child: Text(
                  'Go Default',
                  style: TextStyle(fontSize: 30),
                ),
                color: Colors.white,
                textColor: Colors.black,
                onPressed: () {
                  goDefault();
                }
              ),
            ],
          ),
        ],
      ),  
    );
  }

  void sort() {
    setState(() {
      items.sort((a, b) {
        if (a + b > 5) return 1;
        return -1;
      });
    });
  }

  void goAround() {
    int index = 0;
    int startPointVal = items[0];
    // _timer = new Timer(Duration(milliseconds: 500), () {
    //   setState(() {
    //     items[index] = items[index + 1];
    //   });
    //   index++;
    // });
    _timer = new Timer.periodic(Duration(milliseconds: 500), (timer) {
      setState(() {
        if (index == length - 1) {
          items[index] = startPointVal;
          index = 0;
          startPointVal = items[0];
        } else {
          items[index] = items[index + 1];
          index++;
        }
      });
    });
  }

  void goDefault() {
    setState(() {
      _timer.cancel();
      items = List.generate(9, (index) => index);
    });
  }
  
}

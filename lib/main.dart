import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String message = "";
  ScrollController _controller;
  final itemSize = 100.0;
  bool isBeginned = true;
  bool isEnded = false;

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(() {
      _scrollListener();
    });
    super.initState();
  }

  _scrollListener() {
    print('------------------reset_scrollListener run');
    setState(() {
      isBeginned = false;
      isEnded = false;
    });
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        message = "reach the end";
        isEnded = true;
      });
    }
    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        message = "reach the begin";
        isBeginned = true;
      });
    }
  }

  _movePre() {
    // _controller.jumpTo(pixelsToMove);
    _controller.animateTo(_controller.offset - itemSize,
        curve: Curves.linear, duration: Duration(milliseconds: 500));
  }

  _moveNext() {
    _controller.animateTo(_controller.offset + itemSize,
        curve: Curves.linear, duration: Duration(milliseconds: 500));
  }

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
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            isBeginned
                ? SizedBox()
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      child: Text("pre"),
                      onPressed: _movePre,
                    ),
                  ),
            SizedBox(
              width: 30,
            ),
            Expanded(
              child: Container(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: _controller,
                  itemCount: 30,
                  itemExtent: itemSize,
                  itemBuilder: (context, index) {
                    return ListTile(title: Text("Index : $index"));
                  },
                ),
              ),
            ),
            SizedBox(
              width: 30,
            ),
            isEnded
                ? SizedBox()
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      child: Text("next"),
                      onPressed: _moveNext,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

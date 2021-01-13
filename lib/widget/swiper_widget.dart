import 'package:flutter/material.dart';

class SwiperWidget extends StatefulWidget {
  final double itemWidth;

  SwiperWidget({
    Key key,
    this.itemWidth,
  })
    : super(key: key);
  @override
  _SwiperWidgetState createState() => _SwiperWidgetState();
}

class _SwiperWidgetState extends State<SwiperWidget> {
  String message = "";
  ScrollController _controller;
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
    _controller.animateTo(_controller.offset - widget.itemWidth,
        curve: Curves.linear, duration: Duration(milliseconds: 500));
  }

  _moveNext() {
    _controller.animateTo(_controller.offset + widget.itemWidth,
        curve: Curves.linear, duration: Duration(milliseconds: 500));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SizedBox(
          width: 30,
        ),
        Container(
          margin: EdgeInsets.only(left: 200, right: 200),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            controller: _controller,
            itemCount: 30,
            itemExtent: widget.itemWidth,
            itemBuilder: (context, index) {
              return Container(
                child: Text('Index : $index'),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2)),
              );
            },
          ),
        ),
        SizedBox(
          width: 30,
        ),
        isBeginned
            ? SizedBox()
            : Positioned(
                bottom: 0,
                left: 0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    child: Text("pre"),
                    onPressed: _movePre,
                  ),
                ),
              ),
        isEnded
            ? SizedBox()
            : Positioned(
                bottom: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    child: Text("next"),
                    onPressed: _moveNext,
                  ),
                ),
              ),
      ],
    );
  }
}

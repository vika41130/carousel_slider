import 'package:flutter/material.dart';

class SwiperWidget extends StatefulWidget {
  final double itemWidth;
  final double itemMargin;
  final int numbersOfItemsVisible;
  final Widget preButton;
  final Widget nextButton;
  final double preLeft;
  final double preBottom;
  final double nextRight;
  final double nextBottom;
  final List<Widget> items;

  SwiperWidget({
    Key key,
    @required this.itemWidth,
    this.itemMargin,
    this.numbersOfItemsVisible,
    this.preButton,
    this.nextButton,
    this.nextBottom,
    this.nextRight,
    this.preBottom,
    this.preLeft,
    @required List<Widget> items,
  })
    : items = items ?? []
    , super(key: key);
  @override
  _SwiperWidgetState createState() => _SwiperWidgetState();
}

class _SwiperWidgetState extends State<SwiperWidget> {
  ScrollController _controller;
  bool isBeginned = true;
  bool isEnded = false;
  double marginPerDirection = 0;
  Size widgetSize;

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(() {
      _scrollListener();
    });
    super.initState();
    prepareData();
  }

  void prepareData() {
  }

  void calculateMargin() {
    setState(() {
      if (widget.numbersOfItemsVisible == null || widget.numbersOfItemsVisible == 0) {
        marginPerDirection = 0;
      } else {
        marginPerDirection = (widgetSize.width - widget.itemWidth * widget.numbersOfItemsVisible) / 2;
      }
    });
  }

  _scrollListener() {
    // print('------------------reset_scrollListener run');
    setState(() {
      isBeginned = false;
      isEnded = false;
    });
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        isEnded = true;
      });
    }
    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
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
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        widgetSize = context.size;
        // print('------------------------------widgetSize width-height: ${widgetSize.width}-${widgetSize.height}');
        calculateMargin();
      });
    });
    return Stack(
        children: <Widget>[
    Container(
      margin: EdgeInsets.only(left: marginPerDirection, right: marginPerDirection),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        controller: _controller,
        itemCount: widget.items.length,
        itemExtent: widget.itemWidth,
        itemBuilder: (context, index) {
          return OverflowBox(
                      child: Container(
                        height: 100,
              margin: EdgeInsets.only(right: index == widget.items.length - 1 ? 0 : widget.itemMargin),
              child: widget.items[index],
            ),
          );
        },
      ),
    ),
    isBeginned
        ? SizedBox()
        : Positioned(
            // top: widgetSize != null ? widgetSize.height / 2 : 0,
            bottom: widget.preBottom ?? 0,
            left: widget.preLeft ?? 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                child: Icon(Icons.arrow_left),
                onPressed: _movePre,
              ),
            ),
          ),
    isEnded
        ? SizedBox()
        : Positioned(
            // top: widgetSize != null ? widgetSize.height / 2 : 0,
            bottom: widget.nextBottom ?? 0,
            right: widget.nextRight ?? 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                child: Icon(Icons.arrow_right),
                onPressed: _moveNext,
              ),
            ),
          ),
        ],
      );
  }
}

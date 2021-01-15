import 'package:flutter/material.dart';
import 'package:lutoi/widget/buttons/button_wrap.dart';

class SwiperWidget extends StatefulWidget {
  final double itemWidth;
  final double itemMargin;
  final double contentBottomMargin;
  final int numbersOfItemsVisible;
  final Widget preButton;
  final Widget nextButton;
  final double preLeft;
  final double preBottom;
  final double nextRight;
  final double nextBottom;
  final double buttonWidth;
  final double buttonHeight;
  final List<Widget> items;

  SwiperWidget({
    Key key,
    @required this.itemWidth,
    itemMargin,
    contentBottomMargin,
    this.numbersOfItemsVisible,
    this.preButton,
    this.nextButton,
    this.nextBottom,
    this.nextRight,
    this.preBottom,
    this.preLeft,
    this.buttonWidth,
    this.buttonHeight,
    @required List<Widget> items,
  })  : items = items ?? [],
        contentBottomMargin = contentBottomMargin ?? 0.0,
        itemMargin = itemMargin ?? 0.0,
        super(key: key);
  @override
  _SwiperWidgetState createState() => _SwiperWidgetState();
}

class _SwiperWidgetState extends State<SwiperWidget> {
  ScrollController _controller;
  bool isBeginned = true;
  bool isEnded = false;
  double marginPerDirection = 0.0;
  Size widgetSize;
  int currentIndex = 20;

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(() {
      _scrollListener();
    });
    super.initState();
    prepareData();
  }

  void prepareData() {}

  void calculateMargin() {
    setState(() {
      if (widget.numbersOfItemsVisible == null ||
          widget.numbersOfItemsVisible == 0) {
        marginPerDirection = 0.0;
      } else {
        marginPerDirection = (widgetSize.width -
                widget.itemWidth * widget.numbersOfItemsVisible) /
            2;
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

  _animateTo() {
    // _controller.animateTo(_controller.offset + widget.itemWidth * currentIndex,
    _controller.animateTo(widget.itemWidth * currentIndex,
        curve: Curves.linear, duration: Duration(milliseconds: 500));
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        if (widgetSize != null && widgetSize.width != context.size.width) {
          _animateTo();
        }
        widgetSize = context.size;
        // print('------------------------------widgetSize width-height: ${widgetSize.width}-${widgetSize.height}');
        calculateMargin();
      });
    });
    return Stack(
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.only(
                    left: marginPerDirection ?? 0,
                    right: marginPerDirection ?? 0,
                    bottom: widget.contentBottomMargin),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: _controller,
                  itemCount: widget.items.length,
                  itemExtent: widget.itemWidth,
                  itemBuilder: (context, index) {
                    return OverflowBox(
                      child: Container(
                        height: 100,
                        margin: EdgeInsets.only(
                            right: index == widget.items.length - 1
                                ? 0.0
                                : widget.itemMargin),
                        child: widget.items[index],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
        isBeginned
            ? SizedBox()
            : Positioned(
                bottom: widget.preBottom ?? 0,
                left: widget.preLeft ?? 0,
                child: ButtonWrap(
                  width: widget.buttonWidth,
                  height: widget.buttonHeight,
                  button: widget.preButton,
                  pressed: _movePre,
                ),
              ),
        isEnded
            ? SizedBox()
            : Positioned(
                bottom: widget.nextBottom ?? 0,
                right: widget.nextRight ?? 0,
                child: ButtonWrap(
                  width: widget.buttonWidth,
                  height: widget.buttonHeight,
                  button: widget.nextButton,
                  pressed: _moveNext,
                ),
              ),
      ],
    );
  }
}

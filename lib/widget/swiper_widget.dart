import 'package:flutter/material.dart';
import 'package:lutoi/widget/buttons/button_wrap.dart';

class SwiperWidget extends StatefulWidget {
  final double itemWidth; // width of each item
  final double itemMargin; // margin between items
  final double contentBottomMargin; // margin from bottom
  final int numbersOfItemsVisible; // numbers of item to be visible
  final Widget preButton; // UI for previous button
  final Widget nextButton; // UI for next button
  final double preLeft; // left position for previous button
  final double preBottom; // bottom position for previous button
  final double nextRight; // right position for next button
  final double nextBottom; // bottom position for next button
  final double buttonWidth; // width for previous/next button
  final double buttonHeight; // height for previous/next button
  final List<Widget> items; // list of Widgets to be shown
  final Function scroll; // output current index being actived

  // popup
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
  // accessories
  // Container(
  //   height: 190,
  //   // height: 120,
  //   child: SwiperWidget(
  //     itemWidth: 200,
  //     itemMargin: 20.0,
  //     items: tempItems,
  //     // contentBottomMargin: 20.0,
  //     // numbersOfItemsVisible: 3,
  //     // preBottom: 30,
  //     // preLeft: 30,
  //     // nextBottom: 30,
  //     // nextRight: 30,
  //     buttonHeight: 190,
  //     buttonWidth: 80,
  //     // buttonHeight: 120,
  //     preButton: ButtonPre1(),
  //     nextButton: ButtonNext1(),
  //   ),
  // ),

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
    this.scroll,
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
  int activedIndex = 0;
  double unit = 0;
  int selectedIndex = 0; // use to scroll back again when widget got resize, element item need to output select event

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(() {
      _scrollListener();
    });
    super.initState();
    unit = widget.itemWidth / 2;
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

  // only for one item per view
  _calculateCurrentIndex(double offset) {
    if (widget.scroll == null) {
      return;
    }
    for (var i = 0; i < widget.items.length; i++) {
      if (_controller.offset <= (2 * i + 1) * unit) {
        setState(() {
          activedIndex = i;
          widget.scroll.call(activedIndex);
        });
        break;
      }
      if ((2 * i + 1) * unit < _controller.offset &&
          _controller.offset <= (2 * i + 1) * unit) {
        setState(() {
          activedIndex = i;
          widget.scroll.call(activedIndex);
          return;
        });
        break;
      }
    }
    print('---------------------------currentIndex: $activedIndex');
  }

  _scrollListener() {
    setState(() {
      isBeginned = false;
      isEnded = false;
    });
    _calculateCurrentIndex(_controller.offset);
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
    _controller.animateTo(_controller.offset - widget.itemWidth,
        curve: Curves.linear, duration: Duration(milliseconds: 500));
  }

  _moveNext() {
    _controller.animateTo(_controller.offset + widget.itemWidth,
        curve: Curves.linear, duration: Duration(milliseconds: 500));
  }

  // use to scroll back again to selectedIndex item
  _jumpTo() {
    _controller.jumpTo(widget.itemWidth * selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        if (widgetSize != null && widgetSize.width != context.size.width) {
          _jumpTo();
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
                    return Container(
                      margin: EdgeInsets.only(
                          right: index == widget.items.length - 1
                              ? 0.0
                              : widget.itemMargin),
                      child: widget.items[index],
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

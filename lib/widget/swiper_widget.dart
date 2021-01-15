import 'package:flutter/material.dart';
import 'package:lutoi/widget/buttons/button_wrap.dart';

class SwiperWidget extends StatefulWidget {
  /// width of each item
  final double itemWidth;
  /// margin between items
  final double spaceBetweenItems;
  /// margin content from bottom
  final double contentBottomMargin;
  /// numbers of item to be visible
  final int numbersOfItemsVisible;
  /// UI for previous button
  final Widget preButton;
  /// UI for next button
  final Widget nextButton;
  /// left position for previous button
  final double preLeft;
  /// bottom position for previous button
  final double preBottom;
  /// right position for next button
  final double nextRight;
  /// bottom position for next button
  final double nextBottom;
  /// width for previous/next button
  final double buttonWidth;
  /// height for previous/next button
  final double buttonHeight;
  /// list of Widgets to be shown
  final List<Widget> items;
  /// output current index being actived
  final Function scroll;

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
  // Container(
  //   height: 200,
  //   width: 200,
  //   child: SwiperWidget(
  //     itemWidth: 200,
  //     itemMargin: 20.0,
  //     items: tempItems,
  //     numbersOfItemsVisible: 1,
  //     buttonWidth: 40,
  //     preButton: ButtonPre2(),
  //     nextButton: ButtonNext2(),
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
        spaceBetweenItems = itemMargin ?? 0.0,
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
            2.0;
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
                              : widget.spaceBetweenItems),
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
            : Align(
                alignment: Alignment.centerLeft,
                child: ButtonWrap(
                  width: widget.buttonWidth ?? (widgetSize != null ? widgetSize.width : null),
                  height: widget.buttonHeight ?? (widgetSize != null ? widgetSize.height : null),
                  button: widget.preButton,
                  pressed: _movePre,
                ),
              ),
        isEnded
            ? SizedBox()
            : Align(
                alignment: Alignment.centerRight,
                child: ButtonWrap(
                  width: widget.buttonWidth ?? (widgetSize != null ? widgetSize.width : null),
                  height: widget.buttonHeight ?? (widgetSize != null ? widgetSize.height : null),
                  button: widget.nextButton,
                  pressed: _moveNext,
                ),
              ),
      ],
    );
  }
}

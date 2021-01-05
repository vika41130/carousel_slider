import 'dart:math';

import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ScrollablePositionedListWidget extends StatefulWidget {
  const ScrollablePositionedListWidget({Key key}) : super(key: key);
  @override
  _ScrollablePositionedListWidgetState createState() {
    return _ScrollablePositionedListWidgetState();
  }
}

class _ScrollablePositionedListWidgetState
    extends State<ScrollablePositionedListWidget> {
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();
  final length = 10;
  List<Color> itemColors;
  Duration duraton;

  @override
  void initState() {
    super.initState();
    duraton = Duration(milliseconds: 500);
    final colorGenerator = Random(42490823);
    itemColors = List<Color>.generate(
        length,
        (int _) =>
            Color(colorGenerator.nextInt(pow(2, 32) - 1)).withOpacity(1));
  }

  void jumpToIndex(int index) {
    itemScrollController.jumpTo(index: index);
  }

  void srollToIndex(int index) {
    itemScrollController.scrollTo(index: index, duration: duraton);
  }

  Widget createList() {
    return ScrollablePositionedList.builder(
      itemCount: length,
      itemBuilder: (context, index) {
        return SizedBox(
          height: 100,
          width: 100,
          child: Container(
            color: itemColors[index],
            child: Center(
              child: Text('Item $index'),
            ),
          ),
        );
      },
      itemScrollController: itemScrollController,
      itemPositionsListener: itemPositionsListener,
      scrollDirection: Axis.vertical,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            RaisedButton(
              onPressed: () {
                jumpToIndex(0);
              },
              child: Text('Jump to O'),
            ),
            RaisedButton(
              onPressed: () {
                jumpToIndex(4);
              },
              child: Text('Jump'),
            ),
            RaisedButton(
              onPressed: () {
                srollToIndex(4);
              },
              child: Text('Scroll'),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 50),
          height: 500,
          child: createList()
        ),
      ],
    );
  }
}

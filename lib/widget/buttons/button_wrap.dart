import 'package:flutter/material.dart';

class ButtonWrap extends StatelessWidget {
  final Widget button;
  final double width;
  final double height;
  final Function pressed;

  const ButtonWrap({
    Key key,
    @required this.button,
    this.width,
    this.height,
    this.pressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 0,
      height: height ?? 0,
      child: InkWell(
        child: button,
        onTap: () {
          pressed.call();
        },
      ),
    );
  }
}

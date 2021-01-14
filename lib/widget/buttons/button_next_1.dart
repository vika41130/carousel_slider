import 'package:flutter/material.dart';

class ButtonNext1 extends StatelessWidget {
  const ButtonNext1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
          gradient: LinearGradient(
        colors: [Color(0xff000000), Color(0x21808080)],
        stops: [0, 1],
        begin: Alignment(1.00, -0.00),
        end: Alignment(-1.00, 0.00),
      )),
      child: Image(
        image: AssetImage('assets/icons/ic_arr_next_bl_w_48_e.png'),
      ),
    );
  }
}
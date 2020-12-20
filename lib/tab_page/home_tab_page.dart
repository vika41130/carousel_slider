import 'package:flutter/material.dart';

class HomeTabPage extends StatefulWidget {
  @override
  _HomeTabPageState createState() => _HomeTabPageState();
}

class _HomeTabPageState extends State<HomeTabPage>
    with AutomaticKeepAliveClientMixin<HomeTabPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text('Home'),
          ),
          body: Container(
          // child: Column(
          //   children: [
          //     Expanded(
          //       child: Container(
          //         decoration: BoxDecoration(
          //           color: Colors.blue[200],
          //         ),
          //         child: Center(
          //           child: Text(
          //             'BMW Galery',
          //             style: TextStyle(
          //               fontSize: 40,
          //             ),
          //           ),
          //         ),
          //       ),
          //     ),
          //     Image(
          //       image: AssetImage('assets/images/bmw/bg_bmw.jpg'),
          //     ),
          //   ],
          // ),
        ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

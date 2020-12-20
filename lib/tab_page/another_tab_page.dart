import 'package:flutter/material.dart';

class BlankTabPage extends StatefulWidget {
  @override
  _BlankTabPageState createState() => _BlankTabPageState();
}

class _BlankTabPageState extends State<BlankTabPage>
    with AutomaticKeepAliveClientMixin<BlankTabPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blank'),
      ),
      body: Center(
        child: Text(
          'Blank',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

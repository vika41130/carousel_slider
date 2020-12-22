import 'package:flutter/material.dart';

class HomeTabPage extends StatefulWidget {
  GlobalKey<ScaffoldState> scaffoldKey;
  HomeTabPage({this.scaffoldKey});
  @override
  _HomeTabPageState createState() => _HomeTabPageState();
}

class _HomeTabPageState extends State<HomeTabPage>
    with AutomaticKeepAliveClientMixin<HomeTabPage> {
  // final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: Center(
        child: Text('Home', style: TextStyle(fontSize: 30),),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

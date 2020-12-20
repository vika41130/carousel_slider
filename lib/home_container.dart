import 'package:flutter/material.dart';
import 'package:lutoi/model/bottom_tab_bar.model.dart';
import 'package:lutoi/tab_page/home_tab_page.dart';
import 'package:lutoi/tab_page/another_tab_page.dart';
import 'package:lutoi/tab_page/product_tab_page.dart';

class HomeContainer extends StatefulWidget {
  HomeContainer({Key key}) : super(key: key);

  @override
  _HomeContainerState createState() => _HomeContainerState();
}

class _HomeContainerState extends State<HomeContainer> {
  int tabIndex = 0;
  List<Widget> pagesList;
  List<BottomTabBarModel> bottomTabBarList = [];
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    pagesList = [
      HomeTabPage(scaffoldKey: _scaffoldKey),
      ProductTabPage(),
      BlankTabPage(),
    ];
    createBottomTabBarDataList();
  }

  void createBottomTabBarDataList() {
    bottomTabBarList.add(BottomTabBarModel(label: 'Home'));
    bottomTabBarList.add(BottomTabBarModel(label: 'Product'));
    bottomTabBarList.add(BottomTabBarModel(label: 'Blank'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('${bottomTabBarList[tabIndex].label}'),
      ),
      // drawer: Drawer(
      drawer: Container(
        width: 150,
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Menu'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('${bottomTabBarList[0].label}'),
              onTap: () {
                setState(() {
                  tabIndex = 0;
                });
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: Text('${bottomTabBarList[1].label}'),
              onTap: () {
                setState(() {
                  tabIndex = 1;
                });
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: Text('${bottomTabBarList[2].label}'),
              onTap: () {
                setState(() {
                  tabIndex = 2;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
      body: pagesList[tabIndex],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey[400],
          backgroundColor: Theme.of(context).primaryColor,
          currentIndex: tabIndex,
          onTap: (int index) {
            setState(() {
              tabIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: bottomTabBarList[0].label,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.car_repair),
              label: bottomTabBarList[1].label,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.check_box_outline_blank),
              label: bottomTabBarList[2].label,
            ),
          ]),
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
}

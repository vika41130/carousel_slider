import 'package:flutter/material.dart';
import 'package:lutoi/tab_page/home_tab_page.dart';
import 'package:lutoi/tab_page/another_tab_page.dart';
import 'package:lutoi/tab_page/product_tab_page.dart';


class HomeContainer extends StatefulWidget {
  HomeContainer({Key key}) : super(key: key);

  @override
  _HomeContainerState createState() => _HomeContainerState();
}

class _HomeContainerState extends State<HomeContainer> {
  List<Widget> pagesList;
  @override
  void initState() {
    super.initState();
    pagesList = [
      HomeTabPage(),
      ProductTabPage(),
      BlankTabPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.yellow,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          // endDrawer
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text('Menu'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Profile'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Language'),
              onTap: () {},
            ),
          ],
        ),
      ),
          body: TabBarView(
            // physics: NeverScrollableScrollPhysics(), 
            children: pagesList
          ),
          bottomNavigationBar: TabBar(
            tabs: [
              Tab(
                text: 'Home',
                icon: Icon(Icons.home),
              ),
              Tab(
                text: 'BMW',
                icon: Icon(Icons.directions_car),
              ),
              Tab(
                text: 'Blank',
                icon: Icon(Icons.check_box_outline_blank_outlined),
              ),
            ],
          ),
          backgroundColor: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lutoi/custom_drawer.dart';
import 'package:lutoi/model/bottom_tab_bar.model.dart';
import 'package:lutoi/tab_page/home_tab_page.dart';
import 'package:lutoi/tab_page/another_tab_page.dart';
import 'package:lutoi/tab_page/product_tab_page.dart';

class HomeContainer extends StatefulWidget {
  HomeContainer({Key key}) : super(key: key);

  @override
  _HomeContainerState createState() => _HomeContainerState();
}

class _HomeContainerState extends State<HomeContainer>
    with SingleTickerProviderStateMixin {
  int tabIndex = 0;
  List<Widget> pagesList;
  List<BottomTabBarModel> bottomTabBarList = [];
  List<Tab> tabBarList = [];
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TabController _tabController;
  bool isDrawerOpen = false;

  @override
  void initState() {
    createTabBarList();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(tabListener);
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

  void createTabBarList() {
    tabBarList.add(Tab(
      icon: new Icon(Icons.home),
      child: Text("Home"),
    ));
    tabBarList.add(Tab(
      icon: new Icon(Icons.directions_car),
      child: Text("Product"),
    ));
    tabBarList.add(Tab(
      icon: new Icon(Icons.check_box_outline_blank),
      child: Text("Blank"),
    ));
  }

  void tabListener() {
  }

  void setIsDrawerOpen({bool isOpen = false}) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        isDrawerOpen = isOpen;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      // drawerEnableOpenDragGesture: false,
      // drawerEdgeDragWidth: 10,
      // extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 80,
        // title: Text('${bottomTabBarList[tabIndex].label}'),
        // backgroundColor: Colors.cyan[100],
        bottom: TabBar(
          isScrollable: true,
          unselectedLabelColor: Colors.black,
          labelColor: Colors.white,
          onTap: (index) {
            setState(() {
              tabIndex = index;
              print('-----------------tabIndex: $tabIndex');
            });
          },
          tabs: tabBarList,
          controller: _tabController,
          indicatorColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.tab,
        ),
      ),
      body: TabBarView(
        children: [
          HomeTabPage(scaffoldKey: _scaffoldKey),
          ProductTabPage(),
          BlankTabPage(),
        ],
        controller: _tabController,
      ),
      drawer: Container(
        width: 150,
        child: CustomDrawer(
          callback: (v) {
            setIsDrawerOpen(isOpen: v);
          },
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                // margin: EdgeInsets.zero,
                // padding: EdgeInsets.zero,
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
                  _tabController.animateTo(tabIndex);
                  Navigator.of(context).pop();
                  setIsDrawerOpen();
                },
              ),
              ListTile(
                title: Text('${bottomTabBarList[1].label}'),
                onTap: () {
                  setState(() {
                    tabIndex = 1;
                  });
                  _tabController.animateTo(tabIndex);
                  Navigator.of(context).pop();
                  setIsDrawerOpen();
                },
              ),
              ListTile(
                title: Text('${bottomTabBarList[2].label}'),
                onTap: () {
                  setState(() {
                    tabIndex = 2;
                  });
                  _tabController.animateTo(tabIndex);
                  Navigator.of(context).pop();
                  setIsDrawerOpen();
                },
              ),
            ],
          ),
        ),
      ),
      // drawer: Container(
      //   width: 150,
      //   color: Colors.white,
      //   child: ListView(
      //     padding: EdgeInsets.zero,
      //     children: <Widget>[
      //       DrawerHeader(
      //         child: Text('Menu'),
      //         decoration: BoxDecoration(
      //           color: Colors.blue,
      //         ),
      //       ),
      //       ListTile(
      //         title: Text('${bottomTabBarList[0].label}'),
      //         onTap: () {
      //           setState(() {
      //             tabIndex = 0;
      //           });
      //           _tabController.animateTo(tabIndex);
      //           Navigator.of(context).pop();
      //           setIsDrawerOpen();
      //         },
      //       ),
      //       ListTile(
      //         title: Text('${bottomTabBarList[1].label}'),
      //         onTap: () {
      //           setState(() {
      //             tabIndex = 1;
      //           });
      //           _tabController.animateTo(tabIndex);
      //           Navigator.of(context).pop();
      //           setIsDrawerOpen();
      //         },
      //       ),
      //       ListTile(
      //         title: Text('${bottomTabBarList[2].label}'),
      //         onTap: () {
      //           setState(() {
      //             tabIndex = 2;
      //           });
      //           _tabController.animateTo(tabIndex);
      //           Navigator.of(context).pop();
      //           setIsDrawerOpen();
      //         },
      //       ),
      //     ],
      //   ),
      // ),
      // body: pagesList[tabIndex],
      // bottomNavigationBar: BottomNavigationBar(
      //     selectedItemColor: Colors.white,
      //     unselectedItemColor: Colors.grey[400],
      //     backgroundColor: Theme.of(context).primaryColor,
      //     currentIndex: tabIndex,
      //     onTap: (int index) {
      //       setState(() {
      //         tabIndex = index;
      //       });
      //     },
      //     items: [
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.home),
      //         label: bottomTabBarList[0].label,
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.car_repair),
      //         label: bottomTabBarList[1].label,
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.check_box_outline_blank),
      //         label: bottomTabBarList[2].label,
      //       ),
      //     ]),
      // backgroundColor: Theme.of(context).primaryColor,
      floatingActionButton: new FloatingActionButton(
          elevation: 0.0,
          tooltip: 'Open Menu',
          child:
              isDrawerOpen ? new Icon(Icons.menu_open) : new Icon(Icons.menu),
          onPressed: () {
            // Scaffold.of(context).openDrawer();
            _scaffoldKey.currentState.openDrawer();
            setState(() {
              isDrawerOpen = _scaffoldKey.currentState.isDrawerOpen;
            });
          }),
    );
  }
}

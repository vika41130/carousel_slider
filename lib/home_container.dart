import 'package:flutter/material.dart';
import 'package:lutoi/model/bottom_tab_bar.model.dart';
import 'package:lutoi/tab_page/home_tab_page.dart';
import 'package:lutoi/tab_page/another_tab_page.dart';
import 'package:lutoi/tab_page/product_tab_page.dart';
import 'package:lutoi/widget/search_form.dart';

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
  List<Widget> mainActionsList;
  List<Widget> searchModeActionsList;
  List<Widget> realActionsList;
  bool showSearchModeActionsList = false;
  Widget searchButton;
  Widget searchForm;

  @override
  void initState() {
    super.initState();
    pagesList = [
      HomeTabPage(scaffoldKey: _scaffoldKey),
      ProductTabPage(),
      BlankTabPage(),
    ];
    createSearchButton();
    createSearchForm();
    createActionsList();
    realActionsList = mainActionsList;
    createSearchModeActionsList();
    createBottomTabBarDataList();
  }

  void createSearchForm() {
    searchForm = Padding(
      padding: const EdgeInsets.all(8.0),
      child: SearchForm(close: () {
        onSearchClose();
      }),
    );
  }

  void createSearchButton() {
    searchButton = FlatButton(
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Center(child: Icon(Icons.search)),
      ),
      onPressed: () {
        onSearchButtonClick();
      },
    );
  }

  void onSearchClose() {
    setState(() {
      realActionsList = mainActionsList;
    });
  }

  void onSearchButtonClick() {
    setState(() {
      realActionsList = searchModeActionsList;
    });
  }

  void createSearchModeActionsList() {
    searchModeActionsList = [
      FlatButton(
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Icon(Icons.car_repair),
        ),
        onPressed: () {
        },
      ),
      Spacer(),
      searchForm,
    ];
  }

  void createActionsList() {
    mainActionsList = [
      FlatButton(
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Icon(Icons.car_repair),
        ),
        onPressed: () {
          // Navigator.pushNamed(context, RoutingConfig.PRODUCT);
          // setState(() {
          //   tabIndex = 1;
          // });
        },
      ),
      FlatButton(
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Center(child: Text('Resource')),
        ),
        onPressed: () {
          // Navigator.pushNamed(context, RoutingConfig.PRODUCT);
          setState(() {
            tabIndex = 1;
          });
        },
      ),
      FlatButton(
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Center(child: Text('Support')),
        ),
        onPressed: () {},
      ),
      FlatButton(
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Center(child: Text('Request Board Admin')),
        ),
        onPressed: () {},
      ),
      Spacer(),
      searchButton,
      FlatButton(
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Center(child: Icon(Icons.person)),
        ),
        onPressed: () {},
      ),
      FlatButton(
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Center(child: Icon(Icons.card_travel)),
        ),
        onPressed: () {},
      ),
    ];
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
        backgroundColor: Colors.white,
        actions: realActionsList,
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

import 'package:flutter/material.dart';

class SearchInput extends StatefulWidget {
  @override
  _StateSearchInput createState() {
    return _StateSearchInput();
  }
}

class _StateSearchInput extends State<SearchInput> {

  TextField searchInput;
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 15.0);
  final contentPadding = EdgeInsets.fromLTRB(5.0, 2.0, 5.0, 2.0);
  final border = OutlineInputBorder(borderRadius: BorderRadius.zero);

  @override
  void initState() {
    super.initState();
    buildSearchInput();
  }

  void buildSearchInput() {
    searchInput = TextField(
      obscureText: false,
      style: style,
      decoration: InputDecoration(
        contentPadding: contentPadding,
        hintText: "Search",
        border: border,
        suffixIcon: Icon(Icons.search),
        focusColor: Colors.black,
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.zero),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return searchInput;
  }
}
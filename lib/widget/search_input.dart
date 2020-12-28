import 'package:flutter/material.dart';
import 'package:lutoi/model/search.param.model.dart';
import 'package:lutoi/shared/search_form.shared.dart';
import 'package:lutoi/state/search.param.state.dart';

class SearchInput extends StatefulWidget {
  final Function search;
  SearchInput({this.search});
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
  TextEditingController textFieldcontroller;

  @override
  void initState() {
    super.initState();
    textFieldcontroller = new TextEditingController();
    buildSearchInput();
    setTextFieldValue();
  }

  // void setTextFieldValue() {
  //   final SearchParam searchParam = SearchParamState.shared().getParam();
  //   print('-----------------------------SearchParam3: $searchParam');
  //   textFieldcontroller.value = TextEditingValue(text: searchParam != null && searchParam.param3 != null ? searchParam.param3 : '');
  // }

  void setTextFieldValue() {
    final SearchParam searchParam = SearchFormShared.shared().getParam();
    textFieldcontroller.value = TextEditingValue(text: searchParam != null && searchParam.param3 != null ? searchParam.param3 : '');
  }

  void buildSearchInput() {
    searchInput = TextField(
      controller: textFieldcontroller,
      obscureText: false,
      style: style,
      cursorColor: null,
      decoration: InputDecoration(
        contentPadding: contentPadding,
        hintText: "Search",
        border: border,
        suffixIcon: IconButton(
          padding: EdgeInsets.zero,
          icon: Icon(Icons.search),
          onPressed: () {
            widget.search.call(textFieldcontroller.value.text);
          },
        ),
        focusColor: Colors.black,
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.zero),
        isDense: true,
      ),
      onChanged: (value) {
        
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return searchInput;
  }
}
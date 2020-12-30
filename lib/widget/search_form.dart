import 'package:flutter/material.dart';
import 'package:lutoi/model/search.param.model.dart';
import 'package:lutoi/model/system.code.dart';
import 'package:lutoi/service/system.code.service.dart';
import 'package:lutoi/shared/search_form.shared.dart';
import 'package:lutoi/widget/search_input.dart';

class SearchForm extends StatefulWidget {
  final Function close;
  SearchForm({
    this.close,
  });
  @override
  _SearchFormState createState() {
    return _SearchFormState();
  }
}

class _SearchFormState extends State<SearchForm> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 12.0);
  final contentPadding = EdgeInsets.fromLTRB(5.0, 2.0, 5.0, 2.0);
  final border = OutlineInputBorder(borderRadius: BorderRadius.zero);
  String selected1;
  String selected2;
  List<SystemCodeItem> items1 = [];
  List<SystemCodeItem> items2 = [];
  List<DropdownMenuItem<String>> droplist1 = [];
  List<DropdownMenuItem<String>> droplist2 = [];
  String selectedDropdown2;

  @override
  void initState() {
    super.initState();
    prepareData();
  }

  void prepareData() {
    items1 = SystemCodeService.shared().getSystemCode();
    items2 = SystemCodeService.shared().getSystemCode();
    final SearchParam searchParam = SearchFormShared.shared().getParam();
    if (searchParam != null) {
      selected1 = searchParam.param1;
      selected2 = searchParam.param2;
    }

  }

  void onSearch(String value) {
    SearchFormShared.shared().setParam(SearchParam(param1: selected1, param2: selected2, param3: value));
  }

  @override
  Widget build(BuildContext context) {
    final dropdown1 = new DropdownButton<String>(
      isExpanded: true,
      value: selected1,
      underline: SizedBox(),
      items: items1.map((SystemCodeItem value) {
        return new DropdownMenuItem<String>(
          value: value.name,
          child: new Text(value.value),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          selected1 = value;
        });
      },
    );
    final dropdown2 = new DropdownButton<String>(
      isExpanded: true,
      value: selected2,
      underline: SizedBox(),
      items: items2.map((SystemCodeItem value) {
        return new DropdownMenuItem<String>(
          value: value.name,
          child: new Text(value.value),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          selected2 = value;
        });
      },
    );
    return Row(
      children: [
        SizedBox(
          child: InputDecorator(
            decoration: InputDecoration(
              contentPadding: contentPadding,
              border: border,
            ),
            child: dropdown1,
          ),
          width: 120,
          height: 30,
        ),
        SizedBox(
          width: 10,
        ),
        SizedBox(
          child: InputDecorator(
            decoration: InputDecoration(
              contentPadding: contentPadding,
              border: border,
            ),
            child: dropdown2,
          ),
          width: 170,
          height: 30,
        ),
        SizedBox(
          width: 30,
        ),
        SizedBox(
          child: SearchInput(
            search: (value) {
              onSearch(value);
            },
          ),
          width: 250,
          height: 30,
        ),
        SizedBox(
          width: 20,
        ),
        FlatButton(
          height: 50,
          minWidth: 50,
          padding: EdgeInsets.zero,
          child: Icon(
            Icons.close_outlined,
            color: Colors.black,
          ),
          onPressed: () {
            widget.close.call();
          },
        ),
        SizedBox(
          width: 5,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final field1 = TextField(
      obscureText: false,
      style: style,
      decoration: InputDecoration(
        contentPadding: contentPadding,
        hintText: "Field1",
        border: border,
      ),
    );
    final field2 = TextField(
      obscureText: false,
      style: style,
      decoration: InputDecoration(
      contentPadding: contentPadding,
      hintText: "Field2",
      border: border,
      ),
    );
    final searchField = TextField(
      obscureText: false,
      style: style,
      decoration: InputDecoration(
        contentPadding: contentPadding,
        hintText: "Search",
        border: border,
      ),
    );
    return Row(
      children: [
        SizedBox(
          child: field1,
          width: 100,
          height: 30,
        ),
        SizedBox(width: 5,),
        SizedBox(
          child: field2,
          height: 30,
          width: 100,
        ),
        SizedBox(width: 5,),
        SizedBox(
          child: searchField,
          height: 30,
          width: 100,
        ),
        SizedBox(width: 5,),
        FlatButton(
          height: 30,
          minWidth: 30,
          padding: EdgeInsets.zero,
          child: Icon(Icons.close_outlined, color: Colors.black,),
          onPressed: () {
            widget.close.call();
          },
        ),
        SizedBox(width: 5,),
      ],
    );
  }
}

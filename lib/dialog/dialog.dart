import 'package:flutter/material.dart';

createDialog({
  BuildContext context,
  String title,
  double width,
  double height,
  bool hasCancel = false,
}) {
  return showDialog(
      context: context,
      builder: (_) => new AlertDialog(
            contentPadding: EdgeInsets.all(0),
            content: DialogView(
              title: title,
              width: width,
              height: height,
              hasCancel: hasCancel,
            ),
          ));
}

class DialogView extends StatefulWidget {
  final String title;
  double width;
  double height;
  bool hasCancel = false;
  DialogView({this.title, this.width, this.height, this.hasCancel});
  @override
  _DialogViewState createState() {
    return _DialogViewState();
  }
}

class _DialogViewState extends State<DialogView> {
  @override
  void initState() {
    super.initState();
  }

  void cancel() {
    Navigator.of(context).pop();
  }

  void confirm() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: widget.width,
        height: widget.height,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: widget.width,
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(width: 0.5)),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      '${widget.title}',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    width: 28,
                    child: FlatButton(
                      padding: EdgeInsets.zero,
                      child: Icon(Icons.close),
                      onPressed: () {
                        cancel();
                      },
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Center(
                  child: Text('Message'),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: buildAction(),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> buildAction() {
    final ls = <Widget>[
      Expanded(
        child: Container(
          child: FlatButton(
            child: Text('OK'),
            onPressed: () {
              cancel();
            },
            color: Colors.blueAccent,
          ),
        ),
      )
    ];
    if (widget.hasCancel) {
      ls.insert(
          0,
          Container(
            width: widget.width / 2,
            child: FlatButton(
              color: Colors.blueGrey,
              child: Text('Cancel'),
              onPressed: () {
                confirm();
              },
            ),
          ));
    }
    return ls;
  }
}

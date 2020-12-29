import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:lutoi/model/folder.model.dart';

class ResourceFolder extends StatefulWidget {
  final ResourceFolderModel folder;

  ResourceFolder({this.folder});

  @override
  _StateResourceFolder createState() {
    return _StateResourceFolder();
  }
}

class _StateResourceFolder extends State<ResourceFolder> {
  ExpandableController expandableCtrl;

  @override
  void initState() {
    super.initState();
    expandableCtrl = new ExpandableController();
    expandableCtrl.addListener(() {
      handleExpandable();
    });
  }

  void handleExpandable() {
    setState(() {
      searchResource();
    });
  }

  void searchResource() {

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: !expandableCtrl.expanded ? Color(0xFFf1f2f5) : Colors.white,
      padding: EdgeInsets.zero,
      child: ExpandablePanel(
        controller: expandableCtrl,
        header: Container(
          padding: EdgeInsets.only(top: 15, left: 15),
          child: HoverWidget(
            hoverChild: Text(
              '${widget.folder.path}',
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
            ),
            child: Text(
              '${widget.folder.path}',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            onHover: (e) {},
          ),
        ),
        expanded: Container(
          padding: EdgeInsets.all(15),
          child: Text('Expandable Content', softWrap: true,),
          decoration: BoxDecoration(
          ),
        ),
        theme: ExpandableThemeData(
          tapHeaderToExpand: true,
          iconSize: 30,
          iconColor: Colors.blue,
        ),
      ),
    );
  }
}
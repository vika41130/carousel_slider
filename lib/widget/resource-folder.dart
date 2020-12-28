import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';

class ResourceFolder extends StatefulWidget {
  @override
  _StateResourceFolder createState() {
    return _StateResourceFolder();
  }
}

class _StateResourceFolder extends State<ResourceFolder> {
  ExpandableController expandableCtrl;
  bool isExpanded = false;

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
      isExpanded = expandableCtrl.expanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: !isExpanded ? Color(0xFFf1f2f5) : Colors.white,
      padding: EdgeInsets.zero,
      child: ExpandablePanel(
        controller: expandableCtrl,
        header: Container(
          padding: EdgeInsets.only(top: 15, left: 15),
          child: HoverWidget(
            hoverChild: Text(
              'AUSTRALIA > KONA > 2020 > J9W5D2G1XH > HAPW',
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
            ),
            child: Text(
              'AUSTRALIA > KONA > 2020 > J9W5D2G1XH > HAPW',
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
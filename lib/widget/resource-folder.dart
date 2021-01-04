import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:lutoi/model/folder.model.dart';
import 'package:lutoi/model/resource.model.dart';
import 'package:lutoi/service/resource.service.dart';
import 'package:lutoi/widget/thumbnail.dart';

class ResourceFolder extends StatefulWidget {
  final ResourceFolderModel folder;
  final Function(bool) changed;
  bool isOpen;

  ResourceFolder({Key key, @required this.folder, this.changed, this.isOpen})
      : super(key: key);

  @override
  _StateResourceFolder createState() {
    return _StateResourceFolder();
  }
}

class _StateResourceFolder extends State<ResourceFolder> {
  ExpandableController expandableCtrl;
  List<Resource> resourceLst = [];

  @override
  void initState() {
    super.initState();
    expandableCtrl = new ExpandableController();
    expandableCtrl.addListener(() {
      widget.isOpen = expandableCtrl.expanded;
      widget.changed.call(expandableCtrl.expanded);
      searchResource();
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      expandableCtrl.expanded = widget.isOpen != null ? widget.isOpen : false;
    });
  }

  void searchResource() {
    resourceLst = ResourceService.shared().getResource();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      expandableCtrl.expanded = widget.isOpen;
    });
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
        expanded: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: 0, right: 15, bottom: 0, left: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 120,
                  width: 150,
                  // decoration: BoxDecoration(
                  //   border: Border(right: BorderSide(width: 1, color: Colors.black)),
                  // ),
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 20,
                        child: InkWell(
                          child: Text('All'),
                          onTap: () {
                            searchResource();
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                        child: InkWell(
                          child: Text('Item 1'),
                          onTap: () {
                            searchResource();
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                        child: InkWell(
                          child: Text('Item 2'),
                          onTap: () {
                            searchResource();
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                        child: InkWell(
                          child: Text('Item 3'),
                          onTap: () {
                            searchResource();
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                        child: InkWell(
                          child: Text('Item 4'),
                          onTap: () {
                            searchResource();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                    border: Border(left: BorderSide(width: 1, color: Colors.black)),
                  ),
                    height: 300,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 0,
                        crossAxisSpacing: 20,
                      ),
                      itemCount: resourceLst.length,
                      itemBuilder: (context, index) {
                        return Thumbnail(resource: resourceLst[index],);
                      },
                    ),
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(),
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

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
      padding: EdgeInsets.only(top: 0, right: 0, bottom: 0, left: 0),
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
                Expanded(
                  flex: 1,
                    child: Container(
                      height: 120,
                      width: double.infinity,
                      // decoration: BoxDecoration(
                      //   border: Border(right: BorderSide(width: 1, color: Colors.black)),
                      // ),
                      child: ListView(
                      children: [
                        SizedBox(
                          height: 20,
                          child: InkWell(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey,
                              ),
                              child: Text(
                                'All',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
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
                ),
                Expanded(
                  flex: 9,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(left: BorderSide(width: 0.5, color: Colors.black)),
                    ),
                    padding: EdgeInsets.only(left: 20),
                    // height: 300,
                    // width: 500,
                    // child: GridView.builder(
                    //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    //     crossAxisCount: 3,
                    //     mainAxisSpacing: 0,
                    //     crossAxisSpacing: 20,
                    //   ),
                    //   itemCount: resourceLst.length,
                    //   itemBuilder: (context, index) {
                    //     return Thumbnail(resource: resourceLst[index],);
                    //   },
                    // ),
                    child: Wrap(
                      spacing: 20,
                      children: [
                        for (var index = 0; index < resourceLst.length; index++)
                          Container(
                            width: 300,
                            child: Thumbnail(resource: resourceLst[index], width: 300,),
                          )
                      ],
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

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:lutoi/model/category-item.model.dart';
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
  List<CategoryItem> categories = [];

  @override
  void initState() {
    super.initState();
    expandableCtrl = new ExpandableController();
    setCategories();
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

  void setCategories() {
    categories.add(CategoryItem(name: 'All', value: 'All', selected: true));
    categories
        .add(CategoryItem(name: 'Item 1', value: 'Item 1', selected: false));
    categories
        .add(CategoryItem(name: 'Item 2', value: 'Item 2', selected: false));
    categories
        .add(CategoryItem(name: 'Item 3', value: 'Item 3', selected: false));
    categories
        .add(CategoryItem(name: 'Item 4', value: 'Item 4', selected: false));
  }

  Widget header() {
    return Container(
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
    );
  }

  Widget leftContent() {
    return Container(
      height: 120,
      width: double.infinity,
      child: ListView.builder(
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return SizedBox(
              height: 20,
              child: InkWell(
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                      child: Checkbox(
                        value: categories[index].selected,
                        onChanged: (v) {
                          setState(() {
                            categories[index].selected = v;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: categories[index].selected
                              ? Colors.grey
                              : Colors.transparent,
                        ),
                        child: Text(
                          '${categories[index].value}',
                          style: TextStyle(
                            color: categories[index].selected
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  setState(() {
                    categories[index].selected = categories[index].selected ? false : true;
                  });
                  searchResource();
                },
              ),
            );
          }),
    );
  }

  Widget rightContent() {
    return Container(
      decoration: BoxDecoration(
        border: Border(left: BorderSide(width: 0.5, color: Colors.black)),
      ),
      padding: EdgeInsets.only(left: 20),
      child: Wrap(
        spacing: 20,
        children: [
          for (var index = 0; index < resourceLst.length; index++)
            Container(
              width: 300,
              child: Thumbnail(
                resource: resourceLst[index],
                width: 300,
              ),
            )
        ],
      ),
    );
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
        header: header(),
        expanded: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: 0, right: 15, bottom: 0, left: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: leftContent(),
                ),
                Expanded(
                  flex: 9,
                  child: rightContent(),
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

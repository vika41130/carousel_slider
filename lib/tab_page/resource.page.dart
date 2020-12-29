import 'package:flutter/material.dart';
import 'package:lutoi/model/folder.model.dart';
import 'package:lutoi/service/resource.service.dart';
import 'package:lutoi/widget/resource-folder.dart';

class ResourcePage extends StatefulWidget {
  @override
  _ResourcePageState createState() => _ResourcePageState();
}

class _ResourcePageState extends State<ResourcePage>
    with AutomaticKeepAliveClientMixin<ResourcePage> {
  List<ResourceFolderModel> list = [];
  int expandedIdx = 0;

  @override
  void initState() {
    super.initState();
    list = getResourceFolder();
  }

  List<dynamic> getResourceFolder() {
    return ResourceService.shared().getResourceFolder();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          Column(),
          Expanded(
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20, bottom: 20, right: 25, left: 25),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FlatButton(
                        child: Row(
                          children: [
                            Icon(Icons.shopping_bag_sharp),
                            SizedBox(width: 5,),
                            Text('ADD TO CART')
                          ],
                        ),
                        onPressed:  () {
                          setState(() {
                          });
                        },
                      ),
                      Spacer(),
                      Text('Found 12323 resources in 421 folders'),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 70),
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: ResourceFolder(
                          folder: list[index],
                          isOpen: expandedIdx == index,
                          changed: (v) {
                            setState(() {
                              if (v) {
                                expandedIdx = index;
                              } else if(expandedIdx == index) {
                                expandedIdx = null;
                              }
                            });
                          },
                        ),
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(color: Colors.black, width: 0.5),
                            bottom: index == list.length - 1 ? BorderSide(color: Colors.black, width: 0.5) : BorderSide(width: 0, color: Colors.white),
                          )
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

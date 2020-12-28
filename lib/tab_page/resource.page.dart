import 'package:flutter/material.dart';
import 'package:lutoi/service/product_service.dart';
import 'package:lutoi/widget/resource-folder.dart';

class ResourcePage extends StatefulWidget {
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<ResourcePage>
    with AutomaticKeepAliveClientMixin<ResourcePage> {
  List<dynamic> list = [];

  @override
  void initState() {
    super.initState();
    list = getProductList();
  }

  List<dynamic> getProductList() {
    return ProductService.shared().getProductList();
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
                        child: ResourceFolder(),
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

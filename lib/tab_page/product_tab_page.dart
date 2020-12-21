import 'package:flutter/material.dart';
import 'package:lutoi/model/product_model.dart';
import 'package:lutoi/service/product_service.dart';
import 'package:lutoi/widget/product_item.dart';

class ProductTabPage extends StatefulWidget {
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<ProductTabPage>
    with AutomaticKeepAliveClientMixin<ProductTabPage> {
  List<ProductModel> list = [];

  @override
  void initState() {
    super.initState();
    getProductList();
  }

  void getProductList() {
    list = ProductService.shared().getProductList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: list.length,
          itemBuilder: (context, index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.5, color: Colors.blue),
                  ),
                  child: ProductItem(
                    item: list[index],
                  ),
                ),
              ],
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
        ));
  }

  @override
  bool get wantKeepAlive => true;
}

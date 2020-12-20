import 'package:flutter/material.dart';
import 'package:lutoi/config/assets.dart';
import 'package:lutoi/dialog/dialog.dart';
import 'package:lutoi/model/product_model.dart';

class ProductItem extends StatefulWidget {

  final ProductModel item;
  ProductItem({Key key, this.item}): super(key: key);

  @override
  _ProductItemState createState() {
    return _ProductItemState();
  }
}

class _ProductItemState extends State<ProductItem> {
  @override
  void initState() {
    super.initState();
  }

  void alert() {
    createDialog(
      context: context,
      title: 'Alert',
      width: MediaQuery.of(context).size.width / 3,
      height: MediaQuery.of(context).size.height / 3,
    );
  }

  void confirm() {
    createDialog(
      context: context,
      title: 'Confirm',
      width: MediaQuery.of(context).size.width / 3,
      height: MediaQuery.of(context).size.height / 3,
      hasCancel: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 0, right: 10, bottom: 0, left: 0),
      child: Center(
        child: Column(
          children: [
            Text(
              '${widget.item.name}',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10,),
            Image(
              image: AssetImage(widget.item.image),
              // width: 250,
              height: 150,
            ),
            SizedBox(height: 10,),
            Text(
              '${widget.item.price} USD',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  child: Text(
                    'New',
                    style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                  onPressed: () {
                    alert();
                  },
                ),
                SizedBox(width: 10,),
                RaisedButton(
                  child: Text(
                    'Buy',
                    style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                  onPressed: () {
                    confirm();
                  },
                ),
              ],
            ),
            SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}
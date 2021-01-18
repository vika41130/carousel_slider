import 'package:flutter/material.dart';
// import 'package:ssc_kia_configurator/theme/color.dart';
// import 'package:ssc_kia_configurator/theme/text-style.dart';

class ConfigOptionItem extends StatelessWidget {
  final String name;
  final bool isActive;
  final double price;

  const ConfigOptionItem({
    this.name,
    this.price,
    this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 205,
        height: 66,
        margin: EdgeInsets.only(left: 5, right: 5),
        padding: EdgeInsets.only(top: 9, left: 20, right: 20),
        decoration: new BoxDecoration(
          border: Border.all(
            color: isActive == true ? Colors.red: Colors.white,
            width: isActive == true ? 3 : 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(children: [
              Text(name, style: TextStyle(fontSize: 15)),
              Spacer(),
              Icon(Icons.help, color: Colors.white),
            ]),
            Expanded(child: Text('$price원', style: TextStyle(fontSize: 15)))
          ],
        ));
  }
}

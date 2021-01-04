import 'package:flutter/material.dart';
import 'package:lutoi/model/resource.model.dart';

class Thumbnail extends StatefulWidget {

  final Resource resource;
  final double height;
  final double width;
  Thumbnail({this.resource, this.height, this.width});

  @override
  _StateThumbnail createState() {
    return _StateThumbnail();
  }
}

class _StateThumbnail extends State<Thumbnail> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = widget.height ?? 50.0;
    final width = widget.width ?? 50.0;
    return SizedBox(
      // height: height,
      // width: width,
      child: Column(
        children: [
          Center(
            child: Text('${widget.resource.fileName}'),
          ),
          SizedBox(height: 10),
          Image(
            image: AssetImage('assets/images/bmw/driver1.jpg'),
            width: 200,
          ),
        ],
      ),
    );
  }
}
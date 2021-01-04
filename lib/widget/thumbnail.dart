import 'package:flutter/material.dart';
import 'package:lutoi/model/resource.model.dart';

class Thumbnail extends StatefulWidget {
  final Resource resource;
  final double height;
  final double width;
  final Function changed;
  Thumbnail({this.resource, this.height, this.width, this.changed});

  @override
  _StateThumbnail createState() {
    return _StateThumbnail();
  }
}

class _StateThumbnail extends State<Thumbnail> {
  bool checked = false;
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
            child: Text(
              '${widget.resource.fileName}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 10),
          Image(
            image: AssetImage('assets/images/bmw/driver1.jpg'),
            // height: 200,
            // width: widget.width,
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
                child: Checkbox(
                  value: checked,
                  onChanged: (v) {
                    setState(() {
                      checked = v;
                    });
                    widget.changed.call(v);
                  },
                ),
              ),
              Spacer(),
              SizedBox(
                width: 30,
                child: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {},
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

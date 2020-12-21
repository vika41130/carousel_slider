import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  CustomDrawer({
    Key key,
    this.elevation = 16.0,
    this.child,
    this.semanticLabel,
    this.callback,
  })  : assert(elevation != null && elevation >= 0.0),
        super(key: key);

  final double elevation;
  final Widget child;
  final String semanticLabel;

  final DrawerCallback callback;
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  void initState() {
    if (widget.callback != null) {
      widget.callback(true);
    }

    super.initState();
  }

  @override
  void dispose() {
    if (widget.callback != null) {
      widget.callback(false);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      key: widget.key,
      elevation: widget.elevation,
      semanticLabel: widget.semanticLabel,
      child: widget.child
    );
  }
}

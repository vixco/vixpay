import 'package:flutter/material.dart';

class HScrollContainer extends StatelessWidget {
  double _height;
  double _width;
  var _children = <Widget>[];

  HScrollContainer({
    required double height,
    double width = double.infinity,
    required List<Widget> children,
  })  : _height = height,
        _width = width,
        _children = children;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: _height, width: _width, child: ListView(scrollDirection: Axis.horizontal, children: _children));
  }
}

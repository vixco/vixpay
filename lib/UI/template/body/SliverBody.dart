import 'package:flutter/material.dart';

class AppBarContainerOrange extends StatelessWidget {
  Widget child;
  bool isFirstContainer;
  EdgeInsetsGeometry? padding;

  AppBarContainerOrange({required this.child, this.isFirstContainer = true , this.padding});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
//    if (isFirstContainer) topPadding += kToolbarHeight;

    return SafeArea(
      child: Container(
        padding: padding,
        child: child,
      ));
  }
}
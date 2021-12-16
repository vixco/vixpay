import 'dart:math' as math;

import 'package:flutter/material.dart';

///need to set floatingActionButtonLocation to fabMenuLocation
///
/// https://github.com/js94766524/fab_menu/blob/master/lib/fab_menu.dart
const _FabLocation fabMenuLocation = const _FabLocation();

///A FloatingActionButton with expandable menu
class FabMenu extends StatefulWidget {
  final List<FabMenuData> menus;

  ///Default to Icons.add
  final IconData? mainIcon;

  ///Default to const Duration(milliseconds:200)
  final Duration duration;

  ///Default to Colors.white
  final Color maskColor;

  ///Default to Colors.white
  final Color? mainButtonColor;

  ///Default to Theme.of(context).primaryColor
  final Color? menuButtonColor;

  ///Default to Theme.of(context).primaryColor
  final Color? mainButtonBackgroundColor;

  ///Default to Colors.white
  final Color? menuButtonBackgroundColor;

  ///Default to Theme.of(context).cardColor
  final Color? labelBackgroundColor;

  ///Default to Theme.of(context).primaryColor
  final Color? labelTextColor;

  ///Default to 0.5
  final double maskOpacity;

  FabMenu({
    required this.menus,
    this.mainIcon,
    this.duration: const Duration(milliseconds: 200),
    this.mainButtonColor,
    this.mainButtonBackgroundColor,
    this.menuButtonColor,
    this.menuButtonBackgroundColor,
    this.labelTextColor,
    this.labelBackgroundColor,
    this.maskColor: Colors.white,
    this.maskOpacity: 0.5,
  });

  @override _FabMenuState createState() => _FabMenuState();
}

class _FabMenuState extends State<FabMenu> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..addStatusListener((state) {
        switch (state) {
          case AnimationStatus.forward:
          case AnimationStatus.dismissed:
            setState(() {});
            break;
          default:
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: <Widget>[_buildFabMask(), _buildFabButton()],
    );
  }

  _buildFabMask() {
    return Offstage(
      offstage: _controller.isDismissed,
      child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return GestureDetector(
              onTap: () {
                if (!_controller.isDismissed) {
                  _controller.reverse();
                }
              },
              behavior: HitTestBehavior.opaque,
              child: Opacity(
                opacity: _controller.value * widget.maskOpacity,
                child: Container(
                  color: widget.maskColor,
                ),
              ),
            );
          }),
    );
  }

  _buildFabButton() {
    return Padding(
      padding: const EdgeInsets.all(kFloatingActionButtonMargin),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: List.generate(widget.menus.length, (int index) {
            Widget child = Container(
              height: 60.0,
              alignment: FractionalOffset.topCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  ScaleTransition(
                    scale: CurvedAnimation(
                        parent: _controller,
                        curve: Interval(0.0, 1.0 - index / widget.menus.length / 2.0, curve: Curves.easeOut)),
                    child: Card(
                      elevation: 6.0,
                      color: widget.menus[index].enable
                          ? widget.labelBackgroundColor ?? Theme.of(context).cardColor
                          : Colors.grey[100],
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                        child:Text(
                          widget.menus[index].labelText!,
                          style: TextStyle(
                              color: widget.menus[index].enable
                                  ? widget.labelTextColor ?? Theme.of(context).primaryColor
                                  : Colors.grey),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  ScaleTransition(
                    scale: CurvedAnimation(
                      parent: _controller,
                      curve: Interval(0.0, 1.0 - index / widget.menus.length / 2.0, curve: Curves.easeOut),
                    ),
                    child: FloatingActionButton(
                        heroTag: 'menuFab $index ',
                        backgroundColor: widget.menus[index].enable
                            ? widget.menuButtonBackgroundColor ?? Colors.white
                            : Colors.grey[100],
                        mini: true,
                        tooltip: widget.menus[index].labelText,
                        child: Icon(
                          widget.menus[index].icon,
                          color: widget.menus[index].enable
                              ? widget.menuButtonColor ?? Theme.of(context).primaryColor
                              : Colors.grey,
                        ),
                        onPressed: () {
                          if (!_controller.isDismissed) _controller.reverse();
                          widget.menus[index].onClick(context, widget.menus[index]);
                        }),
                  ),
                  const SizedBox(
                    width: 8.0,
                  )
                ],
              ),
            );
            return child;
          }).toList()
            ..add(FloatingActionButton(
                heroTag: 'mainFab',
                backgroundColor: widget.mainButtonBackgroundColor ?? Theme.of(context).primaryColor,
                child: AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return Transform(
                        transform: Matrix4.rotationZ(_controller.value * 0.5 * math.pi),
                        alignment: FractionalOffset.center,
                        child: Icon(
                          _controller.isDismissed ? widget.mainIcon ?? Icons.add : Icons.close,
                          color: widget.mainButtonColor ?? Colors.white,
                        ),
                      );
                    }),
                onPressed: () {
                  if (_controller.isDismissed) {
                    _controller.forward();
                  } else {
                    _controller.reverse();
                  }
                }))),
    );
  }
}

typedef MenuClicked(BuildContext context, FabMenuData menuData);

class FabMenuData {
  IconData icon;
  String? labelText;
  MenuClicked onClick;
  bool enable;

  FabMenuData(this.icon, this.onClick, {this.labelText, this.enable = true})
      : assert(labelText != null && labelText.isNotEmpty);
}

class _FabLocation extends FloatingActionButtonLocation {
  const _FabLocation();

  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    // Compute the x-axis offset.
    late double fabX;
    switch (scaffoldGeometry.textDirection) {
      case TextDirection.rtl:
        // In RTL, the end of the screen is the left.
        final double endPadding = scaffoldGeometry.minInsets.left;
        fabX = endPadding;
        break;
      case TextDirection.ltr:
        // In LTR, the end of the screen is the right.
        final double endPadding = scaffoldGeometry.minInsets.right;
        fabX = scaffoldGeometry.scaffoldSize.width - scaffoldGeometry.floatingActionButtonSize.width - endPadding;
        break;
    }

    // Compute the y-axis offset.
    final double contentBottom = scaffoldGeometry.contentBottom;
    final double bottomSheetHeight = scaffoldGeometry.bottomSheetSize.height;
    final double fabHeight = scaffoldGeometry.floatingActionButtonSize.height;
    final double snackBarHeight = scaffoldGeometry.snackBarSize.height;

    double fabY = contentBottom - fabHeight;
    if (snackBarHeight > 0.0) fabY = math.min(fabY, contentBottom - snackBarHeight - fabHeight);
    if (bottomSheetHeight > 0.0) fabY = math.min(fabY, contentBottom - bottomSheetHeight - fabHeight / 2.0);

    return Offset(fabX, fabY);
  }
}

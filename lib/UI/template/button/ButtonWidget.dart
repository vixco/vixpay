import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yollet/UI/template.dart';

class DoneButton extends ElevatedButton{ //todo OrangeFlatButtonOrange
  double? width = 0.0;
  double height = 0.0;
  double elevation = 0.0;
  EdgeInsetsGeometry padding;

  BorderRadius? borderRadius;

  Key? key;
  VoidCallback onPressed;
  ValueChanged<bool>? onHighlightChanged;
  ButtonTextTheme? textTheme;
  Color textColor;
  Color disabledTextColor;
  Color color;
  Color? disabledColor;
  Color? highlightColor;
  Color? splashColor;
  Brightness? colorBrightness;
  ShapeBorder? shape;
  Clip clipBehavior;
  MaterialTapTargetSize? materialTapTargetSize;
  Widget child;

  DoneButton({
    this.key,
    bool enable = true,
    this.width,
    this.height=ThemeSizeStyle.buttonHeight,
    this.elevation=0.0,
    this.padding = const EdgeInsets.all(0),
    required this.onPressed,
    this.onHighlightChanged,
    this.textTheme,
    this.textColor = ThemeColors.white,
    this.disabledTextColor = ThemeColors.txtDisableBlack,
    this.color = ThemeColors.tangerine,
    this.disabledColor,
    this.highlightColor,
    this.splashColor,
    this.colorBrightness,
    this.shape,
    this.borderRadius,
    this.clipBehavior = Clip.none,
    this.materialTapTargetSize,
    required this.child,
  }) : super(
        key: key,
        onPressed: onPressed,
        child: child,
      );

  // TODO: ElevatedButton 이 StatefulWidget 로 변경되면서 build() 없어짐
  @override
  Widget build(BuildContext context) {
    RoundedRectangleBorder? _shape;

    shape == null
      ? _shape = RoundedRectangleBorder(
      side: BorderSide(
        color: Colors.transparent,
        width: 1),
      borderRadius: borderRadius??BorderRadius.all(
        Radius.circular(ThemeSizeStyle.ButtonRadius)
      )
    )
      : _shape = shape as RoundedRectangleBorder?;

    return ButtonTheme(
      minWidth: 200.0,
      height: height,
      child: RaisedButton(
        key: key,
        onPressed: onPressed,
        onHighlightChanged: onHighlightChanged,
        textTheme: textTheme,
        textColor: textColor,
        disabledTextColor: disabledTextColor,
        color: color,
        disabledColor: disabledColor,
        highlightColor: highlightColor,
        splashColor: splashColor,
        colorBrightness: colorBrightness,
        padding: padding,
        shape: _shape,
        //shape: shape,
        //shape: Border.all(color: color),
        clipBehavior: clipBehavior,
        materialTapTargetSize: materialTapTargetSize,
        child: child,
        elevation: elevation,
      ),
    );
  }
}

class OrangeFlatButton extends ElevatedButton{
  double width = 0.0;
  double height = 0.0;
  double? elevation = 0.0;
  EdgeInsetsGeometry padding;

  OrangeFlatButton({
    Key? key,
    double width = 106,
    double height = ThemeSizeStyle.buttonHeight,
    this.elevation,
    this.padding = const EdgeInsets.all(0),
    required VoidCallback onPressed,
    ValueChanged<bool>? onHighlightChanged,
    ButtonTextTheme? textTheme,
    Color textColor = ThemeColors.txtMainBlack,
    Color disabledTextColor = ThemeColors.txtDisableBlack,
    Color color = ThemeColors.theme_500,
    Color? disabledColor,
    Color? highlightColor,
    Color? splashColor,
    Brightness? colorBrightness,
    ShapeBorder? shape,
    Clip clipBehavior = Clip.none,
    MaterialTapTargetSize? materialTapTargetSize,
    required Widget child,
  })  : width = width,
      height = height,
      super(
      // key: key,
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          textStyle: TextStyle(color: textColor),
        primary: color
      ),
      // onHighlightChanged: onHighlightChanged,
      // textTheme: textTheme,
      // textColor: textColor,
      // disabledTextColor: disabledTextColor,
      // color: color,
      // disabledColor: disabledColor,
      // highlightColor: highlightColor,
      // splashColor: splashColor,
      // colorBrightness: colorBrightness,
      // padding: padding,
      // shape: shape,
      // clipBehavior: clipBehavior,
      // materialTapTargetSize: materialTapTargetSize,
      child: child,
      // elevation: elevation,
    );
}

class TextOnlyButton extends ElevatedButton{
  double width = 0.0;
  double height = 0.0;
  double elevation;
  EdgeInsetsGeometry padding;

  TextOnlyButton({
    Key? key,
    double width = 106,
    double height =ThemeSizeStyle.buttonHeight,
    this.elevation = 0.0,
    this.padding = const EdgeInsets.all(0),
    required VoidCallback onPressed,
    ValueChanged<bool>? onHighlightChanged,
    ButtonTextTheme? textTheme,
    Color textColor = ThemeColors.theme_500,
    Color disabledTextColor = ThemeColors.txtDisableBlack,
    Color color = Colors.transparent,
    Color? disabledColor,
    Color? highlightColor,
    Color? splashColor,
    Brightness? colorBrightness,
    ShapeBorder? shape,
    Clip clipBehavior = Clip.none,
    MaterialTapTargetSize? materialTapTargetSize,
    required Widget child,
  })  : width = width,
      height = height,
      super(
      key: key,
      onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            textStyle: TextStyle(color: textColor),
            primary: color
        ),
      // onHighlightChanged: onHighlightChanged,
      // textTheme: textTheme,
      // textColor: textColor,
      // disabledTextColor: disabledTextColor,
      // color: color,
      // disabledColor: disabledColor,
      // highlightColor: highlightColor,
      // splashColor: splashColor,
      // colorBrightness: colorBrightness,
      // padding: padding,
      // shape: shape,
      // clipBehavior: clipBehavior,
      // materialTapTargetSize: materialTapTargetSize,
      child: child,
      // elevation: elevation,
    );
}

class DoneSubButton extends ElevatedButton{//todo EggBoxButtonOrange
  double width = 0.0;
  double height = 0.0;
  double elevation;
  EdgeInsetsGeometry padding;
  BorderRadius? borderRadius;

  Key? key;
  VoidCallback? onPressed;
  ValueChanged<bool>? onHighlightChanged;
  ButtonTextTheme? textTheme;
  Color textColor;
  Color disabledTextColor;
  Color color;
  Color disabledColor;
  Color? highlightColor;
  Color? splashColor;
  Brightness? colorBrightness;
  ShapeBorder? shape;
  Clip clipBehavior;
  MaterialTapTargetSize? materialTapTargetSize;
  Widget child;

  DoneSubButton({
    this.key,
    this.width =240,
    this.height=ThemeSizeStyle.buttonHeight,
    this.elevation = 0.0,
    this.padding = const EdgeInsets.only(left: 16, right: 16, top:4, bottom:4),
    this.onPressed,
    this.onHighlightChanged,
    this.textTheme,
    this.textColor = ThemeColors.white,
    this.disabledTextColor = ThemeColors.black,
    this.color = ThemeColors.slate,
    this.disabledColor = ThemeColors.very_light_pink_two,
    this.highlightColor,
    this.splashColor,
    this.colorBrightness,
    this.shape,
    this.borderRadius,
    this.clipBehavior = Clip.none,
    this.materialTapTargetSize,
    required this.child,
  }): super(
    key: key,
    onPressed: onPressed,
    child: child,
  );

  // TODO: ElevatedButton 이 StatefulWidget 로 변경되면서 build() 없어짐
  @override
  Widget build(BuildContext context) {
    RoundedRectangleBorder? _shape;

    shape == null
      ? _shape = RoundedRectangleBorder(
      side: BorderSide(
        color: Colors.transparent,
        width: 1),
      borderRadius: borderRadius??BorderRadius.all(
        Radius.circular(ThemeSizeStyle.ButtonRadius)
      )
    )
      : _shape = shape as RoundedRectangleBorder?;

    return ButtonTheme(
      minWidth: width,
      height: height,

      child:RaisedButton(
        key: key,
        onPressed: onPressed,
        onHighlightChanged: onHighlightChanged,
        textTheme: textTheme,
        textColor: textColor,
        disabledTextColor: disabledTextColor,
        color: color,
        disabledColor: disabledColor,
        highlightColor: highlightColor,
        splashColor: splashColor,
        colorBrightness: colorBrightness,
        padding: padding ,
        shape: _shape,
        //shape: shape,
        //shape: Border.all(color: color),
        clipBehavior: clipBehavior,
        materialTapTargetSize: materialTapTargetSize,
        child: child,
        elevation: elevation,
      ),
    );
  }
}

class whatBtn extends StatelessWidget {
  String text;
  void Function()? onClick;
  Color color;
  Color? splashColor;
  Color? borderColor;

  whatBtn(
    {required this.text,
      required this.onClick,
      required this.color,
      this.splashColor,
      this.borderColor});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        border: Border.all(color: borderColor!, width: 1)),
      child: Material(
        color: Colors.transparent,
        shadowColor: Colors.transparent,
        type: MaterialType.transparency,
        //borderRadius: BorderRadius.circular(40),
        child: InkWell(
          onTap: onClick,
          splashColor: Colors.white,
          radius: 20,
          borderRadius: BorderRadius.circular(40),
          customBorder: Border.all(color: borderColor!, width: 0.75),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child:AutoSizeText(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CircularButton extends StatelessWidget {
  String text;
  void Function()? onPressed;
  Color color;
  double size;
  Color textColor;
  Color borderColor;

  CircularButton(
    {required this.text,
      required this.onPressed,
      required this.color,
      this.size = 100.0,
      this.textColor = ThemeColors.ReplyBlue1000,
      this.borderColor = ThemeColors.ReplyBlue});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onPressed,
        child: ClipOval(
          child: Container(
//            color: color,
            height: size, // height of the button
            width: size, // width of the button
            decoration: BoxDecoration(
              color: color,
              border: Border.all(
                width: 1.0,
                color: borderColor,
              ),
              shape: BoxShape.circle,
//              boxShadow: [
//                BoxShadow(
//                  color: Colors.black45,
//                  offset: Offset(10.0, 10.0),
//
//                  blurRadius: 40.5,
////                  spreadRadius: 4.0,
//                )
//              ]
              boxShadow: [
                BoxShadow(
                  blurRadius: 13.0,
                  color: Colors.black.withOpacity(.5),
                  offset: Offset(6.0, 7.0),
                ),
              ],
            ),
            child: Center(
              child:AutoSizeText(
                text,
                style: ThemeTextStyles.bodyBlack26.apply(color: textColor),
              )),
          ),
        ),
      ));
  }
}

class CircleButton extends StatelessWidget {
  String text;
  void Function()? onPressed;
  Color color;
  double size;
  Color textColor;
  Color borderColor;

  CircleButton(
    {required this.text,
      required this.onPressed,
      required this.color,
      this.size = 20.0,
      this.textColor = ThemeColors.ReplyBlue1000,
      this.borderColor = ThemeColors.ReplyBlue});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Center(
        child:AutoSizeText(
          text,
          style: ThemeTextStyles.bodyBlack26.apply(color: textColor),
        )),
      shape: CircleBorder(
        side: BorderSide(
          color: borderColor, width: 1.0, style: BorderStyle.solid)),
      elevation: 2.0,
      fillColor: color,
      padding: EdgeInsets.all(size),
    );
  }
}

class HeaderSearchFormButtonBar extends StatelessWidget {
  var _widgets = <Widget>[];

  HeaderSearchFormButtonBar(widgets) {
    //여기에서 버튼 Size(Width 도 잘 조정하면 화면에 꽉 차게 나옴)
    var widgetCnt = widgets.length;
    _widgets = <Widget>[];
    for (int i = 0; i < widgetCnt - 1; i++) {
      _widgets.add(Expanded(child: widgets[i]));
//      _widgets.add(widgets[i]);
      _widgets.add(new SizedBox(width: ThemeSizeStyle.size_16));
    }
    _widgets.add(Expanded(child: widgets[widgetCnt - 1]));
  }

  @override
  Widget build(BuildContext context) {
    //위젯들의 길이 계산

    return Container(
      //color: ReplyBlue,
      height: ThemeSizeStyle.headerSearchFormButtonBarHeight,//120-16
      decoration: BoxDecoration(color: ThemeColors.slate,
        //color: ThemeColors.,
        //borderRadius: BorderRadius.all(Radius.circular(0.0)),
//        boxShadow: [
//          BoxShadow(
//            color: Colors.black.withOpacity(0.1),
//            blurRadius: ThemeSizeStyle.TopBottomElevation,
//            spreadRadius: 1.0,
//          )
//        ]
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 0.0, bottom: ThemeSizeStyle.headerSearchFormButtonBarPaddingBottom),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: _widgets,
        ),
      ));
  }
}

class OrangeFlatButtonOrange extends ElevatedButton{
  double width = 0.0;
  double height = 0.0;
  double elevation = 0.0;
  EdgeInsetsGeometry padding;

  BorderRadius? borderRadius;

  Key? key;
  VoidCallback onPressed;
  ValueChanged<bool>? onHighlightChanged;
  ButtonTextTheme? textTheme;
  Color textColor;
  Color disabledTextColor;
  Color color;
  Color? disabledColor;
  Color? highlightColor;
  Color? splashColor;
  Brightness? colorBrightness;
  ShapeBorder? shape;
  Clip clipBehavior;
  MaterialTapTargetSize? materialTapTargetSize;
  Widget child;

  OrangeFlatButtonOrange({
    this.key,
    bool enable = true,
    this.width = 106,
    this.height=ThemeSizeStyle.buttonHeight,
    this.elevation=0.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 10),
    required this.onPressed,
    this.onHighlightChanged,
    this.textTheme,
    this.textColor = ThemeColors.white,
    this.disabledTextColor = ThemeColors.txtDisableBlack,
    this.color = ThemeColors.tangerine,
    this.disabledColor,
    this.highlightColor,
    this.splashColor,
    this.colorBrightness,
    this.shape,
    this.borderRadius,
    this.clipBehavior = Clip.none,
    this.materialTapTargetSize,
    required this.child,
  }): super(
    key: key,
    onPressed: onPressed,
    child: child,
  );

  // TODO: ElevatedButton 이 StatefulWidget 로 변경되면서 build() 없어짐
  @override
  Widget build(BuildContext context) {
    RoundedRectangleBorder? _shape;

    shape == null
      ? _shape = RoundedRectangleBorder(
      side: BorderSide(
        color: Colors.transparent,
        width: 1),
      borderRadius: borderRadius??BorderRadius.all(
        Radius.circular(ThemeSizeStyle.ButtonRadius)
      )
    )
      : _shape = shape as RoundedRectangleBorder?;

    return ButtonTheme(
      minWidth: width,
      height: height,
      padding : EdgeInsets.all(0),
      child: RaisedButton(
      key: key,
      onPressed: onPressed,
      onHighlightChanged: onHighlightChanged,
      textTheme: textTheme,
      textColor: textColor,
      disabledTextColor: disabledTextColor,
      color: color,
      disabledColor: disabledColor,
      highlightColor: highlightColor,
      splashColor: splashColor,
      colorBrightness: colorBrightness,
      padding: padding,
      shape: _shape,
      //shape: shape,
      //shape: Border.all(color: color),
      clipBehavior: clipBehavior,
      materialTapTargetSize: materialTapTargetSize,
      child: child,
      elevation: elevation,
   ),
    );
  }
}

class EggBoxButtonOrange extends ElevatedButton{
  double? width = 0.0;
  double height = 0.0;
  double elevation;
  EdgeInsetsGeometry padding;
  BorderRadius? borderRadius;

  Key? key;
  VoidCallback? onPressed;
  ValueChanged<bool>? onHighlightChanged;
  ButtonTextTheme? textTheme;
  Color textColor;
  Color disabledTextColor;
  Color color;
  Color disabledColor;
  Color? highlightColor;
  Color? splashColor;
  Brightness? colorBrightness;
  ShapeBorder? shape;
  Clip clipBehavior;
  MaterialTapTargetSize? materialTapTargetSize;
  Widget child;

  EggBoxButtonOrange({
    this.key,
    this.width,
    this.height=ThemeSizeStyle.buttonHeight,
    this.elevation = 0.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 10),
    this.onPressed,
    this.onHighlightChanged,
    this.textTheme,
    this.textColor = ThemeColors.orangey_red,
    this.disabledTextColor = ThemeColors.txtDisableBlack,
    this.color = ThemeColors.egg_shell,
    this.disabledColor = ThemeColors.txtDisableBlack,
    this.highlightColor,
    this.splashColor,
    this.colorBrightness,
    this.shape,
    this.borderRadius,
    this.clipBehavior = Clip.none,
    this.materialTapTargetSize,
    required this.child,
  }): super(
    key: key,
    onPressed: onPressed,
    child: child,
  );

  // TODO: ElevatedButton 이 StatefulWidget 로 변경되면서 build() 없어짐
  @override
  Widget build(BuildContext context) {
    RoundedRectangleBorder? _shape;

    shape == null
      ? _shape = RoundedRectangleBorder(
      side: BorderSide(
        color: Colors.transparent,
        width: 1),
      borderRadius: borderRadius??BorderRadius.all(
        Radius.circular(ThemeSizeStyle.ButtonRadius)
      )
    )
      : _shape = shape as RoundedRectangleBorder?;

    return ButtonTheme(
      minWidth: 200.0,
      height: height,
      child:RaisedButton(
      key: key,
      onPressed: onPressed,
      onHighlightChanged: onHighlightChanged,
      textTheme: textTheme,
      textColor: textColor,
      disabledTextColor: disabledTextColor,
      color: color,
      disabledColor: disabledColor,
      highlightColor: highlightColor,
      splashColor: splashColor,
      colorBrightness: colorBrightness,
      padding: padding,
      shape: _shape,
      //shape: shape,
      //shape: Border.all(color: color),
      clipBehavior: clipBehavior,
      materialTapTargetSize: materialTapTargetSize,
      child: child,
      elevation: elevation,
    ),
    );
  }
}


class MarigoldFlatButtonOrange extends ElevatedButton{
  double? width = 0.0;
  double height = 0.0;
  double? elevation = 0.0;
  EdgeInsetsGeometry padding;

  BorderRadius? borderRadius;

  Key? key;
  VoidCallback onPressed;
  ValueChanged<bool>? onHighlightChanged;
  ButtonTextTheme? textTheme;
  Color textColor;
  Color disabledTextColor;
  Color color;
  Color? disabledColor;
  Color? highlightColor;
  Color? splashColor;
  Brightness? colorBrightness;
  ShapeBorder? shape;
  Clip clipBehavior;
  MaterialTapTargetSize? materialTapTargetSize;
  Widget child;

  MarigoldFlatButtonOrange({
    this.key,
    bool enable = true,
    this.width,
    this.height=ThemeSizeStyle.buttonHeight,
    this.elevation,
    this.padding = const EdgeInsets.symmetric(horizontal: 10),
    required this.onPressed,
    this.onHighlightChanged,
    this.textTheme,
    this.textColor = ThemeColors.white,
    this.disabledTextColor = ThemeColors.txtDisableBlack,
    this.color = ThemeColors.marigold,
    this.disabledColor,
    this.highlightColor,
    this.splashColor,
    this.colorBrightness,
    this.shape,
    this.borderRadius,
    this.clipBehavior = Clip.none,
    this.materialTapTargetSize,
    required this.child,
  }): super(
    key: key,
    onPressed: onPressed,
    child: child,
  );

  // TODO: ElevatedButton 이 StatefulWidget 로 변경되면서 build() 없어짐
  @override
  Widget build(BuildContext context) {
    RoundedRectangleBorder? _shape;

    shape == null
      ? _shape = RoundedRectangleBorder(
      side: BorderSide(
        color: Colors.transparent,
        width: 1),
      borderRadius: borderRadius??BorderRadius.all(
        Radius.circular(8)
      )
    )
      : _shape = shape as RoundedRectangleBorder?;

    return ButtonTheme(
      minWidth: 200.0,
      height: height,
      child: RaisedButton(
        key: key,
        onPressed: onPressed,
        onHighlightChanged: onHighlightChanged,
        textTheme: textTheme,
        textColor: textColor,
        disabledTextColor: disabledTextColor,
        color: color,
        disabledColor: disabledColor,
        highlightColor: highlightColor,
        splashColor: splashColor,
        colorBrightness: colorBrightness,
        padding: padding,
        shape: _shape,
        //shape: shape,
        //shape: Border.all(color: color),
        clipBehavior: clipBehavior,
        materialTapTargetSize: materialTapTargetSize,
        child: child,
        elevation: elevation,
      ),
    );
  }
}


class PGBodyButton extends ElevatedButton{
  double? width = 0.0;
  double height = 0.0;
  double elevation = 0.0;
  EdgeInsetsGeometry padding;

  BorderRadius? borderRadius;

  Key? key;
  VoidCallback onPressed;
  ValueChanged<bool>? onHighlightChanged;
  //ButtonTextTheme textTheme;
  String buttonText;
  Color textColor;
  Color disabledTextColor;
  Color color;
  Color? disabledColor;
  Color? highlightColor;
  Color? splashColor;
  Brightness? colorBrightness;
  ShapeBorder? shape;
  Clip clipBehavior;
  MaterialTapTargetSize? materialTapTargetSize;
  // Widget? child;

  PGBodyButton({
    this.key,
    bool enable = true,
    this.width,
    this.height=24,
    this.padding =const EdgeInsets.all(0),
    required this.onPressed,
    this.onHighlightChanged,
    this.buttonText = "OK",
    this.textColor = ThemeColors.tangerine,
    this.disabledTextColor = ThemeColors.txtDisableBlack,
    this.color = ThemeColors.white,
    this.disabledColor,
    this.highlightColor,
    this.splashColor,
    this.colorBrightness,
    this.shape,
    this.borderRadius,
    this.clipBehavior = Clip.none,
    this.materialTapTargetSize
  }): super(
    key: key,
    onPressed: onPressed,
    child: Container(),
  );

  // TODO: ElevatedButton 이 StatefulWidget 로 변경되면서 build() 없어짐
  @override
  Widget build(BuildContext context) {
    RoundedRectangleBorder _shape;

    return FlatButton(
      key: key,
      onPressed: onPressed,
      onHighlightChanged: onHighlightChanged,
      // textTheme: textTheme,
      textColor: textColor,
      disabledTextColor: disabledTextColor,
      color: color,
      disabledColor: disabledColor,
      highlightColor: highlightColor,
      splashColor: splashColor,
      colorBrightness: colorBrightness,
      padding: padding,
      //shape: shape,
      //shape: Border.all(color: color),
      clipBehavior: clipBehavior,
      materialTapTargetSize: materialTapTargetSize,
      child:AutoSizeText(buttonText , style: ThemeTextStyles.bodyBlack26.apply(color : textColor) ),
    );
  }
}

class CircleCheckbox extends StatefulWidget {
  bool value;
  final ValueChanged<bool>? onChanged;
  final Color activeColor;
  final Color checkColor;
  final Color borderColor;
  final Color disabledColor;
  final double size;
  final double buttonSize;
  final AlignmentGeometry buttonAlignment;

  CircleCheckbox({
    required this.value,
    this.onChanged,
    this.activeColor = ThemeColors.theme_400,
    this.checkColor = ThemeColors.white,
    this.borderColor=ThemeColors.theme_400,
    this.disabledColor = ThemeColors.very_light_pink_box,
    this.size=24,
    this.buttonSize = 32,
    this.buttonAlignment = Alignment.center,
  });

  @override
  _CircleCheckboxState createState() => _CircleCheckboxState();
}

class _CircleCheckboxState extends State<CircleCheckbox> {
  @override
  Widget build(BuildContext context) {
    void Function() onTap = () {
      if (widget.onChanged != null) {
        widget.value = !widget.value;
        widget.onChanged!(widget.value);
      }
    };
    return InkWell(
      onTap: onTap,
      child: Container(
        width: widget.buttonSize,
        height: widget.buttonSize,
        child:Align(
          alignment: widget.buttonAlignment,
          child: getContent(),
        )
      )
    );
  }
  Widget getContent(){
    if(widget.value){
      return Container(
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(shape: BoxShape.circle, color: widget.onChanged != null ? widget.activeColor : widget.disabledColor,
          border: Border.all(
            color: widget.onChanged != null ? widget.activeColor : widget.disabledColor,
            width: 2.5,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Icon(
            Icons.check,
            size: widget.size*0.8,
            color: widget.checkColor,
          )
        ),
      );
    }else{
      return Container(
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white,
          border: Border.all(
            color: widget.onChanged != null ? widget.borderColor : widget.disabledColor,
            width: 2.5,
          ),
        ),

      );
    }
  }
}
/*

class _CircleCheckboxState extends State<CircleCheckbox> {
  @override
  Widget build(BuildContext context) {
    Function onTap = () {
      if (widget.onChanged != null) {
        widget.value = !widget.value;
        widget.onChanged(widget.value);
      }
    };
    if(widget.value){
      return IconButton(
        iconSize: widget.size,
        icon: Icon(YoshopIcons.y0308_check, color: widget.onChanged != null ? widget.activeColor : widget.disabledColor,size: widget.size,),
        onPressed: onTap);

    }else{
      return IconButton(
        iconSize: widget.size,
        icon: Icon(YoshopIcons.y0307_uncheck, color: widget.onChanged != null ? widget.borderColor : widget.disabledColor,size: widget.size,),
        onPressed: onTap);
    }
  }
}
*/

class RotatedIcon extends StatelessWidget {
  Icon base;
  int angle;
  RotatedIcon( IconData icon,
    {
      Key? key,
      double? size,
      Color? color,
      String? semanticLabel,
      TextDirection? textDirection,
      this.angle=0,
    }):base = Icon(icon,
    key:key,
    color:color,
    size: size,
    semanticLabel:semanticLabel,
    textDirection:textDirection,
  );

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * pi/180,
      child: base,
    );
  }
}
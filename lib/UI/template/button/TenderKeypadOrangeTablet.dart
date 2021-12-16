import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yollet/UI/template.dart';

class TenderKeypadOrangeTablet extends StatelessWidget {
  final ValueChanged<String?> onPressed;
//  final double wUnit;
//  final double hUnit;
  final double wSpace;
  final double hSpace;


  TenderKeypadOrangeTablet({
    required this.onPressed,
//    this.wUnit=/*_wUnit*/136,
//    this.hUnit=/*_hUnit*/80,
    this.wSpace=8,
    this.hSpace=8
  });

  static final List keypadList = <NumKeypad>[
    NumKeypad(
      title: "7",
      buttonColor: ThemeColors.very_light_pink_box,
      textColor: ThemeColors.black),
    NumKeypad(
      title: "8",
      buttonColor: ThemeColors.very_light_pink_box,
      textColor: ThemeColors.black),
    NumKeypad(
      title: "9",
      buttonColor: ThemeColors.very_light_pink_box,
      textColor: ThemeColors.black),
    NumKeypad(
      title: YoshopIcons.y0409_back,
      value: "BS",
      buttonColor: ThemeColors.brown_grey,
      textColor: ThemeColors.white,
//      valueAlignment: Alignment.bottomRight
    ),
    NumKeypad(
      title: "4",
      buttonColor: ThemeColors.very_light_pink_box,
      textColor: ThemeColors.black),
    NumKeypad(
      title: "5",
      buttonColor: ThemeColors.very_light_pink_box,
      textColor: ThemeColors.black),
    NumKeypad(
      title: "6",
      buttonColor: ThemeColors.very_light_pink_box,
      textColor: ThemeColors.black),
    NumKeypad(
      title: "C",
      buttonColor: ThemeColors.brown_grey,
      textColor: ThemeColors.white),
    NumKeypad(
      title: "1",
      buttonColor: ThemeColors.very_light_pink_box,
      textColor: ThemeColors.black),
    NumKeypad(
      title: "2",
      buttonColor: ThemeColors.very_light_pink_box,
      textColor: ThemeColors.black),
    NumKeypad(
      title: "3",
      buttonColor: ThemeColors.very_light_pink_box,
      textColor: ThemeColors.black),
    NumKeypad(
      title: YoshopIcons.y0408_enter,
      value: "Enter",
      buttonColor: ThemeColors.brown_grey,
      textColor: ThemeColors.white,
      height:168

//      valueAlignment: Alignment.bottomRight
    ),
//    NumKeypad(
//        title: Icons.keyboard_backspace,
//        value: "BS",
//        color: ThemeColors.egg_shell,
//        textColor: ThemeColors.orangey_red,
//        valueAlignment: Alignment.bottomRight),
    NumKeypad(
      title: "0",
      buttonColor: ThemeColors.white,
      textColor: ThemeColors.black),
    NumKeypad(
      title: "00",
      buttonColor: ThemeColors.white,
      textColor: ThemeColors.black),
    NumKeypad(
      title: ".",
      buttonColor: ThemeColors.white,
      textColor: ThemeColors.black),
//    NumKeypad(
//      title: Icons.keyboard_return,
//      value: "Enter",
//      color: ThemeColors.tangerine,
//      textColor: ThemeColors.white,
//      height:168
////        valueAlignment: Alignment.bottomRight
//    ),
    NumKeypad(
      title: YoshopIcons.y0401_up,
      value: "FocusUp",
      buttonColor: ThemeColors.white_tab,
      textColor: ThemeColors.brown_grey,
      width:280,
      height: 48,
    ),
    NumKeypad(
      title: YoshopIcons.y0309_under,
      value: "FocusDown",
      buttonColor: ThemeColors.white_tab,
      textColor: ThemeColors.brown_grey,
      width:280,
      height: 48,
    ),
  ];
//
//  final double _wUnit = 106;
//  final double _hUnit = 54;

  @override
  Widget build(BuildContext context) {

    return Container(
      //color: Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
      Row(
      mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _unitButton(keypadList[15]),
          SizedBox(width: wSpace),
          _unitButton(keypadList[16]),
          ]),
          SizedBox(height: hSpace),
          Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _unitButton(keypadList[0]),
              SizedBox(height: hSpace),
              _unitButton(keypadList[4]),
              SizedBox(height: hSpace),
              _unitButton(keypadList[8]),
              SizedBox(height: hSpace),
              _unitButton(keypadList[12]),
            ],
          ),
          SizedBox(width: wSpace),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _unitButton(keypadList[1]),
              SizedBox(height: hSpace),
              _unitButton(keypadList[5]),
              SizedBox(height: hSpace),
              _unitButton(keypadList[9]),
              SizedBox(height: hSpace),
              _unitButton(keypadList[13]),
            ],
          ),
          SizedBox(width: wSpace),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _unitButton(keypadList[2]),
              SizedBox(height: hSpace),
              _unitButton(keypadList[6]),
              SizedBox(height: hSpace),
              _unitButton(keypadList[10]),
              SizedBox(height: hSpace),
              _unitButton(keypadList[14]),
            ],
          ),
          SizedBox(width: wSpace),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _unitButton(keypadList[3]),
              SizedBox(height: hSpace),
              _unitButton(keypadList[7]),
              SizedBox(height: hSpace),
              _unitButton(keypadList[11]),
//              SizedBox(height: 4),
//              _unitButton(keypadList[15]),
            ], )
        ],),
      ]),
    );

  }


  Widget _unitButton(NumKeypad item) {
    Widget? child;
    Color? buttonColor;
    Color? buttonTextColor;
    if (item.title is String) {
      buttonColor = item.buttonColor;
      buttonTextColor = item.textColor;
      child =AutoSizeText(
        item.title,
        style: ThemeTextStyles.KeypadNum.apply(color: buttonTextColor),
      );
    } else if (item.title is IconData) {
      child = Icon(item.title,size: 50,color: item.textColor,);
      buttonColor = item.buttonColor;
      buttonTextColor = item.textColor;
    }
    if (item.valueAlignment != null) {
      child = Align(
        alignment: item.valueAlignment!,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0 - 9, vertical: 12),
          child: child,
        ));
    }

    return  Container(
      width: item.width,
      height: item.height,
//      child: OrangeFlatButton(
//        width: item.width,
//        height: item.height,
      child: RaisedButton(
        child: child,
        elevation: 0.0,
        onPressed: () => onPressed(item.value),
        color: buttonColor,
        textColor: buttonTextColor,
        shape: RoundedRectangleBorder(
//              side: BorderSide(color: Colors.transparent, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(8))),
      ),

    );
  }
}

class NumKeypad {
  var title;
  String? value;
  Color? buttonColor;
  Color? textColor;
  double width;
  double height;
  AlignmentGeometry? valueAlignment;

  NumKeypad(
    {this.title,
      this.value,
      this.buttonColor,
      this.textColor,
      this.width = 136,
      this.height = 80,
      this.valueAlignment}) {
    if (value == null) {
      value = title;
    }
  }
}

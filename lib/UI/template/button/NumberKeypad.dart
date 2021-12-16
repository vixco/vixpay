import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yollet/UI/template.dart';

class NumberKeypadOrange extends StatelessWidget {
  final ValueChanged<String?> onPressed;
//  final int numberType; //키패드별 타입을 지정해 주세요.. emum 으로 설정하면 될듯...
//  final Color numberBackgroundColor;
//  final Color numberTextColor;
//  final double wUnit;
//  final double hUnit;
  final double wSpace;
  final double hSpace;

  NumberKeypadOrange({
    required this.onPressed,
//    this.numberType = 0,
//    this.numberBackgroundColor,
//    this.numberTextColor,
//    this.wUnit=/*_wUnit*/105,
//    this.hUnit=/*_hUnit*/54,
    this.wSpace=8,
    this.hSpace=8
  });

  static final List keypadList = <NumKeypad>[
    NumKeypad(
        title: "1",
        buttonColor: ThemeColors.white_tab,
        textColor: ThemeColors.dark),
    NumKeypad(
        title: "2",
      buttonColor: ThemeColors.white_tab,
      textColor: ThemeColors.dark),
    NumKeypad(
        title: "3",
      buttonColor: ThemeColors.white_tab,
      textColor: ThemeColors.dark),
    NumKeypad(
        title: "4",
      buttonColor: ThemeColors.white_tab,
      textColor: ThemeColors.dark),
    NumKeypad(
        title: "5",
      buttonColor: ThemeColors.white_tab,
      textColor: ThemeColors.dark),
    NumKeypad(
        title: "6",
      buttonColor: ThemeColors.white_tab,
      textColor: ThemeColors.dark),
    NumKeypad(
        title: "7",
      buttonColor: ThemeColors.white_tab,
      textColor: ThemeColors.dark),
    NumKeypad(
        title: "8",
      buttonColor: ThemeColors.white_tab,
      textColor: ThemeColors.dark),
    NumKeypad(
        title: "9",
      buttonColor: ThemeColors.white_tab,
      textColor: ThemeColors.dark),
    NumKeypad(
        title: Icons.keyboard_backspace,
        value: "BS",
        buttonColor: ThemeColors.slate,
        textColor: ThemeColors.white,
        valueAlignment: Alignment.bottomRight),
    NumKeypad(
        title: "0",
      buttonColor: ThemeColors.white_tab,
      textColor: ThemeColors.dark),
    NumKeypad(
        title: Icons.keyboard_return,
        value: "Enter",
        buttonColor: ThemeColors.tangerine,
        textColor: ThemeColors.white,
        valueAlignment: Alignment.bottomRight),
  ];

  @override
  Widget build(BuildContext context) {

    return Container(
      //color: Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _unitButton(keypadList[0]),
              SizedBox(width: wSpace),
              _unitButton(keypadList[1]),
              SizedBox(width: wSpace),
              _unitButton(keypadList[2]),
            ],
          ),
          SizedBox(height: hSpace),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _unitButton(keypadList[3]),
              SizedBox(width: wSpace),
              _unitButton(keypadList[4]),
              SizedBox(width: wSpace),
              _unitButton(keypadList[5]),
            ],
          ),
          SizedBox(height: hSpace),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _unitButton(keypadList[6]),
              SizedBox(width: wSpace),
              _unitButton(keypadList[7]),
              SizedBox(width: wSpace),
              _unitButton(keypadList[8]),
            ],
          ),
          SizedBox(height: hSpace),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _unitButton(keypadList[9]),
              SizedBox(width: wSpace),
              _unitButton(keypadList[10]),
              SizedBox(width: wSpace),
              _unitButton(keypadList[11]),
            ],
          )
        ],
      ),
    );
  }

  Widget _unitButton(NumKeypad item) {
    Widget? child;
    Color? buttonColor;
    Color? buttonTextColor;
    if (item.title is String) {
      child =AutoSizeText(
        item.title,
        style: ThemeTextStyles.keyPadNum,
      );
      buttonColor = item.buttonColor;
      buttonTextColor = item.textColor;
    } else if (item.title is IconData) {
      child = Icon(item.title ,size : 36,);
      buttonColor = item.buttonColor;
      buttonTextColor = item.textColor;
    }
    if (item.valueAlignment != null) {
      child = Align(
          alignment: item.valueAlignment!,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: child,
          ));
    }

    return Expanded(
      flex: 1,
      child: Container(
        width: item.width,
        height: item.height,
        child: RaisedButton(
          child: child,
          elevation: 0.0,
          onPressed: () => onPressed(item.value),
          color: buttonColor,
          textColor: buttonTextColor,
          shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.transparent, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(8))),
        ),
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
        this.width = ThemeSizeStyle.numberKeypadWidth,
        this.height = ThemeSizeStyle.numberKeypadHeight,
      this.valueAlignment}) {
    if (value == null) {
      value = title;
    }
  }
}

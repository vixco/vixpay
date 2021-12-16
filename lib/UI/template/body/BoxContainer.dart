import 'package:flutter/material.dart';
import 'package:yollet/UI/template.dart';

//기본으로 MediumBox 를 사용하세요...
//Large Box는 전체 화면을 걸칠때 사용합니다.
class MediumBoxContainer2 extends StatelessWidget {
  var _Widgets;

  MediumBoxContainer2(childWidget) {
    _Widgets = childWidget;
  }

  @override
  Widget build(BuildContext context) {
    return new Padding(
        padding:
            const EdgeInsets.only(top: 0.0, left: 0.0, right: 0.0, bottom: 8.0),
        child: Container(
            decoration: BoxDecoration(
              color: ThemeColors.white,
              /*boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4.5,
                    spreadRadius: 1.0,
                  )
                ]*/
            ),
            child: Padding(
                //padding: const EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0, bottom: 10.0),
                padding: const EdgeInsets.only(
                    top: 12.0, left: 12.0, right: 12.0, bottom: 12.0),
                child: _Widgets)));
  }
}

//기본으로 MediumBox 를 사용하세요...
//Large Box는 전체 화면을 걸칠때 사용합니다.
class MediumBoxContainer extends StatelessWidget {
  var child;
  BoxDecoration? decoration;

  MediumBoxContainer({
    required this.child,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    if (decoration == null) decoration = ThemeBoxDeco.whiteRound;

    return new Padding(
        padding:
            const EdgeInsets.only(top: 0.0, left: 0.0, right: 0.0, bottom: 8.0),
        child: Container(
            decoration: decoration,
            child: Padding(
                //padding: const EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0, bottom: 10.0),
                padding: const EdgeInsets.only(
                    top: 12.0, left: 12.0, right: 12.0, bottom: 12.0),
                child: child)));
  }
}

class MediumLargeBoxContainer extends StatelessWidget {
  var _Widgets;

  MediumLargeBoxContainer(childWidget) {
    _Widgets = childWidget;
  }

  @override
  Widget build(BuildContext context) {
    return new Padding(
        padding:
            const EdgeInsets.only(top: 0.0, left: 0.0, right: 0.0, bottom: 8.0),
        child: Container(
            decoration: BoxDecoration(
              color: ThemeColors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0.w),
                  topRight: Radius.circular(16.0.w)),
              /*boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4.5,
                    spreadRadius: 1.0,
                  )
                ]*/
            ),
            child: Padding(
                //padding: const EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0, bottom: 10.0),
                padding: const EdgeInsets.only(
                    top: 12.0, left: 12.0, right: 12.0, bottom: 12.0),
                child: _Widgets)));
  }
}

class InputGroupBox extends StatelessWidget {
  String title;
  Widget child;

  InputGroupBox({
    this.title = "",
    this.child = const AutoSizeText(""),
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      //color : Colors.red,
      //padding: EdgeInsets.only(left: 24.0, right: 24.0 , top: 24.0, bottom: 24.0),
      //margin : const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      width: double.infinity,
      //decoration: themeBoxDecoOrange.guideBoxDeco,
      /*
      decoration: BoxDecoration(
          color: ThemeColors.txtMainWhite,
          border: Border.all(
            color: ThemeColors.ReplyBlue100,
            width: 1.0,
          ),
          borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(16.0.w),
              bottomLeft: const Radius.circular(16.0.w),
              topRight: const Radius.circular(16.0.w))),*/
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MainSubjectOrange(
            text: title,
            textStyle: ThemeTextStyles.h4BlackB36,
            marginLeft: 0.0,
          ),
          Container(
            child: child,
          ),
          //그룹 하단의 여백 필요
          SizedBox(height : 6.0)
        ],
      ),
    );
  }
}

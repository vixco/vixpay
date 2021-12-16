import 'package:flutter/material.dart';
import 'package:yollet/themeStyle.dart'; //Color , Font, 각 위젯의 Style을 정의한 파일

class CircleBG extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      //백그라운드.
      padding: const EdgeInsets.only(left: 0.0, right: 0.0, top: 0.0, bottom: 4.0),
      child: Container(
          height: MediaQuery.of(context).size.height * 0.35, //30%
          width: double.infinity,
          decoration: BoxDecoration(color: ThemeColors.ReplyBlue500,
              //borderRadius: BorderRadius.all(Radius.circular(0.0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black45.withOpacity(0.4),
                  blurRadius: 4.5,
                  spreadRadius: 4.0,
                )
              ]),
          child: Stack(children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
              color: ThemeColors.ReplyBlue500,
            ),
            Positioned(
              bottom: -40.0,
              left: -80.0,
              child: Container(
                height: 400.0,
                width: 400.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(200.0),
                  color: ThemeColors.ReplyBlue400.withOpacity(0.7),
                ),
              ),
            ),
            Positioned(
              bottom: 100.0,
              right: -40.0,
              child: Container(
                  height: 300.0,
                  width: 300.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(150.0), color: ThemeColors.ReplyBlue300.withOpacity(0.7))),
            ),
          ])),
    );
  }
}

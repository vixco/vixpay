import 'package:flutter/material.dart';
import 'package:yollet/UI/template.dart';
import 'package:yollet/themeStyle.dart';

class SampleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:AutoSizeText("sample"), centerTitle: true),
      body: DefaultBody(Body()),
      bottomSheet: Footer(),
    );
  }
}

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var widgets = <Widget>[
      BottomButton(
        text: 'ok',
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    ];
    return ActionBtnFooterBarOrange(widgets,);
  }
}

class Body extends StatefulWidget {

@override
BodyState createState() => BodyState();
}

class BodyState extends State<Body> {
  @override
  void initState() {
    super.initState();
  }

 @override
  Widget build(BuildContext context) {
   return Container(color:ThemeColors.cool_gray_500,
      child: Column(
      children: <Widget>[
      BottomButton(
      text: 'ok',
      onPressed: () {
        Navigator.pop(context);
      },
    ),
   ThemeSpacingBox.spacing_xl,

   ],
   )
      ,);
  }
}



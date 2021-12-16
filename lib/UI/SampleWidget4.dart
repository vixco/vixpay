import 'package:flutter/material.dart';
import 'package:yollet/UI/template.dart';
import 'package:yollet/themeStyle.dart';

class SampleWidget4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultBody(Body(),appBarWidget: CustomAppBar(title: "ddd",),),
      bottomNavigationBar: BottomNavigationBarWidget(),
    );
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
      child:          Column(
        children: <Widget>[
          BtnBorder(
            text: 'ok',
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          ThemeSpacingBox.spacing_xl,
          BtnFill(
            text: 'ok',
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          ThemeSpacingBox.spacing_xl,
          KeyPadNumButton(text: "1",),
          ThemeSpacingBox.spacing_xl,
          KeyPadNumButton(text: "9",),
          ThemeSpacingBox.spacing_xl,
          KeyPadBackButton(),
        ],
      ),
      );
  }
}



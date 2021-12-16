import 'package:flutter/material.dart';
import 'package:yollet/UI/template.dart';
import 'package:yollet/themeStyle.dart';

class SampleWidget3 extends StatelessWidget {
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
    return Container(color:ThemeColors.white,
      child:          Column(
        children: <Widget>[
          KeypadBody(showDecimalPoint: true,onValue: (value){
            debugPrint(value);
          },),
        ],
      ),
      );
  }
}




import 'package:flutter/material.dart';
import 'package:yollet/Mgr/Navigation/app_routes.dart';
import 'package:yollet/Mgr/redux/action.dart';
import 'package:yollet/Mgr/redux/state.dart';
import 'package:yollet/UI/template.dart';
import 'package:yollet/themeStyle.dart';

class CreatePassCodePage  extends StatefulWidget {
  @override
  CreatePassCodePageState createState() => CreatePassCodePageState();
}

class CreatePassCodePageState extends State<CreatePassCodePage> {
  String? value="";
  String? validatePin ="";
  bool isDone =false;

  @override
  void initState() {
    super.initState();
    isDone = false;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultBody(Body(),appBarWidget: CustomAppBar(title: "sign_up",)),
      bottomSheet: Footer(),
    );
  }

  Widget Footer(){
    return Container(
        height:248.h ,
        color:ThemeColors.white,
        child:
        Column(
            children: [
              KeypadBody(showDecimalPoint: false,onValue: (v){
                setState(() {
                  value = v;
                });
              },inputText:value??"",),
              ThemeSpacingBox.spacing_l,
            ]
        )
    );
  }
  Widget Body() {
    // if(value!.length!=6){
    //   validatePin ='';
    // }
    return Container(color:ThemeColors.white,
      child: Column(
        children: <Widget>[
          SizedBox(height: 77.h,),
          SizedText(text: "create_your_passcode",textStyle: ThemeTextStyles.InputGroupSubject,alignment: Alignment.center,),
          SizedBox(height: 40.h,),
          DisplayPasswordWidget(inputCount:value!.length ,inputDone: () async {
            if(!isDone) {
              await appStore.dispatch(SetLoginInfoAction(loginPin:value));
              appStore.dispatch(NavigateToAction(to: AppRoutes.enterPassCode,replace: true));
              isDone=true;
            }
          },),
        ],
      ),
    );
  }
}




import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter/material.dart';
import 'package:yollet/Mgr/Navigation/app_routes.dart';
import 'package:yollet/Mgr/redux/action.dart';
import 'package:yollet/Mgr/redux/state.dart';
import 'package:yollet/UI/template.dart';
import 'package:yollet/themeStyle.dart';


class AssignTokenConfirmPage  extends StatefulWidget {
  @override
  AssignTokenConfirmPageState createState() => AssignTokenConfirmPageState();
}

class AssignTokenConfirmPageState extends State<AssignTokenConfirmPage>  {
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
      body: DefaultBody(Body(),appBarWidget: CustomAppBar(title: "assign_token",)),
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
          ThemeSpacingBox.spacing_xl,
          SizedText(text: "enter_your_passcode",textStyle: ThemeTextStyles.InputGroupSubject,alignment: Alignment.center,),
          ThemeSpacingBox.spacing_xl,
          DisplayPasswordWidget(inputCount:value!.length ,inputDone: () async {
            if(!isDone) {
              InitState state = StoreProvider.of<AppState>(context).state.initState;
              if(state.loginPin==value) {
                int result = await appStore.dispatch(AssignToken());
            if(result==0){
                  await appStore.dispatch(NavigateToAction(to: AppRoutes.assignTokenComplete,replace: true));
                }else{
              actionDialog(title: 'error',
                  text:  AppLocalizations.of(context)!.getString("assign_token_fail")+"($result)",
                  actions: <Widget>[
                    TextButton(
                      child:AutoSizeText(AppLocalizations.of(context)!.getString('ok')),
                      onPressed: () async {
                        await appStore.dispatch(NavigateToAction(to: AppRoutes.home));
                        await appStore.dispatch(NavigateToAction(to: AppRoutes.wallet));
                      },
                    ),
                  ]);

                }

                isDone=true;
              }else{
                setState(() {
                  validatePin = AppLocalizations.of(context)!.getString("invalid_passcode");
                  value="";
                });
              }
            }
          },),
          SizedText(height: 24.h,text:validatePin,textStyle: ThemeTextStyles.Error,),
          ThemeSpacingBox.spacing_xl,
          TextButton(
            child:AutoSizeText(AppLocalizations.of(context)!.getString("reset_passcode"),style: ThemeTextStyles.KeepMeLoggedIn,),
            onPressed: (){
              setState(() {
                //validatePin = "";
                value="";
              });
            },
          ),
        ],
      ),
    );
  }
}
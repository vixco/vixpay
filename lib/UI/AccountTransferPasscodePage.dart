
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:yollet/Mgr/Navigation/app_routes.dart';
import 'package:yollet/Mgr/redux/action.dart';
import 'package:yollet/Mgr/redux/state.dart';
import 'package:yollet/UI/template.dart';
import 'package:yollet/themeStyle.dart';


class AccountTransferPasscodePage  extends StatefulWidget {
  @override
  AccountTransferPasscodePageState createState() => AccountTransferPasscodePageState();
}

class AccountTransferPasscodePageState extends State<AccountTransferPasscodePage>  {
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

    return StoreConnector<AppState, YolletState>(
      converter: (store) => store.state.yolletState,
      builder: (_, YolletState state) =>Scaffold(
        body: DefaultBody(Body(), appBarWidget: CustomAppBar(
          title: "transfer",
          style:ThemeTextStyles.AppbarTitle,
          titleIcon: CoinImageWidget(url: state.currentTokenInfo.url,width:28.w,height: 28.h),
        )),
        bottomSheet: Footer(),
      ),
    );
  }

  // final String? inputText;
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
                isDone=true;
                if(await appStore.dispatch(DoTransfer())){
                  await appStore.dispatch(NavigateToAction(to: AppRoutes.accountTransferComplete, replace: true));
                }else{
                  await alertCallback(
                      "error", "transfer_fail",
                      callback: () {
                        appStore.dispatch(DismissPopupAction(result: null));
                      });
                }
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


import 'package:flutter/material.dart';
import 'package:yollet/Mgr/Navigation/app_routes.dart';
import 'package:yollet/Mgr/redux/action.dart';
import 'package:yollet/Mgr/redux/state.dart';
import 'package:yollet/UI/template.dart';
import 'package:yollet/themeStyle.dart';
import 'package:flutter_redux/flutter_redux.dart';

class EnterPassCodePage extends StatefulWidget {
  @override
  EnterPassCodePageState createState() => EnterPassCodePageState();
}

class EnterPassCodePageState extends State<EnterPassCodePage> {
  String? value = "";
  String? validatePin = "";
  bool isDone = false;

  @override
  void initState() {
    super.initState();
    isDone = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultBody(Body(),
          appBarWidget: CustomAppBar(
            title: "sign_up",
          )),
      bottomSheet: Footer(),
    );
  }

  Widget Footer() {
    return Container(
        height: 248.h,
        color: ThemeColors.white,
        child: Column(children: [
          KeypadBody(
            showDecimalPoint: false,
            onValue: (v) {
              setState(() {
                value = v;
              });
            },
            inputText: value ?? "",
          ),
          ThemeSpacingBox.spacing_l,
        ]));
  }

  Widget Body() {
    // if(value!.length!=6){
    //   validatePin ='';
    // }
    return Container(
      color: ThemeColors.white,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 77.h,
          ),
          SizedText(
            text: "reenter_your_passcode",
            textStyle: ThemeTextStyles.InputGroupSubject.apply(
                fontFamily: 'SpoqaRegular'),
            alignment: Alignment.center,
          ),
          SizedBox(
            height: 40.h,
          ),
          DisplayPasswordWidget(
            inputCount: value!.length,
            inputDone: () async {
              if (!isDone) {
                InitState state =
                    StoreProvider.of<AppState>(context).state.initState;
                if (state.loginPin == value) {
                  if (state.isLogin) {
                    await appStore.dispatch(SavePinAction(pin: value));
                    YolletState yolletState = appStore.state.yolletState;
                    if (yolletState.ethereumInfo.address.isEmpty) {
                      // String address = await appStore
                      //     .dispatch(CreateEthereumAddressAction());
                      // Map<String, dynamic>? others = Map();
                      // others["ethereum"] = address;
                      // await appStore.dispatch(UpdateUserOthers(others: others));
                      // await appStore
                      //     .dispatch(ExportEthereumKeyAction(address: address));
                      appStore.dispatch(NavigateToAction(
                          to: AppRoutes.exportCautionPage));
                    } else {
                      appStore.dispatch(NavigateToAction(to: AppRoutes.home));
                    }
                  } else {
                    if (await appStore.dispatch(SignUpAction())) {
                      appStore.dispatch(NavigateToAction(
                          to: AppRoutes.signUpComplete, replace: true));
                    } else {
                      appStore.dispatch(NavigateToAction(to: AppRoutes.signUp));
                    }
                  }
                  isDone = true;
                } else {
                  setState(() {
                    validatePin = AppLocalizations.of(context)!
                        .getString("invalid_passcode");
                    value = "";
                  });
                }
              }
            },
          ),
          SizedBox(
            height: 8.h,
          ),
          SizedText(
            height: 24.h,
            text: validatePin,
            textStyle: ThemeTextStyles.Error,
          ),
        ],
      ),
    );
  }
}

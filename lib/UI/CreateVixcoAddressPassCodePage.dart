import 'package:flutter/material.dart';
import 'package:yollet/Mgr/Navigation/app_routes.dart';
import 'package:yollet/Mgr/redux/action.dart';
import 'package:yollet/Mgr/redux/state.dart';
import 'package:yollet/UI/template.dart';
import 'package:yollet/themeStyle.dart';
import 'package:flutter_redux/flutter_redux.dart';

class CreateVixcoAddressPassCodePage extends StatefulWidget {
  @override
  CreateVixcoAddressPassCodePageState createState() => CreateVixcoAddressPassCodePageState();
}

class CreateVixcoAddressPassCodePageState extends State<CreateVixcoAddressPassCodePage> {
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
            title: "create_vixco_address",
              showBackIcon:false
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
            text: "enter_your_passcode",
            textStyle: ThemeTextStyles.InputGroupSubject,
            alignment: Alignment.center,
          ),
          SizedBox(
            height: 8.h,
          ),
          SizedText(
              textAlign: TextAlign.center,
              text: 'create_vixco_address_passCode_guide',
              textStyle: ThemeTextStyles
                  .CreateVixcoAddressPassCodePageGuide),
          SizedBox(
            height: 24.h,
          ),
          DisplayPasswordWidget(
            inputCount: value!.length,
            inputDone: () async {
              if (!isDone) {
                InitState state =
                    StoreProvider.of<AppState>(context).state.initState;
                if (state.loginPin == value) {
                  YolletState yolletState = appStore.state.yolletState;
                  if (yolletState.ethereumInfo.address.isEmpty) {
                    String address = await appStore
                        .dispatch(CreateEthereumAddressAction());
                    //move
                    // Map<String, dynamic>? others = Map();
                    // others["ethereum"] = address;
                    // await appStore.dispatch(UpdateUserOthers(others: others));
                    await appStore
                        .dispatch(ExportEthereumKeyAction(address: address));
                    appStore.dispatch(NavigateToAction(
                        to: AppRoutes.createAccountConfirmMnemonic,replace: true));
                  } else {
                    appStore.dispatch(NavigateToAction(to: AppRoutes.home));
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

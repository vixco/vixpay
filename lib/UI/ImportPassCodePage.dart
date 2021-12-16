import 'package:flutter/material.dart';
import 'package:yollet/Mgr/Navigation/app_routes.dart';
import 'package:yollet/Mgr/redux/action.dart';
import 'package:yollet/Mgr/redux/state.dart';
import 'package:yollet/UI/template.dart';
import 'package:yollet/themeStyle.dart';
import 'package:flutter_redux/flutter_redux.dart';

class ImportPassCodePage extends StatefulWidget {
  @override
  ImportPassCodePageState createState() => ImportPassCodePageState();
}

class ImportPassCodePageState extends State<ImportPassCodePage> {
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
            title: "import_vixco_address",
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
            height: 40.h,
          ),
          DisplayPasswordWidget(
            inputCount: value!.length,
            inputDone: () async {
              if (!isDone) {
                InitState state =
                    StoreProvider.of<AppState>(context).state.initState;
                if (state.loginPin == value) {
                  YolletState yolletState = appStore.state.yolletState;
                  String? address = await appStore.dispatch(ImportEthereumKeyAction(mnemonic:
                  yolletState.importEthereumMnemonicPhrase));
                  if(address!=null) {
                    Map<String, dynamic>? others = Map();
                    others["ethereum"] = address;
                    await appStore.dispatch(UpdateUserOthers(others: others));
                    await appStore.dispatch(SetEthereumAddressAction(address: address));
                    await appStore.dispatch(QueryEthBalanceAction());
                    appStore.dispatch(NavigateToAction(to: AppRoutes.importEthAccountCompletePage));
                  }else{
                    await alertCallback("error", "import_fail", callback: () {
                      appStore.dispatch(DismissPopupAction(result: null));
                      appStore.dispatch(NavigateToAction(to: AppRoutes.setting));
                    });
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

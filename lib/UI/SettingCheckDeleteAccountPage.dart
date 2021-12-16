import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:yollet/Mgr/Navigation/app_routes.dart';
import 'package:yollet/Mgr/redux/action.dart';
import 'package:yollet/Mgr/redux/state.dart';
import 'package:yollet/UI/template.dart';
import 'package:yollet/themeStyle.dart';

class SettingCheckDeleteAccountPage extends StatefulWidget {
  @override
  SettingCheckDeleteAccountPageState createState() =>
      SettingCheckDeleteAccountPageState();
}

class SettingCheckDeleteAccountPageState
    extends State<SettingCheckDeleteAccountPage> {
  String _password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultScrollBody(Body(),
          appBarWidget: CustomAppBar(
            title: "delete_account",
          )),
      // bottomSheet: ,
    );
  }

  Widget Footer() {
    YolletState yState = StoreProvider.of<AppState>(context).state.yolletState;

    return Container(
        // height:72.h ,
        color: ThemeColors.white,
        child: Column(children: [
          BottomButton(
            horizontalPadding: 0,
            text: "confirm",
            onPressed: () async {
              if (_password.isEmpty) {
                return;
              }
              actionDialog<bool>(
                  title: "delete_account",
                  text: "delete_account_q",
                  actions: <Widget>[
                    TextButton(
                      onPressed: () =>
                          appStore.dispatch(DismissPopupAction(result: false)),
                      child: AutoSizeText(
                          AppLocalizations.of(context)!.getString('no')),
                    ),
                    TextButton(
                      onPressed: () async {
                        appStore.dispatch(DismissPopupAction());
                        String result = await appStore
                            .dispatch(UnregisterAction(password: _password));
                        if (result == "00") {
                          await appStore.dispatch(RemoveAccount(
                            walletList: yState.walletList,
                            addressList: yState.addressInfoList,
                          ));
                          await appStore.dispatch(DeletePinAction());
                          await appStore.dispatch(DoLogoutAction());
                          appStore
                              .dispatch(NavigateToAction(to: AppRoutes.intro));
                        } else if (result == "02") {
                          actionDialog(
                              title: 'error',
                              text: "invalid_password",
                              actions: <Widget>[
                                TextButton(
                                  child: AutoSizeText(
                                      AppLocalizations.of(context)!
                                          .getString('ok')),
                                  onPressed: () {
                                    appStore.dispatch(DismissPopupAction());
                                  },
                                ),
                              ]);
                        } else {
                          actionDialog(
                              title: 'error',
                              text: AppLocalizations.of(context)!
                                      .getString('error') +
                                  " " +
                                  result,
                              actions: <Widget>[
                                TextButton(
                                  child: AutoSizeText(
                                      AppLocalizations.of(context)!
                                          .getString('ok')),
                                  onPressed: () {
                                    appStore.dispatch(DismissPopupAction());
                                  },
                                ),
                              ]);
                        }
                      },
                      child: AutoSizeText(
                          AppLocalizations.of(context)!.getString('yes')),
                    )
                  ]);
            },
          ),
          ThemeSpacingBox.spacing_l,
        ]));
  }

  Widget Body() {
    return Container(
      color: ThemeColors.white,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 12.h,
          ),
          InputGroupSubject(text: "confirm_password"),
          SizedBox(
            height: 16.h,
          ),
          CustomTextFieldWidget(
              labelText: "password",
              onChanged: (s) => _password = s,
              isPassword: true),
          // _customTextField(controller: _passwordController,hintText:"Password",isPassword:true),
          SizedBox(
            height: 410.h,
          ),
          Footer(),
        ],
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:yollet/Mgr/Navigation/app_routes.dart';
import 'package:yollet/Mgr/redux/action.dart';
import 'package:yollet/Mgr/redux/state.dart';
import 'package:yollet/UI/template.dart';
import 'package:yollet/Util/Common/CountDownTimer.dart';
import 'package:yollet/Util/Format/NumberFormatUtil.dart';
import 'package:yollet/themeStyle.dart';

class FindPasswordCautionPage extends StatefulWidget {
  @override
  FindPasswordCautionPageState createState() => FindPasswordCautionPageState();
}

class FindPasswordCautionPageState extends State<FindPasswordCautionPage> {
  String mnemonicPhrase = "";

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, InitState>(
        converter: (store) => store.state.initState,
        builder: (_, InitState state) => Scaffold(
              body: DefaultBody(Body(),
                  appBarWidget: CustomAppBar(
                    title: "issue_temp_password",
                    showBackIcon: false,
                  )),
              bottomSheet: Footer(state),
            ));
  }

  Widget Footer(InitState state) {
    return Container(
        height: 72.h,
        color: ThemeColors.white,
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BottomButton(
                  text: "issue_temp_password_reset",
                  onPressed: () async {
                    String phoneNo = state.loginPhone;
                    String result = await appStore.dispatch(
                        SendVerificationAction(mobileNumber: phoneNo));
                    if (result == "00") {
                      appStore.dispatch(
                        NavigateToAction(
                            to: AppRoutes.findPasswordVerifyPage,
                            replace: true),
                      );
                      // }else if (result=="22") {
                      //   actionDialog(title: 'error',
                      //       text: "already_have_user_account",
                      //       actions: <Widget>[
                      //         TextButton(
                      //           child:AutoSizeText(AppLocalizations.of(context)!.getString('ok')),
                      //           onPressed: () {
                      //             appStore.dispatch(DismissPopupAction());
                      //           },
                      //         ),
                      //       ]);
                    } else if (result == "01") {
                      actionDialog(
                          title: 'error',
                          text: "invalid_phonenumber",
                          actions: <Widget>[
                            TextButton(
                              child: AutoSizeText(AppLocalizations.of(context)!
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
                                  .getString('invalid_phonenumber') +
                              " - $result",
                          actions: <Widget>[
                            TextButton(
                              child: AutoSizeText(AppLocalizations.of(context)!
                                  .getString('ok')),
                              onPressed: () {
                                appStore.dispatch(DismissPopupAction());
                              },
                            ),
                          ]);
                    }
                  })
            ],
          ),
        ]));
  }

  Widget Body() {
    return Container(
      color: ThemeColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 30.h,
          ),
          Container(
              child: Center(
                  child: Icon(
            YolletIcons.warning,
            color: ThemeColors.sub_color_pink,
            size: 58.w,
          ))),
          SizedBox(
            height: 24.h,
          ),
          SizedText(
            text: "press_reset_to_initialize",
            textStyle: ThemeTextStyles.ImportCautionGuide1,
            alignment: Alignment.center,
          ),
          SizedBox(
            height: 32.h,
          ),
          SizedText(
            text: "issue_temp_password_reset_continue",
            textAlign: TextAlign.center,
            textStyle: ThemeTextStyles.ImportCautionGuide2,
            alignment: Alignment.center,
          ),
        ],
      ),
    );
  }
}

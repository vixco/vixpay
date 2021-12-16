import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:yollet/Mgr/Navigation/app_routes.dart';
import 'package:yollet/Mgr/redux/action.dart';
import 'package:yollet/Mgr/redux/state.dart';
import 'package:yollet/UI/template.dart';
import 'package:yollet/Util/Common/CountDownTimer.dart';
import 'package:yollet/themeStyle.dart';

class FindPasswordVerifyPage extends StatefulWidget {
  @override
  FindPasswordVerifyPageState createState() => FindPasswordVerifyPageState();
}

class FindPasswordVerifyPageState extends State<FindPasswordVerifyPage> {
  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;
  String phoneNo = "";
  String verificationCode = "";
  bool isVerifyNumberMode = true;
  int secondsRemaining = 3 * 60;
  bool toggleSecondsRemaining = false;
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, InitState>(
        converter: (store) => store.state.initState,
        builder: (_, InitState state) => Scaffold(
              body: DefaultBody(Body(state),
                  appBarWidget: CustomAppBar(
                    title: "issue_temp_password",
                  )),
              bottomSheet: Footer(),
            ));
  }

  Widget Footer() {
    return Container(
        height: 72.h,
        color: ThemeColors.white,
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BottomButton(
                text: "confirm",
                onPressed: verificationCode.isNotEmpty
                    ? () async {
                        Map map = await appStore.dispatch(ResetPasswordAction(
                            verificationCode: verificationCode));
                        String result = map["resCode"];
                        String message = map["resMessage"];
                        if (result == "00") {
                          setState(() {
                            secondsRemaining = 0;
                          });
                          appStore.dispatch(
                            NavigateToAction(
                                to: AppRoutes.findPasswordComplete,
                                replace: true),
                          );
                        } else if (result == "21") {
                          actionDialog(
                              title: 'error',
                              text: "valid_time_is_expired",
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
                        } else if (result == "20") {
                          actionDialog(
                              title: 'error',
                              text: "invalid_verification_number",
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
                              text:
                                  "invalid_verification_number - [$result]$message",
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
                      }
                    : null,
              ),
            ],
          ),
        ]));
  }

  Widget Body(InitState state) {
    phoneNo = state.loginPhone;
    return Container(
      color: ThemeColors.white,
      child: Form(
        key: _key,
        autovalidate: _validate,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20.h,
            ),
            InputGroupSubject(
              text: "enter_mobile_number_for_verification",
              textStyle: ThemeTextStyles.FindPassVerifyPageTitle,
            ),
            SizedBox(
              height: 47.h,
            ),
            CustomTextFieldWidget(
                labelText: "phone_number",
                initText: phoneNo,
                isPassword: false,
                readOnly: true),
            Column(
              children: <Widget>[
                ThemeSpacingBox.spacing_xl,
                CustomTextFieldWidget(
                    labelText: "verification_number",
                    onChanged: (s) => setState(() {
                          verificationCode = s;
                        }),
                    keyboardType: TextInputType.number),
                ThemeSpacingBox.spacing_xl,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        AutoSizeText(
                          AppLocalizations.of(context)!
                                  .getString("remaining_time") +
                              " : ",
                          style: ThemeTextStyles.signupRemainTime,
                        ),
                        CountDownTimer(
                            secondsRemaining: secondsRemaining,
                            whenTimeExpires: () {
                              actionDialog(
                                  title: 'error',
                                  text: "valid_time_is_expired",
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
                            },
                            countDownTimerStyle:
                                ThemeTextStyles.signupRemainTime),
                      ],
                    ),
                    BtnBorder(
                      width: 96.w,
                      height: 32.h,
                      text: "re-send",
                      onPressed: () async {
                        await appStore.dispatch(
                            SendVerificationAction(mobileNumber: phoneNo));
                        setState(() {
                          if (toggleSecondsRemaining) {
                            secondsRemaining = 3 * 60;
                            toggleSecondsRemaining = false;
                          } else {
                            secondsRemaining = 3 * 60 + 1;
                            toggleSecondsRemaining = true;
                          }
                        });
                      },
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:yollet/Mgr/Navigation/app_routes.dart';
import 'package:yollet/Mgr/redux/action.dart';
import 'package:yollet/Mgr/redux/state.dart';
import 'package:yollet/UI/template.dart';
import 'package:yollet/themeStyle.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultScrollBody(
        Body(),
      ),
      bottomNavigationBar: Footer(),
    );
  }
}

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 72.h,
        color: ThemeColors.white,
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AutoSizeText(AppLocalizations.of(context)!
                  .getString("do_not_have_an_account_q")),
              TextButton(
                child: AutoSizeText(
                  AppLocalizations.of(context)!.getString("sign_up"),
                  style: ThemeTextStyles.introLogin,
                ),
                onPressed: () {
                  appStore
                      .dispatch(NavigateToAction(to: AppRoutes.signUpTerms));
                },
              ),
            ],
          ),
          // ThemeSpacingBox.spacing_l,
        ]));
  }
}

class Body extends StatefulWidget {
  @override
  BodyState createState() => BodyState();
}

class BodyState extends State<Body> {
  // TextEditingController _loginIdController = TextEditingController();
  // TextEditingController _passwordController = TextEditingController();
  String _loginId = "";
  String _password = "";
  bool isKeepLogin = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ThemeColors.white,
      child: Column(children: [
        Container(
          padding: EdgeInsets.only(
            top: 64.h,
            bottom: 53.h,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                  width: 154.w,
                  height: 38.h,
                  fit: BoxFit.contain,
                  image: AssetImage('assets/img/login_title.png')),
              // SizedBox(width: 6.w,),
              // SizedText(height : 35.h,text:"Yollet",textStyle: ThemeTextStyles.loginAppName,alignment: Alignment.center,)
            ],
          ),
        ),
        InputGroupSubject(text: "login_to_your_account"),
        ThemeSpacingBox.spacing_xl,
        // _customTextField(controller: _loginIdController,hintText: "Email Id"),
        CustomTextFieldWidget(
            labelText: "phone_number",
            onChanged: (s) => _loginId = s,
            keyboardType: TextInputType.phone),
        ThemeSpacingBox.spacing_xl,
        // _customTextField(controller: _passwordController,hintText: "Password", isPassword: true),
        CustomTextFieldWidget(
          labelText: "password",
          isPassword: true,
          onChanged: (s) => _password = s,
        ),
        SizedBox(
          height: 16.h,
        ),
        Row(
          children: [
            CircleCheckbox(
              value: isKeepLogin,
              size: 20.w,
              onChanged: (v) {
                setState(() {
                  isKeepLogin = v;
                });
              },
            ),
            SizedBox(
              width: 8.w,
            ),
            AutoSizeText(
              AppLocalizations.of(context)!.getString("keep_me_logged_in"),
              style: ThemeTextStyles.forgotPassword,
            ),
          ],
        ),
        ThemeSpacingBox.spacing_xl,
        BottomButton(
          text: "login",
          onPressed: () async {
            // appStore
            //     .dispatch(NavigateToAction(to: AppRoutes.findPasswordComplete));

            if (_loginId.isNotEmpty && _password.isNotEmpty) {
              await appStore.dispatch(SetLoginInfoAction(
                loginPhone: _loginId,
                loginPw: _password,
              ));
              await appStore.dispatch(DoLoginAction(keepLogin: isKeepLogin));
              InitState initState = appStore.state.initState;

              if (initState.isLogin) {
                if (initState.loginPin.isEmpty) {
                  appStore
                      .dispatch(NavigateToAction(to: AppRoutes.createPassCode));
                } else {
                  YolletState yolletState = appStore.state.yolletState;
                  if (yolletState.ethereumInfo.address.isEmpty) {
                    appStore.dispatch(NavigateToAction(
                      to: AppRoutes.exportCautionPage,
                    ));
                  } else {
                    appStore.dispatch(NavigateToAction(to: AppRoutes.home));
                  }
                }
              } else {
                var code = initState.resCodeLogin;
                var message = initState.messageLogin;
                debugPrint('error code: $code message: $message');
                actionDialog(
                    title: 'error',
                    text: "login_fail_please_check_input_field",
                    actions: <Widget>[
                      TextButton(
                        child: AutoSizeText(
                            AppLocalizations.of(context)!.getString('ok')),
                        onPressed: () {
                          appStore.dispatch(DismissPopupAction());
                        },
                      ),
                    ]);
              }
            } else {
              actionDialog<bool?>(title: 'fail', text: 'please_input_text');
            }
          },
          horizontalPadding: 0,
        ),
        ThemeSpacingBox.spacing_l,
        TextButton(
          child: AutoSizeText(
            AppLocalizations.of(context)!.getString("forgot_your_password_q"),
            style: ThemeTextStyles.forgotPassword,
          ),
          onPressed: () {
            appStore.dispatch(NavigateToAction(
              to: AppRoutes.findPasswordPhoneNumberPage,
            ));
            // actionDialog<bool?>(
            //     title: 'find_password', text: 'Visit http://vixco.net/');
          },
        ),
      ]),
    );
  }
}

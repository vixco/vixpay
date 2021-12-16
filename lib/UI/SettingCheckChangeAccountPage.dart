import 'package:flutter/material.dart';
import 'package:yollet/Mgr/Navigation/app_routes.dart';
import 'package:yollet/Mgr/redux/action.dart';
import 'package:yollet/Mgr/redux/state.dart';
import 'package:yollet/UI/template.dart';
import 'package:yollet/themeStyle.dart';

class SettingCheckChangeAccountPage extends StatefulWidget {
  @override
  SettingCheckChangeAccountPageState createState() =>
      SettingCheckChangeAccountPageState();
}

class SettingCheckChangeAccountPageState
    extends State<SettingCheckChangeAccountPage> {
  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;
  String _password = "";
  String? pw;
  String? pw2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultScrollBody(Body(),
          appBarWidget: CustomAppBar(
            title: "change_password",
          )),
      // bottomSheet: ,
    );
  }

  Widget Footer() {
    return Container(
        // height: 72.h,
        color: ThemeColors.white,
        child: Column(children: [
          BottomButton(
            horizontalPadding: 0,
            text: "confirm",
            onPressed: () async {
              if (_key.currentState!.validate()) {
                _validate = false;
                _key.currentState!.save();

                if (await appStore.dispatch(ChangePasswordAction(
                    oldPassword: _password, newPassword: pw))) {
                  appStore.dispatch(NavigateToAction(to: 'up'));
                } else {
                  actionDialog(
                      title: 'error',
                      text: "invalid_password",
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
                setState(() {
                  _validate = true;
                });
              }
            },
          ),
          ThemeSpacingBox.spacing_l,
        ]));
  }

  Widget Body() {
    return Container(
      color: ThemeColors.white,
      child: Form(
        key: _key,
        autovalidate: _validate,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 12.h,
            ),
            InputGroupSubject(text: "enter_your_current_password"),
            SizedBox(
              height: 16.h,
            ),
            CustomTextFieldWidget(
                labelText: "password",
                onChanged: (s) => _password = s,
                isPassword: true),
            ThemeSpacingBox.spacing_l,
            ThemeSpacingBox.spacing_l,
            InputGroupSubject(text: "enter_your_new_password"),
            ThemeSpacingBox.spacing_l,
            CustomTextFieldWidget(
              labelText: "password",
              onChanged: (s) => pw = s,
              validator: validatePassword,
              isPassword: true,
            ),
            ThemeSpacingBox.spacing_l,
            CustomTextFieldWidget(
              labelText: "confirm_password",
              onChanged: (s) => pw2 = s,
              validator: validatePassword2,
              isPassword: true,
            ),
            // _customTextField(controller: _passwordController,hintText:"Password",isPassword:true),
            Container(
              height: 180.h,
            ),
            Footer()
          ],
        ),
      ),
    );
  }

  String? validatePassword(String? value) {
    if (value != null && value.length < 6)
      return AppLocalizations.of(context)!
          .getString('password_must_be_more_than_6_charater');
    else
      return null;
  }

  String? validatePassword2(String? value) {
    if (value != null && value.length < 6)
      return AppLocalizations.of(context)!
          .getString('password_must_be_more_than_6_charater');
    if (pw != value)
      return AppLocalizations.of(context)!
          .getString('password_and_confirmation_password_are_different');
    else
      return null;
  }
}

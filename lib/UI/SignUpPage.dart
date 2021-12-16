import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:yollet/Mgr/Navigation/app_routes.dart';
import 'package:yollet/Mgr/redux/action.dart';
import 'package:yollet/Mgr/redux/state.dart';
import 'package:yollet/UI/template.dart';
import 'package:yollet/themeStyle.dart';

class SignUpPage extends StatefulWidget {
  @override
  SignUpPageState createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;

  String? phoneNo;
  String? userName;
  String? pw;
  String? pw2;
  String? email;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, InitState>(
        converter: (store) => store.state.initState,
        builder: (_, InitState state) => Scaffold(
              body: DefaultScrollBody(
                Body(state),
                appBarWidget: CustomAppBar(
                  title: "sign_up",
                ),
                // footerHeight: 72.h,
              ),
              // bottomSheet: ,
            ));
  }

  Widget Footer() {
    return Container(
        // height: 72.h,
        color: ThemeColors.white,
        child: BottomButton(
          horizontalPadding: 0,
          text: "confirm",
          onPressed: () async {
            if (_key.currentState!.validate()) {
              _validate = false;
              _key.currentState!.save();
              await appStore.dispatch(SetLoginInfoAction(
                loginEmail: email,
                loginPw: pw,
                loginPhone: phoneNo,
                loginUserName: userName,
              ));
              appStore.dispatch(NavigateToAction(to: AppRoutes.createPassCode));
              if (await appStore.dispatch(SignUpAction())) {
                appStore.dispatch(NavigateToAction(
                    to: AppRoutes.signUpComplete, replace: true));
              } else {
                appStore.dispatch(NavigateToAction(to: AppRoutes.signUp));
              }
            } else {
              setState(() {
                _validate = true;
              });
            }
          },
        ));
  }

  Widget Body(InitState state) {
    phoneNo = state.loginPhone;
    return Column(
      children: [
        Container(
            color: ThemeColors.white,
            child: Form(
              key: _key,
              autovalidate: _validate,
              child: Column(
                children: <Widget>[
                  // InputGroupSubject(text: "mandatory"),
                  // ThemeSpacingBox.spacing_l,
                  CustomTextFieldWidget(
                      labelText: "user_name",
                      onChanged: (s) => userName = s,
                      autofocus: true,
                      isPassword: false),
                  ThemeSpacingBox.spacing_l,
                  CustomTextFieldWidget(
                    labelText: "phone_number",
                    onChanged: (s) => phoneNo = s,
                    validator: validateMobile,
                    isPassword: false,
                    keyboardType: TextInputType.phone,
                    initText: state.loginPhone,
                    readOnly: true,
                  ),
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
                  ThemeSpacingBox.spacing_l,
                  InputGroupSubject(text: "option"),
                  ThemeSpacingBox.spacing_l,
                  CustomTextFieldWidget(
                      labelText: "email_id",
                      onChanged: (s) => email = s,
                      validator: validateEmail,
                      isPassword: false,
                      keyboardType: TextInputType.emailAddress),
                  Container(
                    height: 100.h,
                  )
                ],
              ),
            )),
        Footer()
      ],
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

  // String? validatePhoneNo(String? value) {
  //   if (value!=null && value.length < 9 || value!=null && value.length > 12)
  //     return AppLocalizations.of(context)!.getString('telephone_number_must_be_of_9_12_digit');
  //   else
  //     return null;
  // }

  String? validateMobile(String? value) {
    // String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    const pattern = r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$';

    RegExp regExp = RegExp(pattern);
    if (value != null && value.length == 0) {
      return AppLocalizations.of(context)!
          .getString("please_enter_mobile_number");
    } else if (value != null && !regExp.hasMatch(value)) {
      return AppLocalizations.of(context)!
          .getString("please_enter_valid_mobile_number");
    }
    return null;
  }

  String? validateEmail(String? value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (value == null || value.length == 0)
      return null;
    else if (value != null && !regex.hasMatch(value))
      return AppLocalizations.of(context)!.getString("enter_valid_email");
    else
      return null;
  }
}

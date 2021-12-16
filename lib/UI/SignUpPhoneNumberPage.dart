import 'package:flutter/material.dart';
import 'package:yollet/Mgr/Navigation/app_routes.dart';
import 'package:yollet/Mgr/redux/action.dart';
import 'package:yollet/Mgr/redux/state.dart';
import 'package:yollet/UI/template.dart';
import 'package:yollet/Util/Common/CountDownTimer.dart';
import 'package:yollet/themeStyle.dart';

class SignUpPhoneNumberPage extends StatefulWidget {

  @override
  SignUpPhoneNumberPageState createState() => SignUpPhoneNumberPageState();
}

class SignUpPhoneNumberPageState extends State<SignUpPhoneNumberPage> {
  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;
  String phoneNo="";
  String verificationCode="";
  bool isVerifyNumberMode=false;
  int secondsRemaining = 3*60;
  bool toggleSecondsRemaining = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultBody(Body(),appBarWidget: CustomAppBar(title: "sign_up",)),
      bottomSheet: Footer(),
    );
  }

  Widget Footer(){
    return Container(
        height:72.h ,
        color:ThemeColors.white,
        child:
        Column(
            children: [ Row(
              mainAxisAlignment:MainAxisAlignment.center ,
              children: [
                Visibility(
                  visible:!isVerifyNumberMode,
                  child:BottomButton(
                    text: "send_verification_code",
                    onPressed: phoneNo.isNotEmpty
                        ?() async {
                      if (_key.currentState!.validate()) {
                        _validate = false;
                        _key.currentState!.save();
                        String result = await appStore.dispatch(SendVerificationAction(mobileNumber:phoneNo));

                        if (result=="00") {
                          setState(() {
                            isVerifyNumberMode=true;
                          });
                        }else if (result=="22") {
                          actionDialog(title: 'error',
                              text: "already_have_user_account",
                              actions: <Widget>[
                                TextButton(
                                  child:AutoSizeText(AppLocalizations.of(context)!.getString('ok')),
                                  onPressed: () {
                                    appStore.dispatch(DismissPopupAction());
                                  },
                                ),
                              ]);
                        }else if (result=="01") {
                          actionDialog(title: 'error',
                              text: "invalid_phonenumber",
                              actions: <Widget>[
                                TextButton(
                                  child:AutoSizeText(AppLocalizations.of(context)!.getString('ok')),
                                  onPressed: () {
                                    appStore.dispatch(DismissPopupAction());
                                  },
                                ),
                              ]);
                        }else{
                          actionDialog(title: 'error',
                              text: AppLocalizations.of(context)!.getString('invalid_phonenumber')+" - $result",
                              actions: <Widget>[
                                TextButton(
                                  child:AutoSizeText(AppLocalizations.of(context)!.getString('ok')),
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
                    }
                        :null,
                  ),
                ),
                Visibility(
                  visible:isVerifyNumberMode,
                  child:BottomButton(
                    text: "confirm",
                    onPressed: verificationCode.isNotEmpty
                        ?() async {
                      String result = await appStore.dispatch(VerifyVerificationAction(verificationCode:verificationCode));
                      if (result=="00") {
                        setState(() {
                            secondsRemaining = 0;
                        });
                        appStore.dispatch(NavigateToAction(to: AppRoutes.signUp,replace: true));
                      }else if (result=="21") {
                        actionDialog(title: 'error',
                            text: "valid_time_is_expired",
                            actions: <Widget>[
                              TextButton(
                                child:AutoSizeText(AppLocalizations.of(context)!.getString('ok')),
                                onPressed: () {
                                  appStore.dispatch(DismissPopupAction());
                                },
                              ),
                            ]);
                      }else if (result=="20") {
                        actionDialog(title: 'error',
                            text: "invalid_verification_number",
                            actions: <Widget>[
                              TextButton(
                                child:AutoSizeText(AppLocalizations.of(context)!.getString('ok')),
                                onPressed: () {
                                  appStore.dispatch(DismissPopupAction());
                                },
                              ),
                            ]);
                      }else{
                        actionDialog(title: 'error',
                            text: "invalid_verification_number - $result",
                            actions: <Widget>[
                              TextButton(
                                child:AutoSizeText(AppLocalizations.of(context)!.getString('ok')),
                                onPressed: () {
                                  appStore.dispatch(DismissPopupAction());
                                },
                              ),
                            ]);
                      }
                    }
                        :null,
                  ),
                ),
              ],),
              ThemeSpacingBox.spacing_l,
            ]
        )
    );
  }
  Widget Body() {
    return Container(color:ThemeColors.white,
      child:  Form(
        key: _key,
        autovalidate: _validate,
        child:Column(
          children: <Widget>[
            SizedBox(height: 12.h,),
            InputGroupSubject(text: "enter_mobile_number_for_verification"),
            SizedBox(height: 16.h,),
            CustomTextFieldWidget(labelText: "phone_number",
                onChanged: (s)=>setState(() {phoneNo=s;}),validator: validateMobile,isPassword: false,keyboardType: TextInputType.phone, readOnly:isVerifyNumberMode),
            Visibility(
                visible:isVerifyNumberMode,
                child:Column(
                  children: <Widget>[
                    ThemeSpacingBox.spacing_xl,
                    CustomTextFieldWidget(labelText: "verification_number", onChanged: (s)=>setState(() {verificationCode=s;}),keyboardType: TextInputType.number),
                    ThemeSpacingBox.spacing_xl,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          AutoSizeText(
                            AppLocalizations.of(context)!.getString("remaining_time")+ " : ",
                            style: ThemeTextStyles.signupRemainTime,
                          ),
                          CountDownTimer(
                              secondsRemaining: secondsRemaining,
                              whenTimeExpires: () {
                                actionDialog(title: 'error',
                                    text: "valid_time_is_expired",
                                    actions: <Widget>[
                                      TextButton(
                                        child:AutoSizeText(AppLocalizations.of(context)!.getString('ok')),
                                        onPressed: () {
                                          appStore.dispatch(DismissPopupAction());
                                        },
                                      ),
                                    ]);
                              },
                              countDownTimerStyle:ThemeTextStyles.signupRemainTime
                            // TextStyle(
                            //   color: Color(0XFFf5a623),
                            //   fontSize: 17.0,
                            //   height: 1.2),
                          ),
                        ],),
                        BtnBorder( width: 96.w,height: 32.h,text: "re-send",
                          onPressed: () async {
                            await appStore.dispatch(SendVerificationAction(mobileNumber:phoneNo));
                            setState(() {
                              if(toggleSecondsRemaining) {
                                secondsRemaining = 3*60;
                                toggleSecondsRemaining=false;
                              }else{
                                secondsRemaining = 3*60+1;
                                toggleSecondsRemaining = true;
                              }
                            });
                          },
                        ),
                      ],)
                  ],
                )
            )
          ],
        ),
      ),
    );
  }

  String? validateMobile(String? value) {
    // String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    const pattern = r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$';

    RegExp regExp = RegExp(pattern);
    if (value!=null && value.length == 0) {
      return AppLocalizations.of(context)!.getString("please_enter_mobile_number");
    }
    else if (value!=null && !regExp.hasMatch(value)) {
      return AppLocalizations.of(context)!.getString("please_enter_valid_mobile_number");
    }
    return null;
  }
}




import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:yollet/Mgr/Navigation/app_routes.dart';
import 'package:yollet/Mgr/redux/action.dart';
import 'package:yollet/Mgr/redux/state.dart';
import 'package:yollet/UI/template.dart';
import 'package:yollet/themeStyle.dart';

class MerchantRegistrationPage extends StatefulWidget {
  @override
  MerchantRegistrationPageState createState() =>
      MerchantRegistrationPageState();
}

class MerchantRegistrationPageState extends State<MerchantRegistrationPage> {
  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;
  String? id = '';
  String? pw = '';
  String? domain;
  @override
  void initState() {
    super.initState();
    appStore.dispatch(GetLoginDomainsAction());
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, InitState>(
        converter: (store) => store.state.initState,
        builder: (_, InitState state) => Scaffold(
              body: DefaultScrollBody(
                Body(state),
                appBarWidget: CustomAppBar(
                  title: "merchant_authentication",
                  onPressed: () {
                    appStore.dispatch(
                      NavigateToAction(to: AppRoutes.setting, replace: true),
                    );
                  },
                ),
              ),
              // bottomSheet: ,
            ));
  }

  Widget Footer() {
    return Container(
        height: 72.h,
        color: ThemeColors.white,
        child: Column(children: [
          BottomButton(
            horizontalPadding: 0,
            text: "next",
            onPressed: validateId(id) != null || validatePassword(pw) != null
                ? null
                : () async {
                    var result = await appStore.dispatch(MerchantLoginAction(
                        loginId: id ?? "",
                        loginPw: pw ?? "",
                        loginDomain: domain ?? ""));
                    if (result) {
                      appStore.dispatch(
                        NavigateToAction(
                            to: AppRoutes.merchantRegistrationVerify,
                            replace: false),
                      );
                    } else {
                      actionDialog(
                          title: 'error',
                          text: "merchant_login_fail",
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

                    //TODO ONPRESS action need to be added
                    // if (_key.currentState!.validate()) {
                    //   _validate = false;
                    //   _key.currentState!.save();
                    //   actionDialog(
                    //       title: 'info',
                    //       text: 'change_password',
                    //       actions: <Widget>[
                    //         BtnFillPopup(
                    //           child: AutoSizeText(
                    //             AppLocalizations.of(context)!.getString('ok'),
                    //             style: ThemeTextStyles.BottomButton,
                    //           ),
                    //           onPressed: () {
                    //             appStore.dispatch(DismissPopupAction());
                    //           },
                    //         ),
                    //       ]);
                    // } else {
                    //   setState(() {
                    //     _validate = true;
                    //   });
                    // }
                  },
          ),
        ]));
  }

  Widget Body(InitState state) {
    if (state.domainList.isNotEmpty) {
      domain = domain ?? state.domainList.first;
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedText(
              text: "please_input_login_and_password_and_domain",
              textStyle: ThemeTextStyles.MerchantRegistrationPageMiddle,
            ),
          ],
        ),
        SizedBox(
          height: 46.h,
        ),
        Container(
          color: ThemeColors.white,
          child: Form(
            key: _key,
            autovalidate: _validate,
            child: Column(
              children: <Widget>[
                CustomTextFieldWidget(
                  labelText: "merchant_login_id",
                  onChanged: (s) {
                    setState(() {
                      id = s;
                    });
                  },
                  validator: validateId,
                ),
                ThemeSpacingBox.spacing_l,
                CustomTextFieldWidget(
                    labelText: "merchant_login_password",
                    onChanged: (s) {
                      setState(() {
                        pw = s;
                      });
                    },
                    validator: validatePassword,
                    isPassword: true),
                ThemeSpacingBox.spacing_l,
                // CustomTextFieldWidget(
                //   labelText: "merchant_domain",
                //   onChanged: (s) {
                //     setState(() {
                //       domain = s;
                //     });
                //   },
                //   validator: validateDomain,
                // ),
                CustomDrpDownButton(
                  labelText: 'choose_domain',
                  itemsList: state.domainList,
                  onChanged: (s) {
                    setState(() {
                      domain = s;
                    });
                  },
                  validator: validateDomain,
                ),
              ],
            ),
          ),
        ),
        ThemeSpacingBox.spacing_xl,
        SizedText(
          text: "login_info_is_same_as_back_office_login",
          textStyle: ThemeTextStyles.MerchantRegistrationPageMiddle.apply(
              color: ThemeColors.gray_400.withOpacity(0.7)),
        ),
        SizedBox(
          height: 180.h,
        ),
        Footer()
      ],
    );
  }

  String? validateId(String? value) {
    if (value != null && value.length < 1)
      return AppLocalizations.of(context)!
          .getString('id_must_be_more_than_8_characters');
    else
      return null;
  }

  String? validatePassword(String? value) {
    if (value != null && value.length < 1)
      return AppLocalizations.of(context)!
          .getString('password_must_be_more_than_6_characters');
    else
      return null;
  }

  String? validateDomain(String? value) {
    if (value == null)
      return AppLocalizations.of(context)!.getString('domain_must_selected');
    else
      return null;
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:yollet/Mgr/Navigation/app_routes.dart';
import 'package:yollet/Mgr/redux/action.dart';
import 'package:yollet/Mgr/redux/state.dart';
import 'package:yollet/UI/template.dart';
import 'package:yollet/Util/Common/CountDownTimer.dart';
import 'package:yollet/themeStyle.dart';

class FindPasswordPhoneNumberPage extends StatefulWidget {
  @override
  FindPasswordPhoneNumberPageState createState() =>
      FindPasswordPhoneNumberPageState();
}

class FindPasswordPhoneNumberPageState
    extends State<FindPasswordPhoneNumberPage> {
  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;
  String phoneNo = "";
  int secondsRemaining = 3 * 60;
  bool toggleSecondsRemaining = false;
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, InitState>(
        converter: (store) => store.state.initState,
        builder: (_, InitState state) => Scaffold(
              body: DefaultBody(
                Body(state),
                appBarWidget: CustomAppBar(
                  title: "issue_temp_password",
                  style: ThemeTextStyles.FindPassAppBarTitle,
                ),
              ),
              bottomSheet: Footer(),
            ));
  }

  Widget Footer() {
    return Container(
        height: 72.h,
        color: ThemeColors.white,
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            BottomButton(
              text: "confirm",
              onPressed: phoneNo.isNotEmpty
                  ? () async {
                      if (_key.currentState!.validate()) {
                        _validate = false;
                        _key.currentState!.save();

                        await appStore.dispatch(SetLoginInfoAction(
                          loginPhone: phoneNo,
                        ));

                        appStore.dispatch(
                          NavigateToAction(
                              to: AppRoutes.findPasswordCautionPage,
                              replace: true),
                        );
                      } else {
                        setState(() {
                          _validate = true;
                        });
                      }
                    }
                  : null,
            ),
          ])
        ]));
  }

  Widget Body(InitState state) {
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
            InputGroupSubject(text: "issue_temp_password_input_id"),
            SizedBox(
              height: 16.h,
            ),
            CustomTextFieldWidget(
              labelText: "phone_number",
              onChanged: (s) => setState(() {
                phoneNo = s;
              }),
              validator: validateMobile,
              isPassword: false,
              keyboardType: TextInputType.phone,
            ),
          ],
        ),
      ),
    );
  }

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
}

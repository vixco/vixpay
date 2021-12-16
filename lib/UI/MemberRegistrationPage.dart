import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yollet/Mgr/Navigation/app_routes.dart';
import 'package:yollet/Mgr/redux/action.dart';
import 'package:yollet/Mgr/redux/state.dart';
import 'package:yollet/UI/template/BaseWidget.dart';
import 'template.dart';
import '../themeStyle.dart';

class MemberRegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultBody(
        Body(),
        appBarWidget: CustomAppBar(
            title: "payment_method",
            onActionTap: () => appStore.dispatch(
                  NavigateToAction(to: AppRoutes.setting),
                )),
        paddingTop: 0,
        paddingLR: 0,
      ),
    );
  }
}

class Body extends StatefulWidget {
  bool isSuccessCopyOpen = false;

  @override
  BodyState createState() => BodyState();
}

class BodyState extends State<Body> {
  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;
  String phone = '';
  String? id = '';
  String? pw = '';
  String? domain;
  bool isFilled = false;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        SizedText(
          text: "인증을 위하여 핸드폰 번호를 입력해주세요",
          textStyle: ThemeTextStyles.MerchantRegistrationPageMiddle,
        ),
      ]),
      SizedBox(
        height: 46.0.h,
      ),
      Container(
        color: ThemeColors.white,
        alignment: Alignment.center,
        child: Form(
          child: Column(
            children: [
              SizedBox(
                width: 308.0.w,
                child: CustomTextFieldWidget(
                  labelText: "핸드폰 번호",
                  hintText: "핸드폰 번호",
                  onChanged: (s) {
                    setState(() {
                      phone = s;
                      if(phone != ''){
                        isFilled = true;
                      }else{
                        isFilled = false;
                      }
                    });
                  },
                  validator: validateId,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 405.0.h),
                child: BtnFillPopup(
                  width: 312.0.w,
                  height: 48.0.h,
                  backgroundColor: isFilled ? ThemeColors.cyan_400 : ThemeColors.txtDisableBlack,
                  child: Text("인증번호 전송", style: ThemeTextStyles.BottomButton,),
                ),
              ),
            ],
          ),
        ),
      )
    ]);
  }

  String? validateId(String? value) {
    if (value != null && value.length < 6)
      return AppLocalizations.of(context)!
          .getString('id_must_be_more_than_8_characters');
    else
      return null;
  }

}

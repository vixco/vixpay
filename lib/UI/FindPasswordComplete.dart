import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:yollet/Mgr/Navigation/app_routes.dart';
import 'package:yollet/Mgr/redux/action.dart';
import 'package:yollet/Mgr/redux/state.dart';
import 'package:yollet/UI/template.dart';
import 'package:yollet/themeStyle.dart';
import 'package:unique_identifier/unique_identifier.dart';

class FindPasswordComplete extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          await appStore.dispatch(NavigateToAction(to: 'up'));
          return Future.value(false);
        },
        child: Scaffold(
          body: DefaultBody(
            Body(),
            appBarWidget: CustomAppBar(
                title: "issue_temp_password",
                backgroundColor: ThemeColors.theme_50),
            appBarSubWidget: AppbarSub(
              message: "issue_temp_password_send_sms",
            ),
          ),
          bottomSheet: Footer(),
        ));
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
              BottomButton(
                text: "confirm",
                onPressed: () async {
                  await appStore
                      .dispatch(NavigateToAction(to: AppRoutes.login));
                },
              ),
            ],
          ),
          ThemeSpacingBox.spacing_l,
        ]));
  }
}

class Body extends StatefulWidget {
  @override
  BodyState createState() => BodyState();
}

class BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, InitState>(
        converter: (store) => store.state.initState,
        builder: (_, InitState state) => Container(
              height: MediaQuery.of(context).size.height,
              color: ThemeColors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 24.h),
                  getPassword(state),
                  SizedBox(height: 24.h),
                  SizedText(
                    text: "issue_temp_password_complete_guide",
                    textAlign: TextAlign.center,
                    alignment: Alignment.center,
                    textStyle:
                        ThemeTextStyles.FindPasswordCompleteTempPasswordLabel,
                  ),
                ],
              ),
            ));
  }

  Widget getPassword(InitState state) {
    return Container(
      height: 76.h,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15.r)),
        color: ThemeColors.grey_f6f6f6,
      ),
      // color: ThemeColors.grey_f6f6f6,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedText(
              height: 37.h,
              text: "temp_password",
              textStyle: ThemeTextStyles.FindPasswordCompleteTempPasswordLabel,
              overflow: TextOverflow.ellipsis),
          SizedBox(
            width: 12.w,
          ),
          SizedText(
              height: 37.h,
              text: state.loginPw,
              textStyle: ThemeTextStyles.FindPasswordCompleteTempPassword,
              overflow: TextOverflow.ellipsis),
        ],
      ),
    );
  }
}

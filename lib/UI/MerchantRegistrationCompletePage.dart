import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:yollet/Mgr/Navigation/app_routes.dart';
import 'package:yollet/Mgr/redux/action.dart';
import 'package:yollet/Mgr/redux/state.dart';
import 'package:yollet/UI/template.dart';
import 'package:yollet/Util/Common/Common.dart';
import 'package:yollet/Util/Format/NumberFormatUtil.dart';
import 'package:yollet/themeStyle.dart';

class MerchantRegistrationCompletePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          await appStore.dispatch(NavigateToAction(to: AppRoutes.home));
          return Future.value(false);
        },
        child: StoreConnector<AppState, YolletState>(
            converter: (store) => store.state.yolletState,
            builder: (_, YolletState state) => Scaffold(
                  body: DefaultBody(
                    Body(),
                    appBarWidget: CustomAppBar(
                      title: "merchant_auth_completed",
                      style:
                          ThemeTextStyles.AppbarTitleMerchantAuthCompleteAppbar,
                      showBackIcon: false,
                    ),
                    appBarSubWidget: AppbarSub(
                      message: "merchant_authentication_has_been_completed",
                      customColor: ThemeColors.white,
                    ),
                  ),
                  bottomSheet: Footer(),
                )));
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
                  appStore.dispatch(NavigateToAction(to: AppRoutes.home));
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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    InitState state = StoreProvider.of<AppState>(context).state.initState;
    return Container(
      width: 204.w,
      child: Column(
        children: [
          SizedText(
            textAlign: TextAlign.center,
            text: '“${state.merchantStoreName}”의 가맹점 인증이 완료되었습니다.',
            textStyle: ThemeTextStyles.MerchantRegistrationCompletePageBody,
          ),
          SizedBox(
            height: 20.h,
          ),
          SizedText(
            textAlign: TextAlign.center,
            text: '보유주소 정보에서 가맹점의 주소를확인할 수 있습니다.',
            textStyle: ThemeTextStyles.MerchantRegistrationCompletePageBody,
          ),
        ],
      ),
    );
  }
}

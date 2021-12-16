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

class CreateAccountEthMnemonicQuizConfirmPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          await appStore.dispatch(NavigateToAction(to: 'up'));

          return Future.value(false);
        },
        child: StoreConnector<AppState, YolletState>(
            converter: (store) => store.state.yolletState,
            builder: (_, YolletState state) => Scaffold(
              body: DefaultBody(
                Body(),
                appBarWidget: CustomAppBar(
                  title: "vixco_seed_phrase_history",
                  style: ThemeTextStyles
                      .AppbarTitleCreateAccountConfirmMnemonic,
                  showBackIcon: false,
                ),
                appBarSubWidget: _AppBarSubWidget(
                  'seed_phrase_backup_complete',
                ),
              ),
              bottomSheet: Footer(),
            )));
  }

  Widget _AppBarSubWidget(String message) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          SizedText(
            text: message,
            textStyle:
            ThemeTextStyles.AppbarSubTitleCreateAccountConfirmMnemonic,
            alignment: Alignment.center,
          ),
          SizedBox(
            height: 36.h,
          ),
        ],
      ),
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
              BottomButton(
                text: "continue",
                onPressed: () async {
                  YolletState state = appStore.state.yolletState;
                  // if (state.ethereumInfo.address.isNotEmpty) {
                    Map<String, dynamic>? others = Map();
                    others["ethereum"] = state.ethereumInfo.address;
                    await appStore.dispatch(UpdateUserOthers(others: others));
                  // }
                  NavigationState navigationState = appStore.state.navigationState;
                  if(navigationState.hasRoute(AppRoutes.setting)){
                    appStore.dispatch(NavigateToAction(
                        to: AppRoutes.setting));
                  }else{
                    appStore.dispatch(NavigateToAction(
                        to: AppRoutes.createEthAccountCompletePage,
                        replace: true));
                  }
                },
              ),
            ],
          ),
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
    YolletState state = StoreProvider.of<AppState>(context).state.yolletState;
    List<String> mnemList = state.ethereumMnemonic.split(' ');

    return Column(
      children: [
        CustomTable(mnemonic: mnemList),
        SizedBox(
          height: 24.h,
        ),
        Row(
          children: [
            IconButton(
                icon: Icon(
                  Icons.check_circle,
                  color: Colors.cyan,
                ),
                onPressed: () {}),
            SizedText(
              width: 270.w,
              text: 'protected_wallet',
              textStyle: ThemeTextStyles
                  .AppbarSubTitleMessageEthCreateAccountConfirmMnemonic,
              // maxLines: 3,
            ),
          ],
        )
      ],
    );
  }
}

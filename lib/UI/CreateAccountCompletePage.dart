import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:yollet/Mgr/Navigation/app_routes.dart';
import 'package:yollet/Mgr/redux/action.dart';
import 'package:yollet/Mgr/redux/state.dart';
import 'package:yollet/UI/template.dart';
import 'package:yollet/themeStyle.dart';

class CreateAccountCompletePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          await appStore.dispatch(NavigateToAction(to: AppRoutes.home));
          await appStore.dispatch(NavigateToAction(to: AppRoutes.wallet));
          return Future.value(false);
        },
        child: Scaffold(
          body: DefaultBody(
            Body(),
            appBarWidget: CustomAppBar(
                title: "create_account", backgroundColor: ThemeColors.theme_50),
            appBarSubWidget: AppbarSub(
              message: "create_account_success",
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
                  await appStore.dispatch(NavigateToAction(to: AppRoutes.home));
                  await appStore
                      .dispatch(NavigateToAction(to: AppRoutes.wallet));
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
    // YolletState state = StoreProvider.of<AppState>(context).state.yolletState;
    // var tokenItem;
    // for(Map item in state.tokenList){
    //   if(item["id"]==state.createAccountTokenId){
    //     tokenItem = item;
    //   }
    // }
    return StoreConnector<AppState, YolletState>(
        converter: (store) => store.state.yolletState,
        builder: (_, YolletState state) => Container(
              color: ThemeColors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 40.h),
                  CoinItemWidget(
                    coinImage: CoinImageWidget(
                      url: state.currentTokenInfo.url,
                    ),
                    accountName: state.createAccountName,
                    coinName: state.currentTokenInfo.tokenName ?? "",
                  ),
                  SizedBox(height: 20.h),
                  AddressWidget(
                    address: state.currentAccountAddress,
                  ),
                  // SizedBox(height: 20.h),
                  // MainSubject(text: "mnemonic"),
                  // SizedBox(height: 20.h),
                  // SizedText(
                  //     // width: 100.w,
                  //     height: 110.h,
                  //     text: state.currentMnemonic,
                  //     textStyle: ThemeFontStylesEng.en20Bold,
                  //     overflow: TextOverflow.ellipsis,
                  //     maxLines: 5,
                  //     alignment: Alignment.topLeft),
                ],
              ),
            ));
  }
}

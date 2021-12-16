import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:yollet/Mgr/Navigation/app_routes.dart';
import 'package:yollet/Mgr/redux/action.dart';
import 'package:yollet/Mgr/redux/state.dart';
import 'package:yollet/UI/template.dart';
import 'package:yollet/themeStyle.dart';


class AssignTokenCompletePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
      await appStore.dispatch(NavigateToAction(to: AppRoutes.home));
      await appStore.dispatch(NavigateToAction(to: AppRoutes.wallet));
      return Future.value(false);
    },
    child:Scaffold(
      body: DefaultBody(Body(),
        appBarWidget: CustomAppBar(title: "assign_token",backgroundColor:ThemeColors.theme_50),
        appBarSubWidget: AppbarSub(message: "assign_token_success",),),
      bottomSheet: Footer(),
    )
    );
  }
}

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height:72.h ,
        color:ThemeColors.white,
        child:
        Column(
            children: [ Row(
              mainAxisAlignment:MainAxisAlignment.center ,
              children: [
                BottomButton(
                  text: "confirm",
                  onPressed: () async {
                    await appStore.dispatch(NavigateToAction(to: AppRoutes.home));
                    await appStore.dispatch(NavigateToAction(to: AppRoutes.wallet));
                  },
                ),
              ],),
              ThemeSpacingBox.spacing_l,
            ]
        )
    );
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
    return StoreConnector<AppState, YolletState>(
    converter: (store) => store.state.yolletState,
    builder: (_, YolletState state) =>Container(color:ThemeColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height : 40.h),
          CoinItemWidget(
            coinImage:CoinImageWidget(url: state.currentTokenInfo.url,),
            accountName: state.createAccountName,
            coinName: state.currentTokenInfo.tokenName??"",),
          SizedBox(height : 20.h),
          AddressWidget(address: state.currentAccountAddress,)
        ],
      ),
    )
    );
  }
}







import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:yollet/Mgr/Navigation/app_routes.dart';
import 'package:yollet/Mgr/redux/action.dart';
import 'package:yollet/Mgr/redux/state.dart';
import 'package:yollet/UI/template.dart';
import 'package:yollet/themeStyle.dart';

class CreateEthAccountCompletePage extends StatelessWidget {
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
                title: "create_vixco_address",
                backgroundColor: ThemeColors.theme_50,
            showBackIcon: false,),
            appBarSubWidget: AppbarSub(
              message: "create_vixco_address_success",
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
    YolletState state = StoreProvider.of<AppState>(context).state.yolletState;
    return StoreConnector<AppState, YolletState>(
        converter: (store) => store.state.yolletState,
        builder: (_, YolletState state) => Container(
              height: MediaQuery.of(context).size.height - 417.h,
              alignment: Alignment.center,
              color: ThemeColors.white,
              child: AddressWidget(
                address: state.ethereumInfo.address,
              ),
            ));
  }
}

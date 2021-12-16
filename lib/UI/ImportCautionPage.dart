import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:yollet/Mgr/Navigation/app_routes.dart';
import 'package:yollet/Mgr/redux/action.dart';
import 'package:yollet/Mgr/redux/state.dart';
import 'package:yollet/UI/template.dart';
import 'package:yollet/Util/Common/CountDownTimer.dart';
import 'package:yollet/Util/Format/NumberFormatUtil.dart';
import 'package:yollet/themeStyle.dart';

class ImportCautionPage extends StatefulWidget {
  @override
  ImportCautionPageState createState() => ImportCautionPageState();
}

class ImportCautionPageState extends State<ImportCautionPage> {
  String mnemonicPhrase = "";

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, YolletState>(
        converter: (store) => store.state.yolletState,
        builder: (_, YolletState state) => Scaffold(
              body: DefaultBody(Body(state),
                  appBarWidget: CustomAppBar(
                    title: "import_vixco_address",
                  )),
              bottomSheet: Footer(),
            ));
  }

  Widget Footer() {
    return Container(
        height: 72.h,
        color: ThemeColors.white,
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BottomButton(
                  text: "confirm",
                  onPressed: () {
                    appStore.dispatch(
                      NavigateToAction(
                          to: AppRoutes.importVerifyPage, replace: true),
                    );
                  })
            ],
          ),
        ]));
  }

  Widget Body(YolletState state) {
    return Container(
      color: ThemeColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 30.h,
          ),
          Container(
              child: Center(
                  child: Icon(
            YolletIcons.warning,
            color: ThemeColors.sub_color_pink,
            size: 58.w,
          ))),
          SizedBox(
            height: 14.h,
          ),
          SizedText(
            text: "import_caution_guide1",
            textStyle: ThemeTextStyles.ImportCautionGuide1,
            alignment: Alignment.center,
          ),
          SizedBox(
            height: 24.h,
          ),
          SizedText(
            text: "import_caution_guide2",
            textStyle: ThemeTextStyles.ImportCautionGuide2,
            alignment: Alignment.center,
          ),
          SizedBox(
            height: 43.h,
          ),
          MainSubject(text: "my_wallet"),
          SizedBox(
            height: 10.h,
          ),
          getEthereumWidget(state)
        ],
      ),
    );
  }

  Widget getEthereumWidget(YolletState state) {
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedText(
              height: 36.h,
              width: 70.w,
              text: "vixco",
              textStyle: ThemeTextStyles.stakingTitle,
              alignment: Alignment.topLeft,
              overflow: TextOverflow.ellipsis),
          SizedBox(
            width: 12.w,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.h,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                SizedText(
                    height: 21.h,
                    text: getEthereumAmount(state: state, amount: 0),
                    textStyle: ThemeTextStyles.stakingAmount,
                    alignment: Alignment.centerLeft,
                    overflow: TextOverflow.ellipsis),
                SizedBox(
                  width: 6.w,
                ),
                SizedText(
                    height: 21.h,
                    // width:251.w,
                    text: state.ethereumInfo.symbol,
                    textStyle: ThemeTextStyles.stakingTokenName,
                    alignment: Alignment.centerLeft,
                    overflow: TextOverflow.ellipsis),
              ]),
              SizedBox(
                height: 17.h,
                width: 162.w,
                child: Text(
                  state.ethereumInfo.address,
                  style: ThemeTextStyles.stakingAddress,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
            ],
          ),
          SizedBox(
            width: 12.w,
          ),
        ],
      ),
    );
  }

  String getEthereumAmount({
    required YolletState state,
    required num amount,
  }) {
    String formatStakingAmount = "";
    // if (amount == 0) {
    //   formatStakingAmount = "0";
    // } else {
    formatStakingAmount = CurrencyFormatter.get(2).format(amount).toString();
    // }
    // formatStakingAmount ="$amount VIX";
    return formatStakingAmount;
  }
}

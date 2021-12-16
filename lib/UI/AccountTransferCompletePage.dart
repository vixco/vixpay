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

class AccountTransferCompletePage extends StatelessWidget {
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
                      title: "transfer",
                      style: ThemeTextStyles.AppbarTitleTransferComplete,
                      backgroundColor: state.currentIsVixco
                          ? ThemeColors.theme_50
                          : ThemeColors.gray_100.withOpacity(0.5),
                      titleIcon: CoinImageWidget(
                          url: state.currentTokenInfo.url,
                          width: 28.w,
                          height: 28.h),
                      showBackIcon: false,
                    ),
                    appBarSubWidget: AppbarSub(
                      message: "transfer_success",
                      customColor: state.currentIsVixco
                          ? ThemeColors.theme_50
                          : ThemeColors.gray_100.withOpacity(0.5),
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
    YolletState state = StoreProvider.of<AppState>(context).state.yolletState;
    String formatBalance = "";
    if (state.transferAccountAmount == null ||
        state.transferAccountAmount == 0) {
      formatBalance = "0";
    } else {
      // YolletState state = appStore.state.yolletState;
      num? decimalPoint = state.currentTokenInfo.decimalPoint;
      formatBalance = CurrencyFormatter.get(decimalPoint?.toInt() ?? 0)
          .format(state.transferAccountAmount)
          .toString();
    }
    String formatExchangeBalance = "";
    if (state.transferAccountAmount == null ||
        state.transferAccountAmount == 0) {
      formatExchangeBalance = "0";
    } else {
      YolletState state = appStore.state.yolletState;
      // num? decimalPoint = state.currentTokenInfo.decimalPoint;
      num calc = state.transferAccountAmount *
          state.currentTradePrice[state.currentTokenId];
      formatExchangeBalance = CurrencyFormatter.get(0).format(calc).toString();
    }

    return Container(
      color: ThemeColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 40.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedText(
                /*width:240.w,*/
                height: 31.h,
                text: formatBalance,
                textStyle: ThemeTextStyles.AccountTransferCompleteBalance,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                width: 8.w,
              ),
              SizedText(
                height: 31.h,
                text: state.currentTokenId,
                textStyle: ThemeTextStyles.AccountTransferCompleteCoin,
              ),
            ],
          ),
          SizedBox(
            height: 8.h,
          ),
          Row(
            children: [
              SizedText(
                  height: 21.h,
                  text: formatExchangeBalance,
                  textStyle: ThemeTextStyles.AccountTransferCompleteTradePrice,
                  overflow: TextOverflow.ellipsis),
              SizedBox(width: 4.w),
              SizedText(
                  height: 21.h,
                  text: "krw",
                  textStyle:
                      ThemeTextStyles.AccountTransferCompleteTradeCurrency,
                  overflow: TextOverflow.ellipsis),
            ],
          ),
          SizedBox(height: 36.h),

          // SizedText(/*width:240.w,*/ height:18.h,text: state.transactionDate.toString(),textStyle:ThemeTextStyles.AccountTransferPopupSubject,overflow:TextOverflow.ellipsis ,),
          // SizedBox(height : 8.h),
          getAddress("transfer_date", state.transactionDate,
              isIconHide: true, isAbbreviation: false),
          getAddress("from", state.currentAccountAddress),
          getAddress("to", state.transferAccountAddress),
          getAddress("tx_id", state.transactionId),
        ],
      ),
    );
  }

  Widget getAddress(title, address,
      {bool isIconHide = false, bool isAbbreviation = true}) {
    return Container(
      height: 40.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15.w)),
        color: ThemeColors.white,
      ),
      // padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedText(
                  height: 18.h,
                  width: 130.w,
                  text: title,
                  textStyle: ThemeTextStyles.AccountTransferCompletePopupSubject,
                  alignment: Alignment.centerLeft,
                  overflow: TextOverflow.ellipsis),
              SizedText(
                height: 18.h,
                width: 146.w,
                text: isAbbreviation
                    ? Common.getAbbreviatedAddress16(address)
                    : address,
                textStyle: ThemeTextStyles.AccountTransferPopupSubject.apply(color: ThemeColors.gray_700),
                alignment: Alignment.centerLeft,
                overflow: TextOverflow.ellipsis,
              ),
              isIconHide
                  ? Container(width: 24.w)
                  : Container(
                      width: 24.w,
                      height: 24.h,
                      decoration: BoxDecoration(
                        color: ThemeColors.gray_200,
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(24, 24)),
                      ),
                      child: IconButton(
                        icon: Icon(
                          YolletIcons.copy,
                          color: ThemeColors.gray_400,
                        ),
                        iconSize: 18.w,
                        padding: EdgeInsets.all(0),
                        onPressed: () {
                          Clipboard.setData(ClipboardData(text: address));
                        },
                      ),
                    )
            ],
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}

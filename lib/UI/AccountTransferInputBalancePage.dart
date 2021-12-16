import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:yollet/Mgr/Navigation/app_routes.dart';
import 'package:yollet/Mgr/redux/action.dart';
import 'package:yollet/Mgr/redux/state.dart';
import 'package:yollet/UI/BottomTransferPopupWidget.dart';
import 'package:yollet/UI/template.dart';
import 'package:yollet/Util/Format/NumberFormatUtil.dart';
import 'package:yollet/themeStyle.dart';

class AccountTransferInputBalancePage extends StatefulWidget {
  @override
  AccountTransferInputBalancePageState createState() =>
      AccountTransferInputBalancePageState();
}

class AccountTransferInputBalancePageState
    extends State<AccountTransferInputBalancePage> {
  String? value = "0";
  String formatBalance = "0";
  String formatExchangeBalance = "0";

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, YolletState>(
        converter: (store) => store.state.yolletState,
        builder: (_, YolletState state) => Scaffold(
              body: DefaultBody(
                Body(state),
                appBarWidget: CustomAppBar(
                  title: "transfer",
                  style: ThemeTextStyles.AppbarTitle,
                  titleIcon: CoinImageWidget(
                      url: state.currentTokenInfo.url,
                      width: 28.w,
                      height: 28.h),
                ),
              ),
              bottomSheet: Footer(state, onValue: (v) {
                setState(() {
                  value = v;
                  setInputBalanceFormat();
                });
              }, inputText: value),
            ));
  }

  void setInputBalanceFormat() {
    if (value == null || value!.isEmpty) {
      formatBalance = "0";
    } else {
      YolletState state = appStore.state.yolletState;
      num? decimalPoint = state.currentTokenInfo.decimalPoint;
      formatBalance = CurrencyFormatter.get(decimalPoint?.toInt() ?? 0)
          .format(num.parse(value!))
          .toString();
    }
    if (value == null || value!.isEmpty) {
      formatExchangeBalance = "0";
    } else {
      YolletState state = appStore.state.yolletState;
      // num? decimalPoint = state.currentTokenInfo.decimalPoint;
      num calc =
          num.parse(value!) * state.currentTradePrice[state.currentTokenId];
      formatExchangeBalance = CurrencyFormatter.get(0).format(calc).toString();
    }
  }

  Widget Body(state) {
    // YolletState state = StoreProvider.of<AppState>(context).state.yolletState;

    if(kDebugMode){
      print(state.availableCurrentBalance.toString());
    }

    return Container(
      color: ThemeColors.white,
      child: Column(
        children: <Widget>[
          AccountItem(
              url: state.currentTokenInfo.url,
              name: state.currentAccountName,
              balance: state.availableCurrentBalance,
              currencyBalance: state.availableCurrentCurrencyBalance,
              coinName: state.currentCoinName),
          SizedBox(
            height: 24.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedText(
                /*width:240.w,*/ height: 52.h,
                text: formatBalance,
                textStyle: value == "0"
                    ? ThemeTextStyles.AccountTransferBalanceZero
                    : ThemeTextStyles.AccountTransferBalance,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                width: 8.w,
              ),
              SizedText(
                height: 41.h,
                text: state.currentCoinName,
                textStyle: ThemeTextStyles.AccountTransferBalanceCoin,
              ),
            ],
          ),
          SizedBox(
            height: 4.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedText(
                height: 26.h,
                text: formatExchangeBalance,
                textStyle: ThemeTextStyles.mainAppBottomCurrentTradePrice
                    .apply(color: ThemeColors.gray_400.withOpacity(0.8)),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                width: 8.w,
              ),
              SizedText(
                height: 26.h,
                text: "krw",
                textStyle: ThemeTextStyles.mainAppBottomCurrentTradeCurrency,
              ),
            ],
          ),
          SizedBox(
            height: 28.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BtnBorder(
                  width: 96.w,
                  height: 32.h,
                  text: "reset",
                  onPressed: () {
                    setState(() {
                      value = 0.toString();
                      setInputBalanceFormat();
                    });
                  },
                  style: ThemeTextStyles.AccountTransferMiddleButton.apply(
                      color: ThemeColors.theme_500,)),
              SizedBox(
                width: 12.w,
              ),
              BtnFill(
                  width: 96.w,
                  height: 32.h,
                  text: "max",
                  onPressed: () {
                    setState(() {
                      value = state.availableCurrentBalance.toString();
                      setInputBalanceFormat();
                    });
                  },
                  style: ThemeTextStyles.AccountTransferMiddleButton.apply(
                      color: ThemeColors.theme_500,
                  )),
              SizedBox(),
            ],
          )
        ],
      ),
    );
  }

  Widget Footer(state, {StringCallback? onValue, String? inputText = ""}) {
    // YolletState state = StoreProvider.of<AppState>(context).state.yolletState;

    return Container(
        height: 320.h,
        color: ThemeColors.white,
        child: Column(children: [
          KeypadBody(
            showDecimalPoint: true,
            onValue: (v) {
              inputText = v;
              onValue!(v);
            },
            maxInputLength: 20,
            inputText: inputText ?? "",
            decimalPointLength:
                (state.currentTokenInfo.decimalPoint?.toInt()) ?? 2,
          ),
          ThemeSpacingBox.spacing_l,
          BottomButton(
              text: "confirm",
              onPressed: () async {
                if (inputText!.isEmpty || num.parse(inputText!) <= 0) {
                  return;
                }
                if (state.availableCurrentBalance < num.parse(inputText!)) {
                  return;
                }
                await appStore.dispatch(SetTransferAccount(
                    transferAccountAmount: num.parse(inputText!)));
                showPopup(
                    context,
                    BottomTransferPopupWidget(
                      title: "confirm_transfer_information",
                      amount: num.parse(inputText!),
                      currencyAmount: num.parse(inputText!) *
                          state.currentTradePrice[state.currentTokenId],
                      coinName: state.currentCoinName,
                      fromAccountName: state.currentAccountName,
                      fromAddress: state.currentAccountAddress,
                      fromBalance: state.availableCurrentBalance,
                      fromCurrencyBalance:
                          state.availableCurrentCurrencyBalance,
                      fromCoinName: state.currentCoinName,
                      fromUrl: state.currentTokenInfo.url,
                      // toAccountName: ,
                      toAddress: state.transferAccountAddress,
                      // toBalance: ,
                      // toCoinName: ,
                      // toUrl: ,
                      comment: "",
                      onPressed: () async {
                        await appStore.dispatch(NavigateToAction(
                            to: AppRoutes.accountTransferPasscode));
                      },
                    ));
              },
              style:
                  ThemeTextStyles.BottomButton),
          ThemeSpacingBox.spacing_l,
        ]));
  }
}

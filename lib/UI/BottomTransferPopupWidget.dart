import 'package:flutter/material.dart';
import 'package:yollet/Mgr/redux/action.dart';
import 'package:yollet/Mgr/redux/state.dart';
import 'package:yollet/UI/template.dart';
import 'package:yollet/Util/Format/NumberFormatUtil.dart';
import 'package:yollet/themeStyle.dart';

class BottomTransferPopupWidget extends StatefulWidget {
  final String? title;
  final num? amount;
  final num? currencyAmount;
  final String? coinName;
  final String? fromAccountName;
  final String? fromAddress;
  final num? fromBalance;
  final num? fromCurrencyBalance;
  final String? fromCoinName;
  final String? fromUrl;

  final String? toAccountName;
  final String? toAddress;
  final String? toBalance;
  final String? toCoinName;
  final String? toUrl;
  final String? comment;
  final GestureTapCallback? onPressed;
  final bool isCommentReadOnly;

  BottomTransferPopupWidget(
      {Key? key,
      this.title,
      this.coinName,
      this.amount,
      this.currencyAmount,
      this.fromAccountName,
      this.fromAddress,
      this.fromBalance,
      this.fromCurrencyBalance,
      this.fromCoinName,
      this.fromUrl,
      this.toAccountName,
      this.toAddress,
      this.toBalance,
      this.toCoinName,
      this.toUrl,
      this.onPressed,
      this.comment,
      this.isCommentReadOnly = false})
      : super(key: key);

  @override
  BottomTransferPopupWidgetState createState() =>
      BottomTransferPopupWidgetState();
}

class BottomTransferPopupWidgetState extends State<BottomTransferPopupWidget> {
  String? _comment = "";

  @override
  void initState() {
    super.initState();
    _comment = widget.comment;
  }

  @override
  Widget build(BuildContext context) {
    String formatBalance = "";
    if (widget.amount == null) {
      formatBalance = "0";
    } else {
      YolletState state = appStore.state.yolletState;
      num? decimalPoint = state.currentTokenInfo.decimalPoint;
      formatBalance = CurrencyFormatter.get(decimalPoint?.toInt() ?? 0)
          .format(widget.amount!)
          .toString();
    }

    String formatExchangeBalance = "";
    if (widget.currencyAmount == null ) {
      formatExchangeBalance = "0";
    } else {
      // YolletState state = appStore.state.yolletState;
      // num? decimalPoint = state.currentTokenInfo.decimalPoint;
      formatExchangeBalance = CurrencyFormatter.get(0)
          .format(widget.currencyAmount!)
          .toString();
    }
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: ThemeColors.transparent,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
              width: MediaQuery.of(context).size.width,
              height: 582.h + (_comment!.isEmpty ? 0.h : 68.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.w),
                      topRight: Radius.circular(16.w)),
                  color: ThemeColors.white),
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      appStore.dispatch(DismissPopupAction(all: true));
                    },
                    child: Column(children: [
                      SizedBox(
                        height: 8.h,
                      ),
                      Container(
                        height: 20.h,
                        child: Center(
                          child: Container(
                              width: 32.w,
                              height: 4.h,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100.w)),
                                color: Color.fromRGBO(231, 231, 231, 1),
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                    ]),
                  ),
                  SizedText(
                      height: 23.h,
                      text: widget.title,
                      textStyle: ThemeTextStyles.MainSubject,
                      alignment: Alignment.center),
                  SizedBox(
                    height: 24.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedText(
                        /*width:240.w,*/ height: 46.h,
                        text: formatBalance,
                        textStyle: ThemeTextStyles.AccountTransferPopupBalance,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      SizedText(
                        height: 46.h,
                        text: widget.coinName,
                        textStyle:
                            ThemeTextStyles.AccountTransferPopupBalanceCoin,
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h,),
                  Row(mainAxisAlignment:MainAxisAlignment.center ,
                    children: [
                      SizedText( height:26.h,text: formatExchangeBalance,textStyle: ThemeTextStyles.mainAppBottomCurrentTradePrice
                        ,overflow:TextOverflow.ellipsis ,),
                      SizedBox(width: 8.w,),
                      SizedText(height:26.h,text: "krw",textStyle: ThemeTextStyles.mainAppBottomCurrentTradeCurrency,),
                    ],),
                  SizedBox(
                    height: 8.h,
                  ),
                  InputGroupSubject(
                    text: "from",
                    textStyle: ThemeTextStyles.AccountTransferPopupSubject,
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  AccountItem(
                      url: widget.fromUrl,
                      name: widget.fromAccountName,
                      balance: widget.fromBalance,
                      currencyBalance: widget.fromCurrencyBalance,
                      coinName: widget.fromCoinName),
                  Stack(
                      alignment: AlignmentDirectional.center,
                      children: <Widget>[
                        Column(children: [
                          SizedBox(
                            height: 24.h,
                          ),
                          InputGroupSubject(
                            text: "to",
                            textStyle:
                                ThemeTextStyles.AccountTransferPopupSubject,
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                        ]),
                        Align(
                            alignment: Alignment.center,
                            child: Icon(
                              YolletIcons.down,
                              size: 24.w,
                              color: ThemeColors.gray_300,
                            ))
                      ]),
                  AccountItem(url: widget.toUrl, address: widget.toAddress),
                  SizedBox(
                    height: 24.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InputGroupSubject(
                        text: "txmessage",
                        textStyle: ThemeTextStyles.AccountTransferPopupSubject,
                      ),
                      widget.isCommentReadOnly
                          ? SizedBox(
                              width: 0,
                              height: 0,
                            )
                          : _comment!.isEmpty
                              ? TextButton(
                                  child: AutoSizeText(
                                    "+" +
                                        AppLocalizations.of(context)!
                                            .getString("add"),
                                    style: ThemeTextStyles.mainPageAddItem,
                                  ),
                                  onPressed: () async {
                                    String? inputResult =
                                        await asyncInputDialog(
                                            title: "add_txmessage",
                                            hint: "enter_message",
                                            dismissAll: false);
                                    if (inputResult != null &&
                                        inputResult.isNotEmpty) {
                                      setState(() {
                                        _comment = inputResult;
                                      });
                                    }
                                    // appStore.dispatch(NavigateToAction(to: AppRoutes.createWallet));
                                  },
                                )
                              : TextButton(
                                  child: AutoSizeText(
                                    AppLocalizations.of(context)!
                                        .getString("edit"),
                                    style: ThemeTextStyles.mainPageAddItem,
                                  ),
                                  onPressed: () async {
                                    String? inputResult =
                                        await asyncInputDialog(
                                            title: "edit_txmessage",
                                            hint: "enter_message",
                                            initialString: widget.comment,
                                            dismissAll: false);
                                    if (inputResult != null) {
                                      setState(() {
                                        _comment = inputResult;
                                      });
                                    }
                                    // appStore.dispatch(NavigateToAction(to: AppRoutes.createWallet));
                                  },
                                )
                    ],
                  ),
                  _comment!.isEmpty
                      ? SizedBox(
                          height: 22.h,
                        )
                      : Padding(
                          padding: EdgeInsets.only(top: 22.h, bottom: 28.h),
                          child: Container(
                            width: 312.w,
                            height: 40.h,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(17)),
                              color:
                                  Color.fromRGBO(0, 0, 0, 0.028699999675154686),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 12.w),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: AutoSizeText(
                                  _comment!,
                                  style: ThemeTextStyles.inputText13,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                )),
                          ),
                        ),
                  BottomButton(
                    text: "confirm",
                    onPressed: () async {
                      await appStore.dispatch(
                          SetTransferAccount(transferAccountComment: _comment));
                      if (widget.onPressed != null) {
                        widget.onPressed!();
                      }
                    },
                    horizontalPadding: 0,
                  ),
                ],
              )),
        ));
  }
}

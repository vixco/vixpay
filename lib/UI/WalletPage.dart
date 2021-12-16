import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:intl/intl.dart';
import 'package:yollet/Data/Dataset/AddressInfo.dart';
import 'package:yollet/Data/Dataset/NotificationInfo.dart';
import 'package:yollet/Data/Dataset/QueryBalanceInfo.dart';
import 'package:yollet/Data/Dataset/StakingInfo.dart';
import 'package:yollet/Data/Dataset/TokenInfo.dart';
import 'package:yollet/Data/Dataset/WalletInfo.dart';
import 'package:yollet/Mgr/Navigation/app_routes.dart';
import 'package:yollet/Mgr/redux/action.dart';
import 'package:yollet/Mgr/redux/state.dart';
import 'package:yollet/UI/BottomTransferPopupWidget.dart';
import 'package:yollet/UI/template.dart';
import 'package:yollet/Util/Common/Common.dart';
import 'package:yollet/Util/Common/global_widgets.dart';
import 'package:yollet/Util/Format/NumberFormatUtil.dart';
import 'package:yollet/themeStyle.dart';
import 'package:yollet_client/yollet_client.dart';
import 'package:collection/collection.dart';

class EmptyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  Size get preferredSize => Size(0.0, 0.0);
}

class WalletPage extends StatefulWidget {
  @override
  _WalletPageState createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> with Reloadable {
  GlobalKey<BodyState> bodyKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    reload();
  }

  @override
  Future<void> reload() async {
    bodyKey.currentState?.refreshList();
  }

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: EmptyAppBar(),
      body: DefaultScrollBody(Body(key: bodyKey),
          appBarWidget: WalletPageAppBar(
              height: statusBarHeight != 0.0 ? 88.h - statusBarHeight : 88.h,
              statusBarHeight: statusBarHeight),
          paddingLR: 0,
          paddingTop: 0,
          footerHeight: 56.h),
      // Remove Container in order to remove the elevation shadow color!
      bottomNavigationBar: Container(
          decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 5,
                spreadRadius: 5,
              ),
            ],
          ),
          child: BottomNavigationBarWidget(
            currentIndex: 1,
          )),
    );
  }
}

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  BodyState createState() => BodyState();
}

class BodyState extends State<Body> {
  int walletCount = 0;

  // int accountCount =0;
  var refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    refreshList();
  }

  Future<Null> refreshList() async {
    refreshKey.currentState?.show(atTop: false);
    await appStore.dispatch(GetAccountList(isLoadWallet: true));
    // await appStore.dispatch(GetStakingInfoAction(tokenId: "VIXP"));
    await appStore.dispatch(QueryEthBalanceAction());
    return null;
  }

  Color getColor(int index) {
    return ThemeColors.sub_color[index];
  }

  String makePayQRString({String? tokenId, String? address}) {
    var uuid = gRpcClient.userUuid;
    var time = DateTime.now().millisecondsSinceEpoch + 5 * 60 * 1000;
    var qrData = '$uuid:$tokenId:$address:$time';
    return qrData;
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

  String getStakingAmount({
    required YolletState state,
    required StakingInfo stakingInfo,
  }) {
    // String formatStakingAmount = "";
    // if (state.stakingInfo.amount == null) {
    //   formatStakingAmount = "0";
    // } else {
    //
    //   formatStakingAmount = CurrencyFormatter.get(decimalPoint)
    //       .format(amount)
    //       .toString();
    // }

    String amount = stakingInfo.amount;
    amount = amount.split(".")[0];
    // formatStakingAmount ="$amount ${stakingInfo.symbol}";
    return amount;
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, YolletState>(
        converter: (store) => store.state.yolletState,
        builder: (_, YolletState state) => Container(
          height: MediaQuery.of(context).size.height - 88.h - 56.h,
          width: MediaQuery.of(context).size.width,
          color: ThemeColors.white,
          child: RefreshIndicator(
            key: refreshKey,
            displacement: 40.h,
            child: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                // getStakingWidget(state),
                getEthereumWidget(state),
                SizedBox(
                  height: 24.h,
                ),
                Container(
                  height: 20.h,
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MainSubject(text: "my_wallet"),
                      state.walletList.isNotEmpty
                          ? Row(
                        children: [
                          InkWell(
                            child: Row(children: [
                              Icon(
                                YolletIcons.box_plus,
                                color: ThemeColors.theme_400,
                                size: 16.w,
                              ),
                              SizedBox(
                                width: 4.w,
                              ),
                              AutoSizeText(
                                AppLocalizations.of(context)!
                                    .getString("add"),
                                style:
                                ThemeTextStyles.mainPageAddItem,
                              ),
                            ]),
                            // style: ButtonStyle(
                            //     textStyle:
                            //         MaterialStateProperty.all(
                            //             ThemeTextStyles
                            //                 .mainPageAddItem),
                            //     padding: MaterialStateProperty.all(
                            //         EdgeInsets.all(0)),
                            //     elevation:
                            //         MaterialStateProperty.all(0),
                            //     minimumSize:
                            //         MaterialStateProperty.all(
                            //             Size(39, 10))),
                            onTap: () {
                              appStore.dispatch(NavigateToAction(
                                  to: AppRoutes.createWallet));
                            },
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          InkWell(
                            child: Row(children: [
                              Icon(
                                YolletIcons.setting,
                                color: ThemeColors.theme_400,
                                size: 16.w,
                              ),
                              SizedBox(
                                width: 4.w,
                              ),
                              AutoSizeText(
                                AppLocalizations.of(context)!
                                    .getString("management"),
                                style:
                                ThemeTextStyles.mainPageAddItem,
                              ),
                            ]),
                            // style: ButtonStyle(
                            //     textStyle:
                            //         MaterialStateProperty.all(
                            //             ThemeTextStyles
                            //                 .mainPageAddItem),
                            //     padding: MaterialStateProperty.all(
                            //         EdgeInsets.all(0)),
                            //     elevation:
                            //         MaterialStateProperty.all(0),
                            //     minimumSize:
                            //         MaterialStateProperty.all(
                            //             Size(39, 10))),
                            onTap: () {
                              appStore.dispatch(NavigateToAction(
                                  to: AppRoutes
                                      .settingPaymentMethod));
                            },
                          ),
                        ],
                      )
                          : Container(),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                if (state.walletList.isEmpty)
                  Container(
                    // width:MediaQuery.of(context).size.width,
                    child: Center(
                      child: CardWidget(
                        balance: "0",
                        currentTradePrice: 0,
                        currencyBalance: "0",
                        tokenName: "VIX",
                        // coinName: "vixco",
                        titleName: "VIXPAY",
                        address: Common.getAbbreviatedAddress16(
                            "0x563e48b7c8b40a0f347f5ed3c2fbc703de2a9e9d"),
                        onPayPress: () {
                          // Navigator.pop(context);
                          // showPopup(context, BottomPopupWidget(title: "Pay",coinName: "LiteCoin",address: "0x563e48b7c8b40a0f347f5ed3c2fbc703de2a9e9d",));
                        },
                        onRewardPress: () {
                          // Navigator.pop(context);
                          // showPopup(context, BottomPopupWidget(title: "Reward",coinName: "LiteCoin",address: "0x563e48b7c8b40a0f347f5ed3c2fbc703de2a9e9d",));
                        },
                        coinImage: CoinImageWidget(
                          url: "assets/img/vix.png",
                          width: 16.w,
                          height: 16.h,
                        ),
                        isEmpty: true,
                        color: ThemeColors.sub_color[0],
                        onAddPress: () {
                          appStore.dispatch(
                              NavigateToAction(to: AppRoutes.createWallet));
                        },
                      ),
                    ),
                  )
                else
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: 214.h,
                      // height: 258.h,
                      child: Swiper(
                        // outer: true,
                          itemHeight: 214.h,
                          itemWidth: 208.w,
                          fade: 0.7,
                          viewportFraction: 0.9,
                          scale: 1,
                          itemBuilder: (c, i) {
                            WalletInfo _walletInfo = state.walletList[i];
                            bool emptyToken =
                                _walletInfo.addressInfo?.isEmptyBalance ??
                                    true;
                            List<QueryBalanceInfo>? queryBalanceInfoList =
                                _walletInfo
                                    .addressInfo?.queryBalanceInfoList;
                            String tokenId = "VIXP";
                            // if (_walletInfo.addressInfo!.addInfo ==null) {
                            //   tokenId = "";
                            // } else {
                            //   tokenId = (_walletInfo.addressInfo!.addInfo!
                            //       .split("-")[0]);
                            // }
                            // String tokenId = (_walletInfo
                            //     .addressInfo!.addInfo!
                            //     .split("-")[0]);
                            // num currentTradePrice =  state.currentTradePrice;
                            // BalanceInfo _balanceInfo =balanceInfoList!.isEmpty
                            //     ?BalanceInfo(tokenId:tokenId)
                            //     :(balanceInfoList.first);
                            QueryBalanceInfo _queryBalanceInfo;
                            if (queryBalanceInfoList == null ||
                                queryBalanceInfoList.isEmpty) {
                              _queryBalanceInfo =
                                  QueryBalanceInfo(tokenId: tokenId);
                            } else {
                              _queryBalanceInfo =
                              (queryBalanceInfoList.first);
                            }

                            Function onEvent = (state, data) async {
                              await appStore.dispatch(AddNotificationInfo(
                                  notificationInfo: NotificationInfo(
                                      id: "0",
                                      type: state,
                                      title:
                                      data['storeName'] ?? "" + state,
                                      contents: jsonEncode(data),
                                      date:
                                      DateFormat('yy.MM.dd. a hh:mm:ss')
                                          .format(DateTime.now()))));

                              switch (state) {
                                case 'transfer':
                                  await appStore.dispatch(
                                      SetPaymentTransfer(
                                          paymentTransferData: data));
                                  await appStore.dispatch(SetCurrentAccount(
                                      currentAccountAddress:
                                      _walletInfo.address,
                                      currentTokenId:
                                      _queryBalanceInfo.tokenId));

                                  await appStore.dispatch(
                                      SetTransferAccount(
                                          transferAccountAddress:
                                          data['settlementAddress'],
                                          transferAccountComment:
                                          data['settlementAddress'],
                                          transferAccountAmount: num.parse(
                                              data['tokenAmount'])));

                                  String storeName = data['storeName'];
                                  if (storeName.length > 4) {
                                    storeName = storeName.substring(0, 4);
                                  }

                                  showPopup(
                                      context,
                                      BottomTransferPopupWidget(
                                        title:
                                        "confirm_transfer_information",
                                        amount:
                                        num.parse(data['tokenAmount']),
                                        currencyAmount: num.parse(
                                            data['exchangeAmount']),
                                        coinName: _queryBalanceInfo.tokenId,
                                        fromAccountName: _walletInfo.name,
                                        fromAddress: _walletInfo.address,
                                        fromBalance:
                                        _queryBalanceInfo.totalBalance,
                                        fromCurrencyBalance:
                                        _queryBalanceInfo
                                            .exchangeTotalBalance,
                                        fromCoinName:
                                        _queryBalanceInfo.tokenId,
                                        fromUrl: Common.getUrl(
                                            _queryBalanceInfo.tokenId),
                                        toAddress:
                                        data['settlementAddress'],
                                        comment: data['comment'],
                                        isCommentReadOnly: true,
                                        onPressed: () async {
                                          await appStore.dispatch(
                                              NavigateToAction(
                                                  to: AppRoutes
                                                      .payTransferPasscode,
                                                  isStayPopup: true));
                                        },
                                      ));
                                  break;
                                case 'end_reward':
                                  appStore.dispatch(
                                      DismissPopupAction(result: null));
                                  appStore.dispatch(StopPayment());
                                  await appStore.dispatch(SetTransaction(
                                      transactionId: data["transactionId"],
                                      transactionDate:
                                      DateTime.now().toString()));
                                  break;

                                case 'end':
                                case 'end_pay':
                                  await appStore.dispatch(SetTransaction(
                                      transactionId: data["transactionId"],
                                      transactionDate:
                                      DateTime.now().toString()));
                                  break;
                                case 'error':
                                  var success = data['resCode'] == '00';
                                  var resMessage = data['resMessage'];
                                  await alertCallback(
                                      success ? "info" : "error",
                                      resMessage, callback: () {
                                    appStore.dispatch(
                                        DismissPopupAction(result: null));
                                    appStore.dispatch(StopPayment());
                                    // _stopPayment(state, action, next);
                                  });
                                  break;
                              }
                            };
                            String formatBalance = "";
                            if (_queryBalanceInfo.totalBalance == null ||
                                _queryBalanceInfo.totalBalance!.isNaN) {
                              formatBalance = "0";
                            } else {
                              YolletState state =
                                  appStore.state.yolletState;
                              num? decimalPoint = 0;
                              for (TokenInfo item in state.tokenList) {
                                if (item.tokenId == tokenId) {
                                  decimalPoint = item.decimalPoint;
                                }
                              }
                              formatBalance = CurrencyFormatter.get(
                                  decimalPoint?.toInt() ?? 0)
                                  .format(_queryBalanceInfo.totalBalance!)
                                  .toString();
                            }

                            String formatExchangeBalance = "";
                            if (_queryBalanceInfo.exchangeTotalBalance ==
                                null ||
                                _queryBalanceInfo
                                    .exchangeTotalBalance!.isNaN) {
                              formatExchangeBalance = "0";
                            } else {
                              // YolletState state = appStore.state.yolletState;
                              // num? decimalPoint = 0;
                              // for (TokenInfo item in state.tokenList) {
                              //   if (item.tokenId == tokenId) {
                              //     decimalPoint = item.decimalPoint;
                              //   }
                              // }
                              formatExchangeBalance =
                                  CurrencyFormatter.get(0)
                                      .format(_queryBalanceInfo
                                      .exchangeTotalBalance!)
                                      .toString();
                            }
                            return Center(
                                child: CardWidget(
                                  balance: formatBalance,
                                  currencyBalance: formatExchangeBalance,
                                  tokenName: emptyToken
                                      ? ""
                                      : _queryBalanceInfo.tokenId,
                                  //getTokenName(state,_balanceInfo.tokenId??""),
                                  // coinName: _walletInfo.name,
                                  titleName: _walletInfo.name,
                                  address: Common.getAbbreviatedAddress16(
                                      _walletInfo.address!),
                                  // ////////////////////////////////////////////
                                  onPayPress: emptyToken
                                      ? () {
                                    actionDialog(
                                      actions: [],
                                      text: AppLocalizations.of(context)!
                                          .getString('empty_token'),
                                    );
                                  }
                                      : () async {
                                    if(_walletInfo.addressInfo != null && !_walletInfo.addressInfo!.hasKeyIndex){
                                      actionDialog(
                                        actions: [],
                                        text: AppLocalizations.of(context)!
                                            .getString('empty_keyindex'),
                                      );
                                      return;
                                    }

                                    appStore.dispatch(StartPayment(
                                        addressInfo:
                                        _walletInfo.addressInfo,
                                        onEvent: onEvent));
                                    var result = await showPopup(
                                        context,
                                        BottomPopupWidget(
                                            title: "pay",
                                            coinName: _walletInfo.name,
                                            address: _walletInfo.address,
                                            qrText: makePayQRString(
                                              tokenId: _queryBalanceInfo
                                                  .tokenId ??
                                                  "",
                                              address:
                                              _walletInfo.address,
                                            ),
                                            coinUrl: Common.getUrl(
                                                _queryBalanceInfo
                                                    .tokenId ??
                                                    "")));
                                    if (result == null) {
                                      appStore.dispatch(StopPayment());
                                    }
                                  },
                                  onRewardPress: emptyToken
                                      ? () {
                                    actionDialog(
                                      actions: [],
                                      text: AppLocalizations.of(context)!
                                          .getString('empty_token'),
                                    );
                                  }
                                      : () async {
                                    appStore.dispatch(StartPayment(
                                        addressInfo:
                                        _walletInfo.addressInfo,
                                        onEvent: onEvent));

                                    var result = await showPopup(
                                        context,
                                        BottomPopupWidget(
                                            title: "reward",
                                            coinName: _walletInfo.name,
                                            address: _walletInfo.address,
                                            qrText: makePayQRString(
                                              tokenId: _queryBalanceInfo
                                                  .tokenId ??
                                                  "",
                                              address:
                                              _walletInfo.address,
                                            ),
                                            coinUrl: Common.getUrl(
                                                _queryBalanceInfo
                                                    .tokenId ??
                                                    "")));
                                    if (result == null) {
                                      appStore.dispatch(StopPayment());
                                    }
                                  },
                                  coinImage: emptyToken
                                      ? EmptyCoinImageWidget()
                                      : CoinImageWidget(
                                    url: Common.getUrl(
                                        _queryBalanceInfo.tokenId ?? ""),
                                    width: 16.w,
                                    height: 16.h,
                                  ),
                                  isEmpty: state.walletList.isEmpty,
                                  color: getColor(_walletInfo.index),
                                ));
                          },
                          // pagination:
                          //     new SwiperPagination(alignment: Alignment.topCenter),
                          itemCount: state.walletList.length,
                          onIndexChanged: (int index) =>
                          Common.walletSwiperIndex = index,
                          index: Common.walletSwiperIndex,
                          loop: false)),
                SizedBox(
                  height: 32.h,
                ),
                Column(
                  children: [
                    Container(
                      height: 20.h,
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MainSubject(text: "my_accounts"),
                          state.addressInfoList.length != 0
                              ? InkWell(
                            child: Row(children: [
                              Icon(
                                YolletIcons.box_plus,
                                color: ThemeColors.theme_400,
                                size: 16.w,
                              ),
                              SizedBox(
                                width: 4.w,
                              ),
                              AutoSizeText(
                                AppLocalizations.of(context)!
                                    .getString("add"),
                                style:
                                ThemeTextStyles.mainPageAddItem,
                              ),
                            ]),
                            // style: ButtonStyle(
                            //   textStyle: MaterialStateProperty.all(
                            //       ThemeTextStyles.mainPageAddItem),
                            //   padding: MaterialStateProperty.all(
                            //       EdgeInsets.all(0)),
                            //   elevation:
                            //       MaterialStateProperty.all(0),
                            //   minimumSize:
                            //       MaterialStateProperty.all(
                            //           Size(39, 10)),
                            // ),
                            onTap: () async {
                              if (state.addressInfoList.length >=
                                  20) {
                                await alertCallback(
                                    "error", "maximum_address",
                                    callback: () {
                                      appStore.dispatch(
                                          DismissPopupAction(
                                              result: null));
                                      // _stopPayment(state, action, next);
                                    });
                              } else {
                                appStore.dispatch(NavigateToAction(
                                    to: AppRoutes.createAccount));
                              }
                            },
                          )
                              : Container(),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    state.addressInfoList.length == 0
                        ? AccountEmptyWidget(
                      onPress: () {
                        appStore.dispatch(NavigateToAction(
                            to: AppRoutes.createAccount));
                      },
                    )
                        : getMyAccountList(state),
                  ],
                ),
              ],
            ),
            onRefresh: refreshList,
          ),
        ));
  }

  String? getTokenName(state, tokenId) {
    for (TokenInfo info in state.tokenList) {
      if (info.tokenId == tokenId) {
        return info.tokenName;
      }
    }
    return tokenId;
  }

  /* Widget getStakingWidget(YolletState state) {
    return Container(
      height: 56.h,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      color: ThemeColors.grey_f6f6f6,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedText(
              height: 36.h,
              width: 90.w,
              text: "VIXCO " +
                  AppLocalizations.of(context)!.getString("staking_info"),
              textStyle: ThemeTextStyles.stakingTitle,
              alignment: Alignment.topLeft,
              overflow: TextOverflow.ellipsis),
          SizedBox(
            width: 12.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.h,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                SizedText(
                    height: 21.h,
                    text: getStakingAmount(
                        state: state, stakingInfo: state.stakingInfo),
                    textStyle: ThemeTextStyles.stakingAmount,
                    alignment: Alignment.centerLeft,
                    overflow: TextOverflow.ellipsis),
                SizedBox(
                  width: 6.w,
                ),
                SizedText(
                    height: 21.h,
                    // width:251.w,
                    text: state.stakingInfo.symbol,
                    textStyle: ThemeTextStyles.stakingTokenName,
                    alignment: Alignment.centerLeft,
                    overflow: TextOverflow.ellipsis),
              ]),
              SizedBox(
                height: 17.h,
                width: 162.w,
                child: Text(
                  */ /*Common.getAbbreviatedAddress16(state.stakingInfo.address)*/ /*
                  state.stakingInfo.address,
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
          Container(
            width: 36.w,
            height: 36.h,
            decoration: BoxDecoration(
              color: ThemeColors.gray_200,
              borderRadius: BorderRadius.all(Radius.elliptical(12, 12)),
            ),
            child: IconButton(
              icon: Icon(
                YolletIcons.qr,
                color: ThemeColors.gray_500,
              ),
              iconSize: 20.w,
              padding: EdgeInsets.all(0),
              onPressed: () {
                if (state.stakingInfo.address.isEmpty) {
                  actionDialog(
                    actions: [],
                    text:
                        AppLocalizations.of(context)!.getString('empty_token')!,
                  );
                } else {
                  showPopup(
                      context,
                      BottomPopupWidget(
                        title: "VIXCO " +
                            AppLocalizations.of(context)!
                                .getString("staking_address")!,
                        coinName: state.stakingInfo.symbol,
                        address: state.stakingInfo.address,
                        coinUrl: "",
                      ));
                }
              },
            ),
          )
        ],
      ),
    );
  }*/

  Widget getEthereumWidget(YolletState state) {
    return Container(
      height: 56.h,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      color: ThemeColors.grey_f6f6f6,
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
          Container(
            width: 36.w,
            height: 36.h,
            decoration: BoxDecoration(
              color: ThemeColors.gray_200,
              borderRadius: BorderRadius.all(Radius.elliptical(12, 12)),
            ),
            child: IconButton(
              icon: Icon(
                YolletIcons.send,
                color: ThemeColors.gray_500,
              ),
              iconSize: 20.w,
              padding: EdgeInsets.all(0),
              onPressed: () async {
                if (state.ethereumInfo.address.isEmpty) {
                  actionDialog(
                    actions: [],
                    text:
                    AppLocalizations.of(context)!.getString('empty_token'),
                  );
                } else {
                  // await appStore.dispatch(
                  //     UpdateAccountBalance(address: state.ethereumInfo.address));
                  await appStore.dispatch(SetCurrentAccount(
                      currentAccountAddress: state.ethereumInfo.address,
                      currentTokenId: state.ethereumInfo.tokenId,
                      currentKeyName:
                      AppLocalizations.of(context)!.getString('vixco'),
                      currentAccountName:
                      AppLocalizations.of(context)!.getString('vixco'),
                      currentCoinName: "VIX",
                      currentBalance: num.parse(state.ethereumInfo.amount),
                      availableCurrentBalance:
                      num.parse(state.ethereumInfo.amount),
                      currentIsVixco: true));
                  await appStore
                      .dispatch(NavigateToAction(to: AppRoutes.accountInfo));
                }
              },
            ),
          )
        ],
      ),
    );
  }

  Widget getMyAccountList(YolletState state) {
    List<Widget> list = [];
    for (AddressInfo info in state.addressInfoList) {
      // List<String> split;
      // if (info.addInfo == null || info.addInfo!.isEmpty) {
      //   split = "-".split("-");
      // } else {
      //   split = info.addInfo!.split("-");
      //   if (split.length == 1) {
      //     split = [info.addInfo!, ""];
      //   }
      // }
      String addInfo = info.addInfo ?? "";
      //temp code
      if (addInfo.startsWith("VIXP-")) {
        addInfo = addInfo.substring(5);
      }
      if (info.isEmptyBalance) {
        TokenInfo? tokenItem;
        String? tokenId = "VIXP";
        for (TokenInfo item in state.tokenList) {
          if (item.tokenId == tokenId) {
            tokenItem = item;
          }
        }
        list.add(Container(
            width: MediaQuery.of(context).size.width,
            child: MyAccountItem(
                accountName: addInfo,
                balance: 0,
                currencyBalance: 0,
                tokenId: "",
                currentBalance: "",
                // 0.toString() + " KRW",
                // onPressed:null,
                onPressed: () async {
                  /*
                  //emptyToken
                  await appStore
                      .dispatch(UpdateAccountBalance(address: info.address));
                  await appStore.dispatch(SetCurrentAccount(
                      currentAccountAddress: info.address,
                      currentTokenId: tokenId,
                      currentKeyName: info.addInfo));
                  await appStore
                      .dispatch(NavigateToAction(to: AppRoutes.accountInfo));
                  */
                },
                emptyToken: true,
                onAddToken: () async {
                  await appStore
                      .dispatch(UpdateAccountBalance(address: info.address));
                  await appStore.dispatch(SetCurrentAccount(
                      currentAccountAddress: info.address,
                      currentTokenId: tokenId,
                      currentKeyName: info.addInfo));
                  await appStore
                      .dispatch(NavigateToAction(to: AppRoutes.assignToken));
                },
                onRemoveAddress: () async {
                  actionDialog(
                    // title: 'info',
                      text: 'remove_account',
                      actions: <Widget>[
                        BtnFillPopup(
                          backgroundColor: ThemeColors.gray_400,
                          onPressed: () {
                            appStore.dispatch(DismissPopupAction());
                          },
                          child: AutoSizeText(
                            Global.getString('cancel'),
                            style: ThemeTextStyles.BottomButton,
                          ),
                        ),
                        BtnFillPopup(
                          onPressed: () async {
                            await appStore.dispatch(RemoveAccountSelf(
                                address: info.address,
                                tokenId: tokenId,
                                addInfo: info.addInfo));
                            appStore.dispatch(DismissPopupAction());
                          },
                          child: AutoSizeText(
                            Global.getString('confirm'),
                            style: ThemeTextStyles.BottomButton,
                          ),
                        )
                      ]);

                  //
                  // await appStore
                  //     .dispatch(NavigateToAction(to: AppRoutes.accountInfo));
                  // await appStore
                  //     .dispatch(UpdateAccountBalance(address: info.address));
                  // await appStore.dispatch(SetCurrentAccount(
                  //     currentAccountAddress: info.address,
                  //     currentTokenId: "tokenId",
                  //     currentKeyName: info.addInfo));
                },
                coinImage: EmptyCoinImageWidget())));
      } else {
        for (QueryBalanceInfo binfo in info.queryBalanceInfoList!) {
          TokenInfo? tokenItem;
          String? tokenId = binfo.tokenId;
          for (TokenInfo item in state.tokenList) {
            if (item.tokenId == binfo.tokenId) {
              tokenItem = item;
            }
          }
          list.add(Row(
            children: [
              info.isStoreAddress
                  ? Container(
                width: 8.w,
                height: 84.h,
                color: ThemeColors.sub_color_sky_blue,
              )
                  : Container(
                width: 8.w,
                height: 84.h,
                color: ThemeColors.gray_200,
              ),
              // state.currentIsVixco
              //     ? Container(
              //         color: Color(0xffFAFEFF),
              //         child: MyAccountItem(
              //             accountName: addInfo,
              //             balance: binfo.totalBalance,
              //             currencyBalance: binfo.exchangeTotalBalance,
              //             tokenId: binfo.tokenId ?? "",
              //             currentBalance: "",
              //             // binfo.balance.toString() + " KRW",
              //             // currentTradePrice: ,
              //             onPressed: () async {
              //               await appStore.dispatch(
              //                   UpdateAccountBalance(address: info.address));
              //               await appStore.dispatch(SetCurrentAccount(
              //                   currentAccountAddress: info.address,
              //                   currentTokenId: binfo.tokenId,
              //                   currentKeyName: info.addInfo));
              //               // await appStore.dispatch(GetTransferList(address:info.address,tokenId:binfo.tokenId));
              //               await appStore.dispatch(
              //                   NavigateToAction(to: AppRoutes.accountInfo));
              //             },
              //             coinImage: CoinImageWidget(
              //               url: tokenItem?.url ?? Common.getUrl(tokenId),
              //             )))
              //     :
              Container(
                  child: MyAccountItem(
                      accountName: addInfo,
                      balance: binfo.totalBalance,
                      currencyBalance: binfo.exchangeTotalBalance,
                      tokenId: binfo.tokenId ?? "",
                      currentBalance: "",
                      // binfo.balance.toString() + " KRW",
                      // currentTradePrice: ,
                      onPressed: () async {
                        await appStore.dispatch(
                            UpdateAccountBalance(address: info.address));
                        await appStore.dispatch(SetCurrentAccount(
                          currentAccountAddress: info.address,
                          currentTokenId: binfo.tokenId,
                          currentKeyName: info.addInfo,
                          currentIsStoreAddress: info.isStoreAddress,
                        ));
                        // await appStore.dispatch(GetTransferList(address:info.address,tokenId:binfo.tokenId));
                        await appStore.dispatch(
                            NavigateToAction(to: AppRoutes.accountInfo));
                      },
                      coinImage: CoinImageWidget(
                        url: tokenItem?.url ?? Common.getUrl(tokenId),
                      ))),
            ],
          ));
          // list.add(
          //   MyAccountItem(
          //     accountName: addInfo,
          //     balance: binfo.totalBalance,
          //     currencyBalance: binfo.exchangeTotalBalance,
          //     tokenId: binfo.tokenId ?? "",
          //     currentBalance: "",
          //     // binfo.balance.toString() + " KRW",
          //     // currentTradePrice: ,
          //     onPressed: () async {
          //       await appStore
          //           .dispatch(UpdateAccountBalance(address: info.address));
          //       await appStore.dispatch(SetCurrentAccount(
          //           currentAccountAddress: info.address,
          //           currentTokenId: binfo.tokenId,
          //           currentKeyName: info.addInfo));
          //       // await appStore.dispatch(GetTransferList(address:info.address,tokenId:binfo.tokenId));
          //       await appStore
          //           .dispatch(NavigateToAction(to: AppRoutes.accountInfo));
          //     },
          //     coinImage: CoinImageWidget(
          //       url: tokenItem?.url ?? Common.getUrl(tokenId),
          //     ),
          //   ),
          // );
        }
      }
    }
    return Column(children: list);
  }
}

class AccountEmptyWidget extends StatefulWidget {
  final void Function()? onPress;

  const AccountEmptyWidget({Key? key, this.onPress}) : super(key: key);

  @override
  AccountEmptyWidgetState createState() => AccountEmptyWidgetState();
}

class AccountEmptyWidgetState extends State<AccountEmptyWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 67.h,
        ),
        SizedText(
          height: 18.h,
          text: "your_accounts_are_no_available",
          textStyle: ThemeTextStyles.cardMyAccountEmpty,
          alignment: Alignment.center,
        ),
        SizedBox(
          height: 20.h,
        ),
        BtnCard(
          width: 184.w,
          height: 40.h,
          backgroundColor: ThemeColors.theme_400,
          text: "add_account",
          icon: YolletIcons.add,
          onPressed: widget.onPress,
        )
      ],
    );
  }
}

class MyAccountItem extends StatefulWidget {
  final String? accountName;
  final num? balance;
  final num? currencyBalance;
  final String tokenId;
  final String? currentBalance;
  final bool emptyToken;
  final VoidCallback? onPressed;
  final Widget? coinImage;
  final String? currentTradePrice;
  final VoidCallback? onAddToken;
  final VoidCallback? onRemoveAddress;

  MyAccountItem({
    Key? key,
    this.accountName,
    this.balance,
    this.currencyBalance,
    this.tokenId = "",
    this.currentBalance,
    this.emptyToken = false,
    this.onPressed,
    this.coinImage,
    this.currentTradePrice,
    this.onAddToken,
    this.onRemoveAddress,
  }) : super(key: key);

  @override
  MyAccountItemState createState() => MyAccountItemState();
}

class MyAccountItemState extends State<MyAccountItem> {
  @override
  Widget build(BuildContext context) {
    String formatBalance = "";
    if (widget.balance == null) {
      formatBalance = "0";
    } else {
      YolletState state = appStore.state.yolletState;
      num? decimalPoint = 0;
      for (TokenInfo item in state.tokenList) {
        if (item.tokenId == widget.tokenId) {
          decimalPoint = item.decimalPoint;
        }
      }
      formatBalance = CurrencyFormatter.get(decimalPoint?.toInt() ?? 0)
          .format(widget.balance!)
          .toString();
    }
    // if (widget.emptyToken) {
    //   formatBalance =
    //       AppLocalizations.of(context)!.getString("no_registered_tokens")!;
    // } else {
    //
    // }
    String formatExchangeBalance = "";
    if (widget.balance == null) {
      formatExchangeBalance = "0";
    } else {
      // YolletState state = appStore.state.yolletState;
      // num? decimalPoint = 0;
      // for (TokenInfo item in state.tokenList) {
      //   if (item.tokenId == widget.tokenId) {
      //     decimalPoint = item.decimalPoint;
      //   }
      // }
      formatExchangeBalance =
          CurrencyFormatter.get(0).format(widget.currencyBalance!).toString();
    }

    return Container(
      width: MediaQuery.of(context).size.width - 14.w,
      padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 10.h),
      height: 84.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Visibility(
                visible: widget.tokenId.isNotEmpty,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        width: 32.w,
                        height: 32.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(64.w)),
                          color: Color.fromRGBO(240, 240, 240, 1),
                        ),
                        child: widget.coinImage ?? Icon(Icons.add)),
                    SizedBox(height: 4.h),
                    SizedText(
                      height: 15.h,
                      text: widget.tokenId,
                      textStyle: ThemeTextStyles.mainAccountItemCoinName,
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: widget.tokenId.isEmpty,
                child: Container(
                    width: 32.w,
                    height: 32.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(64.w)),
                      color: Color.fromRGBO(240, 240, 240, 1),
                    ),
                    child: widget.coinImage ?? Icon(Icons.add)),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedText(
                      height: 15.h,
                      text: widget.accountName,
                      textStyle: ThemeTextStyles.mainAccountItemName,
                    ),
                    SizedBox(width: 3.h),
                    widget.emptyToken
                        ? SizedText(
                      height: 18.h,
                      width: 160.w,
                      text: AppLocalizations.of(context)!
                          .getString("no_registered_tokens"),
                      textStyle:
                      ThemeTextStyles.mainAccountItemBalanceEmpty,
                    )
                        : SizedText(
                      height: 23.h,
                      text: formatBalance,
                      textStyle: ThemeTextStyles.mainAccountItemBalance,
                    ),
                    widget.emptyToken ? Container() : SizedBox(width: 3.h),
                    widget.emptyToken
                        ? Container()
                        : Row(
                      // mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedText(
                          //width: 36.w,
                            height: 21.h,
                            text: formatExchangeBalance,
                            textStyle: ThemeTextStyles
                                .accountListCurrentTradePrice,
                            overflow: TextOverflow.ellipsis),
                        SizedBox(width: 4.w),
                        SizedText(
                          //width: 36.w,
                            height: 21.h,
                            text: "krw",
                            textStyle: ThemeTextStyles
                                .accountListCurrentTradeCurrency,
                            overflow: TextOverflow.ellipsis),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          widget.emptyToken
              ? Row(
            children: [
              Container(
                  width: 36.w,
                  height: 36.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12.w)),
                    color: ThemeColors.gray_100,
                  ),
                  child: IconButton(
                      padding: const EdgeInsets.all(0),
                      icon: Icon(
                        YolletIcons.add2,
                        color: ThemeColors.gray_500,
                        size: 16.w,
                      ),
                      onPressed: widget.onAddToken)),
              SizedBox(width: 12.h),
              Container(
                  width: 36.w,
                  height: 36.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12.w)),
                    color: ThemeColors.gray_100,
                  ),
                  child: IconButton(
                      padding: const EdgeInsets.all(0),
                      icon: Icon(
                        YolletIcons.trash,
                        color: ThemeColors.gray_500,
                        size: 16.w,
                      ),
                      onPressed: widget.onRemoveAddress)),
            ],
          )
              : Opacity(
            opacity: widget.onPressed == null ? 0.2 : 1,
            child: Container(
                width: 36.w,
                height: 36.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12.w)),
                  color: ThemeColors.gray_100,
                ),
                child: IconButton(
                    padding: const EdgeInsets.all(0),
                    icon: Icon(
                      YolletIcons.send,
                      color: ThemeColors.gray_500,
                      size: 24.w,
                    ),
                    onPressed: widget.onPressed)),
          ),
        ],
      ),
    );
  }
}

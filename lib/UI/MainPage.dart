import 'dart:async';
import 'dart:convert';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import 'package:flutter_card_swipper/widgets/flutter_page_indicator/flutter_page_indicator.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:intl/intl.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:yollet/Data/Dataset/NotificationInfo.dart';
import 'package:yollet/Data/Dataset/QueryBalanceInfo.dart';
import 'package:yollet/Data/Dataset/TokenInfo.dart';
import 'package:yollet/Data/Dataset/WalletInfo.dart';
import 'package:yollet/Mgr/Navigation/app_routes.dart';
import 'package:yollet/Mgr/redux/action.dart';
import 'package:yollet/Mgr/redux/state.dart';
import 'package:yollet/UI/BottomTransferPopupWidget.dart';
import 'package:yollet/UI/QRViewPage.dart';
import 'package:yollet/UI/template.dart';
import 'package:yollet/Util/Common/Common.dart';
import 'package:yollet/Util/Common/global_widgets.dart';
import 'package:yollet/Util/Format/NumberFormatUtil.dart';
import 'package:yollet/themeStyle.dart';
import 'package:yollet_client/yollet_client.dart';

class MainPage extends StatefulWidget {
  MainPage() : super(key: Global.appKey);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with Reloadable {
  GlobalKey<BodyState> bodyKey = GlobalKey();
  static const platform = const MethodChannel('com.yoshop.vixpay/channel');

  @override
  void initState() {
    super.initState();
    // reload();
    // SchedulerBinding.instance!.addPostFrameCallback((_) {
    //   reload();
    // });
  }

  void setEventChanel() {
    rewardUri().then(_onRedirected);
  }

  Future<String?> rewardUri() async {
    try {
      return platform.invokeMethod('reward');
    } on PlatformException catch (e) {
      return "Failed to Invoke: '${e.message}'.";
    }
  }

  _onRedirected(String? results) {
    if (results == null) {
      return;
    }

    var iniQr = results;
    String _parsingText = 'qr_data=';
    if (results != null) {
      int index = results.indexOf(_parsingText);

      if (index > 0) {
//             iniQr=  results.substring(0, index);
        iniQr = results.substring(_parsingText.length + index);
      }
    }

    // if(results.startsWith("https://")||results.startsWith("http://")||results.startsWith("yollet://")) {
    //   var iniQr="";
    //   Uri initialUri = Uri.parse(results);
    //   final params = initialUri?.queryParametersAll?.entries?.toList();
    //   if(params==null){
    //     return;
    //   }
    //   // var cUrl = params[0].value;
    //   // var cInittoken = params[1].value;
    //
    //   initialUri.queryParameters.forEach((i, k) {
    //     if (i == 'qr_code') {
    //       iniQr = k.toString();
    //       parsingQrReward(iniQr);
    //     }
    //   });
    // }else{
    //   parsingQrReward(results);
    // }
    parsingQrReward(iniQr);
  }

  Future<String?> parsingQrReward(String qr) async {
    // 1. QR의 해당토큰 지갑이 없는경우
    // + "토큰명" 적립이 가능한 지갑이 없습니다. 지갑을 생성해 주세요.
    // 2. QR의 해당토큰 지갑이 1개인경우
    // + 읽어낸 QR로 바로 적립 실행 후 결과 표시
    // 3. QR의 해당토큰 지갑이 2개 이상인 경우
    // + "토큰" 적립 가능한 지갑이 2개 이상입니다. 지갑을 선택 후 다시 스캔해 주세요

    //reward:4E0060F925EC0001:VIXP:0.99
    List<String> split;
    if (qr.isEmpty) {
      //invalid qr;
    } else {
      split = qr.split(":");
      //reward:4E0060F925EC0001:VIXP:0.99
      if (split.length == 4 && split[0] == "reward") {
        await appStore.dispatch(NavigateToAction(to: AppRoutes.home));

        String rewardId = split[1];
        String tokenId = split[2];
        String tokenAmount = split[3];

        YolletState state = appStore.state.yolletState;

        if (state.walletList.isEmpty) {
        } else {
          int count = 0;
          WalletInfo? currentWalletInfo;
          for (WalletInfo _walletInfo in state.walletList) {
            // bool emptyToken = _walletInfo.addressInfo?.isEmptyBalance ?? true;
            List<QueryBalanceInfo>? queryBalanceInfoList =
                _walletInfo.addressInfo?.queryBalanceInfoList;
            if (queryBalanceInfoList == null || queryBalanceInfoList.isEmpty) {
            } else {
              for (QueryBalanceInfo _queryBalanceInfo in queryBalanceInfoList) {
                if (tokenId == _queryBalanceInfo.tokenId) {
                  count++;
                  currentWalletInfo = _walletInfo;
                }
              }
            }
          }
          if (count == 0) {
            //    // + "토큰명" 적립이 가능한 지갑이 없습니다. 지갑을 생성해 주세요.
            await alertCallback("error", "reward_empty_wallet", callback: () {
              appStore.dispatch(DismissPopupAction(result: null));
              appStore.dispatch(StopPayment());
              // _stopPayment(state, action, next);
            });
          } else if (count > 1) {
            // + "토큰" 적립 가능한 지갑이 2개 이상입니다. 지갑을 선택 후 다시 스캔해 주세요
            await alertCallback("error", "reward_many_wallet", callback: () {
              appStore.dispatch(DismissPopupAction(result: null));
              appStore.dispatch(StopPayment());
              // _stopPayment(state, action, next);
            });
          } else {
            var data = await appStore.dispatch(DoYolletRewardAction(
                rewardId: rewardId,
                tokenId: tokenId,
                tokenAmount: tokenAmount,
                userAddress: currentWalletInfo?.address ?? ""));

            var success = data['resCode'] == '00';

            // String ERR_REWARD_NOT_ISSUED = "01";
            // String ERR_REWARD_EXPIRED = "02";
            // String ERR_REWARD_CANCELED = "03";
            // String ERR_BAD_AMOUNT = "04";
            // String ERR_REWARDED = "05";
            // String ERR_NOT_REWARDED = "06";

            var resMessage = data['resMessage'];
            await alertCallback(success ? "info" : "error", resMessage,
                callback: () {
              appStore.dispatch(DismissPopupAction(result: null));
              appStore.dispatch(StopPayment());
              // _stopPayment(state, action, next);
            });
          }
        }
      }
    }
  }

  @override
  Future<void> reload() async {
    // bodyKey.currentState?.refreshList();
    await appStore.dispatch(GetTokenList());
    await appStore.dispatch(RefreshCurrentExchangeRate());
    await appStore.dispatch(GetAccountList(isLoadWallet: true));

    // setEventChanel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultBody(
        Body(key: bodyKey),
        appBarWidget: MainPageAppBar(height: 88.h),
        paddingLR: 0,
        paddingTop: 0,
      ),
      bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }
}

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  BodyState createState() => BodyState();
}

class BodyState extends State<Body> {
  bool? canBeViewed;
  @override
  void initState() {
    super.initState();
    canBeViewed = false;
  }

  @override
  Widget build(BuildContext context) {
    void viewWallet() {
      setState(() {
        canBeViewed = true;
      });
    }

    return StoreConnector<AppState, YolletState>(
        converter: (store) => store.state.yolletState,
        builder: (_, YolletState state) {
          Future.delayed(Duration.zero, () async {
            if (!state.isFetching) {
              viewWallet();
            }
          });
          return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 88.h - 56.h,
            color: ThemeColors.white,
            child: Stack(
              children: [
                Positioned(
                    child: SingleChildScrollView(
                        child: AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      height: !canBeViewed!
                          ? MediaQuery.of(context).size.height -
                              88.h //appbar
                              -
                              56.h
                          : MediaQuery.of(context).size.height -
                              88.h //appbar
                              -
                              56.h //bottom navi bar
                              -
                              166.h, // +44.h // +height
                      width: MediaQuery.of(context).size.width,
                      child: WebView(
                        initialUrl: (defaultTargetPlatform ==
                                TargetPlatform.iOS)
                            ? "http://www.vixco.net/resource/event/index4apple.html"
                            : "http://www.vixco.net/resource/event/index4.html",
                        javascriptMode: JavascriptMode.unrestricted,
                      ),
                    )),
                    top: 0.h),
                AnimatedPositioned(
                  duration: Duration(milliseconds: 500),
                  child: SizedBox(
                      height: 166.h, child: BottomWidget()), // +44.h // +height
                  bottom: canBeViewed! ? 0 : -166.h,
                ),
              ],
            ),
          );
        });
  }
}

class BottomWidget extends StatelessWidget {
  final String? title;
  final String? qrText;
  final String? address;
  final String? coinUrl;
  final String? coinName;
  final String? currentTradePrice;
  BottomWidget({
    Key? key,
    this.title,
    this.qrText,
    this.address,
    this.coinUrl,
    this.coinName,
    this.currentTradePrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, YolletState>(
      converter: (store) => store.state.yolletState,
      builder: (_, YolletState state) => Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.all(Radius.circular(10.w)),
        //   boxShadow: ThemeBoxShadow.bottomButton,
        //   color: backgroundColor,
        // ),
        color: ThemeColors.transparent,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Stack(
            children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 166.h, // +height
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.w),
                        topRight: Radius.circular(16.w)),
                    color: ThemeColors.white,
                    boxShadow: ThemeBoxShadow.mainBottom,
                  ),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          appStore.dispatch(DismissPopupAction());
                        },
                        child: Column(children: [
                          // SizedBox(height: 8.h,),
                          Container(
                            height: 32.h,
                            child: Center(
                              child: Container(
                                  width: 32.w,
                                  height: 4.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(100.w)),
                                    color: Color.fromRGBO(231, 231, 231, 1),
                                  )),
                            ),
                          ),
                          // SizedBox(height: 16.h,),
                        ]),
                      ),
                      ConstrainedBox(
                          constraints: BoxConstraints.loose(
                            Size(MediaQuery.of(context).size.width, 134.h),
                          ),
                          child: Swiper(
                            // outer: true,
                            itemHeight: 134.h,
                            itemWidth: 127.w,
                            // fade: 0.7,
                            // viewportFraction: 0.9,
                            scale: 1,
                            itemBuilder: (c, i) {
                              WalletInfo _walletInfo = state.walletList[i];
                              return Container(
                                height: 134.h,
                                width: 127.w,
                                // padding: EdgeInsets.symmetric(horizontal: 24.w),
                                padding: EdgeInsets.only(
                                    left: 24.w, right: 24.w, bottom: 36),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    state.walletList.length == 0
                                        ? Container()
                                        : getAddressInfo(state, _walletInfo),
                                    getButtonWidget(context, state, _walletInfo)
                                  ],
                                ),
                              );
                            },
                            itemCount: state.walletList.length,
                            onIndexChanged: (int index) =>
                                Common.mainSwiperIndex = index,
                            index: Common.mainSwiperIndex,
                            loop: false,
                            // control:  SwiperControl(
                            //     padding: EdgeInsets.all(8.0.w)),
                            pagination: SwiperPagination(
                                margin: EdgeInsets.all(4.0.w),
                                builder: CustomDotSwiperPaginationBuilder(
                                    color: ThemeColors.grey_c4c4c4,
                                    size: 6.w,
                                    activeSize: 6.w,
                                    space: 8.w)),
                          ))
                    ],
                  )),
              Positioned.fill(
                child: Visibility(
                  visible: (state.walletList.length == 0),
                  child: Opacity(
                    opacity: 0.9,
                    child: InkWell(
                      onTap: () async => await appStore
                          .dispatch(NavigateToAction(to: AppRoutes.wallet)),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 166.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16.w),
                              topRight: Radius.circular(16.w)),
                          color: ThemeColors.gray_450,
                          boxShadow: ThemeBoxShadow.mainBottom,
                        ),
                        child: Center(
                            child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            DottedBorder(
                              borderType: BorderType.Oval,
                              color: ThemeColors.white,
                              strokeWidth: 1,
                              padding: const EdgeInsets.all(2),
                              dashPattern: const <double>[2, 2],
                              child: Container(
                                height: 64.h,
                                width: 64.w,
                                child: Icon(
                                  YolletIcons.add,
                                  size: 36.w,
                                  color: ThemeColors.white,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            SizedText(
                              text: "add_payment_method",
                              textStyle: ThemeTextStyles.cardAdd,
                              alignment: Alignment.center,
                            )
                          ],
                        )),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getAddressInfo(YolletState state, WalletInfo _walletInfo) {
    bool emptyToken = _walletInfo.addressInfo?.isEmptyBalance ?? true;

    List<QueryBalanceInfo>? queryBalanceInfoList =
        _walletInfo.addressInfo?.queryBalanceInfoList;
    String tokenId = "VIXP";
    // if (_walletInfo.addressInfo!.addInfo == null) {
    //   tokenId = "";
    // } else {
    //   tokenId = (_walletInfo.addressInfo!.addInfo!.split("-")[0]);
    // }

    // BalanceInfo _balanceInfo =balanceInfoList!.isEmpty
    //     ?BalanceInfo(tokenId:tokenId)
    //     :(balanceInfoList.first);
    QueryBalanceInfo _queryBalanceInfo;
    if (queryBalanceInfoList == null || queryBalanceInfoList.isEmpty) {
      _queryBalanceInfo = QueryBalanceInfo(tokenId: tokenId);
    } else {
      _queryBalanceInfo = (queryBalanceInfoList.first);
    }

    return MainAddressInfo(
      url: Common.getUrl(_queryBalanceInfo.tokenId ?? ""),
      name: _walletInfo.name,
      balance: _queryBalanceInfo.totalBalance ?? 0,
      tokenId: _queryBalanceInfo.tokenId ?? "",
      emptyToken: emptyToken,
      currencyBalance: _queryBalanceInfo.exchangeTotalBalance ?? 0,
    );
  }

  Widget getButtonWidget(
      BuildContext context, YolletState state, WalletInfo _walletInfo) {
    bool emptyToken = _walletInfo.addressInfo?.isEmptyBalance ?? true;

    return Row(
      children: [
        InkWell(
          onTap: emptyToken
              ? () {
                  // Mr Shoh
                  actionDialog(
                    actions: [],
                    text:
                        AppLocalizations.of(context)!.getString('empty_token'),
                  );
                }
              : () async {
                  await runQRReward(context, _walletInfo);
                },
          child: Container(
            height: 64.h,
            width: 64.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12.w)),
              color: ThemeColors.black_3b3d3c,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  YolletIcons.qr,
                  color: ThemeColors.white,
                  size: 24.r,
                ),
                SizedBox(height: 4.h),
                SizedText(
                  height: 15.h,
                  text: AppLocalizations.of(context)!.getString('qr_scan'),
                  textStyle: ThemeTextStyles.mainAppBottomButtonName,
                  alignment: Alignment.center,
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 8.w),
        InkWell(
          onTap: emptyToken
              ? () {
                  // Mr Shoh
                  actionDialog(
                    actions: [],
                    text:
                        AppLocalizations.of(context)!.getString('empty_token'),
                  );
                }
              : () async {
                  if (state.walletList.length == 0) {
                    return;
                  }
                  List<QueryBalanceInfo>? queryBalanceInfoList =
                      _walletInfo.addressInfo?.queryBalanceInfoList;
                  String tokenId = "VIXP";
                  // (_walletInfo.addressInfo!.addInfo!.split("-")[0]);
                  // BalanceInfo _balanceInfo =balanceInfoList!.isEmpty
                  //     ?BalanceInfo(tokenId:tokenId)
                  //     :(balanceInfoList.first);
                  QueryBalanceInfo _queryBalanceInfo;
                  if (queryBalanceInfoList == null ||
                      queryBalanceInfoList.isEmpty) {
                    _queryBalanceInfo = QueryBalanceInfo(tokenId: tokenId);
                  } else {
                    _queryBalanceInfo = (queryBalanceInfoList.first);
                  }

                  Function onEvent = (state, data) async {
                    await appStore.dispatch(AddNotificationInfo(
                        notificationInfo: NotificationInfo(
                            id: "0",
                            type: state,
                            title: data['storeName'] ?? "" + state,
                            contents: jsonEncode(data),
                            date: DateFormat('yy.MM.dd. a hh:mm:ss')
                                .format(DateTime.now()))));

                    switch (state) {
                      case 'transfer':
                        await appStore.dispatch(
                            SetPaymentTransfer(paymentTransferData: data));
                        await appStore.dispatch(SetCurrentAccount(
                            currentAccountAddress: _walletInfo.address,
                            currentTokenId: _queryBalanceInfo.tokenId));

                        await appStore.dispatch(SetTransferAccount(
                            transferAccountAddress: data['settlementAddress'],
                            transferAccountComment: data['settlementAddress'],
                            transferAccountAmount:
                                num.parse(data['tokenAmount'])));

                        String storeName = data['storeName'];
                        if (storeName.length > 4) {
                          storeName = storeName.substring(0, 4);
                        }

                        showPopup(
                            context,
                            BottomTransferPopupWidget(
                              title: "confirm_transfer_information",
                              amount: num.parse(data['tokenAmount']),
                              currencyAmount: num.parse(data['exchangeAmount']),
                              coinName: _queryBalanceInfo.tokenId,
                              fromAccountName: _walletInfo.name,
                              fromAddress: _walletInfo.address,
                              fromBalance: _queryBalanceInfo.totalBalance,
                              fromCurrencyBalance:
                                  _queryBalanceInfo.exchangeTotalBalance,
                              fromCoinName: _queryBalanceInfo.tokenId,
                              fromUrl: Common.getUrl(_queryBalanceInfo.tokenId),
                              toAddress: data['settlementAddress'],
                              comment: data['comment'],
                              isCommentReadOnly: true,
                              onPressed: () async {
                                await appStore.dispatch(NavigateToAction(
                                    to: AppRoutes.payTransferPasscode,
                                    isStayPopup: true));
                              },
                            ));
                        break;
                      case 'end_reward':
                        appStore.dispatch(DismissPopupAction(result: null));
                        appStore.dispatch(StopPayment());
                        await appStore.dispatch(SetTransaction(
                            transactionId: data["transactionId"],
                            transactionDate: DateTime.now().toString()));
                        break;

                      case 'end':
                      case 'end_pay':
                        await appStore.dispatch(SetTransaction(
                            transactionId: data["transactionId"],
                            transactionDate: DateTime.now().toString()));
                        break;
                      case 'error':
                        var success = data['resCode'] == '00';
                        var resMessage = data['resMessage'];
                        await alertCallback(
                            success ? "info" : "error", resMessage,
                            callback: () {
                          appStore.dispatch(DismissPopupAction(result: null));
                          appStore.dispatch(StopPayment());
                          // _stopPayment(state, action, next);
                        });
                        break;
                    }
                  };

                  appStore.dispatch(StartPayment(
                      addressInfo: _walletInfo.addressInfo, onEvent: onEvent));

                  var result = await showPopup(
                      context,
                      BottomPopupWidget(
                          title: "pay",
                          coinName: _walletInfo.name,
                          address: _walletInfo.address,
                          qrText: makePayQRString(
                            tokenId: _queryBalanceInfo.tokenId ?? "",
                            address: _walletInfo.address,
                          ),
                          coinUrl:
                              Common.getUrl(_queryBalanceInfo.tokenId ?? "")));
                  if (result == null) {
                    appStore.dispatch(StopPayment());
                  }
                },
          child: Container(
              height: 64.h,
              width: 64.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12.w)),
                color: ThemeColors.black_3b3d3c,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    YolletIcons.barcode,
                    color: ThemeColors.white,
                    size: 24.r,
                  ),
                  SizedBox(height: 4.h),
                  SizedText(
                    height: 15.h,
                    text: AppLocalizations.of(context)!.getString('pay'),
                    textStyle: ThemeTextStyles.mainAppBottomButtonName,
                    alignment: Alignment.center,
                  ),
                ],
              )),
        )
      ],
    );
  }

  String makePayQRString({String? tokenId, String? address}) {
    var uuid = gRpcClient.userUuid;
    var time = DateTime.now().millisecondsSinceEpoch + 5 * 60 * 1000;
    var qrData = '$uuid:$tokenId:$address:$time';
    return qrData;
  }

  List<String> split = [];
  Future<void> runQRReward(BuildContext context, WalletInfo _walletInfo) async {
    String? results = await Navigator.push(
      // waiting for the scan results
      context,
      MaterialPageRoute(
        builder: (context) => QRViewPage(), // open the scan view
      ),
    );
    if (results != null) {
      if (results.isEmpty) {
        //invalid qr;
      } else {
        String iniQr;
        String _parsingText = 'qr_data=';
        int index = results.indexOf(_parsingText);

        if (index > 0) {
          iniQr = results.substring(_parsingText.length + index);
        } else {
          iniQr = results;
        }
        split = [];
        // if(results.startsWith("https://")||results.startsWith("http://")||results.startsWith("yollet://")) {
        //   Uri initialUri = Uri.parse(results);
        //   final params = initialUri?.queryParametersAll?.entries?.toList();
        //   if(params==null){
        //     return;
        //   }
        //   initialUri.queryParameters.forEach((i, k) {
        //     if (i == 'qr_data') {
        //       iniQr = k.toString();
        //     }
        //   });
        // }else {
        //   iniQr = results;
        // }

        // split = iniQr.split(":");
        split = getSplit(iniQr, ":");

        // List<String>list =[];
        // String temp = iniQr;
        // while(true){
        //   int index = temp.indexOf(":");
        //   if(index>0){
        //     String text = temp.substring(0,index);
        //     split.add("-"+text);
        //     temp = temp.substring(":".length+index);
        //   }else{
        //     split.add(temp);
        //     break;
        //   }
        // }

        //reward:4E0060F925EC0001:VIXP:0.99
        // debugPrint(command);
        // debugPrint(rewardId);
        // debugPrint(tokenId);
        // debugPrint(tokenAmount);
        if (split.length == 4 && split[0] == "reward") {
          // String rewardId= split[1];
          // String tokenId=split[2];
          // String tokenAmount=split[3];

          var data = await appStore.dispatch(DoYolletRewardAction(
              rewardId: rewardId,
              tokenId: tokenId,
              tokenAmount: tokenAmount,
              userAddress: _walletInfo.address ?? ""));

          // var success = data['resCode'] == '00';
          const String ERR_REWARD_SUCCESS = "00";
          const String ERR_REWARD_NOT_ISSUED = "01";
          const String ERR_REWARD_EXPIRED = "02";
          const String ERR_REWARD_CANCELED = "03";
          const String ERR_BAD_AMOUNT = "04";
          const String ERR_REWARDED = "05";
          const String ERR_NOT_REWARDED = "06";
          String message = "";
          // var resMessage = data['resMessage'];
          switch (data['resCode']) {
            case ERR_REWARD_SUCCESS:
              message = "reward_success";
              break;
            case ERR_REWARD_NOT_ISSUED:
              message = "reward_not_issued";
              break;
            case ERR_REWARD_EXPIRED:
              message = "reward_expired";
              break;
            case ERR_REWARD_CANCELED:
              message = "reward_canceled";
              break;
            case ERR_BAD_AMOUNT:
              message = "reward_bad_amount";
              break;
            case ERR_REWARDED:
              message = "reward_rewarded";
              break;
            case ERR_NOT_REWARDED:
              message = "reward_not_rewarded";
              break;
            default:
              message = data['resMessage'];
              if (message.isEmpty) {
                message = "reward_fail";
              }
              break;
          }
          await actionDialog(
              text: AppLocalizations.of(context)!.getString(message),
              actions: <Widget>[
                TextButton(
                  child: AutoSizeText(
                      AppLocalizations.of(context)!.getString('ok')),
                  onPressed: () {
                    appStore.dispatch(DismissPopupAction());
                  },
                ),
              ]);
          return;
        }
      }
      await actionDialog(
          title: "error",
          text: "invalid_qr_code",
          actions: <Widget>[
            TextButton(
              child:
                  AutoSizeText(AppLocalizations.of(context)!.getString('ok')),
              onPressed: () {
                appStore.dispatch(DismissPopupAction());
              },
            ),
          ]);
    }
  }

  List<String> getSplit(String text, [String split = ":"]) {
    List<String> list = [];
    String temp = text;
    while (true) {
      int index = temp.indexOf(split);
      if (index > 0) {
        String text = temp.substring(0, index);
        list.add(text.toString());
        temp = temp.substring(split.length + index);
      } else {
        list.add(temp.toString());
        break;
      }
    }
    if (list.length == 4) {
      command = list[0];
      rewardId = list[1];
      tokenId = list[2];
      tokenAmount = list[3];
    }
    return list;
  }

  String command = "";
  String rewardId = "";
  String tokenId = "";
  String tokenAmount = "";
}

class MainAddressInfo extends StatelessWidget {
  final String? url;
  final String? name;
  final num? balance;
  final String? tokenId;
  final bool emptyToken;
  final num? currencyBalance;
  MainAddressInfo({
    Key? key,
    this.url,
    this.name,
    this.balance,
    this.tokenId,
    this.emptyToken = false,
    this.currencyBalance,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String formatBalance = "";
    String formatExchangeBalance = "";
    if (balance == null) {
      formatBalance = "0";
    } else {
      YolletState state = appStore.state.yolletState;
      num? decimalPoint = 0;
      for (TokenInfo item in state.tokenList) {
        if (item.tokenId == tokenId) {
          decimalPoint = item.decimalPoint;
        }
      }
      formatBalance = CurrencyFormatter.get(decimalPoint?.toInt() ?? 0)
          .format(balance)
          .toString();
    }
    if (balance == null) {
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
          CurrencyFormatter.get(0).format(currencyBalance).toString();
    }
    return Container(
      width: 157.w,
      height: 100.h,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Row(
            // mainAxisSize: MainAxisSize.min,
            //// Icon with the Token name
            children: <Widget>[
              Container(
                width: 28.w,
                height: 28.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(64.w)),
                  color: Color.fromRGBO(240, 240, 240, 1),
                ),
                child: emptyToken
                    ? EmptyCoinImageWidget()
                    : CoinImageWidget(
                        url: url,
                      ),
              ),
              SizedBox(width: 8.w),
              SizedText(
                height: 28.h,
                text: name!,
                textAlign: TextAlign.left,
                textStyle: ThemeTextStyles.mainAppBottomCoinName,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(width: 8.w),
              SizedText(
                  //width: 36.w,
                  height: 18.h,
                  text: emptyToken ? "" : tokenId!,
                  textStyle: ThemeTextStyles.mainAppBottomCoinTokenName.apply(
                      color:
                          // (balance == "0")
                          //     ? ThemeColors.error
                          //     :
                          ThemeColors.gray_500.withOpacity(0.6)),
                  overflow: TextOverflow.ellipsis),
            ],
          ),
          SizedBox(height: 11.h),
          SizedText(
              //width: 78.w,
              height: 31.h,
              text: formatBalance,
              textStyle: ThemeTextStyles.mainAppBottomCoinBalance.apply(
                  color:
                      // balance == 0
                      //     ? ThemeColors.error
                      //     :
                      ThemeColors.black_3f3f46),
              alignment: Alignment.centerRight,
              overflow: TextOverflow.ellipsis),
          // SizedBox(height: 4.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedText(
                  //width: 36.w,
                  height: 26.h,
                  text: formatExchangeBalance,
                  textStyle:
                      ThemeTextStyles.mainAppBottomCurrentTradePrice.apply(
                    color:

                        // (balance == "0")
                        //     ? ThemeColors.error
                        //     :
                        ThemeColors.grey_a1a1aa,
                  ),
                  alignment: Alignment.centerRight,
                  overflow: TextOverflow.ellipsis),
              SizedBox(width: 3.w),
              SizedText(
                  //width: 36.w,
                  height: 26.h,
                  text: "krw",
                  textStyle:
                      ThemeTextStyles.mainAppBottomCurrentTradeCurrency.apply(
                    color:
                        // (balance == "0")
                        //     ? ThemeColors.error
                        //     :
                        ThemeColors.grey_a1a1aa,
                  ),
                  alignment: Alignment.centerRight,
                  overflow: TextOverflow.ellipsis),
            ],
          )
        ],
      ),
    );
  }
}

class CustomDotSwiperPaginationBuilder extends SwiperPlugin {
  ///color when current index,if set null , will be Theme.of(context).primaryColor
  final Color? activeColor;

  ///,if set null , will be Theme.of(context).scaffoldBackgroundColor
  final Color? color;

  ///Size of the dot when activate
  final double activeSize;

  ///Size of the dot
  final double size;

  /// Space between dots
  final double space;

  final Key? key;

  const CustomDotSwiperPaginationBuilder(
      {this.activeColor,
      this.color,
      this.key,
      this.size: 10.0,
      this.activeSize: 10.0,
      this.space: 3.0});

  @override
  Widget build(BuildContext context, SwiperPluginConfig? config) {
    if (config!.itemCount! > 20) {
      // ignore: avoid_print
      print(
          'The itemCount is too big, we suggest use FractionPaginationBuilder instead of DotSwiperPaginationBuilder in this sitituation');
    }
    Color? activeColor = this.activeColor;
    Color? color = this.color;

    if (activeColor == null || color == null) {
      final ThemeData themeData = Theme.of(context);
      activeColor = this.activeColor ?? themeData.primaryColor;
      color = this.color ?? themeData.scaffoldBackgroundColor;
    }

    if (config.indicatorLayout != PageIndicatorLayout.NONE &&
        config.layout == SwiperLayout.DEFAULT) {
      return PageIndicator(
        count: config.itemCount,
        controller: config.pageController,
        layout: config.indicatorLayout,
        size: size,
        activeColor: activeColor,
        color: color,
        space: space,
      );
    }

    final List<Widget> list = [];

    int itemCount = config.itemCount!;
    int? activeIndex = config.activeIndex;

    if (itemCount > 3) {
      if (activeIndex == 0) {
        activeIndex = 0;
      } else if (activeIndex == itemCount - 1) {
        activeIndex = 2;
      } else {
        activeIndex = 1;
      }
      itemCount = 3;
    }
    for (int i = 0; i < itemCount; ++i) {
      final bool active = i == activeIndex;
      list.add(Container(
        key: Key('pagination_$i'),
        margin: EdgeInsets.all(space),
        child: ClipOval(
          child: Container(
            color: active ? activeColor : color,
            width: active ? activeSize : size,
            height: active ? activeSize : size,
          ),
        ),
      ));
    }

    if (config.scrollDirection == Axis.vertical) {
      return Column(
        key: key,
        mainAxisSize: MainAxisSize.min,
        children: list,
      );
    } else {
      return Row(
        key: key,
        mainAxisSize: MainAxisSize.min,
        children: list,
      );
    }
  }
}

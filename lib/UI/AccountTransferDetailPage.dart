import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yollet/Data/Dataset/AddressInfo.dart';
import 'package:yollet/Data/Dataset/QueryBalanceInfo.dart';
import 'package:yollet/Data/Dataset/TokenInfo.dart';
import 'package:yollet/Mgr/redux/state.dart';
import 'package:yollet/UI/template.dart';
import 'package:yollet/Util/Common/Common.dart';
import 'package:yollet/Util/Format/NumberFormatUtil.dart';
import 'package:yollet/Util/Format/date_format_base.dart';
import 'package:yollet/themeStyle.dart';

class AccountTransferDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, YolletState>(
        converter: (store) => store.state.yolletState,
        builder: (_, YolletState state) => Scaffold(
            body: DefaultBody(Body(),
                appBarWidget: CustomAppBar(
                  title: formatDate(
                      state.transactionInfoDetail.transactionDateTime!, [
                    'yy',
                    '. ',
                    'mm',
                    '. ',
                    'dd',
                    ' ',
                    'H',
                    ':',
                    'nn',
                    ':',
                    'ss'
                  ]),
                  backgroundColor: state.currentIsVixco
                      ? ThemeColors.theme_50
                      : ThemeColors.gray_100.withOpacity(0.5),
                ),
                appBarSubWidget: _AppbarSubWidget(context, state),
                paddingTop: 0)));
  }
}

Widget _AppbarSubWidget(context, YolletState state) {
  final String receive = 'assets/img/ic_receive.svg';
  final String sent = 'assets/img/ic_sent.svg';
  // bool isSent = (state.transferInfo.fromAddress==state.currentAccountAddress);
  String type = "";
  bool isSent = true;
  if (state.transactionInfoDetail.chaincodeInputArgs![1] ==
      state.currentAccountAddress) {
    type = "sent";
  } else if (state.transactionInfoDetail.chaincodeInputArgs![3] ==
      state.currentAccountAddress) {
    type = "received";
    isSent = false;
  } else {
    type = state.transactionInfoDetail.chaincodeInputArgs![0] ?? "";
  }
  String? formatBalance = state.transactionInfoDetail.chaincodeInputArgs![4];
  if (formatBalance == null || formatBalance.isEmpty) {
    formatBalance = "0";
  } else {
    YolletState state = appStore.state.yolletState;
    num? decimalPoint = state.currentTokenInfo.decimalPoint;
    formatBalance = CurrencyFormatter.get(decimalPoint?.toInt() ?? 0)
        .format(num.parse(formatBalance))
        .toString();
  }
  String formatExchangeBalance = "";

  if (state.transferInfo.amount == null) {
    formatExchangeBalance = "0";
  } else {
    for (AddressInfo info in state.addressInfoList) {
      for (QueryBalanceInfo binfo in info.queryBalanceInfoList!) {
        TokenInfo? tokenItem;
        String? tokenId = binfo.tokenId;
        for (TokenInfo item in state.tokenList) {
          if (item.tokenId == binfo.tokenId) {
            tokenItem = item;
          }

          num? rate = binfo.exchangeRate! *
              double.parse(state.transactionInfoDetail.chaincodeInputArgs![4]);
          formatExchangeBalance =
              CurrencyFormatter.get(0).format(rate).toString();
        }
      }
    }
  }

  return Container(
    height: 148.h,
    color: state.currentIsVixco
        ? ThemeColors.theme_50
        : ThemeColors.gray_100.withOpacity(0.5),
    padding: EdgeInsets.symmetric(horizontal: 24.w),
    child: Column(
      children: [
        Column(children: [
          Row(children: [
            SizedBox(
              width: 32.w,
              height: 32.h,
              child: SvgPicture.asset(
                isSent ? sent : receive,
              ),
            ),
            SizedBox(
              width: 12.w,
            ),
            isSent
                ? SizedText(
                    height: 21.h,
                    text: type,
                    textStyle: ThemeTextStyles.TransferType.apply(
                        color: ThemeColors.sub_color_yellow),
                  )
                : SizedText(
                    height: 21.h,
                    text: type,
                    textStyle: ThemeTextStyles.TransferType.apply(
                        color: ThemeColors.sub_color_sky_blue),
                  )
          ]),
          // SizedBox(height: 2.h,),
          // SizedText(height:21.h,text: currentBalance,textStyle: ThemeTextStyles.AccountInfoCurrentBalanceCoin,alignment: Alignment.center,),
        ]),
        SizedBox(
          height: 20.h,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // Row(
            //     children: [
            //       SizedText(height: 31.h,text:state.transferInfo.amount,textStyle: ThemeTextStyles.TransferBalance,),
            //       SizedBox(width: 12.w,),
            //       SizedText(height: 31.h,text:state.transferInfo.tokenId,textStyle: ThemeTextStyles.TransferBalance,),
            //     ]
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedText(
                  /*width:240.w,*/
                  height: 41.h,
                  text: (isSent ? "-" : "+") + formatBalance,
                  textStyle: ThemeTextStyles.AccountTransferDetailBalance,
                  overflow: TextOverflow.ellipsis,
                ),
                // SizedBox(
                //   width: 8.w,
                // ),
                SizedText(text: '\t'),
                SizedText(
                  height: 41.h,
                  text:
                      state.transactionInfoDetail.chaincodeInputArgs![2] ?? "",
                  textStyle: ThemeTextStyles.AccountTransferDetailToken,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            SizedBox(
              height: 8.h,
            ),
            Row(
              children: [
                SizedText(
                  height: 18.h,
                  text: "${formatExchangeBalance}",
                  textStyle: ThemeTextStyles.AccountTransferDetailTradeBalance,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedText(
                  text: '\t',
                ),
                SizedText(
                  height: 18.h,
                  text: AppLocalizations.of(context)!.getString('krw'),
                  textStyle: ThemeTextStyles.AccountTransferDetailTradeBalance,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
        )
      ],
    ),
  );
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
        builder: (_, YolletState state) => Container(
              color: ThemeColors.white,
              child: Container(
//      width: 488,
                height: MediaQuery.of(context).size.height - 88.h - 148.h,
                child: ListView(
                  children: <Widget>[
                    SizedBox(height: 36.h),
                    getAddress(
                        "from",
                        state.transactionInfoDetail.chaincodeInputArgs![1] ??
                            ""),
                    getAddress(
                        "to",
                        state.transactionInfoDetail.chaincodeInputArgs![3] ??
                            ""),
                    getAddress(
                        "tx_id", state.transactionInfoDetail.transactionID),
                    getAddress(
                        "note",
                        state.transactionInfoDetail.chaincodeInputArgs![5] ??
                            "",
                        isAbbreviation: false),
                    SizedBox(height: 32.h),
                    Divider(
                      height: 1.h,
                      thickness: 1,
                      color: ThemeColors.gray_100,
                    ),
                    SizedBox(height: 32.h),
                    // getAddress("BlockID",state.transactionInfoDetail?.readSet[0]?.blockNo,isIconHide: true),
                    // getAddress("Charge",(state.transactionInfoDetail?.chaincodeInputArgs[4]??"") + " "+ (state.transactionInfoDetail?.chaincodeInputArgs[2]??""),isIconHide: true),
                    getAddress("readset", "", isIconHide: true),
                    Container(
                      width: 312.w,
                      // height: 140.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        color: Color.fromRGBO(248, 249, 250, 1),
                      ),
                      padding: EdgeInsets.all(12.w),
                      child: SizedText(
                        width: 288.w,
                        /*height:116.h,*/
                        text: state.transactionInfoDetail.readSetText,
                        textStyle: ThemeTextStyles.AccountInfoAddress,
                      ),
                    ),
                    SizedBox(height: 32.h),
                    getAddress("writeset", "", isIconHide: true),
                    Container(
                      width: 312.w,
                      // height: 140.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        color: Color.fromRGBO(248, 249, 250, 1),
                      ),
                      padding: EdgeInsets.all(12.w),
                      child: SizedText(
                        width: 288.w,
                        /*height:116.h,*/
                        text: state.transactionInfoDetail.writeSetText,
                        textStyle: ThemeTextStyles.AccountInfoAddress,
                      ),
                    ),
                    SizedBox(height: 23.h),
                  ],
                ),
              ),
            ));
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
                  textStyle: ThemeTextStyles.AccountTransferPopupSubject,
                  alignment: Alignment.centerLeft,
                  overflow: TextOverflow.ellipsis),
              SizedText(
                height: 18.h,
                width: 146.w,
                text: isAbbreviation
                    ? Common.getAbbreviatedAddress16(address)
                    : address,
                textStyle: ThemeTextStyles.TransferDetailPopupAddress,
                alignment: Alignment.centerLeft,
                overflow: TextOverflow.ellipsis,
              ),
              isIconHide
                  ? Container()
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

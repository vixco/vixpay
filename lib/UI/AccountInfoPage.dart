import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:yollet/Data/Dataset/TransferInfo.dart';
import 'package:yollet/Mgr/Navigation/app_routes.dart';
import 'package:yollet/Mgr/redux/action.dart';
import 'package:yollet/Mgr/redux/state.dart';
import 'package:yollet/UI/template.dart';
import 'package:yollet/Util/Format/NumberFormatUtil.dart';
import 'package:yollet/Util/Format/date_format_base.dart';
import 'package:yollet/Util/fetch_more/fetch_more.dart';
import 'package:yollet/themeStyle.dart';

class AccountInfoPage extends StatefulWidget {
  String? fromDate;
  String? toDate;

  @override
  _AccountInfoPageState createState() => _AccountInfoPageState();
}

class _AccountInfoPageState extends State<AccountInfoPage> {
  bool isSuccessOpen = false;
  final GlobalKey<FetchMoreBuilderState> _fetchMoreController =
      GlobalKey<FetchMoreBuilderState>();

  @override
  Widget build(BuildContext context) {
    void sortByDate(String from, String to) {
      setState(() {
        widget.fromDate = from;
        widget.toDate = to;
        _fetchMoreController.currentState!.refresh();
      });
    }

    return StoreConnector<AppState, YolletState>(
        converter: (store) => store.state.yolletState,
        builder: (_, YolletState state) => Scaffold(
              body: DefaultBody(
                Body(),
                appBarWidget: CustomAppBar(
                  title: state.currentAccountName,
                  style: ThemeTextStyles.AppbarTitleWhite.apply(
                      color: state.currentIsVixco
                          ? ThemeColors.white
                          : ThemeColors.black),
                  backgroundColor: state.currentIsVixco
                      ? ThemeColors.theme_400
                      : ThemeColors.color_F9F9FA,
                  backIconColor: state.currentIsVixco
                      ? ThemeColors.white
                      : ThemeColors.black,
                  titleIcon: CoinImageWidget(
                      url: state.currentTokenInfo.url,
                      width: 28.w,
                      height: 28.h),
                ),
                appBarSubWidget: Column(
                  children: [
                    _AppbarSubWidget(context,
                        state: state,
                        balance: state.currentBalance,
                        coinName: state.currentCoinName,
                        currencyBalance: state.currentCurrencyBalance,
                        address: state.currentAccountAddress,
                        accountName: state.currentAccountName,
                        coinUrl: state.currentTokenInfo.url,
                        decimalPoint: state.currentTokenInfo.decimalPoint),
                    _TransactionsFilterWidget(
                      address: state.currentAccountAddress,
                      tokenId: state.currentTokenId,
                      sortByDateFunc:   sortByDate,
                      toDate: widget.toDate,
                      fromDate: widget.fromDate,
                    ),
                  ],
                ),
                paddingTop: 0,
                paddingLR: 0,
              ),
              // bottomSheet: Footer(),
            ));
  }

  Widget Body() {
    return StoreConnector<AppState, YolletState>(
        converter: (store) => store.state.yolletState,
        builder: (_, YolletState state) => Container(
            height: MediaQuery.of(context).size.height - 88.h - 212.h - 48.h,
            child: FetchMoreBuilder(
              fetchMoreController: _fetchMoreController,
              itemBuilder: _itemBuilder,
              dataFetcher: _dataFetcher,
              limit: 10,
            )));
  }

  Future<List?> _loadList(int index, int limit) async {
    // debugPrint("index : "+ index.toString() + " limit : "+ limit.toString() + " (index ~/ limit) : " +  (index ~/ limit).toString() + " (index % limit)" + (index % limit).toString());
    YolletState state = StoreProvider.of<AppState>(context).state.yolletState;

    int pageNumber = (index ~/ limit) + 1;
    if ((index % limit) > 0) {
      pageNumber++;
    }

    return await appStore.dispatch(
      GetTransferList(
        address: state.currentAccountAddress,
        tokenId: state.currentTokenId,
        pageNumber: pageNumber,
        pageSize: limit,
        fromDate: widget.fromDate,
        toDate: widget.toDate,
      ),
    );
  }

  Future<List<dynamic>?> _dataFetcher(int? index, int? limit,
      [String? searchTerm]) async {
    return _loadList(index!, limit!);
  }

  Widget _itemBuilder(BuildContext context, List? list, int index) {
    var item = list?[index];
    YolletState state = StoreProvider.of<AppState>(context).state.yolletState;
    Widget widget = Container(
        padding: EdgeInsets.only(top: 0),
        child: TransferItemWidget(
          info: item,
          currentAccountAddress: state.currentAccountAddress,
        ));
    return widget;
  }

  Widget _AppbarSubWidget(
    context, {
    required YolletState state,
    num? balance,
    String? coinName,
    num? currencyBalance,
    String? address,
    String? accountName,
    String? coinUrl,
    num? decimalPoint,
  }) {
    String formatBalance = "";
    String formatExchangeBalance = "";

    if (balance == null) {
      formatBalance = "0";
    } else {
      // YolletState state = appStore.state.yolletState;
      num? decimalPoint = state.currentTokenInfo.decimalPoint;
      formatBalance = CurrencyFormatter.get(decimalPoint?.toInt() ?? 2)
          .format(balance)
          .toString();
    }
    if (currencyBalance == null) {
      formatExchangeBalance = "0";
    } else {
      // YolletState state = appStore.state.yolletState;
      // num? decimalPoint = state.currentTokenInfo.decimalPoint;
      formatExchangeBalance =
          CurrencyFormatter.get(0).format(currencyBalance).toString();
    }

    return Container(
      height: 212.h,
      color: state.currentIsVixco
          ? ThemeColors.theme_400
          : ThemeColors.color_F9F9FA,
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedText(
                height: 46.h,
                text: formatBalance,
                textStyle: ThemeTextStyles.AccountInfoBalance.apply(
                    color: state.currentIsVixco
                        ? ThemeColors.white
                        : ThemeColors.gray_700),
                alignment: Alignment.center,
              ),
              SizedBox(
                width: 8.w,
              ),
              SizedText(
                height: 46.h,
                text: coinName,
                textStyle: ThemeTextStyles.AccountInfoBalanceCoin.apply(
                    color: state.currentIsVixco
                        ? ThemeColors.white
                        : ThemeColors.gray_700),
                alignment: Alignment.center,
              ),
              SizedBox(
                width: 7.w,
              ),
              state.currentIsVixco || state.currentIsStoreAddress
                  ? Container()
                  : Container(
                      width: 16.w,
                      height: 16.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(7.r)),
                        color: ThemeColors.gray_300,
                      ),
                      child: IconButton(
                          padding: const EdgeInsets.all(0),
                          icon: Icon(
                            Icons.add,
                            color: ThemeColors.theme_500,
                            size: 14.w,
                          ),
                          onPressed: () async {
                            await appStore.dispatch(
                                NavigateToAction(to: AppRoutes.assignToken));
                          }))
            ]),
            SizedBox(
              height: 2.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedText(
                    //width: 36.w,
                    height: 26.h,
                    text: formatExchangeBalance,
                    textStyle:
                        ThemeTextStyles.AccountInfoCurrentBalanceCoin.apply(
                            color: state.currentIsVixco
                                ? ThemeColors.white
                                : ThemeColors.gray_700),
                    // alignment:Alignment.centerRight ,
                    overflow: TextOverflow.ellipsis),
                SizedBox(width: 3.w),
                SizedText(
                    //width: 36.w,
                    height: 26.h,
                    text: "krw",
                    textStyle:
                        ThemeTextStyles.AccountInfoCurrentCurrencyBalanceCoin
                            .apply(
                                color: state.currentIsVixco
                                    ? ThemeColors.white
                                    : ThemeColors.gray_700),
                    alignment: Alignment.centerRight,
                    overflow: TextOverflow.ellipsis),
              ],
            ),
            // SizedText(height:21.h,text: formatExchangeBalance,textStyle: ThemeTextStyles.AccountInfoCurrentBalanceCoin,alignment: Alignment.center,),
          ]),
          SizedBox(
            height: 16.h,
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                  height: 48.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15.w)),
                    color: state.currentIsVixco
                        ? ThemeColors.white
                        : ThemeColors.gray_200,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedText(
                        height: 28.h,
                        width: 235.w,
                        text: address,
                        textStyle: ThemeTextStyles.AccountInfoAddress,
                        alignment: Alignment.center,
                      ),
                      Container(
                        width: 28.w,
                        height: 28.h,
                        // decoration: BoxDecoration(
                        //   color : widget.iconBackgroundColor,
                        //   borderRadius : BorderRadius.all(Radius.elliptical(24, 24)),
                        // ),
                        child: IconButton(
                          icon: Icon(
                            YolletIcons.copy,
                            color: ThemeColors.gray_300,
                          ),
                          iconSize: 20.w,
                          padding: EdgeInsets.all(0),
                          onPressed: () {
setState(() {
  isSuccessOpen = true;
});
                            Clipboard.setData(ClipboardData(text: address));
                          },
                        ),
                      )
                    ],
                  ),),
              CopiedAlert(
                small: true,
                height: 46.h,
                isSuccessCopyOpen: isSuccessOpen,
              )
            ],
          ),
          SizedBox(
            height: 12.h,
          ),
          state.currentIsStoreAddress
              ?Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BtnCard(
                width: 150.w,
                height: 48.h,
                text: "remittance",
                icon: YolletIcons.send,
                textColor:ThemeColors.gray_400,
                backgroundColor:ThemeColors.gray_200,
                onPressed: null,
              ),
              SizedBox(
                width: 8.w,
              ),
              BtnCard(
                width: 150.w,
                height: 48.h,
                text: "currency_exchange",
                icon: YolletIcons.exchange,
                textColor:ThemeColors.gray_400,
                backgroundColor:ThemeColors.gray_200,
                onPressed:null,
              ),
            ],
          )
          :Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              state.currentAddressInfo.hasKeyIndex
              ?BtnCard(
                width: 150.w,
                height: 48.h,
                text: "transfer",
                icon: YolletIcons.send,
                textColor: state.currentIsVixco
                    ? ThemeColors.theme_500
                    : ThemeColors.white,
                backgroundColor: state.currentIsVixco
                    ? ThemeColors.theme_100
                    : ThemeColors.theme_400,
                onPressed: () {
                  appStore.dispatch(
                      NavigateToAction(to: AppRoutes.accountTransfer));
                },
              )
              :BtnCard(
                width: 150.w,
                height: 48.h,
                text: "transfer",
                icon: YolletIcons.send,
                textColor:ThemeColors.gray_400,
                backgroundColor:ThemeColors.gray_200,
                // onPressed: () {
                //   appStore.dispatch(
                //       NavigateToAction(to: AppRoutes.accountTransfer));
                // },
              ),
              SizedBox(
                width: 8.w,
              ),
              BtnCard(
                width: 150.w,
                height: 48.h,
                text: "qr_code",
                icon: YolletIcons.qr,
                textColor: state.currentIsVixco
                    ? ThemeColors.theme_500
                    : ThemeColors.white,
                backgroundColor: state.currentIsVixco
                    ? ThemeColors.theme_100
                    : ThemeColors.theme_400,
                onPressed: () {
                  showPopup(
                      context,
                      BottomPopupWidget(
                        title: "share_my_address",
                        coinName: accountName,
                        address: address,
                        coinUrl: coinUrl,
                      ));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TransferItemWidget extends StatefulWidget {
  final TransferInfo? info;
  final String? currentAccountAddress;

  const TransferItemWidget({Key? key, this.info, this.currentAccountAddress})
      : super(key: key);

  @override
  _TransferItemWidgetState createState() => _TransferItemWidgetState();
}

class _TransferItemWidgetState extends State<TransferItemWidget> {
  String? date;
  String? memo;
  String? balance;
  String? currentBalance;
  String? transactionId;
  late bool isSent;

  @override
  void initState() {
    super.initState();
    date = formatDate(widget.info!.transactionDateTime,
        ['yy', '. ', 'mm', '. ', 'dd', ' ', 'H', ':', 'nn', ':', 'ss']);
    // date = widget.info!.transactionDateTime.toString();
    memo = widget.info!.comment;
    String? amount = widget.info!.amount;
    if (amount == null || amount.isEmpty) {
      amount = "0";
    } else {
      YolletState state = appStore.state.yolletState;
      num? decimalPoint = state.currentTokenInfo.decimalPoint;
      amount = CurrencyFormatter.get(decimalPoint?.toInt() ?? 0)
          .format(num.parse(amount))
          .toString();
    }

    balance = amount + " " + widget.info!.tokenId!;
    currentBalance = ""; //widget. info.amount + " KRW";
    transactionId = widget.info!.transactionID;
    isSent = widget.info!.fromAddress == widget.currentAccountAddress;
  }

  @override
  Widget build(BuildContext context) {
    final String receive = 'assets/img/ic_receive.svg';
    final String sent = 'assets/img/ic_sent.svg';
    return InkWell(
        onTap: () async {
          await appStore.dispatch(GetTransferDetail(
              transactionId: transactionId, transferInfo: widget.info));
          await appStore
              .dispatch(NavigateToAction(to: AppRoutes.accountTransferDetail));
        },
        child: Column(children: [
          Divider(
            height: 1.h,
            thickness: 1,
            color: ThemeColors.gray_100,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            height: 106.h,
            child: Column(
              children: [
                Divider(
                  height: 1.h,
                  thickness: 1,
                  color: ThemeColors.gray_100,
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedText(
                  height: 15.h,
                  text: date,
                  textStyle: ThemeTextStyles.Date,
                ),
                SizedBox(
                  height: 12.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 40.w,
                          height: 40.h,
                          child: SvgPicture.asset(
                            isSent ? sent : receive,
                          ),
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            isSent
                                ? SizedText(
                                    height: 21.h,
                                    text: "sent",
                                    textStyle: ThemeTextStyles.TransferType,
                                  )
                                : SizedText(
                                    height: 21.h,
                                    text: "received",
                                    textStyle: ThemeTextStyles.TransferType,
                                  ),
                            (memo == null || memo!.isEmpty)
                                ? Container()
                                : SizedText(
                                    width: 160.w,
                                    text: memo,
                                    textStyle: ThemeTextStyles.TransferMemo,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                          ],
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedText(
                            width: 100.w,
                            height: 21.h,
                            text: balance,
                            textStyle: ThemeTextStyles.TransferBalance,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            alignment: Alignment.centerRight),
                        SizedBox(
                          height: 4.h,
                        ),
                        SizedText(
                          height: 15.h,
                          text: currentBalance,
                          textStyle: ThemeTextStyles.TransferCurrentBalance,
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ]));
  }
}

class _TransactionsFilterWidget extends StatefulWidget {
  final String? address;
  final String? tokenId;
  final String? fromDate;
  final String? toDate;
  final Function? sortByDateFunc;
  final double? ht;

  const _TransactionsFilterWidget({
    this.tokenId,
    this.address,
    this.sortByDateFunc,
    this.fromDate,
    this.toDate,
    this.ht,
    Key? key,
  }) : super(key: key);

  @override
  __TransactionsFilterWidgetState createState() =>
      __TransactionsFilterWidgetState();
}

class __TransactionsFilterWidgetState extends State<_TransactionsFilterWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            YolletIcons.search,
            size: 24.w,
            color: ThemeColors.gray_400,
          ),
          InkWell(
            onTap: () async {
              showPopup(
                  context,
                  BottomPopupFilterWidget(
                    ht: widget.ht ?? 235.h,
                    address: widget.address,
                    tokenId: widget.tokenId,
                    sortByDateFunc: widget.sortByDateFunc,
                    fromDate: widget.fromDate,
                    toDate: widget.toDate,
                  ));
            },
            child: Row(
              children: [
                SizedText(
                  text: widget.fromDate == null && widget.toDate == null
                      ? AppLocalizations.of(context)!.getString('this_month')
                      : "${widget.fromDate} ~ ${widget.toDate}",
                  textStyle: ThemeTextStyles.AccountInfoFilter,
                ),
                SizedBox(
                  width: 12.w,
                ),
                Icon(
                  YolletIcons.down,
                  size: 12.w,
                  color: ThemeColors.gray_300,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ToogleButtonFilterWidget extends StatefulWidget {
  final String? month1;
  final String? month3;
  final String? monthLast;
  final String? custom;
  bool isLeftTopSelected;
  bool isRightTopSelected;
  bool isLeftBottomSelected;
  bool isRightBottomSelected;
  final Function? onMonth1Press;
  final Function? onMonth3Press;
  final Function? onMonthLastPress;
  final Function? onCustomPress;

  ToogleButtonFilterWidget({
    this.month1,
    this.month3,
    this.monthLast,
    this.custom,
    this.isLeftTopSelected = true,
    this.isRightTopSelected = false,
    this.isLeftBottomSelected = false,
    this.isRightBottomSelected = false,
    this.onMonth1Press,
    this.onMonth3Press,
    this.onMonthLastPress,
    this.onCustomPress,
  });

  @override
  _ToogleButtonFilterWidgetState createState() =>
      _ToogleButtonFilterWidgetState();
}

class _ToogleButtonFilterWidgetState extends State<ToogleButtonFilterWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 36.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(17.w)),
        color: ThemeColors.black.withOpacity(0.028),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3),
        child: getToggle(context),
      ),
    );
  }

  Widget getToggle(context) {
    List<Widget> listRow1 = [];
    List<Widget> listRow2 = [];
    if (widget.isLeftTopSelected) {
      listRow1.add(selected(context, widget.month1, widget.onMonth1Press));
      listRow1.add(SizedBox(width: 2.w));
      listRow1.add(unselected(context, widget.month3, widget.onMonth3Press));
      listRow2
          .add(unselected(context, widget.monthLast, widget.onMonthLastPress));
      listRow2.add(unselected(context, widget.custom, widget.onCustomPress));
    } else if (widget.isRightTopSelected) {
      listRow1.add(unselected(context, widget.month1, widget.onMonth1Press));
      listRow1.add(SizedBox(width: 2.w));
      listRow1.add(selected(context, widget.month3, widget.onMonth3Press));
      listRow2
          .add(unselected(context, widget.monthLast, widget.onMonthLastPress));
      listRow2.add(unselected(context, widget.custom, widget.onCustomPress));
    } else if (widget.isLeftBottomSelected) {
      listRow1.add(unselected(context, widget.month1, widget.onMonth1Press));
      listRow1.add(unselected(context, widget.month3, widget.onMonth3Press));
      listRow2
          .add(selected(context, widget.monthLast, widget.onMonthLastPress));
      listRow2.add(SizedBox(width: 2.w));
      listRow2.add(unselected(context, widget.custom, widget.onCustomPress));
    } else if (widget.isRightBottomSelected) {
      listRow2
          .add(unselected(context, widget.monthLast, widget.onMonthLastPress));
      listRow1.add(unselected(context, widget.month1, widget.onMonth1Press));
      listRow1.add(unselected(context, widget.month3, widget.onMonth3Press));
      listRow2.add(SizedBox(width: 2.w));
      listRow2.add(selected(context, widget.custom, widget.onCustomPress));
    }

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 3.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: listRow1,
          ),
          Row(
            children: listRow2,
          ),
        ],
      ),
    );
  }

  Widget unselected(context, title, onTap) {
    return InkWell(
        onTap: onTap,
        child: Container(
          width: 152.w,
          height: 30.h,
          child: Center(
              child: AutoSizeText(
            AppLocalizations.of(context)!.getString(title),
            textAlign: TextAlign.center,
            style: ThemeTextStyles.transferToggleUnselected,
          )),
        ));
  }

  Widget selected(context, title, onTap) {
    return InkWell(
        onTap: onTap,
        child: Container(
          width: 152.w,
          height: 30.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(14.w),
            ),
            boxShadow: ThemeBoxShadow.shadow_xl,

            // boxShadow : [BoxShadow(
            //     color: Color.fromRGBO(0, 0, 0, 0.10000000149011612),
            //     offset: Offset(0,5),
            //     blurRadius: 20
            // )],
            color: Color.fromRGBO(255, 255, 255, 1),
          ),
          child: Center(
              child: AutoSizeText(
            AppLocalizations.of(context)!.getString(title),
            textAlign: TextAlign.center,
            style: ThemeTextStyles.transferToggleSelected,
          )),
        ));
  }
}

class BottomPopupFilterWidget extends StatefulWidget {
  final String? address;
  final String? tokenId;
  final String? fromDate;
  final String? toDate;
  final double? ht;
  final Function? sortByDateFunc;

  const BottomPopupFilterWidget({
    Key? key,
    this.address,
    this.tokenId,
    this.fromDate,
    this.toDate,
    this.ht,
    this.sortByDateFunc,
  }) : super(key: key);

  @override
  _BottomPopupFilterWidgetState createState() =>
      _BottomPopupFilterWidgetState();
}

class _BottomPopupFilterWidgetState extends State<BottomPopupFilterWidget> {
  bool isCustomPickerHidden = true;
  double popupHeight = 235.h;
  bool isLeftTopSelected = true;
  bool isRightTopSelected = false;
  bool isRightBottomSelected = false;
  bool isLeftBottomSelected = false;
  DateTime dateFrom = DateTime.now().subtract(Duration(days: 7));
  DateTime dateTo = DateTime.now();

  void whenPickerShown() {
    if (this.isCustomPickerHidden) {
      setState(() {
        popupHeight = 287.h;
      });
    }
  }

  void whenPickerHidden() {
    setState(() {
      popupHeight = 235.h;
    });
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    // now = now.add(Duration(days: 1));
    String _format = 'yyyy-MM-dd';
    String currentMonth =
        DateFormat(_format).format(now).toString();

    String thisMonth = DateFormat(_format)
        .format(DateTime(now.year, now.month, 1))
        .toString();

    String lastMonth = DateFormat(_format)
        .format(DateTime(now.year, now.month - 1, 1))
        .toString();

    String last3Month = DateFormat(_format)
        .format(DateTime(
            now.year, now.month - 3, now.day))
        .toString();
    String customFromMonth(DateTime time) {
      return DateFormat(_format).format(time).toString();
    }

    String customToMonth(DateTime time) {
      return DateFormat(_format).format(time).toString();
    }

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: ThemeColors.transparent,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: this.popupHeight,
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.w),
                  topRight: Radius.circular(16.w)),
              color: ThemeColors.white),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  appStore.dispatch(DismissPopupAction());
                },
                child: Column(
                  children: [
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
                  ],
                ),
              ),
              Container(
                height: 72.h,
                child: ToogleButtonFilterWidget(
                  month1: AppLocalizations.of(context)!.getString('this_month'),
                  month3: AppLocalizations.of(context)!.getString('3_month'),
                  monthLast:
                      AppLocalizations.of(context)!.getString('last_month'),
                  custom:
                      AppLocalizations.of(context)!.getString('custom_month'),
                  isLeftTopSelected: this.isLeftTopSelected,
                  isRightTopSelected: this.isRightTopSelected,
                  isRightBottomSelected: this.isRightBottomSelected,
                  isLeftBottomSelected: this.isLeftBottomSelected,
                  onMonth1Press: () {
                    whenPickerHidden();
                    setState(() {
                      isCustomPickerHidden = true;
                      isLeftTopSelected = true;
                      isRightTopSelected = false;
                      isRightBottomSelected = false;
                      isLeftBottomSelected = false;
                    });
                  },
                  onMonth3Press: () {
                    whenPickerHidden();
                    setState(() {
                      isCustomPickerHidden = true;
                      isLeftTopSelected = false;
                      isRightTopSelected = true;
                      isRightBottomSelected = false;
                      isLeftBottomSelected = false;
                    });
                  },
                  onMonthLastPress: () {
                    whenPickerHidden();
                    setState(() {
                      isCustomPickerHidden = true;
                      isLeftTopSelected = false;
                      isRightTopSelected = false;
                      isRightBottomSelected = false;
                      isLeftBottomSelected = true;
                    });
                  },
                  onCustomPress: () {
                    whenPickerShown();
                    setState(() {
                      isCustomPickerHidden = false;
                      isLeftTopSelected = false;
                      isRightTopSelected = false;
                      isRightBottomSelected = true;
                      isLeftBottomSelected = false;
                    });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0.h),
                child: Visibility(
                    visible: this.isCustomPickerHidden ? false : true,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(17.r),
                          border:
                              Border.all(width: 1, color: Color(0xFFE4E4E7))),
                      child: SizedBox(
                          height: 36.h,
                          width: 312.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                  child: GestureDetector(
                                child: Text(
                                  DateFormat('yyyy.MM.dd')
                                      .format(dateFrom)
                                      .toString(),
                                  textAlign: TextAlign.end,
                                ),
                                onTap: () {
                                  _selectDate(context, selectedDate: dateFrom)
                                      .then((onValue) {
                                    setState(() {
                                      dateFrom = onValue;
                                    });
                                  });
                                },
                              )),
                              Expanded(
                                  child:
                                      Text("~", textAlign: TextAlign.center)),
                              Expanded(
                                child: GestureDetector(
                                  child: Text(
                                      DateFormat('yyyy.MM.dd')
                                          .format(dateTo)
                                          .toString(),
                                      textAlign: TextAlign.start),
                                  onTap: () {
                                    _selectDate(context, selectedDate: dateTo)
                                        .then((onValue) {
                                      setState(() {
                                        dateTo = onValue;
                                      });
                                    });
                                  },
                                ),
                              ),
                            ],
                          )),
                    )),
              ),
              Padding(
                padding: this.isCustomPickerHidden
                    ? EdgeInsets.only(top: 21.0)
                    : EdgeInsets.only(top: 36.0),
                child: BtnFill(
                  //horizontalPadding: 0,
                  width: 312.w,
                  height: 48.h,
                  text: "confirm",
                  onPressed: () async {
                    if (isLeftTopSelected) {
                      widget.sortByDateFunc!(thisMonth, currentMonth);
                      appStore.dispatch(DismissPopupAction());
                    } else if (isRightTopSelected) {
                      widget.sortByDateFunc!(last3Month, currentMonth);
                      appStore.dispatch(DismissPopupAction());
                    } else if (isLeftBottomSelected) {
                      widget.sortByDateFunc!(lastMonth, thisMonth);
                      appStore.dispatch(DismissPopupAction());
                    } else if (isRightBottomSelected) {
                      widget.sortByDateFunc!(
                          customFromMonth(dateFrom), customToMonth(dateTo));
                      appStore.dispatch(DismissPopupAction());
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<DateTime> _selectDate(BuildContext context,
      {required DateTime selectedDate}) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2021, 7),
      lastDate: DateTime(2101),
    );
    if (picked != null) return picked;
    return Future.value(null);
  }
}

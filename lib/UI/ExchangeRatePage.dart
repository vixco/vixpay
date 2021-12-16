import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:intl/intl.dart';
import 'package:yollet/Data/Dataset/ExchangeRateInfo.dart';
import 'package:yollet/Data/Dataset/TokenInfo.dart';
import 'package:yollet/Mgr/redux/action.dart';
import 'package:yollet/Mgr/redux/state.dart';
import 'package:yollet/UI/template.dart';
import 'package:yollet/Util/Format/NumberFormatUtil.dart';
import 'package:yollet/Util/fetch_more/fetch_more.dart';
import 'package:yollet/themeStyle.dart';

class ExchangeRatePage extends StatefulWidget {
  @override
  ExchangeRatePageState createState() => ExchangeRatePageState();
}

class ExchangeRatePageState extends State<ExchangeRatePage> {
  final GlobalKey<FetchMoreBuilderState> _fetchMoreController =
      GlobalKey<FetchMoreBuilderState>();
  late DateTime queryDate;
  String queryTokenId = "";

  @override
  void initState() {
    super.initState();
    queryDate = DateTime.now();
    // queryDate = DateFormat('yyyyMMdd').format(queryDate);
    // queryDate = DateFormat('yyyy.MM.dd').format(queryDate);

    YolletState state = appStore.state.yolletState;
    queryTokenId = state.tokenList.first.tokenId!;
    _dropDownMenuItemToken = [];
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, YolletState>(
        converter: (store) => store.state.yolletState,
        builder: (_, YolletState state) => Scaffold(
              body: DefaultBody(
                Body(),
                appBarWidget: CustomAppBar(
                  title: "exchange_rate",
                  style: ThemeTextStyles.AppbarTitleWhite,
                  backgroundColor: ThemeColors.theme_400,
                  backIconColor: ThemeColors.white,
                ),
                paddingTop: 0,
                paddingLR: 0,
                appBarSubWidget: _AppbarSubWidget(context, state),
              ),
              // bottomSheet: Footer(),
            ));
  }

  Widget _AppbarSubWidget(context, YolletState state) {
    return Container(
      height: 64.h,
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      color: ThemeColors.theme_400,
      child: Column(
        children: [
          // SizedBox(height: 12.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BtnCardDropdown(
                width: 150.w,
                height: 48.h,
                text: DateFormat('yyyy.MM.dd').format(queryDate),
                icon: YoshopIcons.y0406_calendar,
                textColor: ThemeColors.gray_500,
                backgroundColor: ThemeColors.white,
                onPressed: () {
                  _selectDate(context, selectedDate: queryDate).then((onValue) {
                    queryDate = onValue;
                    // toDateController.text = DateFormat.yMMMd().format(_toInputDate!);
                    _fetchMoreController.currentState!.refresh();
                  });
                },
              ),
              SizedBox(
                width: 8.w,
              ),
              BtnCardDropdown(
                width: 150.w,
                height: 48.h,
                // text: queryTokenId,
                child: makeDropdownToken(state),
                icon: YolletIcons.qr,
                // iconWidget: CoinImageWidget(url: "",width:24.w,height: 24.h),
                iconWidget: Container(
                    width: 20.w,
                    height: 20.h,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/img/vix.png'),
                          fit: BoxFit.contain),
                    )),
                textColor: ThemeColors.gray_500,
                backgroundColor: ThemeColors.white,
                onPressed: () async {
                  // await appStore.dispatch(ShowPopupAction<String>(
                  //     barrierDismissible: false,
                  //     builder: (BuildContext context) {
                  //       return StatefulBuilder(builder: (context, setState) {
                  //         return AlertDialog(
                  //           title:  null,
                  //           content: makeDropdownToken(state),
                  //           actions: <Widget>[
                  //             BtnFillPopup(
                  //               child: Text(AppLocalizations.of(context)!.getString("ok")!,style: ThemeTextStyles.BottomButton,),
                  //               onPressed: () {
                  //                 _fetchMoreController.currentState!.refresh();
                  //                 setState(() {});
                  //                 appStore.dispatch(DismissPopupAction());
                  //               },
                  //             ),
                  //           ],
                  //         );
                  //       });
                  //     }));
                },
              )
            ],
          ),
        ],
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

  // String? currentToken;
  List<DropdownMenuItem<String>>? _dropDownMenuItemToken;

  Widget makeDropdownToken(YolletState state) {
    _dropDownMenuItemToken!.clear();
    for (TokenInfo item in state.tokenList) {
      _dropDownMenuItemToken!.add(
        DropdownMenuItem(
          value: item.tokenId,
          child: Text(
            item.tokenId!,
          ),
        ),
      );
    }

    return DropdownButton(
      icon: Icon(
        YolletIcons.arrow_down,
        size: 8.w,
        color: ThemeColors.gray_500,
      ),
      isExpanded: true,
      value: queryTokenId,
      items: _dropDownMenuItemToken,
      style: ThemeTextStyles.BottomButton.apply(color: ThemeColors.gray_500),
      onChanged: (String? selectedToken) {
        setState(() {
          queryTokenId = selectedToken ?? "";
          _fetchMoreController.currentState!.refresh();
        });
      },
      iconSize: 24.w,
      underline: Container(
        height: 1.0,
        // decoration: const BoxDecoration(
        //   border: Border(
        //     bottom: BorderSide(
        //       color: ThemeColors.brownish_grey_shadow,
        //       width: 0.0,
        //     ),
        //   ),
        // ),
      ),
    );
  }

  Widget Body() {
    return StoreConnector<AppState, YolletState>(
        converter: (store) => store.state.yolletState,
        builder: (_, YolletState state) => Container(
            height: MediaQuery.of(context).size.height - 88.h - 64.h,
            child: FetchMoreBuilder(
              fetchMoreController: _fetchMoreController,
              itemBuilder: _itemBuilder,
              dataFetcher: _dataFetcher,
              limit: 10,
            )));
  }

  Future<List?> _loadList(int index, int limit) async {
    // YolletState state = StoreProvider.of<AppState>(context).state.yolletState;

    int pageNumber = (index ~/ limit) + 1;
    if ((index % limit) > 0) {
      pageNumber++;
    }
    if (index == 0) {
      return await appStore.dispatch(GetExchangeRatesList(
          date: DateFormat('yyyyMMdd').format(queryDate),
          tokenId: queryTokenId,
          pageNumber: pageNumber,
          pageSize: limit));
    } else {
      return [];
    }
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
        child: ExchangeRateItemWidget(
          info: item,
          currentAccountAddress: state.currentAccountAddress,
        ));
    return widget;
  }
}

class ExchangeRateItemWidget extends StatefulWidget {
  final ExchangeRateInfo? info;
  final String? currentAccountAddress;

  const ExchangeRateItemWidget(
      {Key? key, this.info, this.currentAccountAddress})
      : super(key: key);

  @override
  ExchangeRateItemWidgetState createState() => ExchangeRateItemWidgetState();
}

class ExchangeRateItemWidgetState extends State<ExchangeRateItemWidget> {
  String? date;
  String? memo;
  String? balance;
  String? currentBalance;
  String? indexText;
  late bool isSent;

  @override
  void initState() {
    super.initState();
    date = DateFormat('yy. MM. dd HH:mm:ss')
        .format(widget.info!.timestamp ?? DateTime.now());
    // date=widget.info!.transactionDateTime.toString();
    memo = "";

    String formatExchangeBalance = "";

    num? amount = widget.info!.exchangeRate ?? 0;
    if (amount == null) {
      formatExchangeBalance = "0";
    } else {
      // YolletState state = appStore.state.yolletState;
      // num? decimalPoint = 0;
      //
      // for (TokenInfo item in state.tokenList) {
      //   if (item.tokenId == widget.info!.tokenId) {
      //     decimalPoint = item.decimalPoint;
      //   }
      // }

      formatExchangeBalance =
          CurrencyFormatter.get(2).format(amount).toString();
    }

    balance = formatExchangeBalance;
    currentBalance = ""; //widget. info.amount + " KRW";
    indexText = widget.info!.index!.toString();
    isSent = true;
  }

  @override
  Widget build(BuildContext context) {
    // final String receive = 'assets/img/ic_receive.svg';
    // final String sent = 'assets/img/ic_sent.svg';
    return InkWell(
        onTap: () async {
          // await  appStore.dispatch(GetTransferDetail(transactionId: transactionId, transferInfo : widget.info));
          // await appStore.dispatch(NavigateToAction(to: AppRoutes.accountTransferDetail));
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
                        // Container(
                        //   width: 32.w,
                        //   height: 32.h,
                        //   decoration: BoxDecoration(
                        //     shape: BoxShape.circle,
                        //     color: ThemeColors.theme_400,
                        //   ),
                        //   child:
                        //   SizedText(width: 40.w,height: 40.h,
                        //       text:indexText,textStyle: ThemeTextStyles.TransferType.apply(color: ThemeColors.white),
                        //       alignment : Alignment.center),
                        // ),
                        // SizedBox(width: 40.w,height: 40.h,child: SvgPicture.asset(isSent?sent:receive,),),
                        CoinImageWidget(url: "", width: 32.w, height: 32.h),
                        SizedBox(
                          width: 12.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedText(
                              height: 21.h,
                              text: indexText,
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
                        // SizedText(width: 100.w,height: 21.h,text:balance,textStyle: ThemeTextStyles.TransferBalance,overflow: TextOverflow.ellipsis,maxLines: 1,alignment : Alignment.centerRight),
                        // SizedBox(height: 4.h,),
                        // SizedText(height: 15.h,text: currentBalance,textStyle: ThemeTextStyles.TransferCurrentBalance,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedText(
                                //width: 36.w,
                                height: 21.h,
                                text: balance,
                                textStyle: ThemeTextStyles.ExchangeRatePrice,
                                // alignment:Alignment.centerRight ,
                                overflow: TextOverflow.ellipsis),
                            SizedBox(width: 3.w),
                            SizedText(
                                //width: 36.w,
                                height: 21.h,
                                text: "krw",
                                textStyle: ThemeTextStyles.ExchangeRateCurrency,
                                alignment: Alignment.centerRight,
                                overflow: TextOverflow.ellipsis),
                          ],
                        )
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

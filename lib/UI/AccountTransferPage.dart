import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:intl/intl.dart';
import 'package:yollet/Data/Dataset/AddressInfo.dart';
import 'package:yollet/Data/Dataset/BalanceInfo.dart';
import 'package:yollet/Data/Dataset/QueryBalanceInfo.dart';
import 'package:yollet/Data/Dataset/TokenInfo.dart';
import 'package:yollet/Data/Dataset/TransferInfo.dart';
import 'package:yollet/Mgr/Navigation/app_routes.dart';
import 'package:yollet/Mgr/redux/action.dart';
import 'package:yollet/Mgr/redux/state.dart';
import 'package:yollet/UI/QRViewPage.dart';
import 'package:yollet/UI/template.dart';
import 'package:yollet/Util/Common/Common.dart';
import 'package:yollet/Util/Format/NumberFormatUtil.dart';
import 'package:yollet/themeStyle.dart';
import 'package:yollet/Util/Common/global_widgets.dart';

class AccountTransferPage extends StatefulWidget {
  AccountTransferPage()
      : super(key: GlobalWidgets().key(AppRoutes.accountTransfer));

  @override
  _AccountTransferPageState createState() => _AccountTransferPageState();
}

class _AccountTransferPageState extends State<AccountTransferPage>
    with Reloadable {
  @override
  void initState() {
    super.initState();
    reload();
  }

  @override
  Future<void> reload() async {
    // YolletState state = StoreProvider.of<AppState>(context).state.yolletState;
    YolletState state = appStore.state.yolletState;
    await appStore
        .dispatch(GetRecentTransferList(address: state.currentAccountAddress));
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, YolletState>(
        converter: (store) => store.state.yolletState,
        builder: (_, YolletState state) => Scaffold(
              body: DefaultBody(Body(),
                  appBarWidget: CustomAppBar(
                    title: "transfer",
                    style: ThemeTextStyles.AppbarTitle,
                    // backgroundColor:ThemeColors.orange_400,
                    // backIconColor:ThemeColors.white,
                    titleIcon: CoinImageWidget(
                        url: state.currentTokenInfo.url,
                        width: 28.w,
                        height: 28.h),
                  ),
                  // appBarSubWidget: AppbarSub(message: "Create account success",),),
                  paddingLR: 24.w),
              // bottomSheet: Footer(),
            ));
  }
}

class Body extends StatefulWidget {
  @override
  BodyState createState() => BodyState();
}

class BodyState extends State<Body> with Reloadable {
  bool isLeftSelected = true;

  @override
  Widget build(BuildContext context) {
    // YolletState state = StoreProvider.of<AppState>(context).state.yolletState;
    // var tokenItem;
    // for(Map item in state.tokenList){
    //   if(item["id"]==state.createAccountTokenId){
    //     tokenItem = item;
    //   }
    // }
    return Container(
      color: ThemeColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // SizedBox(height : 40),
          TextToggleButton(
            left: "contacts",
            right: "address",
            isLeftSelected: isLeftSelected,
            onLeftPress: null,
            onRightPress: () {
              setState(() {
                isLeftSelected = false;
              });
            },
          ),

          // Turn isLeftSelected on and uncomment to make it selectable
          // isLeftSelected ? ContactsRecentWidget() : AddressWidget()

          AddressWidget()
        ],
      ),
    );
  }
}

class TextToggleButton extends StatelessWidget {
  final String? left;
  final String? right;
  final bool isLeftSelected;
  final Function? onLeftPress;
  final Function? onRightPress;
  TextToggleButton(
      {this.left,
      this.right,
      this.isLeftSelected = false,
      this.onLeftPress,
      this.onRightPress});

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
    List<Widget> list = [];
    if (isLeftSelected) {
      list.add(unselected(context, left, onLeftPress));
      list.add(SizedBox(width: 2.w));
      list.add(selected(context, right, onRightPress));
    } else {
      list.add(unselected(context, left, onLeftPress));
      list.add(SizedBox(width: 2.w));
      list.add(selected(context, right, onRightPress));
    }
    return Row(
      children: list,
    );
  }

  Widget unselected(context, title, onTap) {
    return InkWell(
        onTap: onTap,
        child: Container(
          width: 152.w,
          height: 30.h,
          // decoration: BoxDecoration(
          //   borderRadius : BorderRadius.all(Radius.circular(14),),
          //   boxShadow : [BoxShadow(
          //       color: Color.fromRGBO(0, 0, 0, 0.10000000149011612),
          //       offset: Offset(0,5),
          //       blurRadius: 20
          //   )],
          //   color : Color.fromRGBO(255, 255, 255, 1),
          // ),
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

class ContactsRecentWidget extends StatefulWidget {
  @override
  _ContactsRecentWidgetState createState() => _ContactsRecentWidgetState();
}

class _ContactsRecentWidgetState extends State<ContactsRecentWidget> {
  // TextEditingController _searchController = TextEditingController();
  String _address = "";
  @override
  void initState() {
    super.initState();
    // _searchController.text="";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        SizedBox(
          height: 16.h,
        ),
        Container(
          // width:276.w,
          height: 58.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(15.w),
            ),
            color: ThemeColors.gray_100,
          ),
          padding: EdgeInsets.all(0.0),
          child: Center(
              child: CustomTextFieldWidget(
            hintText: "enter_phone_number_or_email_address",
            onChanged: (s) => setState(() => _address = s),
            isTransparent: true,
          )),
        ),
        SizedBox(
          height: 24.h,
        ),
        _address.isEmpty
            ? Column(children: [
                InputGroupSubject(text: "recent"),
                SizedBox(
                  height: 24.h,
                ),
                Align(alignment: Alignment.centerLeft, child: ContactItem()),
                // SizedBox(height: 40.h,),
                // Align(alignment: Alignment.centerLeft,child: ContactItem()),
              ])
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 25.h,
                          ),
                          SizedText(
                              height: 18.h,
                              text: "transfer_to",
                              textStyle: ThemeTextStyles.InputGroupSubject,
                              alignment: Alignment.center),
                          SizedText(
                              width: MediaQuery.of(context).size.width,
                              text: "\"" + _address + "\"",
                              textStyle: ThemeTextStyles.InputGroupSubject,
                              textAlign: TextAlign.center,
                              alignment: Alignment.center),
                        ]),
                    SizedBox(
                      height: 64.h,
                    ),
                    BottomButton(
                      horizontalPadding: 0,
                      text: "confirm",
                      onPressed: () async {
                        await appStore.dispatch(SetTransferAccount(
                            transferAccountAddress: _address));
                        await appStore.dispatch(NavigateToAction(
                            to: AppRoutes.accountTransferInputBalance));
                      },
                    ),
                  ])
      ],
    ));
  }

  Widget ContactItem() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          width: 40,
          height: 40,
          child: Icon(
            YolletIcons.contact,
            color: ThemeColors.gray_400,
            size: 40,
          ),
        ),
        SizedBox(width: 12),
        Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AutoSizeText(
                'name',
                textAlign: TextAlign.left,
                style: ThemeTextStyles.CoinListItemText,
              ),
              SizedBox(height: 2),
              AutoSizeText(
                '01012345678',
                textAlign: TextAlign.left,
                style: ThemeTextStyles.CoinItemCoinName,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class AddressWidget extends StatefulWidget {
  @override
  _AddressWidgetState createState() => _AddressWidgetState();
}

class _AddressWidgetState extends State<AddressWidget> {
  String _address = "";
  final GlobalKey<CustomTextFieldWidgetState> _customTextFieldKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    YolletState state = StoreProvider.of<AppState>(context).state.yolletState;

    return Container(
        child: Column(
      children: [
        SizedBox(
          height: 16.h,
        ),
        Container(
          // width:276.w,
          height: 56.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(15.w),
            ),
            color: ThemeColors.gray_100,
          ),
          padding: EdgeInsets.all(0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 270.w,
                child: CustomTextFieldWidget(
                    hintText: "enter_address",
                    onChanged: (s) => setState(() => _address = s),
                    isTransparent: true,
                    key: _customTextFieldKey),
              ),
              // SizedBox(width: 6.w,),
              InkWell(
                onTap: () async {
                  String? results = await Navigator.push(
                    // waiting for the scan results
                    context,
                    MaterialPageRoute(
                      builder: (context) => QRViewPage(), // open the scan view
                    ),
                  );
                  if (results != null) {
                    setState(() {
                      // result = results;
                      _customTextFieldKey.currentState!.inputController.text =
                          results;
                      _address = results;
                    });
                  }
                },
                child: Container(
                  width: 30.w, height: 28.h,
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.all(Radius.circular(10.w)),
                  //   border: Border.all(color: ThemeColors.orange_500, width: 2),
                  // ),
                  child: Icon(
                    YolletIcons.qr,
                    color: ThemeColors.theme_500,
                    size: 18.r,
                  ),
                ),
              ),
              SizedBox(
                width: 12.w,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 24.h,
        ),
        _address.isEmpty
            ? Container(
                height: MediaQuery.of(context).size.height - 233.h,
                child: ListView(scrollDirection: Axis.vertical, children: [
                  InputGroupSubject(text: "my_accounts"),
                  SizedBox(
                    height: 4.h,
                  ),
                  getMyAccountList(),
                  SizedBox(
                    height: 24.h,
                  ),
                  state.recentTransferList.isNotEmpty
                      ? InputGroupSubject(text: "recent")
                      : Container(),
                  SizedBox(
                    height: 4.h,
                  ),
                  getRecentTransferList()
                  // SizedBox(height: 24.h,),
                  // Align(alignment: Alignment.centerLeft,child: RecentTransferItem()),
                  // SizedBox(height: 40.h,),
                  // Align(alignment: Alignment.centerLeft,child: RecentTransferItem()),
                  // SizedBox(height: 40.h,),
                  // Align(alignment: Alignment.centerLeft,child: RecentTransferItem()),
                ]))
            : Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                    SizedBox(
                      height: 25.h,
                    ),
                    SizedText(
                        height: 18.h,
                        text: "transfer_to",
                        textStyle: ThemeTextStyles.InputGroupSubject,
                        alignment: Alignment.center),
                    SizedText(
                        width: MediaQuery.of(context).size.width,
                        text: "\"" + _address + "\"",
                        textStyle: ThemeTextStyles.InputGroupSubject,
                        textAlign: TextAlign.center,
                        alignment: Alignment.center),
                    SizedBox(
                      height: 64.h,
                    ),
                    BottomButton(
                      horizontalPadding: 0,
                      text: "confirm",
                      onPressed: () async {
                        await appStore.dispatch(SetTransferAccount(
                            transferAccountAddress: _address));
                        await appStore.dispatch(NavigateToAction(
                            to: AppRoutes.accountTransferInputBalance));
                      },
                    ),
                  ])
      ],
    ));
  }

  Widget getMyAccountList() {
    YolletState state = StoreProvider.of<AppState>(context).state.yolletState;

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
      if(info.isStoreAddress){
        continue;
      }

      String addInfo =info.addInfo??"";
      //temp code
      if(addInfo.startsWith("VIXP-")){
        addInfo = addInfo.substring(5);
      }
      if (info.isEmptyBalance) {
        String? tokenId = "";
        TokenInfo? tokenItem;
        for (TokenInfo item in state.tokenList) {
          if (item.tokenId == tokenId) {
            tokenItem = item;
          }
        }
        list.add(InkWell(
            onTap: () async {
              await appStore.dispatch(
                  SetTransferAccount(transferAccountAddress: info.address));
              await appStore.dispatch(
                  NavigateToAction(to: AppRoutes.accountTransferInputBalance));
            },
            child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 20),
                child: MyAccountsItem(
                  url: tokenItem?.url ?? Common.getUrl(tokenId),
                  address: info.address,
                  name: addInfo,
                  emptyToken: true,
                ))));
      } else {
        for (QueryBalanceInfo binfo in info.queryBalanceInfoList!) {
          TokenInfo? tokenItem;
          String? tokenId = binfo.tokenId;
          for (TokenInfo item in state.tokenList) {
            if (item.tokenId == tokenId) {
              tokenItem = item;
            }
          }
          list.add(InkWell(
              onTap: () async {
                await appStore.dispatch(
                    SetTransferAccount(transferAccountAddress: info.address));
                await appStore.dispatch(NavigateToAction(
                    to: AppRoutes.accountTransferInputBalance));
              },
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: MyAccountsItem(
                      url: tokenItem?.url ?? Common.getUrl(tokenId),
                      address: info.address,
                      name: addInfo))));
        }
      }
      list.add(Divider(
        height: 1.h,
        thickness: 1,
        color: ThemeColors.gray_100,
      ));
    }
    return Column(children: list);
  }

  Widget getRecentTransferList() {
    YolletState state = StoreProvider.of<AppState>(context).state.yolletState;

    List<Widget> list = [];
    for (TransferInfo info in state.recentTransferList) {
      String formatBalance = "";
      if (info.amount == null || info.amount!.isEmpty) {
        formatBalance = "0";
      } else {
        YolletState state = appStore.state.yolletState;
        num? decimalPoint = state.currentTokenInfo.decimalPoint;
        formatBalance = CurrencyFormatter.get(decimalPoint?.toInt() ?? 0)
            .format(num.parse(info.amount!))
            .toString();
      }

      list.add(InkWell(
          onTap: () async {
            await appStore.dispatch(
                SetTransferAccount(transferAccountAddress: info.toAddress));
            await appStore.dispatch(
                NavigateToAction(to: AppRoutes.accountTransferInputBalance));
          },
          child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(vertical: 20),
              child: RecentTransferItem(
                  url: Common.getUrl(info.tokenId),
                  address: info.toAddress,
                  // name:"",
                  infoText: formatBalance +
                      ' ' +
                      info.tokenId! +
                      ' (' +
                      DateFormat('yy.MM.dd.').format(info.transactionDateTime) +
                      ')'))));
      list.add(Divider(
        height: 1.h,
        thickness: 1,
        color: ThemeColors.gray_100,
      ));
    }
    return Column(children: list);
  }
}

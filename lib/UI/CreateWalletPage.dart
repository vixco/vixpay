import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:yollet/Data/Dataset/AddressInfo.dart';
import 'package:yollet/Data/Dataset/BalanceInfo.dart';
import 'package:yollet/Data/Dataset/QueryBalanceInfo.dart';
import 'package:yollet/Data/Dataset/TokenInfo.dart';
import 'package:yollet/Mgr/Navigation/app_routes.dart';
import 'package:yollet/Mgr/redux/action.dart';
import 'package:yollet/Mgr/redux/state.dart';
import 'package:yollet/UI/QRViewPage.dart';
import 'package:yollet/UI/template.dart';
import 'package:yollet/Util/Common/Common.dart';
import 'package:yollet/themeStyle.dart';

class CreateWalletPage extends StatefulWidget {
  @override
  _CreateWalletPageState createState() => _CreateWalletPageState();
}

class _CreateWalletPageState extends State<CreateWalletPage> {
  String? _address = '';
  // final GlobalKey<CustomTextFieldWidgetState> _customTextFieldKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      YolletState state = StoreProvider.of<AppState>(context).state.yolletState;

      if (state.addressInfoList.isEmpty) {
        actionDialog(
            title: 'error',
            text: "account_list_is_empty_create_an_account",
            actions: <Widget>[
              TextButton(
                child: AutoSizeText(
                    AppLocalizations.of(context)!.getString('ok')),
                onPressed: () async {
                  appStore.dispatch(DismissPopupAction());
                  await appStore.dispatch(NavigateToAction(to: 'up'));
                  await appStore
                      .dispatch(NavigateToAction(to: AppRoutes.createAccount));
                },
              ),
            ]);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultScrollBody(Body(context),
          appBarWidget: CustomAppBar(
            title: "add_payment_method",
          ),
          // footerHeight: 72.h
      ),
      // bottomSheet: Footer(),
    );
  }

  Widget Body(context) {
    return Container(
      color: ThemeColors.white,
      child: Column(
        children: <Widget>[
          /*
          SizedBox(
            height: 12.h,
          ),
          InputGroupSubject(text: "add_payment_address"),
          SizedBox(
            height: 16.h,
          ),
          // _customTextField(controller: _searchController,hintText:"Add payment address"),
          CustomTextFieldWidget(
              labelText: "payment_address",
              onChanged: (s) => setState(() => _address = s),
              key: _customTextFieldKey),
          SizedBox(
            height: 20.h,
          ),
          BtnBorderQRCode(
            text: "qr_code",
            onPressed: () async {
              String? results = await Navigator.push(
                // waiting for the scan results
                context,
                MaterialPageRoute(
                  builder: (context) => QRViewPage(), // open the scan view
                ),
              );
              if (results != null) {
                setState(() {
                  _customTextFieldKey.currentState!.inputController.text =
                      results;
                  _address = results;
                });
              }
            },
          ),

           */
          SizedBox(
            height: 24.h,
          ),
          InputGroupSubject(text: "please_select_account_to_use_for_payment"),
          SizedBox(
            height: 4.h,
          ),
          getMyAccountList(),
          SizedBox(
            height: 24.h,
          ),
        ],
      ),
    );
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
                onPressed: () async {
                  await appStore.dispatch(SetWalletInfo(address: _address));
                  appStore.dispatch(
                      NavigateToAction(to: AppRoutes.createWalletName));
                },
              ),
            ],
          ),
          ThemeSpacingBox.spacing_l,
        ]));
  }

  Widget getMyAccountList() {
    YolletState state = StoreProvider.of<AppState>(context).state.yolletState;

    List<Widget> list = [];
    for (AddressInfo info in state.addressInfoList) {
      // List<String> split;
      // if (info.addInfo == null ||info.addInfo!.isEmpty) {
      //   split = "-".split("-");
      // } else {
      //   split = info.addInfo!.split("-");
      //   if(split.length==1){
      //     split = [info.addInfo!,""];
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
              // await appStore.dispatch(SetWalletInfo(address: info.address));
              // appStore.dispatch(NavigateToAction(to: AppRoutes.createWalletName));
              // setState(() async {
              // _customTextFieldKey.currentState!.inputController.text =
              //     info.address!;
              _address = info.address;
              await appStore.dispatch(SetWalletInfo(address: _address));
              appStore
                  .dispatch(NavigateToAction(to: AppRoutes.createWalletName));
              // });
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
                // await appStore.dispatch(SetWalletInfo(address: info.address));
                // appStore.dispatch(NavigateToAction(to: AppRoutes.createWalletName));
                // setState(() async {
                // _customTextFieldKey.currentState!.inputController.text =
                //     info.address!;
                _address = info.address;
                await appStore.dispatch(SetWalletInfo(address: _address));
                appStore
                    .dispatch(NavigateToAction(to: AppRoutes.createWalletName));
                // });
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
}

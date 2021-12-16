import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yollet/Data/Dataset/WalletInfo.dart';
import 'package:yollet/Mgr/Navigation/app_routes.dart';
import 'package:yollet/Mgr/redux/action.dart';
import 'package:yollet/Mgr/redux/state.dart';
import 'package:yollet/UI/template.dart';
import 'package:yollet/Util/Common/global_widgets.dart';
import 'package:yollet/themeStyle.dart';

class SettingPaymentMethodPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultBody(
        Body(),
        appBarWidget: CustomAppBar(
            title: "payment_method",
            actionText: "add",
            onActionTap: () => appStore.dispatch(
                  NavigateToAction(to: AppRoutes.createWallet),
                )),
        paddingTop: 0,
        paddingLR: 0,
      ),
    );
  }
}

class Body extends StatefulWidget {
  bool isSuccessCopyOpen = false;

  @override
  BodyState createState() => BodyState();
}

class BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    void updateAlert(bool val) {
      setState(() {
        widget.isSuccessCopyOpen = val;
      });
    }

    return StoreConnector<AppState, YolletState>(
        converter: (store) => store.state.yolletState,
        builder: (_, YolletState state) => Container(
              height: MediaQuery.of(context).size.height - 88.h,
              color: ThemeColors.white,
              child: Stack(
                children: [
                  ReorderableListView(
                    onReorder: _onReorder,
                    scrollDirection: Axis.vertical,
                    // padding: const EdgeInsets.symmetric(vertical: 8.0),
                    children: List.generate(
                      state.walletList.length,
                      (index) {
                        return WalletCardItem(
                          state.walletList[index],
                          index,
                          Key('$index'),
                          updateAlert,
                        );
                      },
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height - 88.h - 36.h,
                    alignment: Alignment.bottomCenter,
                    child: CopiedAlert(
                      isSuccessCopyOpen:
                          widget.isSuccessCopyOpen ? true : false,
                      title: 'delete_complete',
                      subtitle: 'bank_account_delete',
                    ),
                  ),
                ],
              ),
            ));
  }

  Future<void> _onReorder(int oldIndex, int newIndex) async {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }
    YolletState state = StoreProvider.of<AppState>(context).state.yolletState;
    List<WalletInfo> list = [];
    list.addAll(state.walletList);
    final WalletInfo item = list.removeAt(oldIndex);
    list.insert(newIndex, item);
    await appStore.dispatch(UpdateWalletList(walletList: list));
  }
}

class WalletCardItem extends StatefulWidget {
  final int index;
  final Key key;
  final WalletInfo info;
  Function updateAlert;

  WalletCardItem(this.info, this.index, this.key, this.updateAlert);

  @override
  _ListViewCard createState() => _ListViewCard();
}

class _ListViewCard extends State<WalletCardItem> {
  final String wallet0 = 'assets/img/small_wallet_0.svg';
  final String wallet1 = 'assets/img/small_wallet_1.svg';
  final String wallet2 = 'assets/img/small_wallet_2.svg';
  final String wallet3 = 'assets/img/small_wallet_3.svg';
  final String wallet4 = 'assets/img/small_wallet_4.svg';

  String getWallet(int index) {
    List list = [wallet0, wallet1, wallet2, wallet3, wallet4];
    return list[index];
  }

  Future<void> _remove(int index) async {
    YolletState state = StoreProvider.of<AppState>(context).state.yolletState;
    List<WalletInfo> list = [];
    list.addAll(state.walletList);
    final WalletInfo item = list.removeAt(index);
    await appStore.dispatch(DeleteWallet(wallet: item));
    await appStore.dispatch(UpdateWalletList(walletList: list));
  }

  Future<void> _edit(int index, WalletInfo info) async {
    YolletState state = StoreProvider.of<AppState>(context).state.yolletState;
    List<WalletInfo> list = [];
    list.addAll(state.walletList);
    list[index] = info;
    await appStore.dispatch(UpdateWalletList(walletList: list));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.all(0),
      color: Colors.white,
      child: InkWell(
        // splashColor: ThemeColors.sub_color_orange,
        // onTap: () => Fluttertoast.showToast(
        //     msg: "Item ${widget.listItems[widget.index]} selected.",
        //     toastLength: Toast.LENGTH_SHORT),
        // onTap: ()=>debugPrint("Item ${widget.index} selected."),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: Divider.createBorderSide(context,
                  width: 1.0, color: ThemeColors.gray_100),
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          height: 86.h,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Flexible(
                child: Row(
                  children: [
                    Container(
                      width: 32.w,
                      height: 32.h,
                      // child: Icon(Icons.remove_circle,color: ThemeColors.error,size: 20.r,),
                      child: IconButton(
                        icon: Icon(Icons.remove_circle,
                            color: ThemeColors.error, size: 20.r),
                        iconSize: 32.w,
                        padding: EdgeInsets.only(right: 12.w),
                        onPressed: () {
                          actionDialog(
                              // DeleteConfirmTitle
                              customText: AutoSizeText(AppLocalizations.of(context)!.getString('delete_wallet'), style: ThemeTextStyles.DeleteConfirmTitle, ),
                              actions: <Widget>[
                                BtnFillPopup(
                                  backgroundColor: ThemeColors.gray_400,
                                  onPressed: () {
                                    appStore.dispatch(DismissPopupAction());
                                    widget.updateAlert(false);
                                  },
                                  child: AutoSizeText(
                                    AppLocalizations.of(context)!
                                        .getString('cancel'),
                                    style: ThemeTextStyles.BottomButton,
                                  ),
                                ),
                                BtnFillPopup(
                                  onPressed: () {
                                    _remove(widget.index);
                                    appStore.dispatch(DismissPopupAction());
                                    widget.updateAlert(true);
                                  },
                                  child: AutoSizeText(
                                    AppLocalizations.of(context)!
                                        .getString('confirm'),
                                    style: ThemeTextStyles.BottomButton,
                                  ),
                                )
                              ]);
                        },
                      ),
                    ),
                    // SizedBox(width: 12.w,),
                    SizedBox(
                      width: 72.w,
                      height: 48.h,
                      child: SvgPicture.asset(getWallet(widget.info.index)),
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    SizedText(
                      height: 18.h,
                      text: widget.info.name,
                      textStyle: ThemeTextStyles.SettingItem,
                    ),
                    Container(
                      width: 28.w,
                      height: 28.h,
                      // child: Icon(YolletIcons.edit,color: ThemeColors.gray_300,size: 20.r,),
                      child: IconButton(
                        icon: Icon(
                          YolletIcons.edit,
                          color: ThemeColors.gray_300,
                          size: 20.r,
                        ),
                        iconSize: 28.w,
                        padding: EdgeInsets.all(0),
                        onPressed: () async {
                          WalletInfo info = widget.info;
                          String? inputResult = await asyncInputDialog(
                              title: "edit_wallet_name",
                              hint: "my_wallet",
                              initialString: widget.info.name);
                          if (inputResult != null &&
                              inputResult.isNotEmpty &&
                              widget.info.name != inputResult) {
                            info.name = inputResult;
                            _edit(widget.index, info);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Icon(
                  Icons.reorder,
                  color: ThemeColors.gray_500,
                  size: 24.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

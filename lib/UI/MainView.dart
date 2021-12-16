import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:yollet/Mgr/Navigation/MenuListData.dart';
import 'package:yollet/Mgr/redux/action.dart';
import 'package:yollet/Mgr/redux/state.dart';
import 'package:yollet/UI/template.dart';
import 'package:yollet/Util/Common/global_widgets.dart';

class MainView extends StatefulWidget {
  // MainView() : super(key: Global.appKey);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  // late StreamSubscription _systemListener;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    // _systemListener.cancel();
  }

  Future<bool> _onWillPop() async {
    return await actionDialog<bool>(title: 'exit', text: 'exit_the_program', actions: <Widget>[
      BtnFillPopup(
        backgroundColor: ThemeColors.gray_400,
        onPressed: () => appStore.dispatch(DismissPopupAction(result: false)),
        child:AutoSizeText(Global.getString('no'),style: ThemeTextStyles.BottomButton,),
      ),
      BtnFillPopup(
        onPressed: () => SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
        child:AutoSizeText(Global.getString('yes'),style: ThemeTextStyles.BottomButton,),
      )
    ]) ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: WillPopScope(
          onWillPop: _onWillPop,
          child:
          StoreConnector<AppState,SettingState>(
              converter: (store) => store.state.settingState,
              builder: (_, SettingState state) =>
                  Scaffold(
                    body: Container(
                      height: MediaQuery.of(context).size.height,
                      color: ThemeColors.white,
                      child: DefaultBody(
                        Column(children: <Widget>[
                          //Title
                          Container(
                              padding: EdgeInsets.only(
                                  top: 44.h,
                                  bottom: 20.h),
                              child: Column(
                                children: <Widget>[
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child:AutoSizeText("Yollet TEST Page",
                                        style: ThemeTextStyles.MainSubject,
                                      )),
                                ],
                              )),
                          _mainButton(context, useAllMenu: true),
                        ]),
                      ),
                    ),
                  )),
        )
    );
  }


  Widget _mainButton(BuildContext context, {bool useAllMenu = false}) {
    List<Widget> btnWidgets =[];
    List menuList = MenuDataList.getMenuList(context);
    for (int i = 0; i < menuList.length; i++) {

      MenuData menuItem = menuList[i];
      btnWidgets.add(
        MarigoldFlatButtonOrange(
          elevation: 0.0,
          child:Padding(padding:EdgeInsets.only(bottom: 1),
            child:
            Row(
              children: [
                SizedBox(width: 3.w),
                Icon(
                  menuItem.icon, color: ThemeColors.black, size: 28.w,),
                SizedBox(width: 10.w),
                Expanded(
                  flex: 1,
                  child:
                  AutoSizeText(
                    AppLocalizations.of(context)!.getString(menuItem.menuTitle),
                    style: menuItem.textStyle!.apply(color: ThemeColors.black),
                  ),),
              ],
            ),
          ),
          onPressed: () {
            appStore.dispatch(NavigateToAction(to: menuItem.menuLink));
          },
        ),
      );
    }
    return Expanded(
      flex: 1,
      child: GridView.count(
        //primary: false,
        padding: const EdgeInsets.all(0),
        mainAxisSpacing: 8,
        crossAxisSpacing: 0,
        crossAxisCount: 1,
        childAspectRatio: 39/7,
        children: btnWidgets,
      ),
    );
  }
}

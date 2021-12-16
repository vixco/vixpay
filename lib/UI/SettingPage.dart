import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:yollet/Mgr/Navigation/app_routes.dart';
import 'package:yollet/Mgr/redux/action.dart';
import 'package:yollet/Mgr/redux/state.dart';
import 'package:yollet/UI/template.dart';
import 'package:yollet/themeStyle.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultScrollBody(Body(),
          appBarWidget: MainPageAppBar(
              title: "setting", isVisibleLogo: false, height: 88.h),
          footerHeight: 56.h,
          paddingTop: 0,
          paddingLR: 0),

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
            currentIndex: 2,
          )),
    );
  }
}

class Body extends StatefulWidget {
  @override
  BodyState createState() => BodyState();
}

class BodyState extends State<Body> {
  bool hasEthereumKeyIndex = false;
  @override
  void initState() {
    super.initState();
    appStore.dispatch(ReadStoreCertificationDateAction());
    SchedulerBinding.instance?.addPostFrameCallback((_) async {
      YolletState yolletState = StoreProvider.of<AppState>(context).state.yolletState;
      hasEthereumKeyIndex = await appStore.dispatch(HasKeyIndexAction(address:yolletState.ethereumInfo.address));
      setState(() {

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, InitState>(
        converter: (store) => store.state.initState,
        builder: (_, InitState state) => Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height -
                  88.h -
                  kBottomNavigationBarHeight.h,
              color: ThemeColors.white,
              child: ListView(
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  SettingGroupWidget(
                    text: "profile",
                  ),
                  SettingItemWidget(
                      text: state.loginId,
                      textStyle: ThemeTextStyles.SettingAccount,
                      onTap: () => appStore.dispatch(
                            NavigateToAction(to: AppRoutes.settingProfile),
                          )),
                  SettingGroupWidget(
                    text: "exchange_rate",
                  ),
                  SettingItemWidget(
                      text: "exchange_rate",
                      onTap: () => appStore.dispatch(
                            NavigateToAction(to: AppRoutes.exchangeRatePage),
                          )),
                  SettingGroupWidget(
                    text: "app",
                  ),
                  SettingItemWidget(
                      text: "notification",
                      onTap: () => appStore.dispatch(
                            NavigateToAction(to: AppRoutes.settingNotification),
                          )),
                  SettingItemWidget(
                      text: "passcode",
                      onTap: () => appStore.dispatch(
                            NavigateToAction(to: AppRoutes.settingPasscode),
                          )),
                  SettingItemWidget(
                      text: "payment_method",
                      description: "add_delete_payment_method",
                      onTap: () => appStore.dispatch(
                            NavigateToAction(
                                to: AppRoutes.settingPaymentMethod),
                          )),

                  SettingGroupWidget(
                    text: "vixco_address_manager",
                  ),
                  hasEthereumKeyIndex
                  ?SettingItemWidget(
                      text: "export_vixco_address",
                      onTap: () => appStore.dispatch(
                            NavigateToAction(to: AppRoutes.exportVixcoAddressPassCodePage),
                          ))
                  :SettingItemWidget(
                    textStyle: ThemeTextStyles.SettingItem.apply(
                        color: ThemeColors.gray_400),
                    text: "export_vixco_address",),
                  SettingItemWidget(
                      textStyle: ThemeTextStyles.SettingItem,
                      text: "import_vixco_address",
                      onTap: () => appStore.dispatch(
                        NavigateToAction(to: AppRoutes.importCautionPage),
                      )),
                  SettingGroupWidget(
                    text: "store_management",
                  ),
                  SettingItemWidget(
                      text: "merchant_certification",
                      description: state.certificationDate.isEmpty
                          ? AppLocalizations.of(context)!
                              .getString("merchant_uncertified")
                          : AppLocalizations.of(context)!
                                  .getString("auth_complete") +
                              "(${state.certificationDate})",
                      onTap: () => appStore.dispatch(
                            NavigateToAction(
                                to: AppRoutes.merchantRegistration,
                                replace: false),
                          )),
                  SettingGroupWidget(
                    text: "others",
                  ),
                  SettingItemWidget(
                      text: "terms_of_service_view",
                      onTap: () => appStore.dispatch(
                            NavigateToAction(to: AppRoutes.settingTerms),
                          )),
                  SettingItemWidget(
                      text: "version",
                      onTap: () => appStore.dispatch(
                            NavigateToAction(to: AppRoutes.settingVersion),
                          )),
                  SettingItemWidget(
                      text: "language",
                      onTap: () => appStore.dispatch(
                            NavigateToAction(
                                to: AppRoutes.settingLanguage, replace: true),
                          )),
                  // SizedBox(height: 24.h,),
                  // SettingGroupWidget(text: 'Others',),
                  // SettingItemWidget(text:"Tearms of Service",),
                  // SettingItemWidget(text:"Version",),
                ],
              ),
            ));
  }
  // Future<String> getStoreCertification() async {
  //  String date =  await appStore.dispatch(ReadStoreCertificationDateAction());
  //   if(date.isEmpty){
  //     return "";
  //   }else{
  //     return AppLocalizations.of(context)!.getString("auth_complete")+"($date)";
  //   }
  //
  //
  // }

}

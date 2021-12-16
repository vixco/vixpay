import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yollet/Mgr/Navigation/app_routes.dart';
import 'package:yollet/Mgr/redux/action.dart';
import 'package:yollet/Mgr/redux/state.dart';
import 'package:yollet/UI/template.dart';
import 'package:yollet_client/yollet_client.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  FlutterSecureStorage? _secureStorage;
  SharedPreferences? _storage;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance!.addPostFrameCallback(init);
  }

  Future<void> init(Duration timeStamp) async {
     // ScreenUtil.init(context, width: 360, height: 720);
    debugPrint('[INIT][1/8]Init');
    initGRpc();
  }
  Future<void> initGRpc() async {
    debugPrint('[INIT][2/8]initGRpc');

    var info = await PackageInfo.fromPlatform();

    // 개발서버: dev-grpc.yoshop.net, dev-auth.yoshop.net 사용
    // 데모서버: dd-grpc.yoshop.net, dd-auth.yoshop.net 사용
    GRpcClient.instance
      ..url = kReleaseMode?'https://cpos-grpc.yoshop.net':'https://dev-grpc.yoshop.net'
      ..authUrl = kReleaseMode?'https://cpos-auth.yoshop.net':'https://dev-auth.yoshop.net'
      ..service = info.packageName
      ..version = info.version
      ..onAuthenticate = () async {
        appStore.dispatch(NavigateToAction(to: AppRoutes.login));
        return false;
      };
    checkLicense1();

  }

  Future<void> checkLicense1() async {
    debugPrint('[INIT][3/8]checkLicense1');

    var resultMap =await appStore.dispatch(CheckLicenseFileAction());
    bool? success = resultMap["success"];
    bool invalidLicense = resultMap["invalidLicense"];
    // if(success) {
    if (invalidLicense) {
      invalidLicensePopup("license_invalid_store");
    }else {
      await appStore.dispatch(RequestPermissionAction());
      await initData();
    }
    // }
  }

  void invalidLicensePopup(String message){
    actionDialog(title: "error", text: message,
        actions: <Widget>[
          BtnFillPopup(
            backgroundColor: ThemeColors.gray_400,
            child: Text(AppLocalizations.of(context)!.getString("no"),style: ThemeTextStyles.BottomButton,),
            onPressed: () async {
              if((defaultTargetPlatform==TargetPlatform.iOS)){
                return;
              }
              // SystemChannels.platform.invokeMethod('SystemNavigator.pop');
              // await appStore.dispatch(SetResetLoginInfoAction());

              await appStore.dispatch(DismissPopupAction());
              // appStore.dispatch(DoRestartAppAction());
              SystemChannels.platform.invokeMethod('SystemNavigator.pop');
            },
          ),
          BtnFillPopup(
            child: Text(AppLocalizations.of(context)!.getString("yes"),style: ThemeTextStyles.BottomButton,),
            onPressed: () async {
              await appStore.dispatch(DismissPopupAction());
              await appStore.dispatch(IssueLicenseAction());
              await appStore.dispatch(RequestPermissionAction());
              await initData();
            },
          ),
        ],
        onWillPop:() async {
          if((defaultTargetPlatform==TargetPlatform.iOS)){
            return Future.value(false);
          }
          // await appStore.dispatch(SetResetLoginInfoAction());
          await appStore.dispatch(DismissPopupAction());
          // appStore.dispatch(DoRestartAppAction());
          SystemChannels.platform.invokeMethod('SystemNavigator.pop');
          return Future.value(false);
        });
  }

  Future<void> initData() async {
    debugPrint('[INIT][4/8]initData');

    // var info = await PackageInfo.fromPlatform();
    //
    // // 개발서버: dev-grpc.yoshop.net, dev-auth.yoshop.net 사용
    // // 데모서버: dd-grpc.yoshop.net, dd-auth.yoshop.net 사용
    // GRpcClient.instance
    //   ..url = 'https://dev-grpc.yoshop.net'
    //   ..authUrl = 'https://dev-auth.yoshop.net'
    //   ..service = info.packageName
    //   ..version = info.version
    //   ..onAuthenticate = () async {
    //     appStore.dispatch(NavigateToAction(to: AppRoutes.login));
    //     return false;
    //   };
    _secureStorage = FlutterSecureStorage();
    _storage = await SharedPreferences.getInstance();
    await initLoginData();
    await appStore.dispatch(GetTokenList());
    await appStore.dispatch(GetNotificationInfoList());
    // await appStore.dispatch(GetAccountList(isLoadWallet: true));
    initSettingData();
    checkLicense2();
  }

  Future<void> initLoginData() async {
    debugPrint('[INIT][5/8]LOAD Login Data');

    var prefs = await SharedPreferences.getInstance();

    await appStore.dispatch(SetLoginInfoAction(
      loginToken: prefs.getString(KEY_LOGIN_TOKEN)??"",
    ));

    await appStore.dispatch(DoLoginAction());
  }

  Future<void> initSettingData() async {
    debugPrint('[INIT][6/8]LOAD Setting Data');
    SettingState state = StoreProvider.of<AppState>(context).state.settingState;
    for(String key in state.keyList) {
      await appStore.dispatch(GetSettingAction(key: key));
    }
    ThemeValue.language = state.value(SettingState.KEY_LANGUAGE);
  }

  Future<void> checkLicense2() async {
    debugPrint('[INIT][7/8]Check License');

    const String LIC_STAT_USED = "0000"; //사용중
    const String LIC_STAT_WAITING_FOR_APPROVAL = "1000"; //승인대기
    const String LIC_STAT_PAUSE = "8000"; //일시중지
    const String LIC_STAT_DISPOSAL = "9000"; //폐기
    const String LIC_STAT_EXPIRED = "9100"; //만료
    const String LIC_STAT_INVALID_LICENSE = "9200"; //invalid license

    var resultMap = await appStore.dispatch(VerifyLicenseAction());
    if(resultMap!=null && resultMap.containsKey("licenseKey")) {
      print("License Id :${resultMap["licenseKey"]??""}");
    }
    bool isSuccess = resultMap["success"]??false;
    String state = resultMap["state"]??LIC_STAT_USED;

    if(!isSuccess){
      switch(state) {
        case LIC_STAT_WAITING_FOR_APPROVAL:
          if((defaultTargetPlatform==TargetPlatform.iOS)){
            actionDialog(title: 'info', text: "waiting_for_approval",
                actions: <Widget>[
                  TextButton(
                    child: AutoSizeText(
                        AppLocalizations.of(context)!.getString('ok')),
                    onPressed: () async {
                      appStore.dispatch(DismissPopupAction());
                      appStore.dispatch(DoRestartAppAction());
                    },
                  ),
                ],
              disableCloseButton:true,
            );
          }else{
            alertCallback('info', "waiting_for_approval", callback: () {
              appStore.dispatch(DoRestartAppAction());
              SystemChannels.platform.invokeMethod('SystemNavigator.pop');
            });
          }
          return;
        case LIC_STAT_PAUSE:
          if((defaultTargetPlatform==TargetPlatform.iOS)){
            actionDialog(title: 'info', text: "license_pause",
                actions: <Widget>[
              TextButton(
                child: AutoSizeText(
                    AppLocalizations.of(context)!.getString('ok')),
                onPressed: () async {
                  appStore.dispatch(DismissPopupAction());
                  appStore.dispatch(DoRestartAppAction());
                },
              ),
            ],
              disableCloseButton:true,);
          }else{
            alertCallback('info', "license_pause", callback: () {
              appStore.dispatch(DoRestartAppAction());
              SystemChannels.platform.invokeMethod('SystemNavigator.pop');
            });
          }
          return;
        case LIC_STAT_DISPOSAL:
          invalidLicensePopup("license_disposal");

          // alertCallback('error', "license_disposal", callback: () {
          //   appStore.dispatch(DoRestartAppAction());
          //   SystemChannels.platform.invokeMethod('SystemNavigator.pop');
          // });
          return;
        case LIC_STAT_EXPIRED:
          if((defaultTargetPlatform==TargetPlatform.iOS)){
            actionDialog(title: 'info', text: "license_expired",
                actions: <Widget>[
              TextButton(
                child: AutoSizeText(
                    AppLocalizations.of(context)!.getString('ok')),
                onPressed: () async {
                  appStore.dispatch(DismissPopupAction());
                  appStore.dispatch(DoRestartAppAction());
                },
              ),
            ],
              disableCloseButton:true,);
          }else{
            alertCallback('info', "license_expired", callback: () {
              appStore.dispatch(DoRestartAppAction());
              SystemChannels.platform.invokeMethod('SystemNavigator.pop');
            });
          }

          return;
        case LIC_STAT_INVALID_LICENSE:
          if((defaultTargetPlatform==TargetPlatform.iOS)){
            actionDialog(title: 'info', text: "license_invalid",
                actions: <Widget>[
              TextButton(
                child: AutoSizeText(
                    AppLocalizations.of(context)!.getString('ok')),
                onPressed: () async {
                  appStore.dispatch(DismissPopupAction());
                  appStore.dispatch(DoRestartAppAction());
                },
              ),
            ],
              disableCloseButton:true,);
          }else{
            alertCallback('info', "license_invalid", callback: () {
              appStore.dispatch(DoRestartAppAction());
              SystemChannels.platform.invokeMethod('SystemNavigator.pop');
            });
          }

          return;
        default:
          if((defaultTargetPlatform==TargetPlatform.iOS)){
            actionDialog(title: 'info', text: "waiting_for_approval",
                actions: <Widget>[
              TextButton(
                child: AutoSizeText(
                    AppLocalizations.of(context)!.getString('ok')),
                onPressed: () async {
                  appStore.dispatch(DismissPopupAction());
                  appStore.dispatch(DoRestartAppAction());
                },
              ),
            ],
              disableCloseButton:true,);
          }else{
            alertCallback('info', "waiting_for_approval", callback: () {
              appStore.dispatch(DoRestartAppAction());
              SystemChannels.platform.invokeMethod('SystemNavigator.pop');
            });
          }

          return;
      }
    }
    // if(resultMap["isLock"]=="1") {
    // InitState initState = appStore.state.initState;
    // if (num.parse(resultMap["minVer"]) > num.parse(resultMap["currVer"])) {
    //   showForceUpdatePopup(initState);
    //   return;
    // }
    // if (num.parse(resultMap["lastVer"]) > num.parse(resultMap["currVer"])) {
    //   showUpdatePopup(initState);
    //   return;
    // }
    String appVersion = resultMap["appVersion"]??"";
    String currAppVersion = resultMap["currAppVersion"]??"";
    String appPackage = resultMap["appPackage"]??"";
    debugPrint("appVersion : $appVersion  , currAppVersion : $currAppVersion , appPackage : $appPackage");
    if(appVersion!=currAppVersion) {
      debugPrint("appVersion!=currAppVersion");

      try {
        List<String> appVersionSplit;
        if (appVersion == null || appVersion.isEmpty) {
          appVersionSplit = "1.0.0".split(".");
        } else {
          appVersionSplit = appVersion.split(".");
          if (appVersionSplit.length != 3) {
            appVersionSplit = "1.0.0".split(".");
          }
        }

        List<String> currAppVersionSplit;
        if (currAppVersion == null || currAppVersion.isEmpty) {
          currAppVersionSplit = "1.0.0".split(".");
        } else {
          currAppVersionSplit = currAppVersion.split(".");
          if (currAppVersionSplit.length != 3) {
            currAppVersionSplit = "1.0.0".split(".");
          }
        }
        int appVersionValue=
            int.parse(appVersionSplit[0])*100*100+
                int.parse(appVersionSplit[1])*100+
                int.parse(appVersionSplit[2]);


        int currAppVersionValue=
            int.parse(currAppVersionSplit[0])*100*100+
                int.parse(currAppVersionSplit[1])*100+
                int.parse(currAppVersionSplit[2]);
        debugPrint("appVersion = $appVersionValue  currAppVersion = $currAppVersionValue");

      if(appVersionValue > currAppVersionValue) {
        actionDialog(title: "app_update_title", text: "app_update_context",
            actions: <Widget>[
              BtnFillPopup(
                backgroundColor: ThemeColors.gray_400,
                child: Text(AppLocalizations.of(context)!.getString("exit"), style: ThemeTextStyles.BottomButton,),
                onPressed: () async {
                  // SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                  // await appStore.dispatch(SetResetLoginInfoAction());
                  await appStore.dispatch(DismissPopupAction());
                  // appStore.dispatch(DoRestartAppAction());
                  SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                },
              ),
              // BtnFillPopup(
              //   child: Text(AppLocalizations.of(context)!.getString("update"), style: ThemeTextStyles.BottomButton,),
              //   onPressed: () async {
              //     await appStore.dispatch(DismissPopupAction());
              //     appStore.dispatch(DoRestartAppAction());
              //     SystemChannels.platform.invokeMethod('SystemNavigator.pop');
              //   },
              // ),
            ],
            onWillPop: () async {
              // await appStore.dispatch(SetResetLoginInfoAction());
              await appStore.dispatch(DismissPopupAction());
              // appStore.dispatch(DoRestartAppAction());
              SystemChannels.platform.invokeMethod('SystemNavigator.pop');
              return Future.value(false);
            });
        return;
      }
      } catch (e) {

      }
        // NewVersion newVersion = NewVersion(
        //   iOSId: '$appPackage',
        //   androidId: '$appPackage',
        // );
        // VersionStatus? versionStatus = await newVersion.getVersionStatus();
        // if(versionStatus!=null && currAppVersion!=versionStatus.storeVersion){
        //   print("Store Appver :${versionStatus.storeVersion} , needUpdateVer : $currAppVersion");
        //   // newVersion.showAlertIfNecessary(context: context);
        //   if (versionStatus.canUpdate) {
        //     newVersion.showUpdateDialog(
        //         context: context,
        //         versionStatus: versionStatus,
        //         dialogTitle: AppLocalizations.of(context)!.getString("app_update_title")!,//'Custom dialog title',
        //         dialogText:AppLocalizations.of(context)!.getString("app_update_context")!,//'Custom dialog text',
        //         updateButtonText: AppLocalizations.of(context)!.getString("update")!,//'Custom update button text',
        //         dismissButtonText: AppLocalizations.of(context)!.getString("exit")!,//'Custom dismiss button text',
        //         dismissAction:() {
        //           Navigator.of(context, rootNavigator: true).pop();
        //           appStore.dispatch(DoRestartAppAction());
        //           SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        //         } ,
        //     );
        //     return;
        //   }
        // }
    }
    moveHome();
}


  Future<void> moveHome() async {
    debugPrint('[INIT][8/8]GO TO MAIN');
    InitState state = StoreProvider.of<AppState>(context).state.initState;
    if (state.isLogin) {
      if(state.loginPin.isEmpty){
        appStore.dispatch(NavigateToAction(to: AppRoutes.createPassCode));
      }else {
        YolletState yolletState = appStore.state.yolletState;
        if (yolletState.ethereumInfo.address.isEmpty) {
          appStore.dispatch(
              NavigateToAction(
                  to: AppRoutes.exportCautionPage,));
        } else {
          appStore.dispatch(NavigateToAction(to: AppRoutes.home));
        }
        appStore.dispatch(GetStakingInfoAction(tokenId: "VIXP"));
      }
    }else{
      appStore.dispatch(NavigateToAction(to: AppRoutes.intro));
    }
  }

  Future<bool> _onWillPop() {
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    return Future.value(false);
  }
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child:Scaffold(
        backgroundColor: ThemeColors.white,
        body: Container(
          child: Center(
            child:Container(
              width: 136.w,
              height: 163.h,
              child:
            Stack(
                children: [
                  Positioned(
                    child:Image(
                        width: 104.w,
                        height: 104.h,
                        fit: BoxFit.contain,
                        image: AssetImage('assets/img/logo_w.png'))
                    , left: 16.w,top: 0.h,),
                  Positioned(
                    child:Image(
                        width: 128.w,
                        height: 43.h,
                        fit: BoxFit.contain,
                        image: AssetImage('assets/img/vixpay.png'))
                    , left: 4.w,bottom: 0.h,)
                  ])
            )
          ),
        ),
      ),
    );
  }
}

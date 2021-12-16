import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';
import 'package:redux/redux.dart';
import 'package:restart_app/restart_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yollet/Mgr/redux/action.dart';
import 'package:yollet/Mgr/redux/state.dart';
import 'package:yollet/UI/template/Popup/popup.dart';
import 'package:yollet/Util/License.dart';
import 'package:yollet_client/yollet_client.dart';

/// Middleware 구현
///   Middleware 를 포함할 경우 다음과 같이 동작함
///   UI => Action1 => Middleware => Action2 => Reducer => Store => UI
///
/// 1. middleware 로 동작하기 위해서는 MiddlewareClass<AppState> 상속 받음
/// 2. call()에서 action 별 분기
/// 3. next(Action2()) 식으로 다음 action 을 호출

///
/// POS Middleware
///CrmInitAction
class InitMiddleware extends MiddlewareClass<AppState> {
  final _secureStorage = FlutterSecureStorage();

  @override
  call(Store<AppState> store, action, next) {
    /////////cartState
    if (action is DoLoginAction) {
      return _doLoginAction(store.state.initState,action.keepLogin, next);
    } else if (action is DoLogoutAction) {
      return _doLogoutAction(store.state.initState, next);
    } else if (action is GetUserAction) {
      return _getUserAction(store.state.initState, next);
    } else if (action is SetLoginInfoAction) {
      return _setLoginInfoAction(store.state.initState, action.loginEmail,action.loginPw,action.loginToken,action.loginPin,action.loginPhone,action.loginUserName, next);
    } else if (action is SignUpAction) {
      return _signUpAction(store.state.initState, action.loginId,action.loginEmail,action.loginPw,action.loginToken,action.loginPin,action.loginPhone,action.loginUserName, next);
    } else if (action is UnregisterAction) {
      return _unregisterAction(store.state.initState, action.password, next);
    } else if (action is ChangePasswordAction) {
      return _changePasswordAction(store.state.initState, action.oldPassword,action.newPassword, next);
    } else if (action is DoRestartAppAction) {
      return _doRestartAppAction(store.state.initState,  next);
    } else if (action is CheckLoginPasswordAction) {
      return _checkLoginPasswordAction(store.state.initState,action.password, next);
    } else if (action is ChangeLoginInfoAction) {
      return _changeLoginInfoAction(store.state.initState,action.password,action.phoneNumber, next);
    } else if (action is SavePinAction) {
      return _savePinAction(store.state.initState,action.pin, next);
    } else if (action is CheckPinAction) {
      return _checkPinAction(store.state.initState,action.pin, next);
    } else if (action is DeletePinAction) {
      return _deletePinAction(store.state.initState,next);
    } else if (action is SendVerificationAction) {
      return _sendVerificationAction(store.state.initState,action.mobileNumber,action.email, next);
    } else if (action is VerifyVerificationAction) {
      return _verifyVerificationAction(store.state.initState,action.verificationCode, next);
    } else if (action is ResetPasswordAction) {
      return _resetPasswordAction(store.state.initState,action.verificationCode, next);
    } else if (action is CheckLicenseFileAction) {
      return _checkLicenseFile(store.state.initState, next);
    } else if (action is IssueLicenseAction) {
      return _issueLicenseAction(store.state.initState, next);
    } else if (action is RequestPermissionAction) {
      return _requestPermission(store.state.initState, next);
    } else if (action is VerifyLicenseAction) {
      return _verifyLicense(store.state.initState, next);
    } else if (action is GetLicenseKeyAction) {
      return _getLicenseKeyAction(store.state.initState, next);
    } else if (action is GetLoginDomainsAction) {
      return _getLoginDomainsAction(store.state.initState, next);
    } else if (action is MerchantLoginAction) {
      return _merchantLoginAction(store.state.initState,action.loginId,action.loginPw,action.loginDomain, next);
    } else if (action is MerchantLoginSaveAction) {
      return _merchantLoginSaveAction(store.state.initState, next);
    } else if (action is ReadStoreCertificationDateAction) {
      return _readStoreCertificationDateAction(store.state.initState, next);
    } else if (action is SetStoreCertificationDateAction) {
      return _setStoreCertificationDateAction(store.state.initState, next);
    } else if (action is UpdateUserOthers) {
      return _updateUserOthers(store.state.initState,action.others, next);
    } else {
      return next(action);
    }
  }
  //
  void _setLoginInfoAction(InitState state, String? loginEmail,String? loginPw,String? loginToken,String? loginPin,String? loginPhone,String? loginUserName,NextDispatcher next) async {
    next(UpdateInitAction(loginId: loginPhone,loginEmail: loginEmail,loginPw:loginPw,loginToken:loginToken,loginPin:loginPin,loginPhone:loginPhone,loginUserName:loginUserName));
  }

  Future<bool> _signUpAction(InitState state, String? loginId, String? loginEmail,String? loginPw,String? loginToken,String? loginPin,String? loginPhone,String? loginUserName,NextDispatcher next) async {
    final String keyLoginToken= "loginToken";
    final String keyLoginPin= "loginPin";
    final String keyLoginPhone= "loginPhone";
    var uuid;
    var prefs = await SharedPreferences.getInstance();
    loginEmail = loginEmail ?? state.loginEmail;
    loginId = loginId ?? state.loginId;
    loginPw = loginPw ?? state.loginPw;
    loginPhone = loginPhone ?? state.loginPhone;
    loginPin = loginPin ?? state.loginPin;
    loginUserName = loginUserName ?? state.loginUserName;

    try {
      uuid = await gRpcClient.signUp(
        userId: loginId,
        password: loginPw,
        email:  loginEmail,
        telNo: loginPhone,
        userName: loginUserName,
      );
      debugPrint("_signUpAction uuid: "+uuid);
      prefs.setString(keyLoginToken, loginId);
      prefs.setString(keyLoginPin, loginPin);
      prefs.setString(keyLoginPhone, "");
      next(UpdateInitAction(loginId: loginId,loginEmail: "", loginPw:"",loginToken:"",loginPin:"",loginPhone:"",loginUserName:""));
      return true;
    } on GRpcException catch (e) {
      await alert('error', '${e.message} (${e.code})');
    }

    return false;
  }

  Future<String> _unregisterAction(InitState state, String password ,NextDispatcher next) async {
    String result;
    try {
      result = await gRpcClient.unregister(password);
      return result;
    } on GRpcException catch (e) {
      await alert('error', '${e.message} (${e.code})');
    }

    return "01";
  }

  void _doLoginAction(InitState state,bool keepLogin,NextDispatcher next) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLogin = false;
    String messageLogin = state.messageLogin;
    int resCodeLogin = 0;
    // String? loginId = "";
    // String loginPw = "";
    // String loginToken = "";
    // String? loginPin = "";
    // String? loginPhone = "";
    // String? loginEmail = "";
    // String? loginUserName = "";

    if (state.loginId.isNotEmpty && state.loginPw.isNotEmpty) {
      isLogin = await gRpcClient.login(id: state.loginId, password: state.loginPw);
    } else if (state.loginToken.isNotEmpty) {
      isLogin = await gRpcClient.validateToken(state.loginToken);
    }

    if (!isLogin) {
      prefs.setString(KEY_LOGIN_TOKEN, "");
      return;
    }

    if (keepLogin) {
      prefs.setString(KEY_LOGIN_TOKEN, gRpcClient.token ?? "");
    }

    bool isSuccess =  await appStore.dispatch(GetUserAction());
    await appStore.dispatch(MerchantLoginAction());
    // try {
    //   Map<String, dynamic> user = await gRpcClient.getUser();
    //
    //   loginId = user["userId"];
    //   loginPw = "";
    //   loginToken = "";
    //   loginEmail = user["email"];
    //   loginUserName = user["userName"];
    //   loginPhone = user["telNo"];
    //   loginPin = await _secureStorage.read(key: '$loginId.$KEY_LOGIN_PIN');
    //   String userUuid = gRpcClient.userUuid ?? "";
    //   debugPrint("_doLoginAction uuid: " + userUuid);
    // } on GRpcException catch (e) {
    //   await alert('error', '${e.message} (${e.code})');
    //   return;
    // }
    if(isSuccess) {
      next(UpdateInitAction(
        isLogin: isLogin,
        messageLogin: messageLogin,
        resCodeLogin: resCodeLogin,
        // loginId: loginId,
        // loginEmail: loginEmail,
        // loginPw: loginPw,
        // loginToken: loginToken,
        // loginPin: loginPin,
        // loginPhone: loginPhone,
        // loginUserName: loginUserName
      ));
    }
  }

  void _doLogoutAction(InitState state,NextDispatcher next) async {
    var prefs = await SharedPreferences.getInstance();

    final String keyLoginToken= "loginToken";
    final String keyLoginPin= "loginPin";
    final String keyLoginPhone= "loginPhone";
    prefs.setString(keyLoginToken, "");
    // prefs.setString(keyLoginPin, "");
    prefs.setString(keyLoginPhone, "");

    bool isLogin = false;
    String loginId="";
    String loginEmail="";
    String loginPw="";
    String loginToken="";
    String loginPin="";
    String loginPhone="";
    next(UpdateInitAction(isLogin: isLogin, loginEmail: loginEmail,loginPw:loginPw,loginToken:loginToken,loginPin:loginPin,loginPhone:loginPhone));
  }



  Future<bool> _getUserAction(InitState state,NextDispatcher next) async {
    String? loginId = "";
    String loginPw = "";
    String loginToken = "";
    String? loginPin = "";
    String? loginPhone = "";
    String? loginEmail = "";
    String? loginUserName = "";

    try {
      Map<String, dynamic> user = await gRpcClient.getUser();

      loginId = user["userId"];
      loginPw = "";
      loginToken = "";
      loginEmail = user["email"];
      loginUserName = user["userName"];
      loginPhone = user["telNo"];
      loginPin = await _secureStorage.read(key: '$loginId.$KEY_LOGIN_PIN');
      String userUuid = gRpcClient.userUuid ?? "";
      debugPrint("_doLoginAction uuid: " + userUuid);

      String ethereum="";
      if(user.containsKey("ethereum")){
        ethereum = user["ethereum"];
        await appStore.dispatch(SetEthereumAddressAction(address: ethereum));
        await appStore.dispatch(QueryEthBalanceAction());
//debug
//         await appStore.dispatch(ExportEthereumKeyAction(address:ethereum));
//         YolletState state = appStore.state.yolletState;
//         if(state.ethereumMnemonic.isNotEmpty) {
//           await appStore.dispatch(ImportEthereumKeyAction(mnemonic: state.ethereumMnemonic));
//         }
//debug
        // }else{
        //   String address =  await appStore.dispatch(CreateEthereumAddressAction());
        //   Map<String, dynamic>? others = Map();
        //   others["ethereum"]=address;
        //   String value = await gRpcClient.updateUser(others:others);
        //   debugPrint("updateUser value: $value");
      }
    } on GRpcException catch (e) {
      await alert('error', '${e.message} (${e.code})');
      return false;
    }

    next(UpdateInitAction(
        loginId: loginId,
        loginEmail: loginEmail,
        loginPw: loginPw,
        loginToken: loginToken,
        loginPin: loginPin,
        loginPhone: loginPhone,
        loginUserName: loginUserName));
    return true;
  }

  Future<bool> _changePasswordAction(InitState state, String? oldPassword, String? newPassword,NextDispatcher next) async {
    String resCode="00";
    try {
      // 성공 시 "00", 패스워드가 다르면 "13"
      resCode = await gRpcClient.updateUser(
        oldPassword: oldPassword,
        newPassword:  newPassword,
      );

      debugPrint("_changePasswordAction resCode: $resCode");
      next(UpdateInitAction());
      if(resCode=="00"){
        return true;
      }else{
        return false;
      }
    } on GRpcException catch (e) {
      await alert('error', '${e.message} (${e.code})');
    }
    return false;
  }
  void _doRestartAppAction(InitState state,NextDispatcher next) async {
    // var r;
    if (Platform.isAndroid) {
      SystemChannels.platform.invokeMethod('SystemNavigator.pop');
      Restart.restartApp();
    }else {
      await actionDialog(
        title: 'restart',
        actions: [],
        text:'restart_app',
        disableCloseButton:true,
        onWillPop: () async {
          // await appStore.dispatch(NavigateToAction(to: AppRoutes.home));
          return Future.value(false);
        },
      );
      // await alert('restart', 'restart_app');
    }
    //
    // if (!Act.success(r)!) {
    //   return;
    // }
    next(UpdateInitAction());
  }

  void _checkLoginPasswordAction(InitState state,String? password,NextDispatcher next) async {
    //check pw
    next(UpdateInitAction());
  }
  void _changeLoginInfoAction(InitState state,String? password,String? phoneNumber,NextDispatcher next) async {
    //change pw
    next(UpdateInitAction());
  }

  void _savePinAction(InitState state,String? pin,NextDispatcher next) async {
    if (pin == null || pin.isEmpty) {

    } else {
      await _secureStorage.write(key: '${state.loginId}.$KEY_LOGIN_PIN', value: pin);
      next(UpdateInitAction(loginPin: pin,));
    }
  }

  Future<bool> _checkPinAction(InitState state,String? pin,NextDispatcher next) async {
    String? loginPin = state.loginPin;

    if (loginPin.isEmpty) {
      loginPin = await _secureStorage.read(key: '${state.loginId}.$KEY_LOGIN_PIN');
    }

    next(UpdateInitAction(loginPin: loginPin));
    return loginPin == pin;
  }


  void _deletePinAction(InitState state,NextDispatcher next) async {
    await _secureStorage.delete(key: '${state.loginId}.$KEY_LOGIN_PIN');

    next(UpdateInitAction(loginPin: ""));
  }

  Future<String> _sendVerificationAction(InitState state,String? mobileNumber,String? email,NextDispatcher next) async {
    String result = "00";
    if(mobileNumber!=null && mobileNumber.isNotEmpty)
    {
      result = await gRpcClient.sendVerificationCode(mobileNumber);
    }
    next(UpdateInitAction(loginPhone: mobileNumber));
    return result;
  }

  Future<String> _verifyVerificationAction(InitState state,String? verificationCode, NextDispatcher next) async {

    String result = "00";
    if(verificationCode!=null && verificationCode.isNotEmpty)
    {
      /// * 성공 시 "00", 인증 코드가 다르면 "20", 인증 유효 시간이 지났으면 "21"
      result = await gRpcClient.verifyVerificationCode(state.loginPhone,verificationCode);

    }
    next(UpdateInitAction());
    return result;
  }

  Future<Map> _resetPasswordAction(InitState state,String? verificationCode, NextDispatcher next) async {
    Map result = Map();
    result["resCode"] = "99";
    result["resMessage"] = "";
    if(verificationCode!=null && verificationCode.isNotEmpty)
    {
      /// * 성공 시 "00", 인증 코드가 다르면 "20", 인증 유효 시간이 지났으면 "21"
      result  = await gRpcClient.resetPassword(telNo:state.loginPhone,verificationCode:verificationCode);
    }
    next(UpdateInitAction(loginPw:result["resMessage"]));
    return result;
  }



  Future<Map> _checkLicenseFile(InitState state,NextDispatcher next) async {
    var result = await License.checkLicenseFile();

    return result;
  }

  void _issueLicenseAction(InitState state,NextDispatcher next) async {
    await License.issueLicense();
  }
  void _requestPermission(InitState state,NextDispatcher next) async {
    await License.requestPermission();
  }
  Future<Map> _verifyLicense(InitState state,NextDispatcher next) async {
    var result = await License.verifyLicense();
    next(UpdateInitAction(licenseKey: result["licenseKey"]??""));
    return result;
  }

  Future<String> _getLicenseKeyAction(InitState state,NextDispatcher next) async {
    return state.licenseKey;
  }

  Future<List<String>> _getLoginDomainsAction(InitState state,NextDispatcher next) async {
    var result = await gRpcClient.getLoginDomains();
    next(UpdateInitAction(domainList: result));
    return result;
  }

  Future<bool> _merchantLoginAction(InitState state,String? loginId,String? loginPw,String? loginDomain,
      NextDispatcher next) async {
    bool isLogin = false;
    if (loginId!=null && loginId.isNotEmpty && loginPw!=null && loginPw
        .isNotEmpty && loginDomain!=null && loginDomain.isNotEmpty) {
      isLogin = await gRpcClient.login(
          id:loginId,
          password: loginPw,
          domain: loginDomain,
          isStore: true
      );
      // await _saveLoginId(loginId);
      // await _saveLoginPw(loginPw);
      // await _saveLoginDomain(loginDomain);
      // await _saveStoreToken(gRpcClient.storeToken);
    } else {
      String? storeToken = await _getStoreToken();
      if(storeToken!=null && storeToken.isEmpty){
        return false;
      }

      isLogin = await gRpcClient.validateStoreToken(storeToken??"");
      if(!isLogin){
        loginId = await _getLoginId();
        loginPw = await _getLoginPw();
        loginDomain = await _getLoginDomain();
        if (loginId!=null && loginId.isNotEmpty && loginPw!=null && loginPw
            .isNotEmpty && loginDomain!=null && loginDomain.isNotEmpty) {
          isLogin = await gRpcClient.login(
              id: loginId,
              password: loginPw,
              domain: loginDomain,
              isStore: true
          );
        }
        if(isLogin) {
          await _saveStoreToken(gRpcClient.storeToken);
        }
      }
    }

    if(isLogin ==true){
      try {
        var resultMap = await gRpcClient.getStoreTokenInfo();
        next(UpdateInitAction(
          merchantLoginId: loginId,
          merchantLoginPw: loginPw,
          merchantLoginDomain: loginDomain,
          // merchantAddressList: resultMap['addresses'],
          merchantStoreName:  resultMap['storeName'],
          merchantTelNo: resultMap['telNo'],
        ));
        // await appStore.dispatch(SetStoreAddressList(merchantAddressList:resultMap['addresses']));
        return isLogin;
      } on GRpcException catch (e) {
        if(e.message==null || e.message!.isEmpty){
          return false;
        }
        alertCallback('error','${e.message} (${e.code})', callback: () {
          DismissPopupAction(result: null);
        });
      }
    }

    return isLogin;
  }

  Future<bool> _merchantLoginSaveAction(InitState state, NextDispatcher next) async {
    bool isLogin = false;
    String loginId=state.merchantLoginId;
    String loginPw=state.merchantLoginPw;
    String loginDomain=state.merchantLoginDomain;

    // if (loginId!=null && loginId.isNotEmpty && loginPw!=null && loginPw.isNotEmpty) {
    //   isLogin = await gRpcClient.login(
    //       id:loginId,
    //       password: loginPw,
    //       domain: loginDomain,
    //       isStore: true
    //   );
    //   await _saveLoginId(loginId);
    //   await _saveLoginPw(loginPw);
    //   await _saveLoginDomain(loginDomain);
    //   await _saveStoreToken(gRpcClient.storeToken);
    // } else /*if (storeToken!=null && storeToken.isNotEmpty) */{
      String? storeToken = await _getStoreToken();
      if(storeToken!=null && storeToken.isEmpty){
        return false;
      }
      isLogin = await gRpcClient.validateStoreToken(storeToken??"");
      if(!isLogin){
        // String? loginId = await _getLoginId();
        // String? loginPw = await _getLoginPw();
        // String? loginDomain = await _getLoginDomain();
        isLogin = await gRpcClient.login(
            id:loginId,
            password: loginPw,
            domain: loginDomain,
            isStore: true
        );
          await _saveLoginId(loginId);
          await _saveLoginPw(loginPw);
          await _saveLoginDomain(loginDomain);
      }
    await _saveStoreToken(gRpcClient.storeToken);

    // }

    if(isLogin ==true){
      try {
        var resultMap = await gRpcClient.getStoreTokenInfo();
        next(UpdateInitAction(
          // merchantAddressList: resultMap['addresses'],
          merchantStoreName:  resultMap['storeName'],
          merchantTelNo: resultMap['telNo'],
        ));
        await appStore.dispatch(SetStoreAddressList(merchantAddressList:resultMap['addresses']));
        return isLogin;
      } on GRpcException catch (e) {
        if(e.message==null || e.message!.isEmpty){
          return false;
        }
        alertCallback('error','${e.message} (${e.code})', callback: () {
          DismissPopupAction(result: null);
        });
      }
    }
    return false;
  }

  Future<String> _readStoreCertificationDateAction(InitState state,NextDispatcher next) async {
    String? certificationDate = await _getCertificationDate();
    if(certificationDate==null || certificationDate.isEmpty){
      return "";
    }

    next(UpdateInitAction(
      certificationDate: certificationDate,
    ));
    return certificationDate;
  }

  Future<String> _setStoreCertificationDateAction(InitState state,NextDispatcher next) async {
    String regDate  = DateFormat('yyyy-MM-dd').format(DateTime.now());
    await _saveCertificationDate(regDate);

    next(UpdateInitAction(
      certificationDate: regDate,
    ));
    return regDate;
  }

  void _updateUserOthers(InitState state,Map<String, dynamic>? others,NextDispatcher next) async {
    String value = await gRpcClient.updateUser(others:others);
  }

  Future<String?> _getStoreToken() async {
    String userUuid = gRpcClient.userUuid ?? "";
    SharedPreferences _storage = await SharedPreferences.getInstance();

    return _storage.getString('$userUuid.storeToken');
  }

  Future<void> _saveStoreToken( storeToken) async {
    String userUuid = gRpcClient.userUuid ?? "";
    SharedPreferences _storage = await SharedPreferences.getInstance();

    await _storage.setString('$userUuid.storeToken', storeToken);
  }

  Future<String?> _getLoginId() async {
    String userUuid = gRpcClient.userUuid ?? "";
    SharedPreferences _storage = await SharedPreferences.getInstance();

    return _storage.getString('$userUuid.loginId');
  }

  Future<void> _saveLoginId( loginId) async {
    String userUuid = gRpcClient.userUuid ?? "";
    SharedPreferences _storage = await SharedPreferences.getInstance();

    await _storage.setString('$userUuid.loginId', loginId);
  }

  Future<String?> _getLoginPw() async {
    String userUuid = gRpcClient.userUuid ?? "";
    SharedPreferences _storage = await SharedPreferences.getInstance();

    return _storage.getString('$userUuid.loginPw');
  }

  Future<void> _saveLoginPw( loginPw) async {
    String userUuid = gRpcClient.userUuid ?? "";
    SharedPreferences _storage = await SharedPreferences.getInstance();

    await _storage.setString('$userUuid.loginPw', loginPw);
  }

  Future<String?> _getLoginDomain() async {
    String userUuid = gRpcClient.userUuid ?? "";
    SharedPreferences _storage = await SharedPreferences.getInstance();

    return _storage.getString('$userUuid.loginDomain');
  }

  Future<void> _saveLoginDomain( loginDomain) async {
    String userUuid = gRpcClient.userUuid ?? "";
    SharedPreferences _storage = await SharedPreferences.getInstance();

    await _storage.setString('$userUuid.loginDomain', loginDomain);
  }

  Future<String?> _getCertificationDate() async {
    String userUuid = gRpcClient.userUuid ?? "";
    SharedPreferences _storage = await SharedPreferences.getInstance();

    return _storage.getString('$userUuid.certificationDate');
  }

  Future<void> _saveCertificationDate( certificationDate) async {
    String userUuid = gRpcClient.userUuid ?? "";
    SharedPreferences _storage = await SharedPreferences.getInstance();

    await _storage.setString('$userUuid.certificationDate', certificationDate);
  }


}

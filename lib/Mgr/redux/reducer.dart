import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:redux/redux.dart';
import 'package:yollet/Mgr/redux/action.dart';
import 'package:yollet/Mgr/redux/state.dart';

/// Reducer 구현
///   action 으로 받은 데이터를 store 에 적용
///
/// 1. TypeReducer<state, action>을 사용해서 action 별 reducer 정의
/// 2. combineReducer<state>로 정의된 reducer 를 묶음
/// 3. 각 reducer 는 state.copyWith() 형태로 새로운 state 를 만들어 전달
AppState appReducer(AppState state, dynamic action) {
  var newState = state.copyWith(
    settingState: _settingReducer(state.settingState, action),
    initState: _initReducer(state.initState, action),
    navigationState: _navReducer(state.navigationState, action),
    yolletState: _yolletReducer(state.yolletState, action),
  );

  // redux 상태를 로깅하기 위해서 아래 주석 제거
  //_logState(action, state.cartState, newState.cartState);
  //_logState(action, state.orderTableState, newState.orderTableState);

  return newState;
}

void _logState(dynamic action, dynamic oldState, dynamic newState) {
  if (oldState != newState) {
    print('----------ACTION/STATE----------');
    _print('ACTION: $action');
    _print('STATE: $newState');
  }
}

void _print(String text) {
  final maxLength = 1000; // LogCat 에서 출력할 수 있는 대략적인 최대 한줄 길이

  while (text.isNotEmpty) {
    var len = text.length > maxLength ? maxLength : text.length;
    print(text.substring(0, len));
    text = text.substring(len);
  }
}

///
/// Setting Reducer
///
final _settingReducer = combineReducers<SettingState>(
    [TypedReducer<SettingState, UpdateSettingAction>(_updateSettingState)]);

SettingState _updateSettingState(
    SettingState state, UpdateSettingAction action) {
  return state.copyWith(setting: action.setting);
}

///
/// Init Reducer
///
final _initReducer = combineReducers<InitState>(
    [TypedReducer<InitState, UpdateInitAction>(_updateInitState)]);

InitState _updateInitState(InitState state, UpdateInitAction action) {
  return state.copyWith(
    isLogin: action.isLogin,
    messageLogin: action.messageLogin,
    resCodeLogin: action.resCodeLogin,
    loginId: action.loginId,
    loginEmail: action.loginEmail,
    loginPw: action.loginPw,
    loginToken: action.loginToken,
    loginPin: action.loginPin,
    loginPhone: action.loginPhone,
    loginUserName: action.loginUserName,
    domainList: action.domainList,
    // merchantAddressList:action.merchantAddressList,
    merchantStoreName: action.merchantStoreName,
    merchantTelNo: action.merchantTelNo,
    certificationDate: action.certificationDate,
    licenseKey: action.licenseKey,
    merchantLoginId: action.merchantLoginId,
    merchantLoginPw: action.merchantLoginPw,
    merchantLoginDomain: action.merchantLoginDomain,
  );
}

///
/// Navigation Reducer
///
final _navReducer = combineReducers<NavigationState>([
  TypedReducer<NavigationState, UpdateNavigationAction>(_updateNavigationState)
]);

NavigationState _updateNavigationState(
    NavigationState state, UpdateNavigationAction action) {
  debugPrint(
      '--- NAVIGATE TO ${action.name} (${action.isPage! ? 'PAGE' : 'POPUP'}) by ${action.method!.toUpperCase()} ---');
  var history = List.from(state.history);

  switch (action.method) {
    case 'push':
      if (action.name == '/') {
        history.insert(0, action);
      } else {
        history.add(action);
      }
      break;
    case 'pop':
      if (history.isNotEmpty) {
        history.removeLast();
      }
      break;
    case 'replace':
      if (history.isNotEmpty) {
        history.removeLast();
      }

      history.add(action);
      break;
  }

  if (kDebugMode) {
    debugPrint('------------HISTORY-------------');

    for (var i in history.reversed) {
      debugPrint('${i.isPage ? 'page' : 'popup'} - ${i.name}');
    }

    debugPrint('--------------------------------');
  }

  return state.copyWith(history: history);
}

///
/// Yollet Reducer
///
final _yolletReducer = combineReducers<YolletState>(
    [TypedReducer<YolletState, UpdateYolletAction>(_updateYolletState)]);

YolletState _updateYolletState(YolletState state, UpdateYolletAction action) {
  return state.copyWith(
    createAccountTokenId: action.createAccountTokenId,
    createAccountName: action.createAccountName,
    tokenList: action.tokenList,
    currentAccountAddress: action.currentAccountAddress,
    transferAccountAddress: action.transferAccountAddress,
    transferAccountComment: action.transferAccountComment,
    transferAccountAmount: action.transferAccountAmount,
    message: action.message,
    addressInfoList: action.addressInfoList,
    transactionId: action.transactionId,
    transactionDate: action.transactionDate,
    currentTokenId: action.currentTokenId,
    currentKeyName: action.currentKeyName,
    currentTokenInfo: action.currentTokenInfo,
    currentAccountName: action.currentAccountName,
    currentBalance: action.currentBalance,
    availableCurrentBalance: action.availableCurrentBalance,
    currentCoinName: action.currentCoinName,
    currentCurrencyBalance: action.currentCurrencyBalance,
    currentTradePrice: action.currentTradePrice,
    availableCurrentCurrencyBalance: action.availableCurrentCurrencyBalance,
    transferInfoList: action.transferInfoList,
    transferInfo: action.transferInfo,
    transactionInfoDetail: action.transactionInfoDetail,
    walletList: action.walletList,
    walletInfo: action.walletInfo,
    recentTransferList: action.recentTransferList,
    notificationList: action.notificationList,
    streamController: action.streamController,
    paymentAddressInfo: action.paymentAddressInfo,
    paymentTransferData: action.paymentTransferData,
    doneMigration: action.doneMigration,
    exchangeRateInfoList: action.exchangeRateInfoList,
    stakingInfo: action.stakingInfo,
    ethereumInfo: action.ethereumInfo,
    currentIsVixco: action.currentIsVixco,
    currentIsStoreAddress: action.currentIsStoreAddress,
    currentMnemonic: action.currentMnemonic,
    ethereumMnemonic: action.ethereumMnemonic,
    importEthereumMnemonicPhrase: action.importEthereumMnemonicPhrase,
    currentAddressInfo: action.currentAddressInfo,
    isFetching: action.isFetching,
  );
}

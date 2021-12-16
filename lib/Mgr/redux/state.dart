import 'dart:async';
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:yollet/Data/Dataset/AddressInfo.dart';
import 'package:yollet/Data/Dataset/EthereumInfo.dart';
import 'package:yollet/Data/Dataset/ExchangeRateInfo.dart';
import 'package:yollet/Data/Dataset/NotificationInfo.dart';
import 'package:yollet/Data/Dataset/StakingInfo.dart';
import 'package:yollet/Data/Dataset/TokenInfo.dart';
import 'package:yollet/Data/Dataset/TransactionInfo.dart';
import 'package:yollet/Data/Dataset/TransferInfo.dart';
import 'package:yollet/Data/Dataset/WalletInfo.dart';
import 'package:yollet/Mgr/redux/middleware/init_middleware.dart';
import 'package:yollet/Mgr/redux/middleware/navigation_middleware.dart';
import 'package:yollet/Mgr/redux/middleware/setting_middleware.dart';
import 'package:yollet/Mgr/redux/middleware/yollet_middleware.dart';
import 'package:yollet/Mgr/redux/reducer.dart';

///
/// 상수 정의
///
const KEY_LOGIN_TOKEN = 'loginToken';
const KEY_LOGIN_PIN = 'loginPin';
const KEY_LOGIN_PHONE = 'loginPhone';

/// Store 구현
///   업무 로직은 state 를 변경하는 부분과 나머지 부분으로 분리
///   state 를 변경하는 부분은 reducer 로, 그외의 기능은 middleware 에서 구현
///
/// 1. appReducer 로 고정됨
/// 2. AppState.initial() 로 고정됨
/// 3. middleware 를 추가할 때마다 등록
final appStore =
    Store<AppState>(appReducer, initialState: AppState.initial(), middleware: [
  SettingMiddleware(),
  InitMiddleware(),
  NavigationMiddleware(),
  YolletMiddleware(),
]);

/// State 구현
/// 1. 각 state 에 @immutable 붙여서 수정할 수 없게 함
/// 2. 각 state 에 포함된 변수는 final 선언
/// 3. state 생성자에서 @required 사용해서 반드시 모든 변수를 초기화하도록 함
/// 4. initial()에서 초기 state 생성
/// 5. copyWith() 구현: State(variable: value ?? this.variable, ...) 형식으로 구현
@immutable
class AppState {
  final SettingState settingState;
  final InitState initState;
  final NavigationState navigationState;
  final YolletState yolletState;
  AppState({
    required this.settingState,
    required this.initState,
    required this.navigationState,
    required this.yolletState,
  });

  factory AppState.initial() {
    return AppState(
      settingState: SettingState.initial(),
      initState: InitState.initial(),
      navigationState: NavigationState.initial(),
      yolletState: YolletState.initial(),
    );
  }

  AppState copyWith({
    SettingState? settingState,
    InitState? initState,
    NavigationState? navigationState,
    YolletState? yolletState,
  }) {
    return AppState(
      settingState: settingState ?? this.settingState,
      initState: initState ?? this.initState,
      navigationState: navigationState ?? this.navigationState,
      yolletState: yolletState ?? this.yolletState,
    );
  }
}

///
/// Setting State
///
@immutable
class SettingState {
  final HashMap<String, dynamic> setting;
  SettingState({
    required this.setting,
  });

  factory SettingState.initial() {
    return SettingState(setting: HashMap<String, dynamic>());
  }

  SettingState copyWith({
    HashMap<String, dynamic>? setting,
  }) {
    return SettingState(
      setting: setting ?? this.setting,
    );
  }

  dynamic value(String key) {
    if (setting.containsKey(key)) {
      return setting[key];
    } else {
      switch (key) {
        case KEY_LANGUAGE:
          return "ko";
        case KEY_CURRENCY:
          return "KRW";
        default:
          return null;
      }
    }
  }

  static const String KEY_SERVICE_NOTIFICATION = "KEY_SERVICE_NOTIFICATION";
  static const String KEY_MARKETING_NOTIFICATION = "KEY_MARKETING_NOTIFICATION";
  static const String KEY_LANGUAGE = "KEY_LANGUAGE";
  static const String KEY_SHOW_CODE = "KEY_SHOW_CODE";
  static const String KEY_CURRENCY = "KEY_CURRENCY";

  List<String> get keyList {
    return [
      KEY_SERVICE_NOTIFICATION,
      KEY_MARKETING_NOTIFICATION,
      KEY_LANGUAGE,
      KEY_SHOW_CODE,
      KEY_CURRENCY,
    ];
  }
}

///
/// init State
///
@immutable
class InitState {
  final bool isLogin;
  final String messageLogin;
  final int resCodeLogin;

  final String loginId;
  final String loginEmail;
  final String loginPw;
  final String loginToken;
  final String loginPin;
  final String loginPhone;
  final String loginUserName;
  final List<String> domainList;
  // final List<String> merchantAddressList;
  final String merchantStoreName;
  final String merchantTelNo;
  final String certificationDate;
  final String licenseKey;
  final String merchantLoginId;
  final String merchantLoginPw;
  final String merchantLoginDomain;

  InitState({
    required this.isLogin,
    required this.messageLogin,
    required this.resCodeLogin,
    required this.loginId,
    required this.loginEmail,
    required this.loginPw,
    required this.loginToken,
    required this.loginPin,
    required this.loginPhone,
    required this.loginUserName,
    required this.domainList,
    // required this.merchantAddressList,
    required this.merchantStoreName,
    required this.merchantTelNo,
    required this.certificationDate,
    required this.licenseKey,
    required this.merchantLoginId,
    required this.merchantLoginPw,
    required this.merchantLoginDomain,
  });

  factory InitState.initial() {
    return InitState(
      isLogin: false,
      messageLogin: '',
      resCodeLogin: 0,

      loginId: '',
      loginEmail: '',
      loginPw: '',
      loginToken: '',
      loginPin: '',
      loginPhone: '',
      loginUserName: '',
      domainList: [],
      // merchantAddressList: [],
      merchantStoreName: '',
      merchantTelNo: '',
      certificationDate: '',
      licenseKey: '',
      merchantLoginId: '',
      merchantLoginPw: '',
      merchantLoginDomain: '',
    );
  }

  InitState copyWith({
    bool? isLogin,
    String? messageLogin,
    int? resCodeLogin,
    String? loginId,
    String? loginEmail,
    String? loginPw,
    String? loginToken,
    String? loginPin,
    String? loginPhone,
    String? loginUserName,
    List<String>? domainList,
    // List<String>? merchantAddressList,
    String? merchantStoreName,
    String? merchantTelNo,
    String? certificationDate,
    String? licenseKey,
    String? merchantLoginId,
    String? merchantLoginPw,
    String? merchantLoginDomain,
  }) {
    return InitState(
      isLogin: isLogin ?? this.isLogin,
      messageLogin: messageLogin ?? this.messageLogin,
      resCodeLogin: resCodeLogin ?? this.resCodeLogin,

      loginId: loginId ?? this.loginId,
      loginEmail: loginEmail ?? this.loginEmail,
      loginPw: loginPw ?? this.loginPw,
      loginToken: loginToken ?? this.loginToken,
      loginPin: loginPin ?? this.loginPin,
      loginPhone: loginPhone ?? this.loginPhone,
      loginUserName: loginUserName ?? this.loginUserName,
      domainList: domainList ?? this.domainList,
      // merchantAddressList: merchantAddressList ?? this.merchantAddressList,
      merchantStoreName: merchantStoreName ?? this.merchantStoreName,
      merchantTelNo: merchantTelNo ?? this.merchantTelNo,
      certificationDate: certificationDate ?? this.certificationDate,
      licenseKey: licenseKey ?? this.licenseKey,
      merchantLoginId: merchantLoginId ?? this.merchantLoginId,
      merchantLoginPw: merchantLoginPw ?? this.merchantLoginPw,
      merchantLoginDomain: merchantLoginDomain ?? this.merchantLoginDomain,
    );
  }
}

///
/// NavigationState
///
@immutable
class NavigationState {
  final List history;

  NavigationState({required this.history});

  factory NavigationState.initial() {
    return NavigationState(history: []);
  }

  NavigationState copyWith({List? history}) {
    return NavigationState(history: history ?? this.history);
  }

  String? get current {
    var last = history.lastWhere((v) => v.isPage, orElse: () => null);
    return last != null ? last.name : '/';
  }

  bool hasRoute(String name) {
    return history.indexWhere((i) => i.name == name) != -1;
  }
}

///
/// NavigationState
///
@immutable
class YolletState {
  final String createAccountTokenId;
  final String createAccountName;
  final List<TokenInfo> tokenList; //TokenInfo
  final String currentAccountAddress;
  final String transferAccountAddress;
  final String transferAccountComment;
  final num transferAccountAmount;
  final String message;
  final List<AddressInfo> addressInfoList;
  final String transactionId;
  final String transactionDate;
  final String currentTokenId;
  final String currentKeyName;
  final TokenInfo currentTokenInfo;
  final String currentAccountName;
  final num currentBalance;
  final num availableCurrentBalance;
  final String currentCoinName;
  final num currentCurrencyBalance;
  final num availableCurrentCurrencyBalance;
  final Map currentTradePrice;
  final List<TransferInfo> transferInfoList;
  final TransferInfo transferInfo;
  final TransactionInfo transactionInfoDetail;
  final List<WalletInfo> walletList;
  final WalletInfo walletInfo;
  final List<TransferInfo> recentTransferList;
  final List<NotificationInfo> notificationList;
  final StreamController streamController;
  final AddressInfo paymentAddressInfo;
  final Map paymentTransferData;
  final bool doneMigration;
  final List<ExchangeRateInfo> exchangeRateInfoList;
  final StakingInfo stakingInfo;
  final EthereumInfo ethereumInfo;
  final bool currentIsVixco;
  final bool currentIsStoreAddress;
  final String currentMnemonic;
  final String ethereumMnemonic;
  final String importEthereumMnemonicPhrase;
  final AddressInfo currentAddressInfo;
  final bool isFetching;

  YolletState({
    required this.createAccountTokenId,
    required this.createAccountName,
    required this.tokenList,
    required this.currentAccountAddress,
    required this.transferAccountAddress,
    required this.transferAccountComment,
    required this.transferAccountAmount,
    required this.message,
    required this.addressInfoList,
    required this.transactionId,
    required this.transactionDate,
    required this.currentTokenId,
    required this.currentKeyName,
    required this.currentTokenInfo,
    required this.currentAccountName,
    required this.currentBalance,
    required this.availableCurrentBalance,
    required this.currentCoinName,
    required this.currentCurrencyBalance,
    required this.availableCurrentCurrencyBalance,
    required this.currentTradePrice,
    required this.transferInfoList,
    required this.transferInfo,
    required this.transactionInfoDetail,
    required this.walletList,
    required this.walletInfo,
    required this.recentTransferList,
    required this.notificationList,
    required this.streamController,
    required this.paymentAddressInfo,
    required this.paymentTransferData,
    required this.doneMigration,
    required this.exchangeRateInfoList,
    required this.stakingInfo,
    required this.ethereumInfo,
    required this.currentIsVixco,
    required this.currentIsStoreAddress,
    required this.currentMnemonic,
    required this.ethereumMnemonic,
    required this.importEthereumMnemonicPhrase,
    required this.currentAddressInfo,
    required this.isFetching,
  });

  factory YolletState.initial() {
    return YolletState(
      createAccountTokenId: '',
      createAccountName: '',
      tokenList: [],
      currentAccountAddress: '',
      transferAccountAddress: '',
      transferAccountComment: '',
      transferAccountAmount: 0,
      message: '',
      addressInfoList: [],
      transactionId: '',
      transactionDate: '',
      currentTokenId: '',
      currentKeyName: '',
      currentTokenInfo: TokenInfo(),
      currentAccountName: '',
      currentBalance: 0,
      availableCurrentBalance: 0,
      currentCoinName: '',
      currentCurrencyBalance: 0,
      availableCurrentCurrencyBalance: 0,
      currentTradePrice: Map(),
      transferInfoList: [],
      transferInfo: TransferInfo(),
      transactionInfoDetail: TransactionInfo(),
      walletList: [],
      walletInfo: WalletInfo(),
      recentTransferList: [],
      notificationList: [],
      streamController: StreamController(),
      paymentAddressInfo: AddressInfo(),
      paymentTransferData: Map(),
      doneMigration: false,
      exchangeRateInfoList: [],
      stakingInfo: StakingInfo(),
      ethereumInfo: EthereumInfo(),
      currentIsVixco: false,
      currentIsStoreAddress: false,
      currentMnemonic: "",
      ethereumMnemonic: "",
      importEthereumMnemonicPhrase: "",
      currentAddressInfo: AddressInfo(),
      isFetching: true,
    );
  }

  YolletState copyWith({
    String? createAccountTokenId,
    String? createAccountName,
    List<TokenInfo>? tokenList,
    String? currentAccountAddress,
    String? transferAccountAddress,
    String? transferAccountComment,
    num? transferAccountAmount,
    String? message,
    List<AddressInfo>? addressInfoList,
    String? transactionId,
    String? transactionDate,
    String? currentTokenId,
    String? currentKeyName,
    TokenInfo? currentTokenInfo,
    String? currentAccountName,
    num? currentBalance,
    num? availableCurrentBalance,
    String? currentCoinName,
    num? currentCurrencyBalance,
    num? availableCurrentCurrencyBalance,
    Map? currentTradePrice,
    List<TransferInfo>? transferInfoList,
    TransferInfo? transferInfo,
    TransactionInfo? transactionInfoDetail,
    List<WalletInfo>? walletList,
    WalletInfo? walletInfo,
    List<TransferInfo>? recentTransferList,
    List<NotificationInfo>? notificationList,
    StreamController? streamController,
    AddressInfo? paymentAddressInfo,
    Map? paymentTransferData,
    bool? doneMigration,
    List<ExchangeRateInfo>? exchangeRateInfoList,
    StakingInfo? stakingInfo,
    EthereumInfo? ethereumInfo,
    bool? currentIsVixco,
    bool? currentIsStoreAddress,
    String? currentMnemonic,
    String? ethereumMnemonic,
    String? importEthereumMnemonicPhrase,
    AddressInfo? currentAddressInfo,
    bool? isFetching,
  }) {
    return YolletState(
      createAccountTokenId: createAccountTokenId ?? this.createAccountTokenId,
      createAccountName: createAccountName ?? this.createAccountName,
      tokenList: tokenList ?? this.tokenList,
      currentAccountAddress:
          currentAccountAddress ?? this.currentAccountAddress,
      transferAccountAddress:
          transferAccountAddress ?? this.transferAccountAddress,
      transferAccountComment:
          transferAccountComment ?? this.transferAccountComment,
      transferAccountAmount:
          transferAccountAmount ?? this.transferAccountAmount,
      message: message ?? this.message,
      addressInfoList: addressInfoList ?? this.addressInfoList,
      transactionId: transactionId ?? this.transactionId,
      transactionDate: transactionDate ?? this.transactionDate,
      currentTokenId: currentTokenId ?? this.currentTokenId,
      currentKeyName: currentKeyName ?? this.currentKeyName,
      currentTokenInfo: currentTokenInfo ?? this.currentTokenInfo,
      currentAccountName: currentAccountName ?? this.currentAccountName,
      currentBalance: currentBalance ?? this.currentBalance,
      availableCurrentBalance:
          availableCurrentBalance ?? this.availableCurrentBalance,
      currentCoinName: currentCoinName ?? this.currentCoinName,
      currentCurrencyBalance:
          currentCurrencyBalance ?? this.currentCurrencyBalance,
      availableCurrentCurrencyBalance: availableCurrentCurrencyBalance ??
          this.availableCurrentCurrencyBalance,
      currentTradePrice: currentTradePrice ?? this.currentTradePrice,
      transferInfoList: transferInfoList ?? this.transferInfoList,
      transferInfo: transferInfo ?? this.transferInfo,
      transactionInfoDetail:
          transactionInfoDetail ?? this.transactionInfoDetail,
      walletList: walletList ?? this.walletList,
      walletInfo: walletInfo ?? this.walletInfo,
      recentTransferList: recentTransferList ?? this.recentTransferList,
      notificationList: notificationList ?? this.notificationList,
      streamController: streamController ?? this.streamController,
      paymentAddressInfo: paymentAddressInfo ?? this.paymentAddressInfo,
      paymentTransferData: paymentTransferData ?? this.paymentTransferData,
      doneMigration: doneMigration ?? this.doneMigration,
      exchangeRateInfoList: exchangeRateInfoList ?? this.exchangeRateInfoList,
      stakingInfo: stakingInfo ?? this.stakingInfo,
      ethereumInfo: ethereumInfo ?? this.ethereumInfo,
      currentIsVixco: currentIsVixco ?? this.currentIsVixco,
      currentIsStoreAddress:
          currentIsStoreAddress ?? this.currentIsStoreAddress,
      currentMnemonic: currentMnemonic ?? this.currentMnemonic,
      ethereumMnemonic: ethereumMnemonic ?? this.ethereumMnemonic,
      importEthereumMnemonicPhrase:
          importEthereumMnemonicPhrase ?? this.importEthereumMnemonicPhrase,
      currentAddressInfo: currentAddressInfo ?? this.currentAddressInfo,
      isFetching: isFetching ?? this.isFetching,
    );
  }

  bool get hasUnreadNotification {
    try {
      notificationList.firstWhere((v) => v.isRead);
      return true;
    } on StateError {
      return false;
    }
  }
}

import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:yollet/Data/Dataset/AddressInfo.dart';
import 'package:yollet/Data/Dataset/EthereumInfo.dart';
import 'package:yollet/Data/Dataset/ExchangeRateInfo.dart';
import 'package:yollet/Data/Dataset/NotificationInfo.dart';
import 'package:yollet/Data/Dataset/StakingInfo.dart';
import 'package:yollet/Data/Dataset/TokenInfo.dart';
import 'package:yollet/Data/Dataset/TransactionInfo.dart';
import 'package:yollet/Data/Dataset/TransferInfo.dart';
import 'package:yollet/Data/Dataset/WalletInfo.dart';

/// action 구현
///   action 은 reducer 에 데이터를 전달하는 역할만 수행
///
/// 1. action 에 변수가 포함된 경우 final 선언
/// 2. 생성자에서 해당 변수 초기화

/// 주문 화면의 메뉴 그룹 및 아이템 가져오기
///----------------- Setting -----------------
class GetSettingAction {
  final String? key;

  GetSettingAction({this.key});
}

class SetSettingAction {
  final String? key;
  final String? value;

  // final Map keyValues;
  SetSettingAction({this.key, this.value});
}

class UpdateSettingAction {
  final HashMap<String, dynamic>? setting;

  UpdateSettingAction({this.setting});
}

///----------------- Init -----------------
class GetCrmInitAction {}

class GetDownloadAppAction {
  final bool? forceUpdate;
  final String? downloadPath;
  final String? baseFilename;

  GetDownloadAppAction(
      {this.forceUpdate, this.downloadPath, this.baseFilename});
}

class GetDssServerListAction {}

class GetLoginDomainListAction {
  final int? serverIndex;

  GetLoginDomainListAction({this.serverIndex});
}

class GetStoreTerminalListAction {}

class DoLoginAction {
  final bool keepLogin;

  DoLoginAction({this.keepLogin = false});
}

class DoLogoutAction {}

class GetUserAction {}

class SetRegisterStoreTerminalAction {
  final String? storeTerminalId;

  SetRegisterStoreTerminalAction({this.storeTerminalId});
}

class SetLoginInfoAction {
  final String? loginEmail;
  final String? loginPw;
  final String? loginToken;
  final String? loginPin;
  final String? loginPhone;
  final String? loginUserName;

  SetLoginInfoAction(
      {this.loginEmail,
      this.loginPw,
      this.loginToken,
      this.loginPin,
      this.loginPhone,
      this.loginUserName});
}

class CheckLoginPasswordAction {
  final String? password;

  CheckLoginPasswordAction({this.password});
}

class ChangeLoginPasswordAction {
  final String? password;

  ChangeLoginPasswordAction({this.password});
}

class ChangeLoginInfoAction {
  final String? password;
  final String? phoneNumber;

  ChangeLoginInfoAction({this.password, this.phoneNumber});
}

class SavePinAction {
  final String? pin;

  SavePinAction({this.pin});
}

class CheckPinAction {
  final String? pin;

  CheckPinAction({this.pin});
}

class DeletePinAction {}

class SignUpAction {
  final String? loginId;
  final String? loginEmail;
  final String? loginPw;
  final String? loginToken;
  final String? loginPin;
  final String? loginPhone;
  final String? loginUserName;

  SignUpAction(
      {this.loginId,
      this.loginEmail,
      this.loginPw,
      this.loginToken,
      this.loginPin,
      this.loginPhone,
      this.loginUserName});
}

class UnregisterAction {
  final String password;

  UnregisterAction({
    required this.password,
  });
}

class ChangePasswordAction {
  final String? oldPassword;
  final String? newPassword;

  ChangePasswordAction({this.oldPassword, this.newPassword});
}

class SendVerificationAction {
  final String? mobileNumber;
  final String? email;

  SendVerificationAction({this.mobileNumber, this.email});
}

class VerifyVerificationAction {
  final String? verificationCode;

  VerifyVerificationAction({this.verificationCode});
}

class ResetPasswordAction {
  final String? verificationCode;

  ResetPasswordAction({this.verificationCode});
}

class SetSyncInitAction {}

class SetTraceLogInitAction {}

class SetServerIndexAction {
  final int? serverIndex;

  SetServerIndexAction({this.serverIndex});
}

class DoRestartAppAction {}

class CheckLicenseFileAction {}

class IssueLicenseAction {}

class RequestPermissionAction {}

class VerifyLicenseAction {}

class GetLicenseKeyAction {}

class GetLoginDomainsAction {}

class MerchantLoginAction {
  final String? loginId;
  final String? loginPw;
  final String? loginDomain;
  MerchantLoginAction({
    this.loginId,
    this.loginPw,
    this.loginDomain,
  });
}

class MerchantLoginSaveAction {
  // final String? loginId;
  // final String? loginPw;
  // final String? loginDomain;
  // MerchantLoginSaveAction(
  //     {this.loginId,
  //       this.loginPw,
  //       this.loginDomain,
  //     });
}

class SetStoreCertificationDateAction {}

class ReadStoreCertificationDateAction {}

class UpdateUserOthers {
  final Map<String, dynamic>? others;
  UpdateUserOthers({
    this.others,
  });
}

class UpdateInitAction {
  final String? loginId;
  final String? loginEmail;
  final String? loginPw;
  final String? loginToken;
  final String? loginPin;
  final String? loginPhone;
  final String? loginUserName;
  final bool? isLogin;
  final String? messageLogin;
  final int? resCodeLogin;
  final List<String>? domainList;
  // final List<String>? merchantAddressList;
  final String? merchantStoreName;
  final String? merchantTelNo;
  final String? certificationDate;
  final String? licenseKey;
  final String? merchantLoginId;
  final String? merchantLoginPw;
  final String? merchantLoginDomain;

  UpdateInitAction({
    this.isLogin,
    this.messageLogin,
    this.resCodeLogin,
    this.loginId,
    this.loginEmail,
    this.loginPw,
    this.loginToken,
    this.loginPin,
    this.loginPhone,
    this.loginUserName,
    this.domainList,
    // this.merchantAddressList,
    this.merchantStoreName,
    this.merchantTelNo,
    this.certificationDate,
    this.licenseKey,
    this.merchantLoginId,
    this.merchantLoginPw,
    this.merchantLoginDomain,
  });
}

///----------------- Navigation -----------------
class NavigateToAction {
  final String? to;
  final bool replace;
  final dynamic arguments;

  // final Widget? page;
  final bool reload;
  final bool isStayPopup;

  NavigateToAction(
      {this.to,
      this.replace = false,
      this.arguments,
      // this.page,
      this.reload = false,
      this.isStayPopup = false});
}

class NavigateToOrderAction {}

class NavigateToPayListAction {}

class UpdateNavigationAction {
  final String? name;
  final bool? isPage;
  final String? method;

  UpdateNavigationAction({this.name, this.isPage, this.method});
}

class ShowPopupAction<T> {
  final bool barrierDismissible;
  final WidgetBuilder? builder;
  final bool dismissAll;

  ShowPopupAction(
      {this.barrierDismissible = true, this.builder, this.dismissAll = true});

  Future<T?> show(BuildContext context) {
    return showDialog<T>(
        context: context,
        barrierDismissible: barrierDismissible,
        builder: builder!);
  }
}

class DismissPopupAction {
  final bool all;
  final dynamic result;

  DismissPopupAction({this.all = false, this.result});
}

///----------------- Yollet -----------------

class GetTokenList {}

class GetTokenInfo {
  final String tokenId;

  GetTokenInfo(this.tokenId);
}

class DoCreateAddressInfo {
  final String? tokenId;
  final String? name;

  DoCreateAddressInfo({this.tokenId, this.name});
}

class DoCreateAddress {}

// class GetPrivateKeyString {
//   final String? name;
//
//   GetPrivateKeyString({this.name});
// }

class AssignTokenInfo {
  final String tokenId;
  final bool isNew;

  AssignTokenInfo({this.tokenId = "", this.isNew = false});
}

class AssignToken {}

// class AddAccountList{
//   final String account;
//   AddAccountList({this.account});
// }
// class SetCurrentTokenId{
//   final String tokenId;
//   SetCurrentTokenId({this.tokenId});
// }

class SetCurrentAccount {
  final String? currentAccountAddress;
  final String? currentTokenId;
  final String? currentKeyName;
  final String? message;
  final String? currentAccountName;
  final String? currentCoinName;
  final bool? currentIsVixco;
  final bool? currentIsStoreAddress;
  final num? currentBalance;
  final num? availableCurrentBalance;

  SetCurrentAccount({
    this.currentAccountAddress,
    this.message,
    this.currentTokenId,
    this.currentKeyName,
    this.currentAccountName,
    this.currentCoinName,
    this.currentIsVixco = false,
    this.currentIsStoreAddress = false,
    this.currentBalance,
    this.availableCurrentBalance,
  });
}

class SetTransferAccount {
  final String? transferAccountAddress;
  final String? transferAccountComment;
  final num? transferAccountAmount;

  SetTransferAccount(
      {this.transferAccountComment,
      this.transferAccountAmount,
      this.transferAccountAddress});
}

class SetTransaction {
  final String? transactionId;
  final String? transactionDate;

  SetTransaction({this.transactionId, this.transactionDate});
}

class DoTransfer {}

class GetAccountList {
  final bool isLoadWallet;

  GetAccountList({this.isLoadWallet = false});
}

class UpdateAccountBalance {
  final String? address;

  UpdateAccountBalance({this.address});
}

class SetTokenInfo {
  final TokenInfo? tokenInfo;

  SetTokenInfo({this.tokenInfo});
}

class GetTransferList {
  // final String from;
  // final String to;
  final String? address;
  final String? tokenId;
  final String? fromDate; // (format '2020-02-01')
  final String? toDate; // (format '2020-02-01')
  final int? pageNumber;
  final int? pageSize;

  GetTransferList({
    // this.from, this.to,
    this.address,
    this.tokenId,
    this.fromDate,
    this.toDate,
    this.pageNumber,
    this.pageSize,
  });
}

class GetTransferSortAction {
  final String? fromDate; // (format '2020-02-01')
  final String? toDate; // (format '2020-02-01')
  GetTransferSortAction({
    this.fromDate,
    this.toDate,
  });
}

class GetTransferListSorted {
  // final String from;
  // final String to;
  final String? address;
  final String? tokenId;
  final String? fromDate; // (format '2020-02-01')
  final String? toDate; // (format '2020-02-01')
  final int? pageNumber;
  final int? pageSize;

  GetTransferListSorted({
    // this.from, this.to,
    this.address,
    this.tokenId,
    this.fromDate,
    this.toDate,
    this.pageNumber,
    this.pageSize,
  });
}

class GetTransferDetail {
  final String? transactionId;
  final TransferInfo? transferInfo;

  GetTransferDetail({this.transferInfo, this.transactionId});
}

class CheckDuplicateAccountName {
  final String? name;

  CheckDuplicateAccountName({this.name});
}

class SetWalletInfo {
  final String? address;
  final String? name;
  final int? colorIndex;

  SetWalletInfo({this.address, this.name, this.colorIndex});
}

class MakeWalletInfo {}

class GetWalletList {}

class UpdateWalletList {
  final List<WalletInfo> walletList;
  final bool replace;

  UpdateWalletList({required this.walletList, this.replace = true});
}

class DeleteWallet {
  final WalletInfo wallet;

  DeleteWallet({required this.wallet});
}

class GetRecentTransferList {
  final String? address;

  GetRecentTransferList({this.address});
}

class StartPayment {
  final AddressInfo? addressInfo;
  final Function? onEvent;

  StartPayment({this.addressInfo, this.onEvent});
}

class SetPaymentTransfer {
  final Map? paymentTransferData;

  SetPaymentTransfer({this.paymentTransferData});
}

class DoPaymentTransfer {}

class StopPayment {}

class DoYolletRewardAction {
  final String rewardId;
  final String tokenAmount;
  final String tokenId;
  final String userAddress;

  DoYolletRewardAction(
      {required this.rewardId,
      required this.tokenAmount,
      required this.tokenId,
      required this.userAddress});
}

class AddNotificationInfo {
  final NotificationInfo? notificationInfo;

  AddNotificationInfo({this.notificationInfo});
}

class GetNotificationInfoList {}

class GetNotificationInfoDetail {
  final int? index;

  GetNotificationInfoDetail({this.index});
}

class MigrationAction {
  final int? index;

  MigrationAction({this.index});
}

class RefreshCurrentExchangeRate {}

class GetExchangeRatesList {
  final String? tokenId;
  final String? date;
  final int? pageNumber;
  final int? pageSize;

  GetExchangeRatesList({
    this.tokenId,
    this.date,
    this.pageNumber,
    this.pageSize,
  });
}

class RemoveAccount {
  final List<WalletInfo>? walletList;
  final List<AddressInfo>? addressList;

  RemoveAccount({this.walletList, this.addressList});
}

class RemoveAccountSelf {
  final String? address;
  final String? tokenId;
  final String? addInfo;

  RemoveAccountSelf({this.address, this.tokenId, this.addInfo});
}

class GetStakingInfoAction {
  final String? tokenId;

  GetStakingInfoAction({this.tokenId});
}

class CreateEthereumAddressAction {}

class SetEthereumAddressAction {
  final String? address;

  SetEthereumAddressAction({this.address});
}

class QueryEthBalanceAction {}

class SetStoreAddressList {
  List<String> merchantAddressList;
  SetStoreAddressList({required this.merchantAddressList});
}

class ExportEthereumKeyAction {
  String address;
  ExportEthereumKeyAction({required this.address});
}

class ImportEthereumKeyAction {
  String mnemonic;
  ImportEthereumKeyAction({required this.mnemonic});
}

class ImportMnemonicPhraseAction {
  String mnemonic;
  ImportMnemonicPhraseAction({required this.mnemonic});
}

class HasKeyIndexAction {
  String address;
  HasKeyIndexAction({required this.address});
}

class UpdateYolletAction {
  final String? createAccountTokenId;
  final String? createAccountName;
  final List<TokenInfo>? tokenList;
  final String? currentAccountAddress;
  final String? transferAccountAddress;
  final String? transferAccountComment;
  final num? transferAccountAmount;
  final String? message;
  final List<AddressInfo>? addressInfoList;
  final String? transactionId;
  final String? transactionDate;
  final String? currentTokenId;
  final String? currentKeyName;
  final TokenInfo? currentTokenInfo;
  final String? currentAccountName;
  final num? currentBalance;
  final num? availableCurrentBalance;
  final String? currentCoinName;
  final num? currentCurrencyBalance;
  final num? availableCurrentCurrencyBalance;
  final Map? currentTradePrice;
  final List<TransferInfo>? transferInfoList;
  final TransferInfo? transferInfo;
  final TransactionInfo? transactionInfoDetail;
  final List<WalletInfo>? walletList;
  final WalletInfo? walletInfo;
  final List<TransferInfo>? recentTransferList;
  final List<NotificationInfo>? notificationList;
  final StreamController? streamController;
  final AddressInfo? paymentAddressInfo;
  final Map? paymentTransferData;
  final bool? doneMigration;
  final List<ExchangeRateInfo>? exchangeRateInfoList;
  final StakingInfo? stakingInfo;
  final EthereumInfo? ethereumInfo;
  final bool? currentIsVixco;
  final bool? currentIsStoreAddress;
  final String? currentMnemonic;
  final String? ethereumMnemonic;
  final String? importEthereumMnemonicPhrase;
  final AddressInfo? currentAddressInfo;
  final bool? isFetching;

  UpdateYolletAction({
    this.createAccountTokenId,
    this.createAccountName,
    this.tokenList,
    this.currentAccountAddress,
    this.transferAccountAddress,
    this.transferAccountComment,
    this.transferAccountAmount,
    this.message,
    this.addressInfoList,
    this.transactionId,
    this.transactionDate,
    this.currentTokenId,
    this.currentKeyName,
    this.currentTokenInfo,
    this.currentAccountName,
    this.currentBalance,
    this.availableCurrentBalance,
    this.availableCurrentCurrencyBalance,
    this.currentTradePrice,
    this.currentCoinName,
    this.currentCurrencyBalance,
    this.transferInfoList,
    this.transferInfo,
    this.transactionInfoDetail,
    this.walletList,
    this.walletInfo,
    this.recentTransferList,
    this.notificationList,
    this.streamController,
    this.paymentAddressInfo,
    this.paymentTransferData,
    this.doneMigration,
    this.exchangeRateInfoList,
    this.stakingInfo,
    this.ethereumInfo,
    this.currentIsVixco,
    this.currentIsStoreAddress,
    this.currentMnemonic,
    this.ethereumMnemonic,
    this.importEthereumMnemonicPhrase,
    this.currentAddressInfo,
    this.isFetching,
  });
}

///--------------------Sort Implementation--------------------------

class SortThisMonth {}

class SortLastMonth {}

class SortLastThreeMonth {}

class SortCustom {}

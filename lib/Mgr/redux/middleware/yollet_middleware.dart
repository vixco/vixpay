import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';
import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yollet/Data/Dataset/AddressInfo.dart';
import 'package:yollet/Data/Dataset/EthereumInfo.dart';
import 'package:yollet/Data/Dataset/ExchangeRateInfo.dart';
import 'package:yollet/Data/Dataset/NotificationInfo.dart';
import 'package:yollet/Data/Dataset/QueryBalanceInfo.dart';
import 'package:yollet/Data/Dataset/StakingInfo.dart';
import 'package:yollet/Data/Dataset/TokenInfo.dart';
import 'package:yollet/Data/Dataset/TransactionInfo.dart';
import 'package:yollet/Data/Dataset/TransferInfo.dart';
import 'package:yollet/Data/Dataset/UserAddress.dart';
import 'package:yollet/Data/Dataset/WalletInfo.dart';
import 'package:yollet/Mgr/Navigation/app_routes.dart';
import 'package:yollet/Mgr/redux/action.dart';
import 'package:yollet/Mgr/redux/state.dart';
import 'package:yollet/Util/Common/Common.dart';
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
class YolletMiddleware extends MiddlewareClass<AppState> {
  @override
  call(Store<AppState> store, action, next) {
    /////////yolletState
    if (action is DoCreateAddressInfo) {
      return _doCreateAddressInfo(store.state.yolletState, action, next);
    } else if (action is DoCreateAddress) {
      return _doCreateAddress(store.state.yolletState, action, next);
    } else if (action is AssignTokenInfo) {
      return _assignTokenInfo(store.state.yolletState, action, next);
    } else if (action is AssignToken) {
      return _assignToken(store.state.yolletState, action, next);
      // } else if (action is GetPrivateKeyString) {
      //   return _getPrivateKeyString(store.state.yolletState, action, next);
    } else if (action is GetTokenList) {
      return _getTokenList(store.state.yolletState, action, next);
      // }else if (action is AddAccountList) {
      //   return _addAccountList(store.state.yolletState,action, next);
    } else if (action is GetAccountList) {
      return _getAccountList(store.state.yolletState, action, next);
    } else if (action is UpdateAccountBalance) {
      return _updateAccountBalance(store.state.yolletState, action, next);
    } else if (action is SetCurrentAccount) {
      return _setCurrentAccount(store.state.yolletState, action, next);
    } else if (action is SetTransferAccount) {
      return _setTransferAccount(store.state.yolletState, action, next);
    } else if (action is SetTransaction) {
      return _setTransaction(store.state.yolletState, action, next);
    } else if (action is DoTransfer) {
      return _doTransfer(store.state.yolletState, action, next);
    } else if (action is GetTransferList) {
      return _getTransferList(store.state.yolletState, action, next);
    } else if (action is GetTransferDetail) {
      return _getTransferDetail(store.state.yolletState, action, next);
    } else if (action is CheckDuplicateAccountName) {
      return _checkDuplicateAccountName(store.state.yolletState, action, next);
    } else if (action is SetWalletInfo) {
      return _setWalletInfo(store.state.yolletState, action, next);
    } else if (action is MakeWalletInfo) {
      return _makeWalletInfo(store.state.yolletState, action, next);
    } else if (action is GetWalletList) {
      return _getWalletList(store.state.yolletState, action, next);
    } else if (action is DeleteWallet) {
      return _deleteWallet(store.state.yolletState, action, next);
    } else if (action is UpdateWalletList) {
      return _updateWalletList(store.state.yolletState, action, next);
    } else if (action is GetRecentTransferList) {
      return _getRecentTransferList(store.state.yolletState, action, next);
    } else if (action is StartPayment) {
      return _startPayment(store.state.yolletState, action, next);
    } else if (action is SetPaymentTransfer) {
      return _setPaymentTransfer(store.state.yolletState, action, next);
    } else if (action is DoPaymentTransfer) {
      return _doPaymentTransfer(store.state.yolletState, action, next);
    } else if (action is StopPayment) {
      return _stopPayment(store.state.yolletState, action, next);
    } else if (action is DoYolletRewardAction) {
      return _doYolletReward(store.state.yolletState, action, next);
    } else if (action is AddNotificationInfo) {
      return _addNotificationInfo(store.state.yolletState, action, next);
    } else if (action is GetNotificationInfoList) {
      return _getNotificationInfoList(store.state.yolletState, action, next);
    } else if (action is GetNotificationInfoDetail) {
      return _getNotificationInfoDetail(store.state.yolletState, action, next);
    } else if (action is MigrationAction) {
      return _migrationAction(store.state.yolletState, action, next);
    } else if (action is RefreshCurrentExchangeRate) {
      return _refreshCurrentExchangeRate(store.state.yolletState, action, next);
    } else if (action is GetExchangeRatesList) {
      return _getExchangeRatesList(store.state.yolletState, action, next);
    } else if (action is RemoveAccount) {
      return _removeAccount(store.state.yolletState, action, next);
    } else if (action is RemoveAccountSelf) {
      return _removeAccountSelf(store.state.yolletState, action, next);
    } else if (action is GetStakingInfoAction) {
      return _getStakingInfoAction(store.state.yolletState, action, next);
    } else if (action is CreateEthereumAddressAction) {
      return _createEthereumAddressAction(
          store.state.yolletState, action, next);
    } else if (action is SetEthereumAddressAction) {
      return _setEthereumAddressAction(store.state.yolletState, action, next);
    } else if (action is QueryEthBalanceAction) {
      return _queryEthBalanceAction(store.state.yolletState, action, next);
    } else if (action is SetStoreAddressList) {
      return _setStoreAddressList(store.state.yolletState, action, next);
    } else if (action is ExportEthereumKeyAction) {
      return _exportEthereumKeyAction(store.state.yolletState, action, next);
    } else if (action is ImportEthereumKeyAction) {
      return _importEthereumKeyAction(store.state.yolletState, action, next);
    } else if (action is ImportMnemonicPhraseAction) {
      return _importMnemonicPhraseAction(store.state.yolletState, action, next);
    } else if (action is HasKeyIndexAction) {
      return _hasKeyIndexAction(store.state.yolletState, action, next);
    } else {
      return next(action);
    }
  }

  //
  void _doCreateAddressInfo(
      YolletState state, action, NextDispatcher next) async {
    next(UpdateYolletAction(
        createAccountTokenId: action.tokenId ?? state.createAccountTokenId,
        createAccountName: action.name ?? state.createAccountName));
  }
  //

  void _doCreateAddress(YolletState state, action, NextDispatcher next) async {
    String name = state.createAccountName;
    // String? publicKey = await _getPublicKey(name);
    // String? privateKey = await _getPrivateKey(name);
    //
    // if ((publicKey?.isEmpty ?? true) || (privateKey?.isEmpty ?? true)) {
    //   _generateKey(name);
    //   publicKey = await _getPublicKey(name);
    // }
    Map? key = await _getCreateKey();
    if (key == null) {
      return;
    }
    String? publicKey = key["publicKey"];
    String? keyIndex = key["keyIndex"];
    String? mnemonic = key["mnemonic"];

    //test
//     var exportKey  = await _exportKey(keyIndex??"");
// debugPrint("exportKey = ${exportKey}");
//     var importKey  = await _importKey(mnemonic??"");
//     debugPrint("importKey = ${importKey}");
    String? address = await _createAddress(name, publicKey!);
    // debugPrint("address = ${address}");
    // try {
    //   address = await _createAddress(name, publicKey!);
    //   debugPrint("address2 = ${address}");
    // } on TokenException catch (e) {
    //   log(e.toString());
    // }
    // try {
    //   address = await _createAddress(name+"-1", publicKey!);
    //   debugPrint("address3 = ${address}");
    // } on TokenException catch (e) {
    //   log(e.toString());
    // }
    if (address != null) {
      await _setKeyIndex(address, keyIndex ?? "");
      try {
        _getAssignTokenToAddress(address, state.createAccountTokenId);
        Map? map = await _getAddressInfoByAddress(address);
        AddressInfo addressInfo;
        if (map == null || map.isEmpty) {
          addressInfo = AddressInfo(address: address, addInfo: "");
        } else {
          addressInfo = AddressInfo.fromJson(map);
        }

        List? _tokenList = await _getQueryTokenByAddress(address);
        if (_tokenList != null) {
          addressInfo.setTokenInfoListFromJson(_tokenList);
        }
        if (addressInfo.tokenInfoList != null) {
          List queryBalanceInfoList = [];
          for (TokenInfo info in addressInfo.tokenInfoList!) {
            if (info.tokenId != null && info.tokenId!.isNotEmpty) {
              Map? queryBalanceInfo = await _getAddressBalanceByAddressByToken(
                  address, info.tokenId!);

              if (queryBalanceInfo != null) {
                queryBalanceInfoList.add(queryBalanceInfo);
              }
            }
          }
          addressInfo.setQueryBalanceInfoListFromJson(queryBalanceInfoList);
        }
        // List? balanceList = await _getAddressBalanceByAddress(address);
        // AddressInfo addressInfo = AddressInfo.fromJson(map??Map());
        // addressInfo.setBalanceInfoListFromJson(balanceList??[]);
      } on TokenException catch (e) {
        log(e.toString());
      }
    }
    // next(UpdateYolletAction());
    await appStore.dispatch(SetCurrentAccount(
        currentAccountAddress: address,
        currentTokenId: state.createAccountTokenId,
        currentKeyName: name));
    await appStore.dispatch(GetAccountList());
    next(UpdateYolletAction(
      currentMnemonic: mnemonic,
    ));
  }

  void _assignTokenInfo(
      YolletState state, AssignTokenInfo action, NextDispatcher next) async {
    if (action.isNew) {
      next(UpdateYolletAction(
          createAccountTokenId: action.tokenId,
          currentTokenId: action.tokenId));
    } else {
      next(UpdateYolletAction(createAccountTokenId: action.tokenId));
    }
  }

  Future<int> _assignToken(
      YolletState state, AssignToken action, NextDispatcher next) async {
    String name = state.createAccountName;

    String address = state.currentAccountAddress;
    try {
      int result =
          await _getAssignTokenToAddress(address, state.createAccountTokenId);
      if (result == 0) {
        await appStore.dispatch(SetCurrentAccount(
            currentAccountAddress: address,
            currentTokenId: state.createAccountTokenId,
            currentKeyName: name));
        return result;
      } else {
        return result;
      }
    } on TokenException catch (e) {
      log(e.toString());
      return e.code;
    }
  }

  // Future<String?> _getPrivateKeyString(
  //     YolletState state, action, NextDispatcher next) async {
  //   String? privateKey = await _getPrivateKey(action.name);
  //   return privateKey;
  // }

// List<Map> tokenList =<Map>[
//   {"id":"TES","Name":"TEST1","addresss":"7e0623ae11e201bc66a6978c0040f646fd57faaaa7cec805174f0d1bb73197a8"},
//   {"id":"GML2","Name":"TOKEN_GMLWND2","addresss":"ff3eb6e8c013996ea11d270fca6bd6ab7dcca8d8899eb2f9fa958e0b5b71b8e6"},
//   {"id":"TKG1","Name":"TOKEN_GMLWND","addresss":"d2e54ee4d4b9a6056302fc05619d44d01ed23af12cd51c26fbd16f75711aa6e5"},
// ];

  // List<Map> tokenList =<Map>[
  //   {"id":"VIX","name":"Vixco","addresss":"7e0623ae11e201bc66a6978c0040f646fd57faaaa7cec805174f0d1bb73197a8","url":"assets/img/vix.png"},
  //   {"id":"BTC","name":"Bitcoin","addresss":"ff3eb6e8c013996ea11d270fca6bd6ab7dcca8d8899eb2f9fa958e0b5b71b8e6","url":"https://s3-ap-northeast-2.amazonaws.com/cobak/logo/1520345981272600_bitcoin.png"},
  //   {"id":"ETH","name":"Ethereum","addresss":"d2e54ee4d4b9a6056302fc05619d44d01ed23af12cd51c26fbd16f75711aa6e5","url":"https://s3-ap-northeast-2.amazonaws.com/cobak/logo/1520345981450374_ethereum.png"},
  //   //https://s3-ap-northeast-2.amazonaws.com/cobak/logo/1520345981954362_litecoin.pn
  // ];

  // [{"tokenId":"GML2","tokenName":"TOKEN_GMLWND2"},
  // {"tokenId":"TES","tokenName":"TEST1"},
  // {"tokenId":"TKG1","tokenName":"TOKEN_GMLWND"},
  // {"tokenId":"VIX","tokenName":"VIXCO"}]

  void _getTokenList(YolletState state, action, NextDispatcher next) async {
    List _tokenList = await _listTokens();
    List<TokenInfo> webTokenList =
        _tokenList.map<TokenInfo>((json) => TokenInfo.fromJson(json)).toList();
    List<TokenInfo> tokenList = [];

    for (TokenInfo info in webTokenList) {
      Map? _tokenInfo = await _queryToken(info.tokenId!);
      //YolletMiddleware: Token info: {
      //   "ver": 1,
      //   "owner": "a56588c4d2170a2ec7351a6087d97f3c32abc61d4bd38c94dad13032bc108c01",
      //   "tokenId": "VIXCO",
      //   "tokenName": "VIXCO description",
      //   "totalSupply": 100000000.0,
      //   "decimalPoint": 0,
      //   "txFeeType": 1,
      //   "txRoundType": 0,
      //   "txFeeRate": 5.0,
      //   "txFeeYN": 1,
      //   "feeAddress": "9de59a1cf5dc5cf584bcf439ab55321f0694060e5fd73e394e3eaa5c12c3716d",
      //   "availableHours": 3600,
      //   "createDate": 1624619877
      // }
      TokenInfo tokenInfo = TokenInfo.fromJson(_tokenInfo ?? Map());
      tokenInfo.setUrl(Common.getUrl(tokenInfo.tokenId));
      tokenInfo.setSymbol(tokenInfo.symbol);
      tokenList.add(tokenInfo);
    }

    //debug
    // TokenInfo secondToken = TokenInfo(
    //   owner: tokenList.first.owner,
    //   tokenId: "ZWWZ",//tokenList.first.tokenId,
    //   tokenName: tokenList.first.tokenName,
    //   totalSupply: tokenList.first.totalSupply,
    //   decimalPoint: 1,//tokenList.first.decimalPoint,
    //   createDate: tokenList.first.createDate,
    //   symbol: "ZWWZ",//tokenList.first.symbol,
    //   balance: tokenList.first.balance,
    // );
    // tokenList.add(secondToken);
    //debug

    next(UpdateYolletAction(tokenList: tokenList));
    if (!state.doneMigration) {
      await appStore.dispatch(MigrationAction());
    }
  }

  // void _addAccountList(YolletState state, action ,NextDispatcher next) async {
  //   //todo 작업 필요함
  //   // next(UpdateYolletAction(tokenList: tokenList));
  // }

  void _getAccountList(YolletState state, action, NextDispatcher next) async {
    List<UserAddress>? storeAddressList = await _getStoreAddressList();
    List<UserAddress>? userAddressList = await _getUserAddressList();
    //todo getStoreAddress

    if (storeAddressList == null) {
      storeAddressList = [];
    }
    if (userAddressList == null) {
      userAddressList = [];
    }
    storeAddressList.addAll(userAddressList);
    List<AddressInfo> list = [];
    for (UserAddress _userAddress in storeAddressList) {
      String? address = _userAddress.address;
      Map? map = await _getAddressInfoByAddress(address);
      // List? balanceList = await _getAddressBalance(accountName);
      // AddressInfo addressInfo = AddressInfo.fromJson(map??Map());
      // addressInfo.setBalanceInfoListFromJson(balanceList??[]);

      AddressInfo addressInfo;
      if (map == null || map.isEmpty) {
        addressInfo = AddressInfo(address: address, addInfo: "");
      } else {
        addressInfo = AddressInfo.fromJson(map);
      }

      addressInfo.setStoreAddress(_userAddress.isStoreAddress);
      addressInfo.setKeyIndex(await _hasKeyIndex(address));
      List? _tokenList = await _getQueryTokenByAddress(address);
      if (_tokenList != null) {
        addressInfo.setTokenInfoListFromJson(_tokenList);
      }
      if (addressInfo.tokenInfoList != null) {
        List queryBalanceInfoList = [];
        for (TokenInfo info in addressInfo.tokenInfoList!) {
          if (info.tokenId != null && info.tokenId!.isNotEmpty) {
            Map? queryBalanceInfo = await _getAddressBalanceByAddressByToken(
                address, info.tokenId!);

            if (queryBalanceInfo != null) {
              queryBalanceInfoList.add(queryBalanceInfo);
            }
          }
        }
        addressInfo.setQueryBalanceInfoListFromJson(queryBalanceInfoList);
      }
      list.add(addressInfo);
      // _getAddressBalance(address);
    }

    next(UpdateYolletAction(
      addressInfoList: list,
    ));
    if (action.isLoadWallet) {
      await appStore.dispatch(GetWalletList());
    }
  }

  void _updateAccountBalance(YolletState state, UpdateAccountBalance action,
      NextDispatcher next) async {
    List<AddressInfo> addressList = state.addressInfoList;
    List<AddressInfo> list = [];
    for (AddressInfo info in addressList) {
      if (info.address == action.address) {
        // String accountName= info.addInfo!;
        Map? map = await _getAddressInfoByAddress(info.address!);
        // List? balanceList = await _getAddressBalance(accountName);
        // AddressInfo addressInfo = AddressInfo.fromJson(map??Map());
        // addressInfo.setBalanceInfoListFromJson(balanceList??[]);

        AddressInfo addressInfo;
        if (map == null || map.isEmpty) {
          addressInfo = AddressInfo(address: info.address!, addInfo: "");
        } else {
          addressInfo = AddressInfo.fromJson(map);
        }
        addressInfo.setStoreAddress(info.isStoreAddress);
        addressInfo.setKeyIndex(await _hasKeyIndex(info.address!));
        // String? address  = await _getAddress(accountName);
        List? _tokenList = await _getQueryTokenByAddress(info.address!);
        if (_tokenList != null) {
          addressInfo.setTokenInfoListFromJson(_tokenList);
        }
        if (addressInfo.tokenInfoList != null) {
          List queryBalanceInfoList = [];
          for (TokenInfo tokenInfo in addressInfo.tokenInfoList!) {
            if (tokenInfo.tokenId != null && tokenInfo.tokenId!.isNotEmpty) {
              Map? queryBalanceInfo = await _getAddressBalanceByAddressByToken(
                  info.address!, tokenInfo.tokenId!);

              if (queryBalanceInfo != null) {
                queryBalanceInfoList.add(queryBalanceInfo);
              }
            }
          }
          addressInfo.setQueryBalanceInfoListFromJson(queryBalanceInfoList);
        }

        list.add(addressInfo);
      } else {
        list.add(info);
      }
    }
    next(UpdateYolletAction(
      addressInfoList: list,
    ));
  }

  void _setCurrentAccount(
      YolletState state, SetCurrentAccount action, NextDispatcher next) async {
    TokenInfo? currentTokenInfo;
    // if(action.currentTokenId!=null){
    //   Map _tokenInfo  = await _queryToken(action.currentTokenId);
    //   currentTokenInfo = TokenInfo.fromJson(_tokenInfo);
    //   // await appStore.dispatch(SetTokenInfo(tokenInfo: tokenInfo));
    // }

    // TokenInfo tokenItem;
    String? currentAccountName = action.currentAccountName;
    num currentBalance = action.currentBalance ?? 0;
    num availableCurrentBalance = action.availableCurrentBalance ?? 0;
    String? currentCoinName = action.currentCoinName;
    num currentCurrencyBalance = 0;
    num availableCurrentCurrencyBalance = 0;
    AddressInfo? currentAddressInfo;
    for (AddressInfo info in state.addressInfoList) {
      if (info.address == action.currentAccountAddress) {
        currentAddressInfo = info;
        // List<String> split;
        // if (info.addInfo == null || info.addInfo!.isEmpty) {
        //   split = "-".split("-");
        // } else {
        //   split = info.addInfo!.split("-");
        //   if (split.length == 1) {
        //     split = [info.addInfo!, ""];
        //   }
        // }
        String tokenId = "VIXP";
        String addInfo = info.addInfo ?? "";
        //temp code
        if (addInfo.startsWith("VIXP-")) {
          addInfo = addInfo.substring(5);
        }
        if (info.isEmptyBalance) {
          for (TokenInfo item in state.tokenList) {
            if (item.tokenId == tokenId) {
              currentTokenInfo = item;
            }
          }
          currentAccountName = addInfo;
          currentCoinName = "";
          currentBalance = 0;
          availableCurrentBalance = 0;
          currentCurrencyBalance = 0;
          availableCurrentCurrencyBalance = 0;
        } else {
          for (QueryBalanceInfo binfo in info.queryBalanceInfoList!) {
            if (binfo.tokenId == action.currentTokenId) {
              for (TokenInfo item in state.tokenList) {
                if (item.tokenId == binfo.tokenId) {
                  currentTokenInfo = item;
                }
              }
              currentAccountName = addInfo;
              currentCoinName = binfo.tokenId;
              currentBalance = binfo.totalBalance ?? 0;
              availableCurrentBalance = binfo.availableBalance ?? 0;
              currentCurrencyBalance = binfo.exchangeTotalBalance ?? 0;
              availableCurrentCurrencyBalance =
                  binfo.exchangeAvailableBalance ?? 0;
              break;
            }
          }
        }
        break;
      }
    }

    next(UpdateYolletAction(
      currentAccountAddress: action.currentAccountAddress,
      currentTokenId: action.currentTokenId,
      currentKeyName: action.currentKeyName,
      currentTokenInfo: currentTokenInfo ?? TokenInfo(),
      currentAccountName: currentAccountName ?? "",
      currentBalance: currentBalance,
      availableCurrentBalance: availableCurrentBalance,
      currentCoinName: currentCoinName ?? "",
      currentCurrencyBalance: currentCurrencyBalance,
      availableCurrentCurrencyBalance: availableCurrentCurrencyBalance,
      message: action.message,
      currentIsVixco: action.currentIsVixco,
      currentIsStoreAddress: action.currentIsStoreAddress,
      currentAddressInfo: currentAddressInfo,
    ));
  }

  void _setTransferAccount(
      YolletState state, action, NextDispatcher next) async {
    next(UpdateYolletAction(
      transferAccountAddress: action.transferAccountAddress,
      transferAccountComment: action.transferAccountComment,
      transferAccountAmount: action.transferAccountAmount,
    ));
  }

  // void _setTransferAccountAmount(YolletState state, action ,NextDispatcher next) async {
  //   next(UpdateYolletAction(transferAccountAmount: action.amount));
  // }
  // void _setCurrentTokenId(YolletState state, action ,NextDispatcher next) async {
  //   next(UpdateYolletAction(tokenId: action.tokenId));
  // }
  void _setTransaction(YolletState state, action, NextDispatcher next) async {
    next(UpdateYolletAction(
        transactionId: action.transactionId,
        transactionDate: action.transactionDate));
  }

  Future<bool> _doTransfer(
      YolletState state, action, NextDispatcher next) async {
    debugPrint("YolletMiddleware:  _doTransfer");
    String? keyIndex = await _getKeyIndex(state.currentAccountAddress);
    var success = await _transfer(
        state.currentAccountAddress,
        state.transferAccountAddress,
        state.currentTokenId,
        state.transferAccountAmount.toString(),
        state.transferAccountComment,
        keyIndex ?? "");
    if (!success) {
      return false;
    }
    TransferInfo info = TransferInfo();
    info.fromAddress = state.currentAccountAddress;
    info.toAddress = state.transferAccountAddress;
    info.tokenId = state.currentTokenId;
    info.amount = state.transferAccountAmount.toString();
    // info.transactionID = ;
    info.transactionTime = DateTime.now().toIso8601String();
    info.comment = state.transferAccountComment;
    Map map = info.stringContentMap();
    String data = jsonEncode(map);
    _addRecentTransferList(state.currentAccountAddress, data);

    next(UpdateYolletAction());
    // await appStore.dispatch(GetAccountList());
    return true;
  }

  // void _setTokenInfo(YolletState state, action ,NextDispatcher next) async {
  //   next(UpdateYolletAction(currentTokenInfo: action.currentTokenInfo));
  // }
  Future<List> _getTransferList(
      YolletState state, action, NextDispatcher next) async {
    List _transferInfoList = [];
    _transferInfoList = await _getTransferListApi(
      address: action.address,
      tokenId: action.tokenId,
      fromDate: action.fromDate ?? '',
      toDate: action.toDate ?? '',
      pageNo: action.pageNumber ?? 1,
      pageSize: action.pageSize ?? 5,
    );

    List<TransferInfo> transferInfoList = _transferInfoList
        .map<TransferInfo>((json) => TransferInfo.fromJson(json))
        .toList();
    // transferInfoList.sort((a,b) => a.compareTo(b));

    // transferInfoList.sort((a,b) {
    // var adate = a.transactionDateTime;
    // var bdate = b.transactionDateTime;
    // return -adate.compareTo(bdate);
    // });

    next(UpdateYolletAction(transferInfoList: transferInfoList));
    return transferInfoList;
  }

  void _getTransferDetail(
      YolletState state, action, NextDispatcher next) async {
    Map? info = await _getTransaction(action.transactionId);
    TransactionInfo transactionInfoDetail =
        TransactionInfo.fromJson(info ?? Map());
    next(UpdateYolletAction(
        transactionInfoDetail: transactionInfoDetail,
        transferInfo: action.transferInfo));
  }

  Future<bool> _checkDuplicateAccountName(
      YolletState state, action, NextDispatcher next) async {
    bool value = true;
    for (AddressInfo addressInfo in state.addressInfoList) {
      if (action.name == addressInfo.addInfo) {
        value = false;
      }
    }
    return value;
  }

  void _setWalletInfo(YolletState state, action, NextDispatcher next) async {
    Map _wallet = Map();
    _wallet["address"] = action.address ?? state.walletInfo.address ?? "";
    _wallet["walletName"] = action.name ?? state.walletInfo.name ?? "";
    _wallet["walletColorIndex"] =
        action.colorIndex ?? state.walletInfo.index ?? 0;
    WalletInfo walletInfo = WalletInfo.fromJson(_wallet);
    next(UpdateYolletAction(walletInfo: walletInfo));
  }

  void _makeWalletInfo(YolletState state, action, NextDispatcher next) async {
    // Map _wallet = Map();
    // _wallet["address"] = state.walletInfo.address ?? "";
    // _wallet["name"] = state.walletInfo.name ?? "";
    // _wallet["index"] = state.walletInfo.index ?? 0;
    // String data = jsonEncode(_wallet);
    _addWalletList(state.walletInfo.name ?? "", state.walletInfo.index,
        state.walletInfo.address ?? "");
    _getWalletList(state, GetWalletList(), next);
  }

  void _getWalletList(YolletState state, action, NextDispatcher next) async {
    List<WalletInfo>? _walletList = await _loadWalletList();
    if (_walletList == null) {
      _walletList = [];
    }
    List<WalletInfo> walletList = [];
    for (WalletInfo walletInfo in _walletList) {
      // Map map = jsonDecode(walletMap);

      // WalletInfo walletInfo = WalletInfo.fromJson(map);

      List addressList = state.addressInfoList;
      for (AddressInfo info in addressList) {
        if (info.address == walletInfo.address) {
          walletInfo.setAddressInfo(info);
          break;
        }
      }
      if (walletInfo.addressInfo == null) {
        try {
          Map? map = await _getAddressInfoByAddress(walletInfo.address!);
          // List? balanceList = await _getAddressBalanceByAddress(walletInfo.address!);
          // AddressInfo addressInfo = AddressInfo.fromJson(map??Map());
          // addressInfo.setBalanceInfoListFromJson(balanceList??[]);
          AddressInfo addressInfo;
          if (map == null || map.isEmpty) {
            addressInfo =
                AddressInfo(address: walletInfo.address ?? "", addInfo: "");
          } else {
            addressInfo = AddressInfo.fromJson(map);
          }

          List? _tokenList =
              await _getQueryTokenByAddress(walletInfo.address ?? "");
          if (_tokenList != null) {
            addressInfo.setTokenInfoListFromJson(_tokenList);
          }

          if (addressInfo.tokenInfoList != null) {
            List queryBalanceInfoList = [];
            for (TokenInfo info in addressInfo.tokenInfoList!) {
              if (info.tokenId != null && info.tokenId!.isNotEmpty) {
                Map? queryBalanceInfo =
                    await _getAddressBalanceByAddressByToken(
                        walletInfo.address!, info.tokenId!);

                if (queryBalanceInfo != null) {
                  queryBalanceInfoList.add(queryBalanceInfo);
                }
              }
            }
            addressInfo.setQueryBalanceInfoListFromJson(queryBalanceInfoList);
          }

          walletInfo.setAddressInfo(addressInfo);
        } on TokenException catch (e) {
          log(e.toString());
        }
      }

      walletList.add(walletInfo);
    }
    next(UpdateYolletAction(walletList: walletList, isFetching: false));
  }

  void _deleteWallet(
      YolletState state, DeleteWallet action, NextDispatcher next) async {
    await _removeWallet(action.wallet);
    _getWalletList(state, GetWalletList(), next);
  }

  void _updateWalletList(
      YolletState state, UpdateWalletList action, NextDispatcher next) async {
    // List<String> list = [];
    //
    // for (WalletInfo info in action.walletList) {
    //   Map _wallet = Map();
    //   _wallet["address"] = info.address ?? "";
    //   _wallet["name"] = info.name ?? "";
    //   _wallet["index"] = info.index ?? 0;
    //   String data = jsonEncode(_wallet);
    //   // _addWalletList(data);
    //   list.add(data);
    // }
    await _saveWalletList(action.walletList);
    // next(UpdateYolletAction(walletInfo: state.walletInfo));
    // await appStore.dispatch(GetWalletList());
    _getWalletList(state, GetWalletList(), next);
  }

  void _getRecentTransferList(
      YolletState state, action, NextDispatcher next) async {
    List<String>? _recentTransferList =
        await _loadRecentTransferList(action.address);
    if (_recentTransferList == null) {
      _recentTransferList = [];
    }
    List<TransferInfo> recentTransferList = [];
    for (String recentTransferMap in _recentTransferList) {
      Map map = jsonDecode(recentTransferMap);

      TransferInfo transferInfo = TransferInfo.fromJson(map);
      recentTransferList.add(transferInfo);
    }
    next(UpdateYolletAction(recentTransferList: recentTransferList));
  }

  void _startPayment(YolletState state, action, NextDispatcher next) async {
    AddressInfo? _addressInfo = action.addressInfo;
    Function onEvent = action.onEvent;
    StreamController<Map> streamController = StreamController<Map>();

    next(UpdateYolletAction(
        streamController: streamController, paymentAddressInfo: _addressInfo));

    await gRpcClient.doYolletPayment(streamController, onEvent);
  }

  void _setPaymentTransfer(
      YolletState state, action, NextDispatcher next) async {
    next(UpdateYolletAction(paymentTransferData: action.paymentTransferData));
  }

  void _doPaymentTransfer(
      YolletState state, action, NextDispatcher next) async {
    AddressInfo _addressInfo = state.paymentAddressInfo;
    // String accountName = _addressInfo.addInfo!;
    String? keyIndex = await _getKeyIndex(_addressInfo.address!);

    // var priKey =
    //     await appStore.dispatch(GetPrivateKeyString(name: accountName));
    var data = state.paymentTransferData;
    var amount = data['tokenAmount'];

    var tokenData = await tokenClient.doYolletPay(
      tokenId: _addressInfo.queryBalanceInfoList![0].tokenId ?? '',
      from: _addressInfo.address!,
      amount: amount,
      to: data['settlementAddress'],
      keyIndex: keyIndex ?? "",
    );

    if (!state.streamController.isClosed) {
      state.streamController.add({
        'tranNo': data['tranNo'],
        'key': tokenData['key'],
        'signature': tokenData['signature'],
        'comment': 'Yollet Pay',
      });
    }
  }

  void _stopPayment(YolletState state, action, NextDispatcher next) async {
    if (!state.streamController.isClosed) {
      state.streamController.close();
    }
    next(UpdateYolletAction(streamController: StreamController<Map>()));
  }

  Future<Map> _doYolletReward(YolletState state, DoYolletRewardAction action,
      NextDispatcher next) async {
    return await gRpcClient.doYolletReward(action.rewardId, action.tokenAmount,
        action.tokenId, action.userAddress);
  }

  void _addNotificationInfo(
      YolletState state, action, NextDispatcher next) async {
    NotificationInfo notificationInfo = action.notificationInfo;

    String data = jsonEncode(notificationInfo.stringContentMap());
    _addNotificationList(data);
    //
    // next(UpdateYolletAction(notificationList: notificationList));
    _getNotificationInfoList(state, GetNotificationInfoList(), next);
  }

  void _getNotificationInfoList(
      YolletState state, action, NextDispatcher next) async {
    List<String>? _notificationList = await _loadNotificationList();
    if (_notificationList == null) {
      _notificationList = [];
    }
    List<NotificationInfo> notificationList = [];
    for (String notificationMap in _notificationList) {
      Map map = jsonDecode(notificationMap);

      NotificationInfo notificationInfo = NotificationInfo.fromJson(map);
      notificationList.add(notificationInfo);
    }
    next(UpdateYolletAction(notificationList: notificationList));
  }

  void _getNotificationInfoDetail(
      YolletState state, action, NextDispatcher next) async {
    // next(UpdateYolletAction(notificationList: notificationList));
  }

  void _refreshCurrentExchangeRate(
      YolletState state, action, NextDispatcher next) async {
    Map currentTradePrice = state.currentTradePrice;
    for (TokenInfo info in state.tokenList) {
      if (info.tokenId != null && info.tokenId!.isNotEmpty) {
// value = {_InternalLinkedHashMap} size = 5
// 0 = {map entry} "date" -> "20210708"
// 1 = {map entry} "exchangeRate" -> 120.1
// 2 = {map entry} "dateIndex" -> "202107080004"
// 3 = {map entry} "index" -> 4
// 4 = {map entry} "timestamp" -> 0

        Map? exchangeRate = await _getCurrentExchangeRate(info.tokenId!);
        if (exchangeRate != null) {
          ExchangeRateInfo exchangeRateInfo =
              ExchangeRateInfo.fromJson(exchangeRate);
          exchangeRateInfo.setTokenId(info.tokenId!);
          currentTradePrice[info.tokenId!] = exchangeRateInfo.exchangeRate ?? 1;
        }
      }
    }
    // state.currentTradePrice[]

    next(UpdateYolletAction(currentTradePrice: currentTradePrice));
  }

  Future<List> _getExchangeRatesList(YolletState state,
      GetExchangeRatesList action, NextDispatcher next) async {
    List? list =
        await _getExchangeRates(action.tokenId ?? "", action.date ?? "");
    if (list != null) {
      List<ExchangeRateInfo> exchangeRateInfoList =
          list.map<ExchangeRateInfo>((json) {
        ExchangeRateInfo exchangeRateInfo = ExchangeRateInfo.fromJson(json);
        exchangeRateInfo.setTokenId(action.tokenId ?? "");
        return exchangeRateInfo;
      }).toList();
      next(UpdateYolletAction(exchangeRateInfoList: exchangeRateInfoList));
      return exchangeRateInfoList;
    }
    return [];
  }

  void _removeAccount(
      YolletState state, RemoveAccount action, NextDispatcher next) async {
    if (action.addressList!.length == 0 && action.walletList!.length == 0) {
      appStore.dispatch(NavigateToAction(to: AppRoutes.intro));
    } else {
      await _removeAddressList(action.addressList ?? []);
      await _removeWalletList(action.walletList ?? []);
      _getWalletList(state, GetWalletList(), next);
      await appStore.dispatch(GetAccountList());
    }
  }

  void _removeAccountSelf(
      YolletState state, RemoveAccountSelf action, NextDispatcher next) async {
    // await _removeWalletSelf(action.address ?? '');
    // await _removeAddressSelf(action.addInfo ?? '');

    for (AddressInfo addressInfo in state.addressInfoList) {
      if (action.address == addressInfo.address) {
        _removeAddress(addressInfo);
      }
    }

    for (WalletInfo info in state.walletList) {
      if (action.address == info.address) {
        _removeWallet(info);
      }
    }

    await appStore.dispatch(GetAccountList());
    _getWalletList(state, GetWalletList(), next);
  }

  void _getStakingInfoAction(YolletState state, GetStakingInfoAction action,
      NextDispatcher next) async {
    Map? stakingInfo = await _getStakingInfo(action.tokenId!);
    if (stakingInfo != null) {
      StakingInfo info = StakingInfo.fromJson(stakingInfo);
      info.setTokenId(action.tokenId!);
      next(UpdateYolletAction(stakingInfo: info));
    }
  }

  Future<String> _createEthereumAddressAction(YolletState state,
      CreateEthereumAddressAction action, NextDispatcher next) async {
    String? address = await _createEthereumAddress();
    next(
        UpdateYolletAction(ethereumInfo: EthereumInfo(address: address ?? "")));
    return address ?? "";
  }

  void _setEthereumAddressAction(YolletState state,
      SetEthereumAddressAction action, NextDispatcher next) async {
    next(UpdateYolletAction(
        ethereumInfo: EthereumInfo(address: action.address ?? "")));
  }

  Future<String> _queryEthBalanceAction(YolletState state,
      QueryEthBalanceAction action, NextDispatcher next) async {
    String? balance = await _queryEthBalance(state.ethereumInfo.address);

    next(UpdateYolletAction(
        ethereumInfo: EthereumInfo(
            address: state.ethereumInfo.address, amount: balance ?? "0")));
    return balance ?? "";
  }

  void _exportEthereumKeyAction(YolletState state,
      ExportEthereumKeyAction action, NextDispatcher next) async {
    String? mnemonic = await _exportEthereumKey(action.address);
    debugPrint("mnemonic $mnemonic");

    next(UpdateYolletAction(ethereumMnemonic: mnemonic));
  }

  Future<String?> _importEthereumKeyAction(YolletState state,
      ImportEthereumKeyAction action, NextDispatcher next) async {
    String? address = await _importEthereumKey(action.mnemonic);
    debugPrint("address $address");
    return address;
  }

  void _importMnemonicPhraseAction(YolletState state,
      ImportMnemonicPhraseAction action, NextDispatcher next) async {
    next(UpdateYolletAction(importEthereumMnemonicPhrase: action.mnemonic));
  }

  Future<bool> _hasKeyIndexAction(
      YolletState state, HasKeyIndexAction action, NextDispatcher next) async {
    bool value = await _hasKeyIndex(action.address);
    return value;
  }

  void _setStoreAddressList(YolletState state, SetStoreAddressList action,
      NextDispatcher next) async {
    await _saveStoreAddressList(action.merchantAddressList);
    await appStore.dispatch(GetAccountList());
  }

  void _migrationAction(YolletState state, action, NextDispatcher next) async {
    List<Future<bool> Function()> migrations = [_migrate0, _migrate1];
    String? v = await _getVersion();

    // 최초 설치인 경우 migration 불필요
    if (v == null) {
      await _setVersion(migrations.length.toString());
      next(UpdateYolletAction(doneMigration: true));
      return;
    }

    int version = int.tryParse(v) ?? 0;

    if (version == migrations.length) {
      next(UpdateYolletAction(doneMigration: true));
      return;
    }

    print('Current version : $version');

    try {
      while (version < migrations.length) {
        print('>>> Begin migration $version');

        if (!await migrations[version]()) {
          print('<<< Fail migration $version');
          break;
        }

        print('<<< End migration $version');
        version++;
      }
    } on Exception catch (e, stack) {
      print('<<< Fail migration $version');
      print('$e\n$stack');
    }

    await _setVersion(version.toString());
    next(UpdateYolletAction(doneMigration: version == migrations.length));
  }

  Future<bool> _migrate0() async {
    List<String>? accountNameList = await _getAccountNameListOld();

    if (accountNameList == null) {
      accountNameList = [];
    }

    await _setAccountNameList(accountNameList); //migration

    for (String name in accountNameList) {
      // String? publicKey = await _getPublicKeyOld(name);
      // String? privateKey = await _getPrivateKeyOld(name);
      // _setPublicKey(name, publicKey ?? ""); //migration
      // _setPrivateKey(name, privateKey ?? ""); //migration

      bool value = await _hasNotAddressOld(name);
      if (value) continue;
      String? address = await _getAddressOld(name);
      await _saveAddressOnly(name, address); //migration

      List<String>? _recentTransferList =
          await _loadRecentTransferListOld(address ?? "");

      if (_recentTransferList == null) {
        _recentTransferList = [];
      }

      await _saveRecentTransferList(
          address ?? "", _recentTransferList); //migration
    }

    List<String>? _walletList = await _loadWalletListOld();

    if (_walletList == null) {
      _walletList = [];
    }

    await _saveWalletListpre(_walletList); //migration

    List<String>? _notificationList = await _loadNotificationListOld();

    if (_notificationList == null) {
      _notificationList = [];
    }

    await _saveNotificationList(_notificationList); //migration
    return true;
  }

  Future<bool> _migrate1() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    if (!pref.containsKey(KEY_LOGIN_PIN)) {
      return true;
    }

    InitState state = appStore.state.initState;

    if (state.loginId.isEmpty) {
      return false;
    }

    FlutterSecureStorage secure = FlutterSecureStorage();
    String pin = pref.getString(KEY_LOGIN_PIN) ?? '';
    await secure.write(key: '${state.loginId}.$KEY_LOGIN_PIN', value: pin);
    await pref.remove(KEY_LOGIN_PIN);
    return true;
  }

  static const VERSION = 'version';

  Future<String?> _getVersion() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.containsKey(VERSION) ? pref.getString(VERSION) : null;
  }

  Future<void> _setVersion(String version) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString(VERSION, version);
  }

////////////key////////
  Future<Map?> _getCreateKey() async {
    try {
      var info = await tokenClient.createKey();
      return info;
    } on TokenException catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<Map?> _exportKey(String keyIndex) async {
    try {
      var info = await tokenClient.exportKey(keyIndex);
      return info;
    } on TokenException catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<Map?> _importKey(String mnemonic) async {
    try {
      var info = await tokenClient.importKey(mnemonic);
      return info;
    } on TokenException catch (e) {
      log(e.toString());
      return null;
    }
  }

  String KEY_INDEX = 'keyIndex';

  Future<bool> _hasKeyIndex(String address) async {
    String userUuid = gRpcClient.userUuid ?? "";
    FlutterSecureStorage _secureStorage = FlutterSecureStorage();
    return await _secureStorage.containsKey(
        key: '$userUuid.$KEY_INDEX-$address');
  }

  Future<String?> _getKeyIndex(String address) async {
    String userUuid = gRpcClient.userUuid ?? "";
    FlutterSecureStorage _secureStorage = FlutterSecureStorage();
    if (!await _secureStorage.containsKey(
        key: '$userUuid.$KEY_INDEX-$address')) {
      return "";
    }

    return await _secureStorage.read(key: '$userUuid.$KEY_INDEX-$address');
  }

  Future<void> _setKeyIndex(String address, String keyIndex) async {
    String userUuid = gRpcClient.userUuid ?? "";
    // SharedPreferences _storage = await SharedPreferences.getInstance();
    FlutterSecureStorage _secureStorage = FlutterSecureStorage();
    await _secureStorage.write(
      key: '$userUuid.$KEY_INDEX-$address',
      value: keyIndex,
    );
  }

//   Future<String?> _getPublicKey(String name) async {
//     String userUuid = gRpcClient.userUuid ?? "";
//     // FlutterSecureStorage _secureStorage = FlutterSecureStorage();
//     SharedPreferences _storage = await SharedPreferences.getInstance();
//     if (!_storage.containsKey('$userUuid.public-$name')) {
//       await _generateKey(name);
//     }
//
//     return _storage.getString('$userUuid.public-$name');
//   }

  // Future<void> _setPublicKey(String name, String value) async {
  //   String userUuid = gRpcClient.userUuid ?? "";
  //
  //   // FlutterSecureStorage _secureStorage = FlutterSecureStorage();
  //   SharedPreferences _storage = await SharedPreferences.getInstance();
  //   await _storage.setString('$userUuid.public-$name', value);
  // }

  // Future<String?> _getPrivateKey(String? name) async {
  //   String userUuid = gRpcClient.userUuid ?? "";
  //   FlutterSecureStorage _secureStorage = FlutterSecureStorage();
  //   // SharedPreferences _storage = await SharedPreferences.getInstance();
  //   if (!await _secureStorage.containsKey(key: '$userUuid.private-$name')) {
  //     await _generateKey(name);
  //   }
  //
  //   return await _secureStorage.read(key: '$userUuid.private-$name');
  // }

  // Future<void> _setPrivateKey(String? name, String value) async {
  //   String userUuid = gRpcClient.userUuid ?? "";
  //
  //   FlutterSecureStorage _secureStorage = FlutterSecureStorage();
  //   await _secureStorage.write(
  //     key: '$userUuid.private-$name',
  //     value: value,
  //   );
  // }

  // Future<void> _generateKey(String? name) async {
  //   String userUuid = gRpcClient.userUuid ?? "";
  //   FlutterSecureStorage _secureStorage = FlutterSecureStorage();
  //   SharedPreferences _storage = await SharedPreferences.getInstance();
  //
  //   var key = tokenClient.generateKey();
  //   await _secureStorage.write(
  //     key: '$userUuid.private-$name',
  //     value: tokenClient.encodePrivateKey(key.privateKey as ECPrivateKey),
  //   );
  //   await _storage.setString('$userUuid.public-$name',
  //       tokenClient.encodePublicKey(key.publicKey as ECPublicKey));
  // }

  ////////////Token////////
  Future<List> _listTokens() async {
    try {
      Map? data = await tokenClient.getTokenList(pageSize: 50, desc: true);
      var list = data['list'];
      //{tokenId: VIXCO,
      // tokenName: VIXCO description,
      // symbol: VIXCO,
      // txId: 1cd568aee0c4d96bef1a9d7c9169de88413c9c2df21313348a02338fed8b6cba,
      // txTime: 2021-06-25T20:17:57}
      list.forEach((token) {
        var id = token['tokenId'];
        var symbol = token['symbol'];
        var name = token['tokenName'];
        log('_listTokens  - $id : $name : $symbol');
      });
      return list;
    } on TokenException catch (e) {
      log(e.toString());
      return [];
    }
  }

  Future<List> _getTransferListApi({
    required String address,
    required String tokenId,
    required String fromDate,
    required String toDate,
    required int pageNo,
    required int pageSize,
  }) async {
    try {
      Map? info = await tokenClient.getTransferList(
          address: address,
          tokenId: tokenId,
          fromDate: fromDate,
          toDate: toDate,
          pageNo: pageNo,
          pageSize: pageSize,
          desc: true);
      var list = info["list"];
      for (var info in list) {
        var to = info[
            'toAddress']; //(await tokenClient.queryAddress(info['toAddress']))['addInfo'];
        var amount = info['amount'];
        var time = info['txTime'];
        log('[$time] $amount => $to');
      }
      return list;
    } on TokenException catch (e) {
      log(e.toString());
      return [];
    }
  }

  Future<String?> _createAddress(String name, String pubKey) async {
    try {
      var address = await tokenClient.createAddress(name, pubKey);
      log('Create address "$name": $address');
      _logTransactionId();
      await _saveAddress(name, address);
      return address;
    } on TokenException catch (e) {
      log(e.toString());
      return null;
    }
  }

  // Future<String?> _getAddressByName(String name) async {
  //   bool value = await _hasNotAddress(name);
  //   if (value) return Future.value(null);
  //   String? address = await _getAddress(name);
  //   return address;
  // }
  //
  // Future<String?> _getNameByAddress(String address) async {
  //   List<String>? accountNameList = await _getAccountNameList();
  //   if (accountNameList == null) {
  //     accountNameList = [];
  //   }
  //   List<AddressInfo> list = [];
  //   for (String accountName in accountNameList) {
  //     String? value = await _getAddressByName(accountName);
  //     if ((value ?? "") == address) {
  //       return accountName;
  //     }
  //   }
  //   return Future.value(null);
  // }

  // Future<Map?> _getAddressInfo(String name) async {
  //   bool value = await _hasNotAddress(name);
  //   if (value) return Future.value(null);
  //   String? address = await _getAddress(name);
  //   try {
  //     var info = await tokenClient.queryAddress(address ?? "");
  //     var text = JsonEncoder.withIndent('  ').convert(info);
  //     log('Address Info: $text');
  //     return info;
  //   } on TokenException catch (e) {
  //     log(e.toString());
  //     return null;
  //   }
  // }

  Future<Map?> _getAddressInfoByAddress(String address) async {
    try {
      var info = await tokenClient.queryAddress(address);
      var text = JsonEncoder.withIndent('  ').convert(info);
      log('Address Info: $text');
      return info;
    } on TokenException catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<int> _getAssignTokenToAddress(String address, String tokenId) async {
    try {
      var success = await tokenClient.assignTokenToAddress(
        tokenId: tokenId,
        address: address,
      );
      if (success) {
        return 0;
      } else {
        return -1;
      }
    } on TokenException catch (e) {
      log(e.toString());
      return e.code;
    }
  }

  Future<List?> _getQueryTokenByAddress(String address) async {
    try {
      var info = await tokenClient.queryTokenByAddress(address);
      var text = JsonEncoder.withIndent('  ').convert(info);
      log('Address Info: $text');
      return info;
    } on TokenException catch (e) {
      log(e.toString());
      // {jsonrpc: 2.0, id: 18752, error: {code: -32601, message: method not found}}
      // if (e.code == -32601) {
      //   return [];
      // }
      return null;
    }
  }

  Future<Map?> _getStakingInfo(String tokenId) async {
    try {
      var info = await tokenClient.getStakingInfo(tokenId);
      return info;
    } on TokenException catch (e) {
      log(e.toString());
      // {jsonrpc: 2.0, id: 18752, error: {code: -32601, message: method not found}}
      // if (e.code == -32601) {
      //   return [];
      // }
      return null;
    }
  }

  Future<String?> _createEthereumAddress() async {
    try {
      var info = await tokenClient.createEthereumAddress();
      String? address = info["address"];
      String? keyIndex = info["keyIndex"];
      _setKeyIndex(address ?? "", keyIndex ?? "");
      return address;
    } on TokenException catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<String?> _queryEthBalance(String address) async {
    try {
      var info = await tokenClient.queryEthBalance(address);
      return info;
    } on TokenException catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<String?> _exportEthereumKey(String address) async {
    try {
      String? keyIndex = await _getKeyIndex(address);
      if (keyIndex == null) {
        return null;
      }
      var info = await tokenClient.exportEthereumKey(keyIndex);
      String? mnemonic = info["mnemonic"];
      return mnemonic;
    } on TokenException catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<String?> _importEthereumKey(String mnemonic) async {
    try {
      var info = await tokenClient.importEthereumKey(mnemonic);
      if (info == null || info.isEmpty) {
        return null;
      }
      String? address = info["address"];
      String? keyIndex = info["keyIndex"];
      _setKeyIndex(address ?? "", keyIndex ?? "");
      return address;
    } on TokenException catch (e) {
      log(e.toString());
      return null;
    }
  }

  // Future<Map?> _getAddressBalanceByToken(String name, String tokenId) async {
  //   try {
  //     bool value = await _hasNotAddress(name);
  //     if (value) return Future.value(Map());
  //     String? address = await _getAddress(name);
  //
  //     var info = await tokenClient.queryBalanceByToken(address ?? "", tokenId);
  //     if (info != null) {
  //       log('Balance', json: info);
  //     } else {
  //       debugPrint(
  //           'queryBalanceByToken : tokenId[$tokenId] address[${address ?? ""}]');
  //     }
  //     return info;
  //   } on TokenException catch (e) {
  //     log(e.toString());
  //     return null;
  //   }
  // }

  Future<Map?> _getAddressBalanceByAddressByToken(
      String address, String tokenId) async {
    try {
      var info = await tokenClient.queryBalanceByToken(address, tokenId);
      if (info != null) {
        log('Balance', json: info);
      } else {
        debugPrint(
            'queryBalanceByToken : tokenId[$tokenId] address[${address}]');
      }
      return info;
    } on TokenException catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<Map?> _getTransaction(String transactionId) async {
    var info = await tokenClient.getTransaction(transactionId);
    log('Transaction', json: info);
    return info;
  }

  Future<Map?> _queryToken(String tokenId) async {
    try {
      var info = await tokenClient.queryToken(tokenId);
      log('Token info', json: info);
      return info;
    } on TokenException catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<bool> _transfer(String from, String to, String tokenId, String amount,
      String comment, String keyIndex) async {
    // if (await _hasNotAddress(from) || await _hasNotAddress(to)) return;
    // keyName= keyName.replaceAll("_", "-"); //todo 임시 코드
    var success = await tokenClient.transfer(
      from: from,
      tokenId: tokenId,
      to: to,
      amount: amount,
      comment: comment,
      keyIndex: keyIndex,
    );

    log('Transfer "$tokenId" "$from" => "$to": $success');
    _logTransactionId();
    return success;
  }

  Future<void> _logTransactionId() async {
    if (tokenClient.transactionId != null) {
      String? _lastTransactionId = tokenClient.transactionId;
      String dateString =
          DateFormat('yy.MM.dd HH:mm:ss').format(DateTime.now());
      await appStore.dispatch(SetTransaction(
          transactionId: _lastTransactionId, transactionDate: dateString));
      log('Transaction id: $_lastTransactionId');
    }
  }

  Future<Map?> _getCurrentExchangeRate(String tokenId) async {
    try {
      var info = await tokenClient.getCurrentExchangeRate(tokenId);
      if (info != null) {
        log('_getCurrentExchangeRate', json: info);
      } else {
        debugPrint('getCurrentExchangeRate : tokenId[$tokenId] is fail');
      }
      return info;
    } on TokenException catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<List?> _getExchangeRates(String tokenId, String date) async {
    try {
      var info = await tokenClient.getExchangeRates(tokenId, date);
      if (info != null) {
        log('_getExchangeRates tokenId[$tokenId]', json: info);
      } else {
        debugPrint(
            'getCurrentExchangeRate : tokenId[$tokenId]  date[$date]  is fail');
      }

      return info;
    } on TokenException catch (e) {
      log(e.toString());
      return null;
    }
  }

  ////////////SharedPreferences////////
  // Future<bool> _hasNotAddress(String? name) async {
  //   String userUuid = gRpcClient.userUuid ?? "";
  //   SharedPreferences _storage = await SharedPreferences.getInstance();
  //
  //   if (!_storage.containsKey('$userUuid.address-$name')) {
  //     log('Address "$name" not created');
  //     return true;
  //   }
  //
  //   return false;
  // }

  // Future<String?> _getAddress(String name) async {
  //   String userUuid = gRpcClient.userUuid ?? "";
  //   SharedPreferences _storage = await SharedPreferences.getInstance();
  //
  //   return _storage.getString('$userUuid.address-$name');
  // }

  Future<void> _saveAddress(String name, address) async {
    String userUuid = gRpcClient.userUuid ?? "";

    Map _map = await userApi.insertAddress(userUuid, name, address);
    // await _addAccountNameList(name);
  }

  //for old version
  Future<void> _saveAddressOnly(String name, address) async {
    String userUuid = gRpcClient.userUuid ?? "";
    SharedPreferences _storage = await SharedPreferences.getInstance();

    await _storage.setString('$userUuid.address-$name', address);
  }

  Future<void> _removeAddress(AddressInfo address) async {
    String userUuid = gRpcClient.userUuid ?? "";
    Map _map = await userApi.removeAddress(userUuid, address.address ?? "");
    // await _storage.remove('$userUuid.address-$name');
  }

  Future<void> _removeWallet(WalletInfo info) async {
    String userUuid = gRpcClient.userUuid ?? "";
    Map _map = await userApi.removeWallet(userUuid, info.id ?? "");
  }

  Future<void> _removeAddressSelf(String? addInfo) async {
    String userUuid = gRpcClient.userUuid ?? "";
    //Instance and Public storage
    SharedPreferences _storage = await SharedPreferences.getInstance();
    List<String>? addList =
        _storage.getStringList("$userUuid.$AccountNameList");

    //Secure Storage
    FlutterSecureStorage _secureStorage = FlutterSecureStorage();

    if (addList == null) {
      addList = [];
    }
    if (addList.contains(addInfo)) {
      addList.remove(addInfo);
      await _storage.remove("$userUuid.address-$addInfo");
      await _storage.remove("$userUuid.public-$addInfo");
      await _secureStorage.delete(key: '$userUuid.private-$addInfo');
    }
    await _storage.setStringList("$userUuid.$AccountNameList", addList);
  }

  Future<void> _removeWalletSelf(String? address) async {
    String userUuid = gRpcClient.userUuid ?? "";
    SharedPreferences _storage = await SharedPreferences.getInstance();
    List<String>? wallList = _storage.getStringList("$userUuid.$WalletList");
    List<String>? newWallList = _storage.getStringList("$userUuid.$WalletList");

    if (wallList == null) {
      wallList = [];
    }
    if (newWallList == null) {
      newWallList = [];
    }
    wallList.forEach((wallet) {
      if (wallet.contains(address!)) {
        newWallList!.remove(wallet);
      }
    });
    await _storage.setStringList("$userUuid.$WalletList", newWallList);
  }

  String AccountNameList = 'addressList';

  // Future<List<String>?> _getAccountNameList() async {
  //   String userUuid = gRpcClient.userUuid ?? "";
  //   SharedPreferences _storage = await SharedPreferences.getInstance();
  //
  //   return _storage.getStringList("$userUuid.$AccountNameList");
  // }
  //
  // Future<void> _setAccountNameList(List<String> list) async {
  //   String userUuid = gRpcClient.userUuid ?? "";
  //
  //   SharedPreferences _storage = await SharedPreferences.getInstance();
  //   await _storage.setStringList("$userUuid.$AccountNameList", list);
  // }
  //
  // Future<void> _addAccountNameList(String address) async {
  //   String userUuid = gRpcClient.userUuid ?? "";
  //
  //   SharedPreferences _storage = await SharedPreferences.getInstance();
  //   List<String>? list = _storage.getStringList("$userUuid.$AccountNameList");
  //   if (list == null) {
  //     list = [];
  //   }
  //   list.add(address);
  //   await _storage.setStringList("$userUuid.$AccountNameList", list);
  // }

  Future<List<UserAddress>?> _getUserAddressList() async {
    String userUuid = gRpcClient.userUuid ?? "";
    Map _map = await userApi.getAddressList(userUuid);
    List _userList = _map["list"];
    List<UserAddress> userAddressList = _userList
        .map<UserAddress>((json) => UserAddress.fromJson(json))
        .toList();
    return userAddressList;
  }

  Future<List<UserAddress>?> _getStoreAddressList() async {
    List<String>? _list = await _loadStoreAddressList();
    if (_list == null) {
      return [];
    }
    List<UserAddress> _storeAddressList = [];
    for (String address in _list) {
      _storeAddressList.add(UserAddress(
          id: "",
          addressName: "",
          location: 0,
          address: address,
          isStoreAddress: true));
    }
    return _storeAddressList;
  }

  //for old version
  Future<void> _setAccountNameList(List<String> list) async {
    String userUuid = gRpcClient.userUuid ?? "";

    SharedPreferences _storage = await SharedPreferences.getInstance();
    await _storage.setStringList("$userUuid.$AccountNameList", list);
  }

  // Future<void> _addAccountNameList(String address) async {
  //   String userUuid = gRpcClient.userUuid ?? "";
  //
  //   SharedPreferences _storage = await SharedPreferences.getInstance();
  //   List<String>? list = _storage.getStringList("$userUuid.$AccountNameList");
  //   if (list == null) {
  //     list = [];
  //   }
  //   list.add(address);
  //   await _storage.setStringList("$userUuid.$AccountNameList", list);
  // }

  Future<void> _removeAddressList(List<AddressInfo> addressList) async {
    String userUuid = gRpcClient.userUuid ?? "";

    //Instance and Public storage
    SharedPreferences _storage = await SharedPreferences.getInstance();

    //Secure Storage
    FlutterSecureStorage _secureStorage = FlutterSecureStorage();

    List<String>? list = _storage.getStringList("$userUuid.$AccountNameList");
    List<String>? storage =
        _storage.getStringList("$userUuid.$AccountNameList");

    if (list == null) {
      storage = [];
    }
    if (storage == null) {
      storage = [];
    } else {
      list!.forEach((addInfo) async {
        String addName = addInfo;
        if (addInfo.contains(addName)) {
          storage!.remove(addInfo);
          await _storage.remove("$userUuid.address-$addName");
          await _storage.remove("$userUuid.public-$addName");
          await _secureStorage.delete(key: '$userUuid.private-$addName');
        }
      });
    }
    await _storage.setStringList("$userUuid.$AccountNameList", storage);
    for (AddressInfo addressInfo in addressList) {
      _removeAddress(addressInfo);
    }
  }

  Future<void> _removeWalletList(List<WalletInfo> walletList) async {
    String userUuid = gRpcClient.userUuid ?? "";

    SharedPreferences _storage = await SharedPreferences.getInstance();
    List<String>? list = _storage.getStringList("$userUuid.$WalletList");
    List<String>? storage = _storage.getStringList("$userUuid.$WalletList");

    if (list == null) {
      storage = [];
    }
    if (storage == null) {
      storage = [];
    } else {
      walletList.forEach((walletInfo) {
        String walletName = walletInfo.name!;
        list!.forEach((storageItem) {
          if (storageItem.contains(walletName)) {
            storage!.remove(storageItem);
          }
        });
      });
    }
    await _storage.setStringList("$userUuid.$WalletList", storage);
    for (WalletInfo info in walletList) {
      _removeWallet(info);
    }
  }
//-----

  String WalletList = 'walletList';

  Future<List<WalletInfo>?> _loadWalletList() async {
    String userUuid = gRpcClient.userUuid ?? "";
    Map _map = await userApi.getWalletList(userUuid);
    List _userList = _map["list"];
    List<WalletInfo> userWalletList =
        _userList.map<WalletInfo>((json) => WalletInfo.fromJson(json)).toList();
    return userWalletList;
  }

  //
  // Future<List<String>?> _loadWalletList() async {
  //   String userUuid = gRpcClient.userUuid ?? "";
  //
  //   SharedPreferences _storage = await SharedPreferences.getInstance();
  //
  //   return _storage.getStringList("$userUuid.$WalletList");
  // }
  Future<void> _saveWalletListpre(List<String> list) async {
    String userUuid = gRpcClient.userUuid ?? "";

    SharedPreferences _storage = await SharedPreferences.getInstance();
    await _storage.setStringList("$userUuid.$WalletList", list);
  }

  Future<void> _saveWalletList(List<WalletInfo> walletList) async {
    String userUuid = gRpcClient.userUuid ?? "";
    int location = 0;
    for (WalletInfo info in walletList) {
      Map _map = await userApi.updateWallet(userUuid, info.id ?? "", location++,
          info.name ?? "", info.index, info.address ?? "");
    }
  }

  Future<void> _addWalletList(
      String walletName, int walletColorIndex, String address) async {
    String userUuid = gRpcClient.userUuid ?? "";

    Map _map = await userApi.insertWallet(
        userUuid, walletName, walletColorIndex, address);
    // return _map;
  }

//----

  //-----

  String RecentTransferList = 'recentTransferList' + '-';

  Future<List<String>?> _loadRecentTransferList(String address) async {
    String userUuid = gRpcClient.userUuid ?? "";

    SharedPreferences _storage = await SharedPreferences.getInstance();

    return _storage.getStringList("$userUuid.$RecentTransferList$address");
  }

  Future<void> _saveRecentTransferList(
      String address, List<String> list) async {
    String userUuid = gRpcClient.userUuid ?? "";

    SharedPreferences _storage = await SharedPreferences.getInstance();
    await _storage.setStringList("$userUuid.$RecentTransferList$address", list);
  }

  Future<void> _addRecentTransferList(
      String address, String transferInfo) async {
    String userUuid = gRpcClient.userUuid ?? "";

    int max_count = 5;
    SharedPreferences _storage = await SharedPreferences.getInstance();
    List<String> list = [];
    list.add(transferInfo);
    List<String>? _list =
        _storage.getStringList("$userUuid.$RecentTransferList$address");
    if (_list == null) {
    } else {
      if (_list.length < max_count) {
        list.addAll(_list);
      } else {
        for (int i = 0; i < max_count - 1; i++) {
          list.add(_list[i]);
        }
      }
    }

    await _storage.setStringList("$userUuid.$RecentTransferList$address", list);
  }

//----
  //-----

  String NotificationList = 'notificationList';

  Future<List<String>?> _loadNotificationList() async {
    String userUuid = gRpcClient.userUuid ?? "";

    SharedPreferences _storage = await SharedPreferences.getInstance();

    return _storage.getStringList("$userUuid.$NotificationList");
  }

  Future<void> _saveNotificationList(List<String> list) async {
    String userUuid = gRpcClient.userUuid ?? "";

    SharedPreferences _storage = await SharedPreferences.getInstance();
    await _storage.setStringList("$userUuid.$NotificationList", list);
  }

  Future<void> _addNotificationList(String notification) async {
    String userUuid = gRpcClient.userUuid ?? "";

    int max_count = 10;
    SharedPreferences _storage = await SharedPreferences.getInstance();
    List<String> list = [];
    list.add(notification);
    List<String>? _list = _storage.getStringList("$userUuid.$NotificationList");
    if (_list == null) {
    } else {
      if (_list.length < max_count) {
        list.addAll(_list);
      } else {
        for (int i = 0; i < max_count - 1; i++) {
          list.add(_list[i]);
        }
      }
    }

    await _storage.setStringList("$userUuid.$NotificationList", list);
  }

  String StoreAddressList = 'storeAddressList';

  Future<List<String>?> _loadStoreAddressList() async {
    String userUuid = gRpcClient.userUuid ?? "";
    SharedPreferences _storage = await SharedPreferences.getInstance();

    return _storage.getStringList("$userUuid.$StoreAddressList");
  }

  Future<void> _saveStoreAddressList(List<String> list) async {
    String userUuid = gRpcClient.userUuid ?? "";

    SharedPreferences _storage = await SharedPreferences.getInstance();
    await _storage.setStringList("$userUuid.$StoreAddressList", list);
  }

//----

  void log(String? msg, {dynamic json}) {
    String _log = '';

    if (msg == null && json == null) {
      _log = '';
    } else {
      if (json != null) {
        msg = (msg != null ? '$msg: ' : '') +
            JsonEncoder.withIndent('  ').convert(json);
      }

      _log = _log.isNotEmpty ? _log + '\n' + msg! : msg!;
    }
    debugPrint("YolletMiddleware: " + _log);
  }
//////////////////////////////
  ////////////BY User////////
//////////////////////////////

  ////////////SharedPreferences////////
  Future<bool> _hasNotAddressOld(String? name) async {
    SharedPreferences _storage = await SharedPreferences.getInstance();

    if (!_storage.containsKey('address-$name')) {
      log('Address "$name" not created');
      return true;
    }

    return false;
  }

  Future<String?> _getAddressOld(String name) async {
    SharedPreferences _storage = await SharedPreferences.getInstance();

    return _storage.getString('address-$name');
  }

  Future<List<String>?> _getAccountNameListOld() async {
    SharedPreferences _storage = await SharedPreferences.getInstance();

    return _storage.getStringList(AccountNameList);
  }

  Future<List<String>?> _loadWalletListOld() async {
    SharedPreferences _storage = await SharedPreferences.getInstance();

    return _storage.getStringList(WalletList);
  }

  Future<List<String>?> _loadRecentTransferListOld(String address) async {
    SharedPreferences _storage = await SharedPreferences.getInstance();

    return _storage.getStringList(RecentTransferList + address);
  }

  Future<List<String>?> _loadNotificationListOld() async {
    SharedPreferences _storage = await SharedPreferences.getInstance();

    return _storage.getStringList(NotificationList);
  }
}

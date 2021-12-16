import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:pointycastle/export.dart';
import 'package:unique_identifier/unique_identifier.dart';
import 'package:yollet_client/src/YolletApi.dart';
import 'package:yollet_client/yollet_client.dart';

import 'crypto/crypto.dart' as crypto;
import 'exception.dart';

final userApi = UserApi.instance;

///
/// Token API: http://pms.ibexlab.com/confluence/display/IBE/4.+%5BAPI%5D+TokenAPI+-20210402+Update
/// Block API: http://pms.ibexlab.com/confluence/display/IBE/8.+%5BAPI%5D+Block+API
///
class UserApi extends YolletApi {
  static UserApi get instance => _instance;

  static final UserApi _instance = UserApi._internal();

  UserApi._internal();

  String? get transactionId => YolletApi.transactionId;

  String? get resultCode => YolletApi.resultCode;

  String? get resultMessage => YolletApi.resultMessage;

  Future<Map> getAddressList(String userUuid, ) async {
    return await _jsonRpc(method: 'user/getAddressList', params: {
      'userUuid': userUuid,
    });
  }
  Future<Map> insertAddress(String userUuid,String addressName,/*String addressKeyIndex,*/String address, ) async {
    return await _jsonRpc(method: 'user/insertAddress', params: {
      'userUuid': userUuid,
      'addressName': addressName,
      // 'addressKeyIndex': addressKeyIndex,
      'address': address,
    });
  }
  Future<Map> updateAddress(String userUuid,int location,String addressName,String address, ) async {
    return await _jsonRpc(method: 'user/updateAddress', params: {
      'userUuid': userUuid,
      'location': location,
      'addressName': addressName,
      'address': address,
    });
  }
  Future<Map> removeAddress(String userUuid,String address, ) async {
    return await _jsonRpc(method: 'user/removeAddress', params: {
      'userUuid': userUuid,
      'address': address,
    });
  }
  Future<Map> getWalletList(String userUuid, ) async {
    return await _jsonRpc(method: 'user/getWalletList', params: {
      'userUuid': userUuid,
    });
  }
  Future<Map> insertWallet(String userUuid,String walletName,int walletColorIndex,String address, ) async {
    return await _jsonRpc(method: 'user/insertWallet', params: {
      'userUuid': userUuid,
      'walletName': walletName,
      'walletColorIndex': walletColorIndex,
      'address': address,
    });
  }
  Future<Map> updateWallet(String userUuid,String id,int location,String walletName,int walletColorIndex, String
  address, ) async {
    return await _jsonRpc(method: 'user/updateWallet', params: {
      'userUuid': userUuid,
      'id': id,
      'location': location,
      'walletName': walletName,
      'walletColorIndex': walletColorIndex,
      'address': address,
    });
  }

  Future<Map> removeWallet(String userUuid,String id, ) async {
    return await _jsonRpc(method: 'user/removeWallet', params: {
      'userUuid': userUuid,
      'id': id,
    });
  }


///////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////

  Future<dynamic> _jsonRpc(
      {required String method, required Map params}) async {
    try{
      return jsonRpc(method:method,params: params);
    } on TokenException catch (e) {
      throw TokenException(code: e.code, message: e.message);
    }
  }
}
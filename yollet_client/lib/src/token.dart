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

final tokenClient = TokenClient.instance;

///
/// Token API: http://pms.ibexlab.com/confluence/display/IBE/4.+%5BAPI%5D+TokenAPI+-20210402+Update
/// Block API: http://pms.ibexlab.com/confluence/display/IBE/8.+%5BAPI%5D+Block+API
///
class TokenClient extends YolletApi {
  // Release build => Use real server
  // Develop build => Use develop server

  static TokenClient get instance => _instance;

  static final TokenClient _instance = TokenClient._internal();

  TokenClient._internal();

  // String? _transactionId;
  // String? resultCode;
  // String? _resultMessage;

  String? get transactionId => YolletApi.transactionId;

  String? get resultCode => YolletApi.resultCode;

  String? get resultMessage => YolletApi.resultMessage;

  ///
  /// 공개/비밀 키 생성
  ///
  AsymmetricKeyPair<PublicKey, PrivateKey> generateKey() {
    return crypto.generateECKey();
  }

  ///
  /// 비밀 키를 PEM 포맷으로 인코딩
  ///
  String encodePrivateKey(ECPrivateKey key) {
    return crypto.encodeECPrivateKey(key);
  }

  ///
  /// 공개 키를 PEM 포맷으로 인코딩
  ///
  String encodePublicKey(ECPublicKey key) {
    return crypto.encodeECPublicKey(key);
  }

  ///
  /// PEM 포맷을 비밀 키로 디코딩
  ///
  ECPrivateKey decodePrivateKey(String pem) {
    return crypto.decodeECPrivateKey(pem);
  }

  ///
  /// PEM 포맷을 공개 키로 디코딩
  ///
  ECPublicKey decodePublicKey(String pem) {
    return crypto.decodeECPublicKey(pem);
  }

  ///
  /// 메시지 서명
  ///
  ECSignature sign(ECPrivateKey priKey, Uint8List message) {
    return crypto.signWithUint8List(priKey, message);
  }

  ///
  /// 서명 검증
  ///
  bool verify(ECPublicKey pubKey, Uint8List message, Signature sig) {
    return crypto.verify(pubKey, message, sig);
  }

  ///
  /// 계좌 소유자의 PEM 공개 키 [pubKey] 사용하여 계좌명 [name] 계좌를 생성
  ///
  Future<String> createAddress(String name, String pubKey) async {
    return await _jsonRpc(method: 'token/createAddress', params: {
      'addInfo': name,
      'publicKey': pubKey,
    });
  }

  ///
  /// 계좌번호 [address] 계좌 정보 조회
  ///
  Future<Map> queryAddress(String address) async {
    var result = await _jsonRpc(method: 'token/queryAddress', params: {
      'address': address,
    });
    // tokenId 없는 경우
    if (resultCode == '500') {
      return Map();
    }
    return result;
  }

  ///
  /// 계좌번호 [address] 계좌 잔액 조회
  ///
  Future<List> queryBalance(String address) async {
    var result = await _jsonRpc(method: 'token/queryBalance', params: {
      'address': address,
    });

    if (resultCode == '500') {
      return [];
    }

    return result;
  }

  ///
  /// 계좌번호 [address] 계좌의 토큰 [tokenId]의 잔액 조회
  ///
  Future<Map?> queryBalanceByToken(String address, String tokenId) async {
    var result = await _jsonRpc(method: 'token/queryBalanceByToken', params: {
      'address': address,
      'tokenId': tokenId,
    });

    // tokenId 없는 경우
    if (resultCode == '500') {
      return null;
    }

    return result;
  }

  ///
  /// 현재 환율 [exchangeRate], 고시시점 정보 [date], [index], [dateIndex], [timestamp] 돌려줌
  ///
  Future<Map> getCurrentExchangeRate(String tokenId) async {
    return await _jsonRpc(method: 'exchange/getCurrentExchangeRate', params: {
      'tokenId': tokenId,
      'currency': 'KRW', // 현재 원화만 지원
    });
  }

  ///
  /// yyyyMMdd 형태의 [date] 로 검색해서 환율 목록을 돌려줌
  /// 목록의 각 항목은 [exchangeRate], [date], [index], [dateIndex], [timestamp] 포함
  ///
  Future<List> getExchangeRates(String tokenId, String date) async {
    return await _jsonRpc(method: 'exchange/getExchangeRates', params: {
      'tokenId': tokenId,
      'currency': 'KRW',
      'date': date,
    });
  }

  ///
  /// 토큰 생성
  ///
  Future<bool> createToken({
    required String address,
    required String tokenId,
    required String tokenName,
    required String totalSupply,
    required String feeAddress,
    required String priKey,
    String decimalPoint = '0',
    FeeType feeType = FeeType.No,
    RoundType roundType = RoundType.HALF_UP,
    String feeRate = '0',
    FeeYN feeYN = FeeYN.NO,
    String availableHours = '600',
  }) async {
    var tempKey = await _getKey('token', address);

    if (tempKey == null) {
      throw TokenException(code: -1, message: 'Cannot get temp key');
    }

    var txFeeType = feeType.index;
    var txRoundType = roundType.index;
    var txFeeYN = feeYN.index;
    var message =
        '$address|$tokenId|$tokenName|$totalSupply|$decimalPoint|$txFeeType|$txRoundType|$feeRate|$txFeeYN|$feeAddress|$availableHours|$tempKey';
    var sig = crypto.sign(crypto.decodeECPrivateKey(priKey), message);

    await _jsonRpc(method: 'token/createToken', params: {
      'owner': address,
      'tokenId': tokenId,
      'tokenName': tokenName,
      'totalSupply': totalSupply,
      'decimalPoint': decimalPoint,
      'txFeeType': txFeeType,
      'txRoundType': txRoundType,
      'txFeeRate': feeRate,
      'txFeeYN': txFeeYN,
      'feeAddress': feeAddress,
      'availableHours': availableHours,
      'tempKey': tempKey,
      'signature': sig,
    });

    return resultCode == '200';
  }

  Future<bool> updateFeeAddress({
    required String owner,
    required String tokenId,
    required String feeAddress,
    required String priKey,
  }) async {
    var tempKey = await _getKey('token', owner);

    if (tempKey == null) {
      throw TokenException(code: -1, message: 'Cannot get temp key');
    }

    var message = '$tokenId|$feeAddress|$tempKey';
    var sig = crypto.sign(crypto.decodeECPrivateKey(priKey), message);

    await _jsonRpc(method: 'token/updateFeeAddress', params: {
      'tokenId': tokenId,
      'feeAddress': feeAddress,
      'tempKey': tempKey,
      'signature': sig,
    });

    return resultCode == '200';
  }

  ///
  /// 트큰 금액 증가
  ///
  Future<bool> increaseToken({
    required String address,
    required String tokenId,
    required String amount,
    required String priKey,
  }) async {
    var tempKey = await _getKey('token', address);

    if (tempKey == null) {
      throw TokenException(code: -1, message: 'Cannot get temp key');
    }

    var message = '$tokenId|$amount|$tempKey';
    var sig = crypto.sign(crypto.decodeECPrivateKey(priKey), message);

    await _jsonRpc(method: 'token/increaseToken', params: {
      'tempKey': tempKey,
      'tokenId': tokenId,
      'amount': amount,
      'signature': sig,
    });

    return resultCode == '200';
  }

  ///
  /// 트큰 금액 감소
  ///
  Future<bool> burnToken({
    required String address,
    required String tokenId,
    required String amount,
    required String priKey,
  }) async {
    var tempKey = await _getKey('token', address);

    if (tempKey == null) {
      throw TokenException(code: -1, message: 'Cannot get temp key');
    }

    var message = '$tokenId|$amount|$tempKey';
    var sig = crypto.sign(crypto.decodeECPrivateKey(priKey), message);

    await _jsonRpc(method: 'token/burnToken', params: {
      'tempKey': tempKey,
      'tokenId': tokenId,
      'amount': amount,
      'signature': sig,
    });

    return resultCode == '200';
  }
  ///
  /// 토큰 [tokenId] 조회
  ///
  Future<Map> getStakingInfo(String tokenId) async {
    var result = await _jsonRpc(method: 'token/getStakingInfo', params: {
      'tokenId': tokenId,
    });
    // if (resultCode == '500') {
    //   return Map();
    // }
    // value = {_InternalLinkedHashMap} size = 5
    // 0 = {map entry} "tokenId" -> "VIXP"
    // 1 = {map entry} "address" -> "0x84f87Cc93A93798cECbCF8b08Fee7a5097d3cEa6"
    // 2 = {map entry} "amount" -> "522,192.00000000"
    // 3 = {map entry} "decimalPoint" -> 8
    // 4 = {map entry} "symbol" -> "VIX"
    return result;
  }


  ///
  ///
  Future<Map> createEthereumAddress() async {
    //keyIndex  : string
    //address  : string
    return await _jsonRpc(method: 'eth/createAddress', params: {
    });
  }


  ///address의 이더리움 balance
  ///
  Future<String> queryEthBalance(String address) async {
    return await _jsonRpc(method: 'eth/queryEthBalance', params: {
      'address': address ,
    });
  }

  ///address의 token balance
  ///
  Future<String> queryTokenBalance(String address,String contractAddress ) async {
    return await _jsonRpc(method: 'eth/queryTokenBalance', params: {
      'address': address ,
      'contractAddress': contractAddress ,
    });
  }


  ///
  /// 요청된 Address의 key에 대한 mnemonic word 를 반환
  ///
  Future<Map> exportEthereumKey(String keyIndex , {String languageType="en"}) async {
    //keyIndex  : string
    //address  : string
    //mnemonic : string
    return await _jsonRpc(method: 'eth/exportKey', params: {
      'keyIndex': keyIndex,
      'languageType': languageType,
    });
  }

  ///
  /// mnemonic 을 변환하여 address 반환
  ///
  Future<Map> importEthereumKey(String mnemonic,{String languageType="en" } ) async {
    // address : string
    // keyIndex  : string
    var result =  await _jsonRpc(method: 'eth/importKey', params: {
      'languageType': languageType,
      'mnemonic': mnemonic,
    });
    if (resultCode == '500') {
      return Map();
    }
    return result;
  }


  ///
  /// 토큰 목록 구하기
  ///
  Future<Map> getTokenList(
      {int pageNo = 1, int pageSize = 10, bool desc = false}) async {
    return await _jsonRpc(method: 'block/getTokenList', params: {
      'pageNumber': pageNo,
      'pageSize': pageSize,
      'order': desc ? 0 : 1,
    });
  }

  ///
  /// 토큰 [tokenId] 조회
  ///
  Future<Map> queryToken(String tokenId) async {
    var result = await _jsonRpc(method: 'token/queryToken', params: {
      'tokenId': tokenId,
    });
    // if (resultCode == '500') {
    //   return Map();
    // }
    return result;
  }

  ///
  /// 토큰  조회
  ///
  Future<List> queryTokenByAddress(String address) async {
    var result = await _jsonRpc(method: 'token/queryTokenByAddress', params: {
      'address': address,
    });
    //{resultCode: 500, resultMessage: A JSONArray text must start with '[' at 0 [character 1 line 1], TransactionID: , resultData: }
    if (resultCode == '500') {
      return [];
    }
    return result;
  }

  ///
  /// 계좌에 토큰 할당
  ///
  Future<bool> assignTokenToAddress({
    required String tokenId,
    required String address,
  }) async {
    await _jsonRpc(method: 'token/assignTokenToAddress', params: {
      'tokenId': tokenId,
      'to': address,
    });

    return resultCode == '200';
  }

  ///
  /// 수수료 없이 계좌 이체
  ///
  /// [from]에서 [to]로 [tokenId]를 [amount]만큼 [comment] 붙여 이체함.
  /// [from]의 PEM 비밀키 [ownerPriKey] 및 수수료 계좌의 [feePriKey]가 필요.
  ///
  Future<bool> systemTransfer({
    required String from,
    required String tokenId,
    required String to,
    required String amount,
    required String comment,
    required String ownerPriKey,
    required String feePriKey,
  }) async {
    var tempKey = await _getKey('transfer', from);

    if (tempKey == null) {
      throw TokenException(code: -1, message: 'Cannot get temp key');
    }

    var message = '$from|$tokenId|$to|$amount|$tempKey';
    var sig = crypto.sign(crypto.decodeECPrivateKey(ownerPriKey), message);
    var sig2 = crypto.sign(crypto.decodeECPrivateKey(feePriKey), sig);

    await _jsonRpc(method: 'token/systemTransfer', params: {
      'from': from,
      'tokenId': tokenId,
      'to': to,
      'amount': amount,
      'comment': comment,
      'tempKey': tempKey,
      'signature': sig,
      'signature2': sig2,
    });

    return resultCode == '200';
  }

  ///
  /// 계좌 이체
  ///
  /// [from]에서 [to]로 [tokenId]를 [amount]만큼 [comment] 붙여 이체함.
  /// [feeIncluded]에 수수료 포함 여부 지정.
  /// [from]의 PEM 비밀키 [priKey]가 필요.
  ///
  Future<bool> transfer({
    required String from,
    required String tokenId,
    required String to,
    required String amount,
    required String comment,
    required String keyIndex,
    bool feeIncluded = true,
  }) async {
    var tempKey = await _getKey('transfer', from);

    if (tempKey == null) {
      throw TokenException(code: -1, message: 'Cannot get temp key');
    }

    var txFeeIncluded = feeIncluded ? '1' : '0';
    var message = '$from|$tokenId|$to|$amount|$txFeeIncluded|$tempKey';
    // var sig = crypto.sign(crypto.decodeECPrivateKey(priKey), message);
    var sig = await signData(keyIndex,message);
    try {
    await _jsonRpc(method: 'token/transfer', params: {
      'from': from,
      'tokenId': tokenId,
      'to': to,
      'amount': amount,
      'comment': comment,
      'tempKey': tempKey,
      'feeInclude': txFeeIncluded,
      'signature': sig,
    });
    } on TokenException catch (e) {
    }
    return resultCode == '200';
  }

  ///
  /// 토큰 소유자로 계좌 이체
  ///
  /// [from]에서 토큰 소유자 계좌로 [tokenId]를 [amount]만큼 [comment] 붙여 이체함.
  /// [from]의 PEM 비밀키 [priKey]가 필요.
  ///
  Future<bool> transferToOwner({
    required String from,
    required String tokenId,
    required String amount,
    required String comment,
    required String priKey,
  }) async {
    var tempKey = await _getKey('transfer', from);

    if (tempKey == null) {
      throw TokenException(code: -1, message: 'Cannot get temp key');
    }

    var message = '$from|$tokenId|$amount|$tempKey';
    var sig = crypto.sign(crypto.decodeECPrivateKey(priKey), message);

    await _jsonRpc(method: 'token/transferToOwner', params: {
      'from': from,
      'tokenId': tokenId,
      'amount': amount,
      'comment': comment,
      'tempKey': tempKey,
      'signature': sig,
    });

    return resultCode == '200';
  }

  ///
  /// YolletPay 요청.
  /// [tokenId]를 사용자 계좌 [from]에서 결제 계좌 [to]로 [amount] 만큼 결제
  ///
  Future<Map> doYolletPay({
    required String tokenId,
    required String from,
    required String amount,
    required String to,
    required String keyIndex,
  }) async {
    var tempKey = await _getKey('transfer', from);

    if (tempKey == null) {
      throw TokenException(code: -1, message: 'Cannot get temp key');
    }

    var message = '$from|$tokenId|$to|$amount|$tempKey';
    // var sig = crypto.sign(crypto.decodeECPrivateKey(priKey), message);
    var sig = await signData(keyIndex,message);
    return {'key': tempKey, 'signature': sig};
  }

  ///
  /// 이체 목록 구하기
  /// {pageNumber, pageSize, totalPages, totalElements,
  ///   list: [{fromAddress, toAddress, tokenId, amount, comment, transactionId, transactionTime}]}
  ///
  /// * [address], 송신/수신 계좌
  /// * [tokenId], 트콘 아이디 (없을 시 VIX)
  /// * [fromDate], 검색 시작 날짜 (yyyy-MM-dd 포맷)
  /// * [toDate], 검색 종료 날짜 (yyyy-MM-dd 포맷)
  ///
  Future<Map> getTransferList({
    String? address,
    String? tokenId,
    String? fromDate,
    String? toDate,
    int pageNo = 1,
    int pageSize = 10,
    bool desc = false,
  }) async {
    if (address != null ||
        tokenId != null ||
        fromDate != null && toDate != null) {
      return await _jsonRpc(method: 'block/getTransferListWithParam', params: {
        'address': address ?? '',
        'tokenId': tokenId ?? '',
        'fromDate': fromDate ?? '',
        'toDate': toDate ?? '',
        'pageNumber': pageNo,
        'pageSize': pageSize,
        'order': desc ? 0 : 1
      });
    } else {
      return await _jsonRpc(method: 'block/getTransferList', params: {
        'pageNumber': pageNo,
        'pageSize': pageSize,
        'order': desc ? 0 : 1
      });
    }
  }

  ///
  /// 트랜잭션 [transactionId] 조회
  ///
  Future<Map> getTransaction(String transactionId) async {
    return await _jsonRpc(method: 'block/getTransaction', params: {
      'transactionId': transactionId,
    });
  }

  ///
  /// 트랜잭선 목록 조회
  ///
  Future<Map> getTransactionList(
      {int pageNo = 1, int pageSize = 10, bool desc = false}) async {
    return await _jsonRpc(method: 'block/getTransactionList', params: {
      'pageNumber': pageNo,
      'pageSize': pageSize,
      'order': desc ? 0 : 1,
    });
  }

  Future<String?> _getKey(String type, String address) async {
    return await _jsonRpc(method: 'token/getTempKey', params: {
      'types': type,
      'address': address,
    });
  }
///////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////
  ///
  ///  keyIndex 와 PublicKey, PrivateKey Mnemonic 을 리턴
  ///
  Future<Map> createKey() async {
    // keyIndex : string
    // publicKey : string
    // mnemonic : string
    return await _jsonRpc(method: 'token/createKey', params: {
    });
  }

  ///
  /// 요청된 data를 address의 PrivateKey로 서명한 결과값 전달
  ///
  Future<String> signData(String keyIndex , String data) async {
    //signData: string
    var result = await _jsonRpc(method: 'token/sign', params: {
      'keyIndex': keyIndex,
      'data': data,
    });
    if(result!=null && (result is Map)) {
      return result['signData'];
    }else{
      return result.toString();
    }
  }

  ///
  /// 요청된 data를 address의 PublicKey로 서명검증한 결과값 전달
  ///
  Future<String> verifyData(String keyIndex , String data, String signData) async {
    // verify_result : string (Y | N)

    var result = await _jsonRpc(method: 'token/verify', params: {
      'keyIndex': keyIndex,
      'data': data,
      'signData': signData,
    });
    if(result!=null) {
      return result['verify_result'];
    }else{
      return "";
    }
  }

  ///
  /// 요청된 Address의 key에 대한 mnemonic word 를 반환
  ///
  Future<Map> exportKey(String keyIndex , {String languageType="en"}) async {
    //mnemonic : string
    return await _jsonRpc(method: 'token/exportKey', params: {
      'keyIndex': keyIndex,
      'languageType': languageType,
    });
  }

  ///
  /// 요청된 Address의 key를 대한 mnemonic word 로 저장
  ///
  Future<Map> importKey(String mnemonic,{String languageType="en" } ) async {
    // keyIndex : string
    // publicKey : string
    return await _jsonRpc(method: 'token/importKey', params: {
      'languageType': languageType,
      'mnemonic': mnemonic,
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

enum FeeType {
  No, // 수수료 미적용
  FIXED, // 정률제
  FLAT, // 정액제
}

enum RoundType {
  HALF_UP, // 수수로 계산시 반올림
  UP, // 올림
  DOWN, // 내림
}

enum FeeYN {
  NO, // 수수료 없이 거래 불가
  YES, // 가능
  MIN, // 최소 금액으로 수수료 적용
}

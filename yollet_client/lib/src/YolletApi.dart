import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:pointycastle/export.dart';
import 'package:unique_identifier/unique_identifier.dart';
import 'package:yollet_client/yollet_client.dart';

import 'crypto/crypto.dart' as crypto;
import 'exception.dart';

///
/// Token API: http://pms.ibexlab.com/confluence/display/IBE/4.+%5BAPI%5D+TokenAPI+-20210402+Update
/// Block API: http://pms.ibexlab.com/confluence/display/IBE/8.+%5BAPI%5D+Block+API
///
class YolletApi {
  // Release build => Use real server
  // Develop build => Use develop server
  static const _YOLLET_API_URL = kReleaseMode
      ? 'https://yollet-api.yollet.net'
      : 'https://dev-yollet-api.yoshop.net';

  static String? _transactionId;
  static String? _resultCode;
  static String? _resultMessage;

  static String? get transactionId => _transactionId;

  static String? get resultCode => _resultCode;

  static String? get resultMessage => _resultMessage;


///////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////



  Future<dynamic> jsonRpc(
      {required String method, required Map params}) async {
    _transactionId = null;
    _resultCode = null;
    _resultMessage = null;

    var time = DateTime.now().millisecondsSinceEpoch.toString();
    var id = time.substring(time.length - 5);
    String deviceId = await getDeviceId();
    String userUuid = gRpcClient.userUuid ?? "";
    var req = {
      'jsonrpc': '2.0',
      'id': id,
      'method': method,
      'params': params,
      'deviceId': deviceId,
      'userUuid': userUuid,
    };

    print('JSON RPC REQUEST[$method]: $_YOLLET_API_URL $req');
    var response =
        await post(Uri.parse(_YOLLET_API_URL), body: jsonEncode(req));

    if (response.statusCode == 200) {
      var rsp = jsonDecode(response.body);
      print('JSON RPC RESPONSE[$method]: $rsp');
      var result = rsp['result'];

      if (result != null) {
        _resultCode = result['resultCode'];
        _resultMessage = result['resultMessage'];
        _transactionId = result['TransactionID'];
        return result['resultData'];
      }

      return null;
    } else {
      if (response.body.isNotEmpty) {
        print('JSON RPC ERROR[$method]: ${response.body}');

        try {
          var rsp = jsonDecode(response.body);
          var error = rsp['error'];

          if (error != null) {
            throw TokenException(code: error['code'], message: error['message']);
          }
        } on Exception {
        }

        throw TokenException(code: -1, message: response.body);
      } else {
        print(
            'JSON RPC ERROR[$method]: [${response.statusCode}]${response.reasonPhrase}');
        throw TokenException(
            code: response.statusCode, message: response.reasonPhrase);
      }
    }
  }

  Future<String> getDeviceId() async {
    String mac ="";
    try {
      mac = (await UniqueIdentifier.serial)??"";
    } on PlatformException {
      mac = '';
    }

    return mac;
  }
}

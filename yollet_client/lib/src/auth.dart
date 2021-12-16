import 'dart:convert';

import 'package:http/http.dart';

class Auth {
  static const _TARGET_SVC = 'auth.yoshop.net';
  static const _TARGET_PACKAGE = 'ibexlab.auth.v1';
  static const _TARGET_API = 'auth';
  static const _AUTH_STORE = '/auth';
  static const _AUTH_USER = '/auth-user';

  late String url;
  String? service;
  String? version;
  String? address;

  Future<bool> ready() async {
    try {
      Response rsp = await get(Uri.parse(url));
      return rsp.statusCode == 200;
    } on Exception {
      return false;
    }
  }

  Future<String?> authenticate({
    String? id,
    String? domain,
    String? password,
    String? token,
    bool isStore = false,
  }) async {
    String time = DateTime.now().millisecondsSinceEpoch.toString();
    String tranNo = time.substring(time.length - 4); // pos 에서 구하는 방식과 동일
    AuthRequest request = AuthRequest(
      common: AuthCommon(
        targetSvc: _TARGET_SVC,
        targetPackage: _TARGET_PACKAGE,
        targetApi: _TARGET_API,
        sourceSvc: service,
        sourceVer: version,
        sourceAddr: address,
        reqTimestamp: time,
        tranNo: tranNo,
      ),
      content: AuthRequestContent(id: id, domain: domain, password: password, token: token),
    );

    try {
      Response rsp = await post(Uri.parse(url + (isStore ? _AUTH_STORE : _AUTH_USER)),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(request.toJson()));
      AuthResponse response = AuthResponse.fromJson(jsonDecode(rsp.body));

      if (response.common.resCode != '000') {
        print('Authentication failed: [${response.common.resCode}]${response.common.resMessage}');
        return null;
      }

      return response.content.token;
    } on Exception catch (e) {
      print('Authentication failed: $e');
      return null;
    }
  }
}

class AuthRequest {
  final AuthCommon common;
  final AuthRequestContent content;

  AuthRequest({required this.common, required this.content});

  Map<String, dynamic> toJson() => {
        'common': common.toJson(),
        'content': content.toJson(),
      };
}

class AuthResponse {
  final AuthCommon common;
  final _AuthResponseContent content;

  AuthResponse({required this.common, required this.content});

  AuthResponse.fromJson(Map<String, dynamic> json)
      : common = AuthCommon.fromJson(json['common']),
        content = _AuthResponseContent.fromJson(json['content']);

  Map<String, dynamic> toJson() => {
        'common': common.toJson(),
        'content': content.toJson(),
      };
}

class AuthCommon {
  final String? targetSvc;
  final String? targetPackage;
  final String? targetApi;
  final String? sourceSvc;
  final String? sourceVer;
  final String? sourceAddr;
  final String? reqTimestamp;
  final String? rspTimestamp;
  final String? tranNo;
  final String? resCode;
  final String? resMessage;

  AuthCommon({
    this.targetSvc,
    this.targetPackage,
    this.targetApi,
    this.sourceSvc,
    this.sourceVer,
    this.sourceAddr,
    this.reqTimestamp,
    this.rspTimestamp,
    this.tranNo,
    this.resCode,
    this.resMessage,
  });

  AuthCommon.fromJson(Map<String, dynamic> json)
      : targetSvc = json['targetSvc'],
        targetPackage = json['targetPackage'],
        targetApi = json['targetApi'],
        sourceSvc = json['sourceSvc'],
        sourceVer = json['sourceVer'],
        sourceAddr = json['sourceAddr'],
        reqTimestamp = json['reqTimestamp'],
        rspTimestamp = json['rspTimestamp'],
        tranNo = json['tranNo'],
        resCode = json['resCode'],
        resMessage = json['resMessage'];

  Map<String, dynamic> toJson() => {
        'targetSvc': targetSvc,
        'targetPackage': targetPackage,
        'targetApi': targetApi,
        'sourceSvc': sourceSvc,
        'sourceVer': sourceVer,
        'sourceAddr': sourceAddr,
        'reqTimestamp': reqTimestamp,
        'rspTimestamp': rspTimestamp,
        'tranNo': tranNo,
        'resCode': resCode,
        'resMessage': resMessage,
      };
}

class AuthRequestContent {
  final String? id;
  final String? password;
  final String? domain;
  final String? token;

  AuthRequestContent({this.id, this.password, this.domain, this.token});

  Map<String, dynamic> toJson() => {
        'id': id,
        'password': password,
        'domain': domain,
        'token': token,
      };
}

class _AuthResponseContent {
  final String? token;

  _AuthResponseContent({this.token});

  _AuthResponseContent.fromJson(Map<String, dynamic> json) : token = json['token'];

  Map<String, dynamic> toJson() => {'token': token};
}

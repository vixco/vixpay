import 'dart:async';

import 'package:fixnum/fixnum.dart';
import 'package:grpc/grpc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import 'auth.dart';
import 'exception.dart';
import 'generated/api/v1/hello.pbgrpc.dart';
import 'generated/api/v1/message.pb.dart';
import 'generated/api/v1/service.pbgrpc.dart';
import 'generated/api/v1/message.pb.dart' as pbm;

final gRpcClient = GRpcClient.instance;

///
/// 인증이 필요할 경우 호출
///
/// * true 응답이면 요청을 재시도
/// * false 응답이면 요청을 재시도 하지 않음
///
typedef OnAuthenticate = Future<bool> Function();

class GRpcClient extends GRpcBaseClient {
  static const String _TAG = 'gRPC';
  static const String _PKG_CUSTOMERS_V1 = "g00.customers.v1";
  static const String _PKG_PAYMENTS_V1 = "g00.payments.v1";
  static const String _PKG_LICENSE_V1 = 'g00.license.v1';
  static const String _PKG_BUSINESS_V1 = 'g00.business.v1';

  static GRpcClient get instance => _instance;

  static final GRpcClient _instance = GRpcClient._internal();

  GRpcClient._internal();

  ///
  /// 접속 테스트
  ///
  Future<String> hello() async {
    return tryRequest<String>(() async {
      HelloReply response = await _helloClient.sayHello(HelloRequest()..name = 'gRPC');
      return response.message;
    });
  }

  ///
  /// 회원 등록
  ///
  /// * [userName], [telNo], [email] 외 다른 정보는 [others]에 {key1: value1, key2: value2, ...} 로 전달
  /// * 실패 시 GRpcException 발생
  ///   - 10: 사용자 아이디 중복 (Duplicate user id)
  ///   - 11: 전화번호 중복 (Duplicate telephone number)
  ///   - 12: 이메일 중복 (Duplicate email)
  ///   - 01: 기타 내부 에러
  Future<String> signUp({
    required String userId,
    required String password,
    String? userName,
    String? telNo,
    String? email,
    Map<String, String>? others,
  }) async {
    return tryRequest<String>(() async {
      User request = User()
        ..common = createCommon(_PKG_CUSTOMERS_V1, 'customers.signUp')
        ..content = (User_Content()
          ..userType = '000'
          ..userId = userId
          ..password = password
          ..userName = userName ?? ''
          ..telNo = telNo ?? ''
          ..email = email ?? ''
          ..userInfo.addAll((others ?? {}).entries.map((e) => KeyValue()
            ..key = e.key
            ..value = e.value)));
      User response = await _userClient.signUp(request);

      if (response.common.resCode != '00') {
        print('Error: (${response.common.resCode}) ${response.common.resMessage}');
        throw GRpcException.network(response.common, response.writeToJsonMap());
      }

      return response.content.uuid;
    });
  }

  ///
  /// 로그인 된 사용자 정보 구하기
  ///
  Future<Map<String, dynamic>> getUser() async {
    return tryRequest<Map<String, dynamic>>(() async {
      User request = User()
        ..common = createCommon(_PKG_CUSTOMERS_V1, 'customers.getUser')
        ..content = (User_Content()..uuid = userUuid ?? '');
      User response = await _userClient.getUser(request);

      if (response.common.resCode != '00') {
        print('Error: (${response.common.resCode}) ${response.common.resMessage}');
        throw GRpcException.network(response.common, response.writeToJsonMap());
      }

      return _toUserMap(response.content);
    });
  }

  ///
  /// 회원 정보 수정
  ///
  /// * [userName], [telNo], [email] 외 다른 정보는 [others]에 {key1: value1, key2: value2, ...} 로 전달
  /// * 성공 시 "00", 패스워드가 다르면 "13"
  /// * 특정 값을 삭제하고 싶다면 null 역할을 하는 "@NULL@" 넣음
  ///
  Future<String> updateUser({
    String? oldPassword,
    String? newPassword,
    String? userName,
    String? telNo,
    String? email,
    Map<String, dynamic>? others,
  }) async {
    return tryRequest<String>(() async {
      User request = User()
        ..common = createCommon(_PKG_CUSTOMERS_V1, 'customers.updateUser')
        ..content = (User_Content()
          ..uuid = userUuid ?? ''
          ..oldPassword = oldPassword ?? ''
          ..password = newPassword ?? ''
          ..userName = userName ?? ''
          ..telNo = telNo ?? ''
          ..email = email ?? ''
          ..userInfo.addAll((others ?? {}).entries.map((e) => KeyValue()
            ..key = e.key
            ..value = e.value)));
      Empty response = await _userClient.updateUser(request);
      print('Response: (${response.common.resCode}) ${response.common.resMessage}');
      return response.common.resCode;
    });
  }

  ///
  /// 회원 ID 구하기
  ///
  /// * telNo 또는 email 을 전달하면 일부 마스킹 된 ID 전달 받음
  ///
  Future<String> findUserId({String? telNo, String? email}) async {
    return tryRequest<String>(() async {
      User request = User()
        ..common = createCommon(_PKG_CUSTOMERS_V1, 'customers.findUserId')
        ..content = (User_Content()
          ..telNo = telNo ?? ''
          ..email = email ?? '');
      User response = await _userClient.findUserId(request);

      if (response.common.resCode != '00') {
        print('Error: (${response.common.resCode}) ${response.common.resMessage}');
        throw GRpcException.network(response.common, response.writeToJsonMap());
      }

      return '${response.content.userId}';
    });
  }

  ///
  /// 비밀 번호 초기화
  ///
  /// * 1단계: [telNo] 또는 [email] 전달
  /// * 2단계: SMS 나 email 통해 받은 인증번호를 [verificationCode] 에 전달
  ///
  Future<Map> resetPassword({String? telNo, String? email, String? verificationCode}) async {
    return tryRequest<Map>(() async {
      IdentityVerification request = IdentityVerification()
        ..common = createCommon(_PKG_CUSTOMERS_V1, 'customers.resetPassword')
        ..content = (IdentityVerification_Content()
          ..telNo = telNo ?? ''
          ..email = email ?? ''
          ..verificationCode = verificationCode ?? '');
      Empty response = await _userClient.resetPassword(request);

      if (response.common.resCode != '00') {
        print('Error: (${response.common.resCode}) ${response.common.resMessage}');
      }
      Map map = Map();
      map["resCode"] = response.common.resCode;
      map["resMessage"] = response.common.resMessage;
      return map;
    });
  }

  ///
  /// 인증 번호 요청
  ///
  /// * 성공 시 "00", 이미 등록된 번호이면 "22", 기타 에러 "01"
  ///
  Future<String> sendVerificationCode(String telNo) async {
    return tryRequest<String>(() async {
      IdentityVerification request = IdentityVerification()
        ..common = createCommon(_PKG_CUSTOMERS_V1, 'customers.verifyIdentity')
        ..content = (IdentityVerification_Content()
          ..telNo = telNo
          ..email = ''
          ..verificationCode = '');
      Empty response = await _userClient.verifyIdentity(request);
      print('Response: (${response.common.resCode}) ${response.common.resMessage}');
      return response.common.resCode;
    });
  }

  ///
  /// 인증 번호 검증
  ///
  /// * 성공 시 "00", 인증 코드가 다르면 "20", 인증 유효 시간이 지났으면 "21", 기타 에러 "01"
  ///
  Future<String> verifyVerificationCode(String telNo, String verificationCode) async {
    return tryRequest<String>(() async {
      IdentityVerification request = IdentityVerification()
        ..common = createCommon(_PKG_CUSTOMERS_V1, 'customers.verifyIdentity')
        ..content = (IdentityVerification_Content()
          ..telNo = telNo
          ..email = ''
          ..verificationCode = verificationCode);
      Empty response = await _userClient.verifyIdentity(request);
      print('Response: (${response.common.resCode}) ${response.common.resMessage}');
      return response.common.resCode;
    });
  }

  ///
  /// Unregister user
  ///
  /// * returns "00" (success), "02" (password mismatch), or "01" (other errors, for example, user not found)
  ///
  Future<String> unregister(String password) async {
    return tryRequest<String>(() async {
      User request = User()
        ..common = createCommon(_PKG_CUSTOMERS_V1, 'customers.unregister')
        ..content = (User_Content()
          ..uuid = userUuid ?? ''
          ..password = password);
      Empty response = await _userClient.unregister(request);
      print('Response: (${response.common.resCode}) ${response.common.resMessage}');
      return response.common.resCode;
    });
  }

  Map<String, dynamic> _toUserMap(User_Content content) {
    var userMap = {
      'uuid': content.uuid,
      'userId': content.userId,
      'userName': content.userName,
      'telNo': content.telNo,
      'email': content.email,
    };

    content.userInfo.forEach((i) => userMap[i.key] = i.value);
    return userMap;
  }

  ///
  /// Yollet Pay 결제
  ///
  Future<void> doYolletPayment(StreamController<Map> controller, Function onEvent) async {
    controller.add({});

    var request = controller.stream.map((data) {
      var content = YolletPayData_Content();

      if (data.isEmpty) {
        content..state = YolletPayData_State.START_PAY;
      } else {
        content
          ..state = YolletPayData_State.TRANSFER
          ..tranNo = data['tranNo']
          ..transferKey = data['key']
          ..transferSignature = data['signature']
          ..transferComment = data['comment'];
      }

      return YolletPayData()
        ..common = createCommon(_PKG_PAYMENTS_V1, 'payments.doYolletPayment')
        ..content = content;
    });

    try {
      await for (var response in _paymentClient.doYolletPayment(request)) {
        if (response.content.state == YolletPayData_State.REQUEST_TRANSFER) {
          onEvent('transfer', {
            'tranNo': response.content.tranNo,
            'tokenId': response.content.tokenId,
            'tokenAmount': response.content.tokenAmount,
            'settlementAddress': response.content.settlementAddress,
            'storeName': response.content.storeName,
            'comment': response.content.transferComment,
            'timestamp': response.common.rspTimestamp,
            'exchangeDateIndex': response.content.exchangeDateIndex,
            'exchangeRate': response.content.exchangeRate,
            'exchangeAmount': response.content.exchangeAmount,
          });
        } else if (response.content.state == YolletPayData_State.END_PAY) {
          if (response.common.resCode == '00') {
            onEvent('end_pay', {
              'tranNo': response.content.tranNo,
              'resCode': response.common.resCode,
              'resMessage': response.common.resMessage,
              'tokenId': response.content.tokenId,
              'tokenAmount': response.content.tokenAmount,
              'transactionId': response.content.transferTransactionId,
              'timestamp': response.common.rspTimestamp,
              'exchangeDateIndex': response.content.exchangeDateIndex,
              'exchangeRate': response.content.exchangeRate,
              'exchangeAmount': response.content.exchangeAmount,
            });
          } else {
            onEvent('error', {
              'resCode': response.common.resCode,
              'resMessage': response.common.resMessage,
              'timestamp': response.common.rspTimestamp,
            });
          }
        } else if (response.content.state == YolletPayData_State.END_REWARD) {
          if (response.common.resCode == '00') {
            onEvent('end_reward', {
              'tranNo': response.content.tranNo,
              'resCode': response.common.resCode,
              'resMessage': response.common.resMessage,
              'tokenId': response.content.tokenId,
              'tokenAmount': response.content.tokenAmount,
              'transactionId': response.content.transferTransactionId,
              'timestamp': response.common.rspTimestamp,
              'exchangeDateIndex': response.content.exchangeDateIndex,
              'exchangeRate': response.content.exchangeRate,
              'exchangeAmount': response.content.exchangeAmount,
            });
          } else {
            onEvent('error', {
              'resCode': response.common.resCode,
              'resMessage': response.common.resMessage,
              'timestamp': response.common.rspTimestamp,
            });
          }
        }
      }
    } on GrpcError catch (e) {
      print('GRPC ERROR: [${e.code}]${e.message}');
      onEvent('error', {
        'resCode': e.code.toString(),
        'resMessage': e.message,
        'timestamp': DateTime.now().millisecondsSinceEpoch,
      });

      if (onAuthenticate != null &&
          (e.code == StatusCode.unauthenticated || e.code == StatusCode.permissionDenied)) {
        print('Try to authenticate...');
        onAuthenticate!();
      }
    }
  }

  ///
  /// Yollet Reward 적립
  ///
  Future<Map> doYolletReward(String rewardId, String tokenAmount, String tokenId, userAddress) async {
    return tryRequest(() async {
      Stream<pbm.YolletPayData> request = Stream.value(YolletPayData()
        ..common = createCommon(_PKG_PAYMENTS_V1, 'payments.doYolletPayment')
        ..content = (YolletPayData_Content()
          ..state = YolletPayData_State.START_REWARD
          ..rewardId = rewardId
          ..tokenAmount = tokenAmount
          ..tokenId = tokenId
          ..userAddress = userAddress));
      await for (pbm.YolletPayData response in _paymentClient.doYolletPayment(request)) {
        if (response.common.resCode == '00') {
          return {
            'tranNo': response.content.tranNo,
            'resCode': response.common.resCode,
            'resMessage': response.common.resMessage,
            'tokenId': response.content.tokenId,
            'tokenAmount': response.content.tokenAmount,
            'transactionId': response.content.transferTransactionId,
            'timestamp': response.common.rspTimestamp,
            'exchangeDateIndex': response.content.exchangeDateIndex,
            'exchangeRate': response.content.exchangeRate,
            'exchangeAmount': response.content.exchangeAmount,
          };
        } else {
          return {
            'resCode': response.common.resCode,
            'resMessage': response.common.resMessage,
            'timestamp': response.common.rspTimestamp,
          };
        }
      }
    });
  }

  Future<Map> issueLicense({String? licenseVersion, String? packageName}) async {
    print(_TAG+'+++ issueLicense >>>');
    pbm.IssueLicenseRequest request = pbm.IssueLicenseRequest()
      ..common = createCommon(_PKG_LICENSE_V1, 'issueLicense')
      ..content = (pbm.IssueLicenseRequest_Content()
        ..licenseInfo = pbm.LicenseInfo(ver: licenseVersion, pkg: packageName));
    pbm.IssueLicenseResponse response =
    await tryRequest(() => _licenseClient.issueLicense(request));

    if (response.common.resCode != '00') {
      print(_TAG+ '+++ issueLicense >>> FAIL');
      throw GRpcException(code: 'EC0000', message: response.common.resMessage);
    }

    print(_TAG+ '+++ issueLicense >>> SUCCESS');
    return {'licenseInfo': _convertLicenseInfo(response.content.licenseInfo)};
  }

  Future<Map> requestPermission({
    required Map licenseMap,
    String? deviceId,
    String? storeId,
    String? terminalId,
    String? regDate,
    required int expireDate,
    String? updateDate,
    String? appVersion,
    String? appVersionCode,
    String? sign,
    String? state,
    String? note,
  }) async {
    print(_TAG+ '+++ requestPermission >>>');
    pbm.RequestPermissionRequest request = pbm.RequestPermissionRequest()
      ..common = createCommon(_PKG_LICENSE_V1, 'requestPermission')
      ..content = (pbm.RequestPermissionRequest_Content()
        ..licenseInfo = _convertMapToLicenseInfo(licenseMap['licenseInfo'] ?? Map())
        ..permission = pbm.LicensePermission(
          deviceId: deviceId,
          storeId: storeId,
          terminalId: terminalId,
          regDate: regDate,
          expireDate: Int64(expireDate),
          updateDate: updateDate,
          appVersion: appVersion,
          appVersionCode: appVersionCode,
          sign: sign,
          state: state,
          note: note,
        ));
    pbm.RequestPermissionResponse response =
    await tryRequest(() => _licenseClient.requestPermission(request));

    if (response.common.resCode != '00') {
      print(_TAG+ '+++ requestPermission >>> FAIL');
      throw GRpcException(code: 'EC0000', message: response.common.resMessage);
    }

    print(_TAG+ '+++ requestPermission >>> SUCCESS');

    return {
      'licenseInfo': _convertLicenseInfo(response.content.licenseInfo),
      'permission': _convertLicensePermission(response.content.permission),
    };
  }

  Future<Map> verifyLicense(
      {required Map licenseMap, required String updateDate, required String appVersion, required String appVersionCode}) async {
    print(_TAG+ '+++ verifyLicense >>>');
    pbm.VerifyLicenseRequest request = pbm.VerifyLicenseRequest()
      ..common = createCommon(_PKG_LICENSE_V1, 'verifyLicense')
      ..content = (pbm.VerifyLicenseRequest_Content()
        ..licenseInfo = _convertMapToLicenseInfo(licenseMap['licenseInfo'] ?? Map())
        ..permission = (_convertMapToLicensePermission(licenseMap['permission'] ?? Map())
          ..updateDate = updateDate
          ..appVersion = appVersion
          ..appVersionCode = appVersionCode)
        ..appVerInfo = pbm.AppVersionInfo());
    pbm.VerifyLicenseResponse response =
    await tryRequest(() => _licenseClient.verifyLicense(request));

    if (response.common.resCode != '00') {
      print(_TAG+ '+++ verifyLicense >>> FAIL');
      throw GRpcException(code: 'EC0000', message: response.common.resMessage);
    }

    print(_TAG+ '+++ verifyLicense >>> SUCCESS');

    return {
      'licenseInfo': _convertLicenseInfo(response.content.licenseInfo),
      'permission': _convertLicensePermission(response.content.permission),
      'appVerInfo': _convertAppVersionInfo(response.content.appVerInfo),
    };
  }

  Map _convertLicenseInfo(pbm.LicenseInfo licenseInfo) {
    return {
      'ver': licenseInfo.ver,
      'key': licenseInfo.key,
      'pkg': licenseInfo.pkg,
      'sign': licenseInfo.sign,
    };
  }

  pbm.LicenseInfo _convertMapToLicenseInfo(Map map) {
    return pbm.LicenseInfo(
      ver: map['ver'] ?? '',
      key: map['key'] ?? '',
      pkg: map['pkg'] ?? '',
      sign: map['sign'] ?? '',
    );
  }

  Map _convertLicensePermission(pbm.LicensePermission licensePermission) {
    return {
      'deviceId': licensePermission.deviceId,
      'storeId': licensePermission.storeId,
      'terminalId': licensePermission.terminalId,
      'regDate': licensePermission.regDate,
      'expireDate': licensePermission.expireDate.toInt(),
      'updateDate': licensePermission.updateDate,
      'appVersion': licensePermission.appVersion,
      'appVersionCode': licensePermission.appVersionCode,
      'sign': licensePermission.sign,
      'state': licensePermission.state,
      'note': licensePermission.note,
    };
  }

  pbm.LicensePermission _convertMapToLicensePermission(Map map) {
    return pbm.LicensePermission(
      deviceId: map['deviceId'] ?? '',
      storeId: map['storeId'] ?? '',
      terminalId: map['terminalId'] ?? '',
      regDate: map['regDate'] ?? '',
      expireDate: Int64(map['expireDate'] ?? 0),
      updateDate: map['updateDate'] ?? '',
      appVersion: map['appVersion'] ?? '',
      appVersionCode: map['appVersionCode'] ?? '',
      sign: map['sign'] ?? '',
      state: map['state'] ?? '1000',
      note: map['note'] ?? '',
    );
  }

  Map _convertAppVersionInfo(pbm.AppVersionInfo appVersionInfo) {
    return {
      'minVer': appVersionInfo.minVer,
      'lastVer': appVersionInfo.lastVer,
      'isLock': appVersionInfo.isLock,
    };
  }

  ///
  /// 상점 로그인 도메인 가져오기
  ///
  Future<List<String>> getLoginDomains() async {
    return tryRequest<List<String>>(() async {
      Empty request = Empty()..common = createCommon(_PKG_BUSINESS_V1, 'getLoginDomains');
      LoginDomain response = await _businessClient.getLoginDomains(request);

      if (response.common.resCode != '00') {
        throw GRpcException(code: response.common.resCode, message: response.common.resMessage);
      }

      return response.content.domain;
    });
  }

  ///
  /// 상점명 및 VIXP 계좌 가져오기
  ///
  Future<Map<String, dynamic>> getStoreTokenInfo() async {
    return tryRequest<Map<String, dynamic>>(() async {
      StoreTokenInfo request = StoreTokenInfo()
        ..common = createCommon(_PKG_BUSINESS_V1, 'getStoreTokenInfo');
      StoreTokenInfo response = await _businessClient.getStoreTokenInfo(request);

      if (response.common.resCode != '00') {
        throw GRpcException(code: response.common.resCode, message: response.common.resMessage);
      }

      return {
        'addresses': response.content.addresses,
        'storeName': response.content.storeName,
        'telNo': response.content.telNo,
      };
    });
  }
}

abstract class GRpcBaseClient {
  static const String _TARGET_NAME = "gRPC API";
  static const String _TARGET_SVC = "grpc.yoshop.net";

  Auth _auth = Auth();
  late ClientChannel _channel;
  String? _service;
  String? _version;
  String? _userUuid;
  String? _userToken;
  String? _storeToken;
  late HelloClient _helloClient;
  late UserServiceClient _userClient;
  late PaymentsServiceClient _paymentClient;
  late LicenseServiceClient _licenseClient;
  late BusinessServiceClient _businessClient;

  /// 로그인 성공한 경우 회원 [userUuid]
  String? get userUuid => _userUuid;

  /// 로그인 성공한 경우 인증 [token]
  String? get token => _userToken;

  /// 로그인 성공한 경우 인증 [storeToken]
  String? get storeToken => _storeToken;

  /// gRPC 서버 주소 설정
  set url(String url) {
    Uri uri = Uri.parse(url);

    if (uri.scheme == 'http') {
      _channel = ClientChannel(
        uri.host,
        port: uri.port,
        options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
      );
    } else {
      _channel = ClientChannel(uri.host, port: uri.port);
    }

    _helloClient = HelloClient(_channel);
    _userClient = UserServiceClient(_channel);
    _paymentClient = PaymentsServiceClient(_channel);
    _licenseClient = LicenseServiceClient(_channel);
    _businessClient = BusinessServiceClient(_channel);
  }

  /// 인증 서버 주소 설정
  set authUrl(String authUrl) {
    _auth.url = authUrl;
  }

  /// [service] 예로 Yollet
  /// * http://pms.ibexlab.com/confluence/pages/viewpage.action?pageId=24281269
  set service(String service) {
    _service = service;
    _auth.service = service;
  }

  /// [version] 예로 1.0.0
  /// * http://pms.ibexlab.com/confluence/pages/viewpage.action?pageId=24281269
  set version(String version) {
    _version = version;
    _auth.version = version;
  }

  /// 인증이 필요할 시 호출됨
  OnAuthenticate? onAuthenticate;

  ///
  /// JWT 토큰 설정
  ///
  void setToken(String? token, {bool isStore = false}) {
    if (isStore) {
      _storeToken = null;
    } else {
      _userToken = null;
      _userUuid = null;
    }

    if (token == null) {
      return;
    }

    if (isStore) {
      _storeToken = token;
      print('Authenticated store');
    } else {
      var decoded = JwtDecoder.decode(token);
      _userToken = token;
      _userUuid = decoded['user'];
      print('Authenticated user: $_userUuid');
    }

    var options = CallOptions(metadata: {'Authorization': 'Bearer $token'});
    _authenticated(options, isStore: isStore);
  }

  ///
  /// JWT 토큰 유효 기간 연장
  ///
  Future<bool> validateToken([String? token]) async {
    _userToken = await _auth.authenticate(token: token ?? _userToken);

    if (_userToken == null) {
      _userUuid = null;
      _authenticated(null);
      return false;
    }

    setToken(_userToken);
    return true;
  }

  ///
  /// StoreJWT 토큰 유효 기간 연장
  ///
  Future<bool> validateStoreToken([String? token]) async {
    _storeToken = await _auth.authenticate(token: token ?? _storeToken);

    if (_storeToken == null) {
      _authenticated(null,isStore:true);
      return false;
    }

    setToken(_storeToken,isStore: true);
    return true;
  }

  ///
  /// 로그인
  ///
  Future<bool> login({String? id, String? domain, String? password, bool isStore = false}) async {
    if (id == null || password == null) {
      print('No authentication data');
      return false;
    }

    var token = await _auth.authenticate(id: id, domain: domain, password: password, isStore: isStore);

    if (isStore) {
      _storeToken = token;
    } else {
      _userToken = token;
    }

    if (token == null) {
      _authenticated(null, isStore: isStore);

      if (!isStore) {
        _userUuid = null;
      }

      return false;
    }

    setToken(token, isStore: isStore);
    return true;
  }

  ///
  /// 로그아웃
  ///
  void logout() {
    _userUuid = null;
    _userToken = null;
    _authenticated(null);
    _authenticated(null, isStore: true);
  }

  void _authenticated(CallOptions? options, {bool isStore = false}) {
    if (isStore) {
      _businessClient = BusinessServiceClient(_channel, options: options);
    } else {
      _helloClient = HelloClient(_channel, options: options);
      _userClient = UserServiceClient(_channel, options: options);
      _paymentClient = PaymentsServiceClient(_channel, options: options);
      _licenseClient = LicenseServiceClient(_channel, options: options);
    }
  }

  Future<T> tryRequest<T>(Function request) async {
    try {
      return await request();
    } on GrpcError catch (e) {
      print('GRPC ERROR: [${e.code}]${e.message}');

      if (onAuthenticate != null &&
          (e.code == StatusCode.unauthenticated || e.code == StatusCode.permissionDenied)) {
        print('Try to authenticate...');

        if (await onAuthenticate!()) {
          try {
            return await request();
          } on GrpcError catch (e) {
            print('GRPC ERROR: [${e.code}]${e.message}');
            throw GRpcException(code: e.code.toString(), message: e.message);
          }
        }
      }

      throw GRpcException(code: e.code.toString(), message: e.message);
    }
  }

  Common createCommon(String package, String api) {
    String time = DateTime.now().microsecondsSinceEpoch.toString();
    String tranNo = time.substring(time.length - 5);

    return Common.create()
      ..targetName = _TARGET_NAME
      ..targetSvc = _TARGET_SVC
      ..targetPackage = package
      ..targetApi = api
      ..sourceSvc = _service ?? ''
      ..sourceVer = _version ?? ''
      ..sourceAddr = _userUuid ?? ''
      ..reqTimestamp = time
      ..tranNo = tranNo;
  }
}

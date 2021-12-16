///
//  Generated code. Do not modify.
//  source: api/v1/message.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'message.pbenum.dart';

export 'message.pbenum.dart';

class Route extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Route', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nextSvc')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nextPackage')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nextApi')
    ..aOB(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'holdRes')
    ..aOB(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'completed')
    ..hasRequiredFields = false
  ;

  Route._() : super();
  factory Route({
    $core.String? nextSvc,
    $core.String? nextPackage,
    $core.String? nextApi,
    $core.bool? holdRes,
    $core.bool? completed,
  }) {
    final _result = create();
    if (nextSvc != null) {
      _result.nextSvc = nextSvc;
    }
    if (nextPackage != null) {
      _result.nextPackage = nextPackage;
    }
    if (nextApi != null) {
      _result.nextApi = nextApi;
    }
    if (holdRes != null) {
      _result.holdRes = holdRes;
    }
    if (completed != null) {
      _result.completed = completed;
    }
    return _result;
  }
  factory Route.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Route.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Route clone() => Route()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Route copyWith(void Function(Route) updates) => super.copyWith((message) => updates(message as Route)) as Route; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Route create() => Route._();
  Route createEmptyInstance() => create();
  static $pb.PbList<Route> createRepeated() => $pb.PbList<Route>();
  @$core.pragma('dart2js:noInline')
  static Route getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Route>(create);
  static Route? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get nextSvc => $_getSZ(0);
  @$pb.TagNumber(1)
  set nextSvc($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNextSvc() => $_has(0);
  @$pb.TagNumber(1)
  void clearNextSvc() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get nextPackage => $_getSZ(1);
  @$pb.TagNumber(2)
  set nextPackage($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNextPackage() => $_has(1);
  @$pb.TagNumber(2)
  void clearNextPackage() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get nextApi => $_getSZ(2);
  @$pb.TagNumber(3)
  set nextApi($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasNextApi() => $_has(2);
  @$pb.TagNumber(3)
  void clearNextApi() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get holdRes => $_getBF(3);
  @$pb.TagNumber(4)
  set holdRes($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasHoldRes() => $_has(3);
  @$pb.TagNumber(4)
  void clearHoldRes() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get completed => $_getBF(4);
  @$pb.TagNumber(5)
  set completed($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasCompleted() => $_has(4);
  @$pb.TagNumber(5)
  void clearCompleted() => clearField(5);
}

class Common extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Common', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'targetName')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'targetSvc')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'targetPackage')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'targetApi')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sourceSvc')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sourceVer')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sourceAddr')
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'reqTimestamp')
    ..aOS(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'languageCode')
    ..aOS(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'rspTimestamp')
    ..aOS(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tranNo')
    ..aOS(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'resCode')
    ..aOS(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'resMessage')
    ..pc<Route>(14, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'routes', $pb.PbFieldType.PM, subBuilder: Route.create)
    ..aOS(15, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'authorization')
    ..hasRequiredFields = false
  ;

  Common._() : super();
  factory Common({
    $core.String? targetName,
    $core.String? targetSvc,
    $core.String? targetPackage,
    $core.String? targetApi,
    $core.String? sourceSvc,
    $core.String? sourceVer,
    $core.String? sourceAddr,
    $core.String? reqTimestamp,
    $core.String? languageCode,
    $core.String? rspTimestamp,
    $core.String? tranNo,
    $core.String? resCode,
    $core.String? resMessage,
    $core.Iterable<Route>? routes,
    $core.String? authorization,
  }) {
    final _result = create();
    if (targetName != null) {
      _result.targetName = targetName;
    }
    if (targetSvc != null) {
      _result.targetSvc = targetSvc;
    }
    if (targetPackage != null) {
      _result.targetPackage = targetPackage;
    }
    if (targetApi != null) {
      _result.targetApi = targetApi;
    }
    if (sourceSvc != null) {
      _result.sourceSvc = sourceSvc;
    }
    if (sourceVer != null) {
      _result.sourceVer = sourceVer;
    }
    if (sourceAddr != null) {
      _result.sourceAddr = sourceAddr;
    }
    if (reqTimestamp != null) {
      _result.reqTimestamp = reqTimestamp;
    }
    if (languageCode != null) {
      _result.languageCode = languageCode;
    }
    if (rspTimestamp != null) {
      _result.rspTimestamp = rspTimestamp;
    }
    if (tranNo != null) {
      _result.tranNo = tranNo;
    }
    if (resCode != null) {
      _result.resCode = resCode;
    }
    if (resMessage != null) {
      _result.resMessage = resMessage;
    }
    if (routes != null) {
      _result.routes.addAll(routes);
    }
    if (authorization != null) {
      _result.authorization = authorization;
    }
    return _result;
  }
  factory Common.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Common.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Common clone() => Common()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Common copyWith(void Function(Common) updates) => super.copyWith((message) => updates(message as Common)) as Common; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Common create() => Common._();
  Common createEmptyInstance() => create();
  static $pb.PbList<Common> createRepeated() => $pb.PbList<Common>();
  @$core.pragma('dart2js:noInline')
  static Common getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Common>(create);
  static Common? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get targetName => $_getSZ(0);
  @$pb.TagNumber(1)
  set targetName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTargetName() => $_has(0);
  @$pb.TagNumber(1)
  void clearTargetName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get targetSvc => $_getSZ(1);
  @$pb.TagNumber(2)
  set targetSvc($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTargetSvc() => $_has(1);
  @$pb.TagNumber(2)
  void clearTargetSvc() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get targetPackage => $_getSZ(2);
  @$pb.TagNumber(3)
  set targetPackage($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTargetPackage() => $_has(2);
  @$pb.TagNumber(3)
  void clearTargetPackage() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get targetApi => $_getSZ(3);
  @$pb.TagNumber(4)
  set targetApi($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTargetApi() => $_has(3);
  @$pb.TagNumber(4)
  void clearTargetApi() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get sourceSvc => $_getSZ(4);
  @$pb.TagNumber(5)
  set sourceSvc($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasSourceSvc() => $_has(4);
  @$pb.TagNumber(5)
  void clearSourceSvc() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get sourceVer => $_getSZ(5);
  @$pb.TagNumber(6)
  set sourceVer($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasSourceVer() => $_has(5);
  @$pb.TagNumber(6)
  void clearSourceVer() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get sourceAddr => $_getSZ(6);
  @$pb.TagNumber(7)
  set sourceAddr($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasSourceAddr() => $_has(6);
  @$pb.TagNumber(7)
  void clearSourceAddr() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get reqTimestamp => $_getSZ(7);
  @$pb.TagNumber(8)
  set reqTimestamp($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasReqTimestamp() => $_has(7);
  @$pb.TagNumber(8)
  void clearReqTimestamp() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get languageCode => $_getSZ(8);
  @$pb.TagNumber(9)
  set languageCode($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasLanguageCode() => $_has(8);
  @$pb.TagNumber(9)
  void clearLanguageCode() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get rspTimestamp => $_getSZ(9);
  @$pb.TagNumber(10)
  set rspTimestamp($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasRspTimestamp() => $_has(9);
  @$pb.TagNumber(10)
  void clearRspTimestamp() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get tranNo => $_getSZ(10);
  @$pb.TagNumber(11)
  set tranNo($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasTranNo() => $_has(10);
  @$pb.TagNumber(11)
  void clearTranNo() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get resCode => $_getSZ(11);
  @$pb.TagNumber(12)
  set resCode($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasResCode() => $_has(11);
  @$pb.TagNumber(12)
  void clearResCode() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get resMessage => $_getSZ(12);
  @$pb.TagNumber(13)
  set resMessage($core.String v) { $_setString(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasResMessage() => $_has(12);
  @$pb.TagNumber(13)
  void clearResMessage() => clearField(13);

  @$pb.TagNumber(14)
  $core.List<Route> get routes => $_getList(13);

  @$pb.TagNumber(15)
  $core.String get authorization => $_getSZ(14);
  @$pb.TagNumber(15)
  set authorization($core.String v) { $_setString(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasAuthorization() => $_has(14);
  @$pb.TagNumber(15)
  void clearAuthorization() => clearField(15);
}

class Empty extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Empty', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api.v1'), createEmptyInstance: create)
    ..aOM<Common>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'common', subBuilder: Common.create)
    ..hasRequiredFields = false
  ;

  Empty._() : super();
  factory Empty({
    Common? common,
  }) {
    final _result = create();
    if (common != null) {
      _result.common = common;
    }
    return _result;
  }
  factory Empty.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Empty.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Empty clone() => Empty()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Empty copyWith(void Function(Empty) updates) => super.copyWith((message) => updates(message as Empty)) as Empty; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Empty create() => Empty._();
  Empty createEmptyInstance() => create();
  static $pb.PbList<Empty> createRepeated() => $pb.PbList<Empty>();
  @$core.pragma('dart2js:noInline')
  static Empty getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Empty>(create);
  static Empty? _defaultInstance;

  @$pb.TagNumber(1)
  Common get common => $_getN(0);
  @$pb.TagNumber(1)
  set common(Common v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCommon() => $_has(0);
  @$pb.TagNumber(1)
  void clearCommon() => clearField(1);
  @$pb.TagNumber(1)
  Common ensureCommon() => $_ensure(0);
}

class User_Content extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'User.Content', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uuid')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userType')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'domain')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'password')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userName')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'telNo')
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'email')
    ..pc<KeyValue>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userInfo', $pb.PbFieldType.PM, subBuilder: KeyValue.create)
    ..aOM<Device>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'device', subBuilder: Device.create)
    ..aOS(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'oldPassword')
    ..hasRequiredFields = false
  ;

  User_Content._() : super();
  factory User_Content({
    $core.String? uuid,
    $core.String? userType,
    $core.String? userId,
    $core.String? domain,
    $core.String? password,
    $core.String? userName,
    $core.String? telNo,
    $core.String? email,
    $core.Iterable<KeyValue>? userInfo,
    Device? device,
    $core.String? oldPassword,
  }) {
    final _result = create();
    if (uuid != null) {
      _result.uuid = uuid;
    }
    if (userType != null) {
      _result.userType = userType;
    }
    if (userId != null) {
      _result.userId = userId;
    }
    if (domain != null) {
      _result.domain = domain;
    }
    if (password != null) {
      _result.password = password;
    }
    if (userName != null) {
      _result.userName = userName;
    }
    if (telNo != null) {
      _result.telNo = telNo;
    }
    if (email != null) {
      _result.email = email;
    }
    if (userInfo != null) {
      _result.userInfo.addAll(userInfo);
    }
    if (device != null) {
      _result.device = device;
    }
    if (oldPassword != null) {
      _result.oldPassword = oldPassword;
    }
    return _result;
  }
  factory User_Content.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory User_Content.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  User_Content clone() => User_Content()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  User_Content copyWith(void Function(User_Content) updates) => super.copyWith((message) => updates(message as User_Content)) as User_Content; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static User_Content create() => User_Content._();
  User_Content createEmptyInstance() => create();
  static $pb.PbList<User_Content> createRepeated() => $pb.PbList<User_Content>();
  @$core.pragma('dart2js:noInline')
  static User_Content getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<User_Content>(create);
  static User_Content? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uuid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uuid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUuid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUuid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userType => $_getSZ(1);
  @$pb.TagNumber(2)
  set userType($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserType() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserType() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get userId => $_getSZ(2);
  @$pb.TagNumber(3)
  set userId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUserId() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get domain => $_getSZ(3);
  @$pb.TagNumber(4)
  set domain($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDomain() => $_has(3);
  @$pb.TagNumber(4)
  void clearDomain() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get password => $_getSZ(4);
  @$pb.TagNumber(5)
  set password($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPassword() => $_has(4);
  @$pb.TagNumber(5)
  void clearPassword() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get userName => $_getSZ(5);
  @$pb.TagNumber(6)
  set userName($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasUserName() => $_has(5);
  @$pb.TagNumber(6)
  void clearUserName() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get telNo => $_getSZ(6);
  @$pb.TagNumber(7)
  set telNo($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasTelNo() => $_has(6);
  @$pb.TagNumber(7)
  void clearTelNo() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get email => $_getSZ(7);
  @$pb.TagNumber(8)
  set email($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasEmail() => $_has(7);
  @$pb.TagNumber(8)
  void clearEmail() => clearField(8);

  @$pb.TagNumber(9)
  $core.List<KeyValue> get userInfo => $_getList(8);

  @$pb.TagNumber(10)
  Device get device => $_getN(9);
  @$pb.TagNumber(10)
  set device(Device v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasDevice() => $_has(9);
  @$pb.TagNumber(10)
  void clearDevice() => clearField(10);
  @$pb.TagNumber(10)
  Device ensureDevice() => $_ensure(9);

  @$pb.TagNumber(11)
  $core.String get oldPassword => $_getSZ(10);
  @$pb.TagNumber(11)
  set oldPassword($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasOldPassword() => $_has(10);
  @$pb.TagNumber(11)
  void clearOldPassword() => clearField(11);
}

class User extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'User', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api.v1'), createEmptyInstance: create)
    ..aOM<Common>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'common', subBuilder: Common.create)
    ..aOM<User_Content>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'content', subBuilder: User_Content.create)
    ..hasRequiredFields = false
  ;

  User._() : super();
  factory User({
    Common? common,
    User_Content? content,
  }) {
    final _result = create();
    if (common != null) {
      _result.common = common;
    }
    if (content != null) {
      _result.content = content;
    }
    return _result;
  }
  factory User.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory User.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  User clone() => User()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  User copyWith(void Function(User) updates) => super.copyWith((message) => updates(message as User)) as User; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static User create() => User._();
  User createEmptyInstance() => create();
  static $pb.PbList<User> createRepeated() => $pb.PbList<User>();
  @$core.pragma('dart2js:noInline')
  static User getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<User>(create);
  static User? _defaultInstance;

  @$pb.TagNumber(1)
  Common get common => $_getN(0);
  @$pb.TagNumber(1)
  set common(Common v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCommon() => $_has(0);
  @$pb.TagNumber(1)
  void clearCommon() => clearField(1);
  @$pb.TagNumber(1)
  Common ensureCommon() => $_ensure(0);

  @$pb.TagNumber(2)
  User_Content get content => $_getN(1);
  @$pb.TagNumber(2)
  set content(User_Content v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasContent() => $_has(1);
  @$pb.TagNumber(2)
  void clearContent() => clearField(2);
  @$pb.TagNumber(2)
  User_Content ensureContent() => $_ensure(1);
}

class IdentityVerification_Content extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'IdentityVerification.Content', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'telNo')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'email')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'verificationCode')
    ..hasRequiredFields = false
  ;

  IdentityVerification_Content._() : super();
  factory IdentityVerification_Content({
    $core.String? telNo,
    $core.String? email,
    $core.String? verificationCode,
  }) {
    final _result = create();
    if (telNo != null) {
      _result.telNo = telNo;
    }
    if (email != null) {
      _result.email = email;
    }
    if (verificationCode != null) {
      _result.verificationCode = verificationCode;
    }
    return _result;
  }
  factory IdentityVerification_Content.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IdentityVerification_Content.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  IdentityVerification_Content clone() => IdentityVerification_Content()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  IdentityVerification_Content copyWith(void Function(IdentityVerification_Content) updates) => super.copyWith((message) => updates(message as IdentityVerification_Content)) as IdentityVerification_Content; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static IdentityVerification_Content create() => IdentityVerification_Content._();
  IdentityVerification_Content createEmptyInstance() => create();
  static $pb.PbList<IdentityVerification_Content> createRepeated() => $pb.PbList<IdentityVerification_Content>();
  @$core.pragma('dart2js:noInline')
  static IdentityVerification_Content getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IdentityVerification_Content>(create);
  static IdentityVerification_Content? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get telNo => $_getSZ(0);
  @$pb.TagNumber(1)
  set telNo($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTelNo() => $_has(0);
  @$pb.TagNumber(1)
  void clearTelNo() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get email => $_getSZ(1);
  @$pb.TagNumber(2)
  set email($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEmail() => $_has(1);
  @$pb.TagNumber(2)
  void clearEmail() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get verificationCode => $_getSZ(2);
  @$pb.TagNumber(3)
  set verificationCode($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasVerificationCode() => $_has(2);
  @$pb.TagNumber(3)
  void clearVerificationCode() => clearField(3);
}

class IdentityVerification extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'IdentityVerification', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api.v1'), createEmptyInstance: create)
    ..aOM<Common>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'common', subBuilder: Common.create)
    ..aOM<IdentityVerification_Content>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'content', subBuilder: IdentityVerification_Content.create)
    ..hasRequiredFields = false
  ;

  IdentityVerification._() : super();
  factory IdentityVerification({
    Common? common,
    IdentityVerification_Content? content,
  }) {
    final _result = create();
    if (common != null) {
      _result.common = common;
    }
    if (content != null) {
      _result.content = content;
    }
    return _result;
  }
  factory IdentityVerification.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IdentityVerification.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  IdentityVerification clone() => IdentityVerification()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  IdentityVerification copyWith(void Function(IdentityVerification) updates) => super.copyWith((message) => updates(message as IdentityVerification)) as IdentityVerification; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static IdentityVerification create() => IdentityVerification._();
  IdentityVerification createEmptyInstance() => create();
  static $pb.PbList<IdentityVerification> createRepeated() => $pb.PbList<IdentityVerification>();
  @$core.pragma('dart2js:noInline')
  static IdentityVerification getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IdentityVerification>(create);
  static IdentityVerification? _defaultInstance;

  @$pb.TagNumber(1)
  Common get common => $_getN(0);
  @$pb.TagNumber(1)
  set common(Common v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCommon() => $_has(0);
  @$pb.TagNumber(1)
  void clearCommon() => clearField(1);
  @$pb.TagNumber(1)
  Common ensureCommon() => $_ensure(0);

  @$pb.TagNumber(2)
  IdentityVerification_Content get content => $_getN(1);
  @$pb.TagNumber(2)
  set content(IdentityVerification_Content v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasContent() => $_has(1);
  @$pb.TagNumber(2)
  void clearContent() => clearField(2);
  @$pb.TagNumber(2)
  IdentityVerification_Content ensureContent() => $_ensure(1);
}

class KeyValue extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'KeyValue', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'key')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'value')
    ..hasRequiredFields = false
  ;

  KeyValue._() : super();
  factory KeyValue({
    $core.String? key,
    $core.String? value,
  }) {
    final _result = create();
    if (key != null) {
      _result.key = key;
    }
    if (value != null) {
      _result.value = value;
    }
    return _result;
  }
  factory KeyValue.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory KeyValue.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  KeyValue clone() => KeyValue()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  KeyValue copyWith(void Function(KeyValue) updates) => super.copyWith((message) => updates(message as KeyValue)) as KeyValue; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static KeyValue create() => KeyValue._();
  KeyValue createEmptyInstance() => create();
  static $pb.PbList<KeyValue> createRepeated() => $pb.PbList<KeyValue>();
  @$core.pragma('dart2js:noInline')
  static KeyValue getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<KeyValue>(create);
  static KeyValue? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get key => $_getSZ(0);
  @$pb.TagNumber(1)
  set key($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearKey() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get value => $_getSZ(1);
  @$pb.TagNumber(2)
  set value($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearValue() => clearField(2);
}

class Device extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Device', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'connectionType')
    ..pPS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'connectionData')
    ..hasRequiredFields = false
  ;

  Device._() : super();
  factory Device({
    $core.String? connectionType,
    $core.Iterable<$core.String>? connectionData,
  }) {
    final _result = create();
    if (connectionType != null) {
      _result.connectionType = connectionType;
    }
    if (connectionData != null) {
      _result.connectionData.addAll(connectionData);
    }
    return _result;
  }
  factory Device.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Device.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Device clone() => Device()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Device copyWith(void Function(Device) updates) => super.copyWith((message) => updates(message as Device)) as Device; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Device create() => Device._();
  Device createEmptyInstance() => create();
  static $pb.PbList<Device> createRepeated() => $pb.PbList<Device>();
  @$core.pragma('dart2js:noInline')
  static Device getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Device>(create);
  static Device? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get connectionType => $_getSZ(0);
  @$pb.TagNumber(1)
  set connectionType($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasConnectionType() => $_has(0);
  @$pb.TagNumber(1)
  void clearConnectionType() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.String> get connectionData => $_getList(1);
}

class YolletPayData_Content extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'YolletPayData.Content', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api.v1'), createEmptyInstance: create)
    ..e<YolletPayData_State>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'state', $pb.PbFieldType.OE, defaultOrMaker: YolletPayData_State.START_PAY, valueOf: YolletPayData_State.valueOf, enumValues: YolletPayData_State.values)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tranNo')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userUuid')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tokenId')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userAddress')
    ..aInt64(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'expirationTime')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'settlementAddress')
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'storeName')
    ..aOS(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tokenAmount')
    ..aOS(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'transferKey')
    ..aOS(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'transferSignature')
    ..aOS(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'transferComment')
    ..aOS(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'transferTransactionId')
    ..aOS(14, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'approvalNo')
    ..aOS(15, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'approvalDate')
    ..aOS(16, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'exchangeDateIndex')
    ..aOS(17, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'exchangeRate')
    ..aOS(18, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'exchangeAmount')
    ..aOS(19, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'exchangeCurrency')
    ..aOS(20, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'rewardId')
    ..aOS(21, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'rewardDate')
    ..aOS(22, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'rewardReason')
    ..aOS(23, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tid')
    ..hasRequiredFields = false
  ;

  YolletPayData_Content._() : super();
  factory YolletPayData_Content({
    YolletPayData_State? state,
    $core.String? tranNo,
    $core.String? userUuid,
    $core.String? tokenId,
    $core.String? userAddress,
    $fixnum.Int64? expirationTime,
    $core.String? settlementAddress,
    $core.String? storeName,
    $core.String? tokenAmount,
    $core.String? transferKey,
    $core.String? transferSignature,
    $core.String? transferComment,
    $core.String? transferTransactionId,
    $core.String? approvalNo,
    $core.String? approvalDate,
    $core.String? exchangeDateIndex,
    $core.String? exchangeRate,
    $core.String? exchangeAmount,
    $core.String? exchangeCurrency,
    $core.String? rewardId,
    $core.String? rewardDate,
    $core.String? rewardReason,
    $core.String? tid,
  }) {
    final _result = create();
    if (state != null) {
      _result.state = state;
    }
    if (tranNo != null) {
      _result.tranNo = tranNo;
    }
    if (userUuid != null) {
      _result.userUuid = userUuid;
    }
    if (tokenId != null) {
      _result.tokenId = tokenId;
    }
    if (userAddress != null) {
      _result.userAddress = userAddress;
    }
    if (expirationTime != null) {
      _result.expirationTime = expirationTime;
    }
    if (settlementAddress != null) {
      _result.settlementAddress = settlementAddress;
    }
    if (storeName != null) {
      _result.storeName = storeName;
    }
    if (tokenAmount != null) {
      _result.tokenAmount = tokenAmount;
    }
    if (transferKey != null) {
      _result.transferKey = transferKey;
    }
    if (transferSignature != null) {
      _result.transferSignature = transferSignature;
    }
    if (transferComment != null) {
      _result.transferComment = transferComment;
    }
    if (transferTransactionId != null) {
      _result.transferTransactionId = transferTransactionId;
    }
    if (approvalNo != null) {
      _result.approvalNo = approvalNo;
    }
    if (approvalDate != null) {
      _result.approvalDate = approvalDate;
    }
    if (exchangeDateIndex != null) {
      _result.exchangeDateIndex = exchangeDateIndex;
    }
    if (exchangeRate != null) {
      _result.exchangeRate = exchangeRate;
    }
    if (exchangeAmount != null) {
      _result.exchangeAmount = exchangeAmount;
    }
    if (exchangeCurrency != null) {
      _result.exchangeCurrency = exchangeCurrency;
    }
    if (rewardId != null) {
      _result.rewardId = rewardId;
    }
    if (rewardDate != null) {
      _result.rewardDate = rewardDate;
    }
    if (rewardReason != null) {
      _result.rewardReason = rewardReason;
    }
    if (tid != null) {
      _result.tid = tid;
    }
    return _result;
  }
  factory YolletPayData_Content.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory YolletPayData_Content.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  YolletPayData_Content clone() => YolletPayData_Content()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  YolletPayData_Content copyWith(void Function(YolletPayData_Content) updates) => super.copyWith((message) => updates(message as YolletPayData_Content)) as YolletPayData_Content; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static YolletPayData_Content create() => YolletPayData_Content._();
  YolletPayData_Content createEmptyInstance() => create();
  static $pb.PbList<YolletPayData_Content> createRepeated() => $pb.PbList<YolletPayData_Content>();
  @$core.pragma('dart2js:noInline')
  static YolletPayData_Content getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<YolletPayData_Content>(create);
  static YolletPayData_Content? _defaultInstance;

  @$pb.TagNumber(1)
  YolletPayData_State get state => $_getN(0);
  @$pb.TagNumber(1)
  set state(YolletPayData_State v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasState() => $_has(0);
  @$pb.TagNumber(1)
  void clearState() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get tranNo => $_getSZ(1);
  @$pb.TagNumber(2)
  set tranNo($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTranNo() => $_has(1);
  @$pb.TagNumber(2)
  void clearTranNo() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get userUuid => $_getSZ(2);
  @$pb.TagNumber(3)
  set userUuid($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUserUuid() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserUuid() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get tokenId => $_getSZ(3);
  @$pb.TagNumber(4)
  set tokenId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTokenId() => $_has(3);
  @$pb.TagNumber(4)
  void clearTokenId() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get userAddress => $_getSZ(4);
  @$pb.TagNumber(5)
  set userAddress($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasUserAddress() => $_has(4);
  @$pb.TagNumber(5)
  void clearUserAddress() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get expirationTime => $_getI64(5);
  @$pb.TagNumber(6)
  set expirationTime($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasExpirationTime() => $_has(5);
  @$pb.TagNumber(6)
  void clearExpirationTime() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get settlementAddress => $_getSZ(6);
  @$pb.TagNumber(7)
  set settlementAddress($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasSettlementAddress() => $_has(6);
  @$pb.TagNumber(7)
  void clearSettlementAddress() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get storeName => $_getSZ(7);
  @$pb.TagNumber(8)
  set storeName($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasStoreName() => $_has(7);
  @$pb.TagNumber(8)
  void clearStoreName() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get tokenAmount => $_getSZ(8);
  @$pb.TagNumber(9)
  set tokenAmount($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasTokenAmount() => $_has(8);
  @$pb.TagNumber(9)
  void clearTokenAmount() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get transferKey => $_getSZ(9);
  @$pb.TagNumber(10)
  set transferKey($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasTransferKey() => $_has(9);
  @$pb.TagNumber(10)
  void clearTransferKey() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get transferSignature => $_getSZ(10);
  @$pb.TagNumber(11)
  set transferSignature($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasTransferSignature() => $_has(10);
  @$pb.TagNumber(11)
  void clearTransferSignature() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get transferComment => $_getSZ(11);
  @$pb.TagNumber(12)
  set transferComment($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasTransferComment() => $_has(11);
  @$pb.TagNumber(12)
  void clearTransferComment() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get transferTransactionId => $_getSZ(12);
  @$pb.TagNumber(13)
  set transferTransactionId($core.String v) { $_setString(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasTransferTransactionId() => $_has(12);
  @$pb.TagNumber(13)
  void clearTransferTransactionId() => clearField(13);

  @$pb.TagNumber(14)
  $core.String get approvalNo => $_getSZ(13);
  @$pb.TagNumber(14)
  set approvalNo($core.String v) { $_setString(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasApprovalNo() => $_has(13);
  @$pb.TagNumber(14)
  void clearApprovalNo() => clearField(14);

  @$pb.TagNumber(15)
  $core.String get approvalDate => $_getSZ(14);
  @$pb.TagNumber(15)
  set approvalDate($core.String v) { $_setString(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasApprovalDate() => $_has(14);
  @$pb.TagNumber(15)
  void clearApprovalDate() => clearField(15);

  @$pb.TagNumber(16)
  $core.String get exchangeDateIndex => $_getSZ(15);
  @$pb.TagNumber(16)
  set exchangeDateIndex($core.String v) { $_setString(15, v); }
  @$pb.TagNumber(16)
  $core.bool hasExchangeDateIndex() => $_has(15);
  @$pb.TagNumber(16)
  void clearExchangeDateIndex() => clearField(16);

  @$pb.TagNumber(17)
  $core.String get exchangeRate => $_getSZ(16);
  @$pb.TagNumber(17)
  set exchangeRate($core.String v) { $_setString(16, v); }
  @$pb.TagNumber(17)
  $core.bool hasExchangeRate() => $_has(16);
  @$pb.TagNumber(17)
  void clearExchangeRate() => clearField(17);

  @$pb.TagNumber(18)
  $core.String get exchangeAmount => $_getSZ(17);
  @$pb.TagNumber(18)
  set exchangeAmount($core.String v) { $_setString(17, v); }
  @$pb.TagNumber(18)
  $core.bool hasExchangeAmount() => $_has(17);
  @$pb.TagNumber(18)
  void clearExchangeAmount() => clearField(18);

  @$pb.TagNumber(19)
  $core.String get exchangeCurrency => $_getSZ(18);
  @$pb.TagNumber(19)
  set exchangeCurrency($core.String v) { $_setString(18, v); }
  @$pb.TagNumber(19)
  $core.bool hasExchangeCurrency() => $_has(18);
  @$pb.TagNumber(19)
  void clearExchangeCurrency() => clearField(19);

  @$pb.TagNumber(20)
  $core.String get rewardId => $_getSZ(19);
  @$pb.TagNumber(20)
  set rewardId($core.String v) { $_setString(19, v); }
  @$pb.TagNumber(20)
  $core.bool hasRewardId() => $_has(19);
  @$pb.TagNumber(20)
  void clearRewardId() => clearField(20);

  @$pb.TagNumber(21)
  $core.String get rewardDate => $_getSZ(20);
  @$pb.TagNumber(21)
  set rewardDate($core.String v) { $_setString(20, v); }
  @$pb.TagNumber(21)
  $core.bool hasRewardDate() => $_has(20);
  @$pb.TagNumber(21)
  void clearRewardDate() => clearField(21);

  @$pb.TagNumber(22)
  $core.String get rewardReason => $_getSZ(21);
  @$pb.TagNumber(22)
  set rewardReason($core.String v) { $_setString(21, v); }
  @$pb.TagNumber(22)
  $core.bool hasRewardReason() => $_has(21);
  @$pb.TagNumber(22)
  void clearRewardReason() => clearField(22);

  @$pb.TagNumber(23)
  $core.String get tid => $_getSZ(22);
  @$pb.TagNumber(23)
  set tid($core.String v) { $_setString(22, v); }
  @$pb.TagNumber(23)
  $core.bool hasTid() => $_has(22);
  @$pb.TagNumber(23)
  void clearTid() => clearField(23);
}

class YolletPayData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'YolletPayData', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api.v1'), createEmptyInstance: create)
    ..aOM<Common>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'common', subBuilder: Common.create)
    ..aOM<YolletPayData_Content>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'content', subBuilder: YolletPayData_Content.create)
    ..hasRequiredFields = false
  ;

  YolletPayData._() : super();
  factory YolletPayData({
    Common? common,
    YolletPayData_Content? content,
  }) {
    final _result = create();
    if (common != null) {
      _result.common = common;
    }
    if (content != null) {
      _result.content = content;
    }
    return _result;
  }
  factory YolletPayData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory YolletPayData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  YolletPayData clone() => YolletPayData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  YolletPayData copyWith(void Function(YolletPayData) updates) => super.copyWith((message) => updates(message as YolletPayData)) as YolletPayData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static YolletPayData create() => YolletPayData._();
  YolletPayData createEmptyInstance() => create();
  static $pb.PbList<YolletPayData> createRepeated() => $pb.PbList<YolletPayData>();
  @$core.pragma('dart2js:noInline')
  static YolletPayData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<YolletPayData>(create);
  static YolletPayData? _defaultInstance;

  @$pb.TagNumber(1)
  Common get common => $_getN(0);
  @$pb.TagNumber(1)
  set common(Common v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCommon() => $_has(0);
  @$pb.TagNumber(1)
  void clearCommon() => clearField(1);
  @$pb.TagNumber(1)
  Common ensureCommon() => $_ensure(0);

  @$pb.TagNumber(2)
  YolletPayData_Content get content => $_getN(1);
  @$pb.TagNumber(2)
  set content(YolletPayData_Content v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasContent() => $_has(1);
  @$pb.TagNumber(2)
  void clearContent() => clearField(2);
  @$pb.TagNumber(2)
  YolletPayData_Content ensureContent() => $_ensure(1);
}

class LicenseInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LicenseInfo', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ver')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'key')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pkg')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sign')
    ..hasRequiredFields = false
  ;

  LicenseInfo._() : super();
  factory LicenseInfo({
    $core.String? ver,
    $core.String? key,
    $core.String? pkg,
    $core.String? sign,
  }) {
    final _result = create();
    if (ver != null) {
      _result.ver = ver;
    }
    if (key != null) {
      _result.key = key;
    }
    if (pkg != null) {
      _result.pkg = pkg;
    }
    if (sign != null) {
      _result.sign = sign;
    }
    return _result;
  }
  factory LicenseInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LicenseInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LicenseInfo clone() => LicenseInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LicenseInfo copyWith(void Function(LicenseInfo) updates) => super.copyWith((message) => updates(message as LicenseInfo)) as LicenseInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LicenseInfo create() => LicenseInfo._();
  LicenseInfo createEmptyInstance() => create();
  static $pb.PbList<LicenseInfo> createRepeated() => $pb.PbList<LicenseInfo>();
  @$core.pragma('dart2js:noInline')
  static LicenseInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LicenseInfo>(create);
  static LicenseInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get ver => $_getSZ(0);
  @$pb.TagNumber(1)
  set ver($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasVer() => $_has(0);
  @$pb.TagNumber(1)
  void clearVer() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get key => $_getSZ(1);
  @$pb.TagNumber(2)
  set key($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearKey() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get pkg => $_getSZ(2);
  @$pb.TagNumber(3)
  set pkg($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPkg() => $_has(2);
  @$pb.TagNumber(3)
  void clearPkg() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get sign => $_getSZ(3);
  @$pb.TagNumber(4)
  set sign($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSign() => $_has(3);
  @$pb.TagNumber(4)
  void clearSign() => clearField(4);
}

class LicensePermission extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LicensePermission', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'storeId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'terminalId')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'regDate')
    ..aInt64(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'expireDate')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'updateDate')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'appVersion')
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'appVersionCode')
    ..aOS(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sign')
    ..aOS(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'state')
    ..aOS(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'note')
    ..hasRequiredFields = false
  ;

  LicensePermission._() : super();
  factory LicensePermission({
    $core.String? deviceId,
    $core.String? storeId,
    $core.String? terminalId,
    $core.String? regDate,
    $fixnum.Int64? expireDate,
    $core.String? updateDate,
    $core.String? appVersion,
    $core.String? appVersionCode,
    $core.String? sign,
    $core.String? state,
    $core.String? note,
  }) {
    final _result = create();
    if (deviceId != null) {
      _result.deviceId = deviceId;
    }
    if (storeId != null) {
      _result.storeId = storeId;
    }
    if (terminalId != null) {
      _result.terminalId = terminalId;
    }
    if (regDate != null) {
      _result.regDate = regDate;
    }
    if (expireDate != null) {
      _result.expireDate = expireDate;
    }
    if (updateDate != null) {
      _result.updateDate = updateDate;
    }
    if (appVersion != null) {
      _result.appVersion = appVersion;
    }
    if (appVersionCode != null) {
      _result.appVersionCode = appVersionCode;
    }
    if (sign != null) {
      _result.sign = sign;
    }
    if (state != null) {
      _result.state = state;
    }
    if (note != null) {
      _result.note = note;
    }
    return _result;
  }
  factory LicensePermission.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LicensePermission.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LicensePermission clone() => LicensePermission()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LicensePermission copyWith(void Function(LicensePermission) updates) => super.copyWith((message) => updates(message as LicensePermission)) as LicensePermission; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LicensePermission create() => LicensePermission._();
  LicensePermission createEmptyInstance() => create();
  static $pb.PbList<LicensePermission> createRepeated() => $pb.PbList<LicensePermission>();
  @$core.pragma('dart2js:noInline')
  static LicensePermission getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LicensePermission>(create);
  static LicensePermission? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get deviceId => $_getSZ(0);
  @$pb.TagNumber(1)
  set deviceId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDeviceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get storeId => $_getSZ(1);
  @$pb.TagNumber(2)
  set storeId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasStoreId() => $_has(1);
  @$pb.TagNumber(2)
  void clearStoreId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get terminalId => $_getSZ(2);
  @$pb.TagNumber(3)
  set terminalId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTerminalId() => $_has(2);
  @$pb.TagNumber(3)
  void clearTerminalId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get regDate => $_getSZ(3);
  @$pb.TagNumber(4)
  set regDate($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasRegDate() => $_has(3);
  @$pb.TagNumber(4)
  void clearRegDate() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get expireDate => $_getI64(4);
  @$pb.TagNumber(5)
  set expireDate($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasExpireDate() => $_has(4);
  @$pb.TagNumber(5)
  void clearExpireDate() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get updateDate => $_getSZ(5);
  @$pb.TagNumber(6)
  set updateDate($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasUpdateDate() => $_has(5);
  @$pb.TagNumber(6)
  void clearUpdateDate() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get appVersion => $_getSZ(6);
  @$pb.TagNumber(7)
  set appVersion($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasAppVersion() => $_has(6);
  @$pb.TagNumber(7)
  void clearAppVersion() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get appVersionCode => $_getSZ(7);
  @$pb.TagNumber(8)
  set appVersionCode($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasAppVersionCode() => $_has(7);
  @$pb.TagNumber(8)
  void clearAppVersionCode() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get sign => $_getSZ(8);
  @$pb.TagNumber(9)
  set sign($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasSign() => $_has(8);
  @$pb.TagNumber(9)
  void clearSign() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get state => $_getSZ(9);
  @$pb.TagNumber(10)
  set state($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasState() => $_has(9);
  @$pb.TagNumber(10)
  void clearState() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get note => $_getSZ(10);
  @$pb.TagNumber(11)
  set note($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasNote() => $_has(10);
  @$pb.TagNumber(11)
  void clearNote() => clearField(11);
}

class AppVersionInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AppVersionInfo', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'minVer')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lastVer')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isLock')
    ..hasRequiredFields = false
  ;

  AppVersionInfo._() : super();
  factory AppVersionInfo({
    $core.String? minVer,
    $core.String? lastVer,
    $core.String? isLock,
  }) {
    final _result = create();
    if (minVer != null) {
      _result.minVer = minVer;
    }
    if (lastVer != null) {
      _result.lastVer = lastVer;
    }
    if (isLock != null) {
      _result.isLock = isLock;
    }
    return _result;
  }
  factory AppVersionInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AppVersionInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AppVersionInfo clone() => AppVersionInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AppVersionInfo copyWith(void Function(AppVersionInfo) updates) => super.copyWith((message) => updates(message as AppVersionInfo)) as AppVersionInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AppVersionInfo create() => AppVersionInfo._();
  AppVersionInfo createEmptyInstance() => create();
  static $pb.PbList<AppVersionInfo> createRepeated() => $pb.PbList<AppVersionInfo>();
  @$core.pragma('dart2js:noInline')
  static AppVersionInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AppVersionInfo>(create);
  static AppVersionInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get minVer => $_getSZ(0);
  @$pb.TagNumber(1)
  set minVer($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMinVer() => $_has(0);
  @$pb.TagNumber(1)
  void clearMinVer() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get lastVer => $_getSZ(1);
  @$pb.TagNumber(2)
  set lastVer($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLastVer() => $_has(1);
  @$pb.TagNumber(2)
  void clearLastVer() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get isLock => $_getSZ(2);
  @$pb.TagNumber(3)
  set isLock($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIsLock() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsLock() => clearField(3);
}

class AppLicenseRegister extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AppLicenseRegister', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'appRegId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'licenseIssuedId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'storeId')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'storeTerminalId')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceUniqueValue')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'appPackageId')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'regDate')
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'openDate')
    ..aInt64(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'expireDate')
    ..aOS(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'licenseStat')
    ..aOS(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'note')
    ..aOS(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'customVersionYn')
    ..aOS(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'appVersionName')
    ..aOS(14, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'appCurrentVersionCode')
    ..aOS(15, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'appMinVersionCode')
    ..aOS(16, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'appLastVersionCode')
    ..aOS(17, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'stateCode')
    ..hasRequiredFields = false
  ;

  AppLicenseRegister._() : super();
  factory AppLicenseRegister({
    $core.String? appRegId,
    $core.String? licenseIssuedId,
    $core.String? storeId,
    $core.String? storeTerminalId,
    $core.String? deviceUniqueValue,
    $core.String? appPackageId,
    $core.String? regDate,
    $core.String? openDate,
    $fixnum.Int64? expireDate,
    $core.String? licenseStat,
    $core.String? note,
    $core.String? customVersionYn,
    $core.String? appVersionName,
    $core.String? appCurrentVersionCode,
    $core.String? appMinVersionCode,
    $core.String? appLastVersionCode,
    $core.String? stateCode,
  }) {
    final _result = create();
    if (appRegId != null) {
      _result.appRegId = appRegId;
    }
    if (licenseIssuedId != null) {
      _result.licenseIssuedId = licenseIssuedId;
    }
    if (storeId != null) {
      _result.storeId = storeId;
    }
    if (storeTerminalId != null) {
      _result.storeTerminalId = storeTerminalId;
    }
    if (deviceUniqueValue != null) {
      _result.deviceUniqueValue = deviceUniqueValue;
    }
    if (appPackageId != null) {
      _result.appPackageId = appPackageId;
    }
    if (regDate != null) {
      _result.regDate = regDate;
    }
    if (openDate != null) {
      _result.openDate = openDate;
    }
    if (expireDate != null) {
      _result.expireDate = expireDate;
    }
    if (licenseStat != null) {
      _result.licenseStat = licenseStat;
    }
    if (note != null) {
      _result.note = note;
    }
    if (customVersionYn != null) {
      _result.customVersionYn = customVersionYn;
    }
    if (appVersionName != null) {
      _result.appVersionName = appVersionName;
    }
    if (appCurrentVersionCode != null) {
      _result.appCurrentVersionCode = appCurrentVersionCode;
    }
    if (appMinVersionCode != null) {
      _result.appMinVersionCode = appMinVersionCode;
    }
    if (appLastVersionCode != null) {
      _result.appLastVersionCode = appLastVersionCode;
    }
    if (stateCode != null) {
      _result.stateCode = stateCode;
    }
    return _result;
  }
  factory AppLicenseRegister.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AppLicenseRegister.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AppLicenseRegister clone() => AppLicenseRegister()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AppLicenseRegister copyWith(void Function(AppLicenseRegister) updates) => super.copyWith((message) => updates(message as AppLicenseRegister)) as AppLicenseRegister; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AppLicenseRegister create() => AppLicenseRegister._();
  AppLicenseRegister createEmptyInstance() => create();
  static $pb.PbList<AppLicenseRegister> createRepeated() => $pb.PbList<AppLicenseRegister>();
  @$core.pragma('dart2js:noInline')
  static AppLicenseRegister getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AppLicenseRegister>(create);
  static AppLicenseRegister? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get appRegId => $_getSZ(0);
  @$pb.TagNumber(1)
  set appRegId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAppRegId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAppRegId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get licenseIssuedId => $_getSZ(1);
  @$pb.TagNumber(2)
  set licenseIssuedId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLicenseIssuedId() => $_has(1);
  @$pb.TagNumber(2)
  void clearLicenseIssuedId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get storeId => $_getSZ(2);
  @$pb.TagNumber(3)
  set storeId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasStoreId() => $_has(2);
  @$pb.TagNumber(3)
  void clearStoreId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get storeTerminalId => $_getSZ(3);
  @$pb.TagNumber(4)
  set storeTerminalId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasStoreTerminalId() => $_has(3);
  @$pb.TagNumber(4)
  void clearStoreTerminalId() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get deviceUniqueValue => $_getSZ(4);
  @$pb.TagNumber(5)
  set deviceUniqueValue($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasDeviceUniqueValue() => $_has(4);
  @$pb.TagNumber(5)
  void clearDeviceUniqueValue() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get appPackageId => $_getSZ(5);
  @$pb.TagNumber(6)
  set appPackageId($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasAppPackageId() => $_has(5);
  @$pb.TagNumber(6)
  void clearAppPackageId() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get regDate => $_getSZ(6);
  @$pb.TagNumber(7)
  set regDate($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasRegDate() => $_has(6);
  @$pb.TagNumber(7)
  void clearRegDate() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get openDate => $_getSZ(7);
  @$pb.TagNumber(8)
  set openDate($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasOpenDate() => $_has(7);
  @$pb.TagNumber(8)
  void clearOpenDate() => clearField(8);

  @$pb.TagNumber(9)
  $fixnum.Int64 get expireDate => $_getI64(8);
  @$pb.TagNumber(9)
  set expireDate($fixnum.Int64 v) { $_setInt64(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasExpireDate() => $_has(8);
  @$pb.TagNumber(9)
  void clearExpireDate() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get licenseStat => $_getSZ(9);
  @$pb.TagNumber(10)
  set licenseStat($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasLicenseStat() => $_has(9);
  @$pb.TagNumber(10)
  void clearLicenseStat() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get note => $_getSZ(10);
  @$pb.TagNumber(11)
  set note($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasNote() => $_has(10);
  @$pb.TagNumber(11)
  void clearNote() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get customVersionYn => $_getSZ(11);
  @$pb.TagNumber(12)
  set customVersionYn($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasCustomVersionYn() => $_has(11);
  @$pb.TagNumber(12)
  void clearCustomVersionYn() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get appVersionName => $_getSZ(12);
  @$pb.TagNumber(13)
  set appVersionName($core.String v) { $_setString(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasAppVersionName() => $_has(12);
  @$pb.TagNumber(13)
  void clearAppVersionName() => clearField(13);

  @$pb.TagNumber(14)
  $core.String get appCurrentVersionCode => $_getSZ(13);
  @$pb.TagNumber(14)
  set appCurrentVersionCode($core.String v) { $_setString(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasAppCurrentVersionCode() => $_has(13);
  @$pb.TagNumber(14)
  void clearAppCurrentVersionCode() => clearField(14);

  @$pb.TagNumber(15)
  $core.String get appMinVersionCode => $_getSZ(14);
  @$pb.TagNumber(15)
  set appMinVersionCode($core.String v) { $_setString(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasAppMinVersionCode() => $_has(14);
  @$pb.TagNumber(15)
  void clearAppMinVersionCode() => clearField(15);

  @$pb.TagNumber(16)
  $core.String get appLastVersionCode => $_getSZ(15);
  @$pb.TagNumber(16)
  set appLastVersionCode($core.String v) { $_setString(15, v); }
  @$pb.TagNumber(16)
  $core.bool hasAppLastVersionCode() => $_has(15);
  @$pb.TagNumber(16)
  void clearAppLastVersionCode() => clearField(16);

  @$pb.TagNumber(17)
  $core.String get stateCode => $_getSZ(16);
  @$pb.TagNumber(17)
  set stateCode($core.String v) { $_setString(16, v); }
  @$pb.TagNumber(17)
  $core.bool hasStateCode() => $_has(16);
  @$pb.TagNumber(17)
  void clearStateCode() => clearField(17);
}

class IssueLicenseRequest_Content extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'IssueLicenseRequest.Content', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api.v1'), createEmptyInstance: create)
    ..aOM<LicenseInfo>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'licenseInfo', subBuilder: LicenseInfo.create)
    ..hasRequiredFields = false
  ;

  IssueLicenseRequest_Content._() : super();
  factory IssueLicenseRequest_Content({
    LicenseInfo? licenseInfo,
  }) {
    final _result = create();
    if (licenseInfo != null) {
      _result.licenseInfo = licenseInfo;
    }
    return _result;
  }
  factory IssueLicenseRequest_Content.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IssueLicenseRequest_Content.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  IssueLicenseRequest_Content clone() => IssueLicenseRequest_Content()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  IssueLicenseRequest_Content copyWith(void Function(IssueLicenseRequest_Content) updates) => super.copyWith((message) => updates(message as IssueLicenseRequest_Content)) as IssueLicenseRequest_Content; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static IssueLicenseRequest_Content create() => IssueLicenseRequest_Content._();
  IssueLicenseRequest_Content createEmptyInstance() => create();
  static $pb.PbList<IssueLicenseRequest_Content> createRepeated() => $pb.PbList<IssueLicenseRequest_Content>();
  @$core.pragma('dart2js:noInline')
  static IssueLicenseRequest_Content getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IssueLicenseRequest_Content>(create);
  static IssueLicenseRequest_Content? _defaultInstance;

  @$pb.TagNumber(1)
  LicenseInfo get licenseInfo => $_getN(0);
  @$pb.TagNumber(1)
  set licenseInfo(LicenseInfo v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasLicenseInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearLicenseInfo() => clearField(1);
  @$pb.TagNumber(1)
  LicenseInfo ensureLicenseInfo() => $_ensure(0);
}

class IssueLicenseRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'IssueLicenseRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api.v1'), createEmptyInstance: create)
    ..aOM<Common>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'common', subBuilder: Common.create)
    ..aOM<IssueLicenseRequest_Content>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'content', subBuilder: IssueLicenseRequest_Content.create)
    ..hasRequiredFields = false
  ;

  IssueLicenseRequest._() : super();
  factory IssueLicenseRequest({
    Common? common,
    IssueLicenseRequest_Content? content,
  }) {
    final _result = create();
    if (common != null) {
      _result.common = common;
    }
    if (content != null) {
      _result.content = content;
    }
    return _result;
  }
  factory IssueLicenseRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IssueLicenseRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  IssueLicenseRequest clone() => IssueLicenseRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  IssueLicenseRequest copyWith(void Function(IssueLicenseRequest) updates) => super.copyWith((message) => updates(message as IssueLicenseRequest)) as IssueLicenseRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static IssueLicenseRequest create() => IssueLicenseRequest._();
  IssueLicenseRequest createEmptyInstance() => create();
  static $pb.PbList<IssueLicenseRequest> createRepeated() => $pb.PbList<IssueLicenseRequest>();
  @$core.pragma('dart2js:noInline')
  static IssueLicenseRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IssueLicenseRequest>(create);
  static IssueLicenseRequest? _defaultInstance;

  @$pb.TagNumber(1)
  Common get common => $_getN(0);
  @$pb.TagNumber(1)
  set common(Common v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCommon() => $_has(0);
  @$pb.TagNumber(1)
  void clearCommon() => clearField(1);
  @$pb.TagNumber(1)
  Common ensureCommon() => $_ensure(0);

  @$pb.TagNumber(2)
  IssueLicenseRequest_Content get content => $_getN(1);
  @$pb.TagNumber(2)
  set content(IssueLicenseRequest_Content v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasContent() => $_has(1);
  @$pb.TagNumber(2)
  void clearContent() => clearField(2);
  @$pb.TagNumber(2)
  IssueLicenseRequest_Content ensureContent() => $_ensure(1);
}

class IssueLicenseResponse_Content extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'IssueLicenseResponse.Content', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api.v1'), createEmptyInstance: create)
    ..aOM<LicenseInfo>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'licenseInfo', subBuilder: LicenseInfo.create)
    ..hasRequiredFields = false
  ;

  IssueLicenseResponse_Content._() : super();
  factory IssueLicenseResponse_Content({
    LicenseInfo? licenseInfo,
  }) {
    final _result = create();
    if (licenseInfo != null) {
      _result.licenseInfo = licenseInfo;
    }
    return _result;
  }
  factory IssueLicenseResponse_Content.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IssueLicenseResponse_Content.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  IssueLicenseResponse_Content clone() => IssueLicenseResponse_Content()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  IssueLicenseResponse_Content copyWith(void Function(IssueLicenseResponse_Content) updates) => super.copyWith((message) => updates(message as IssueLicenseResponse_Content)) as IssueLicenseResponse_Content; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static IssueLicenseResponse_Content create() => IssueLicenseResponse_Content._();
  IssueLicenseResponse_Content createEmptyInstance() => create();
  static $pb.PbList<IssueLicenseResponse_Content> createRepeated() => $pb.PbList<IssueLicenseResponse_Content>();
  @$core.pragma('dart2js:noInline')
  static IssueLicenseResponse_Content getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IssueLicenseResponse_Content>(create);
  static IssueLicenseResponse_Content? _defaultInstance;

  @$pb.TagNumber(1)
  LicenseInfo get licenseInfo => $_getN(0);
  @$pb.TagNumber(1)
  set licenseInfo(LicenseInfo v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasLicenseInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearLicenseInfo() => clearField(1);
  @$pb.TagNumber(1)
  LicenseInfo ensureLicenseInfo() => $_ensure(0);
}

class IssueLicenseResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'IssueLicenseResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api.v1'), createEmptyInstance: create)
    ..aOM<Common>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'common', subBuilder: Common.create)
    ..aOM<IssueLicenseResponse_Content>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'content', subBuilder: IssueLicenseResponse_Content.create)
    ..hasRequiredFields = false
  ;

  IssueLicenseResponse._() : super();
  factory IssueLicenseResponse({
    Common? common,
    IssueLicenseResponse_Content? content,
  }) {
    final _result = create();
    if (common != null) {
      _result.common = common;
    }
    if (content != null) {
      _result.content = content;
    }
    return _result;
  }
  factory IssueLicenseResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IssueLicenseResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  IssueLicenseResponse clone() => IssueLicenseResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  IssueLicenseResponse copyWith(void Function(IssueLicenseResponse) updates) => super.copyWith((message) => updates(message as IssueLicenseResponse)) as IssueLicenseResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static IssueLicenseResponse create() => IssueLicenseResponse._();
  IssueLicenseResponse createEmptyInstance() => create();
  static $pb.PbList<IssueLicenseResponse> createRepeated() => $pb.PbList<IssueLicenseResponse>();
  @$core.pragma('dart2js:noInline')
  static IssueLicenseResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IssueLicenseResponse>(create);
  static IssueLicenseResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Common get common => $_getN(0);
  @$pb.TagNumber(1)
  set common(Common v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCommon() => $_has(0);
  @$pb.TagNumber(1)
  void clearCommon() => clearField(1);
  @$pb.TagNumber(1)
  Common ensureCommon() => $_ensure(0);

  @$pb.TagNumber(2)
  IssueLicenseResponse_Content get content => $_getN(1);
  @$pb.TagNumber(2)
  set content(IssueLicenseResponse_Content v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasContent() => $_has(1);
  @$pb.TagNumber(2)
  void clearContent() => clearField(2);
  @$pb.TagNumber(2)
  IssueLicenseResponse_Content ensureContent() => $_ensure(1);
}

class RequestPermissionRequest_Content extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RequestPermissionRequest.Content', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api.v1'), createEmptyInstance: create)
    ..aOM<LicenseInfo>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'licenseInfo', subBuilder: LicenseInfo.create)
    ..aOM<LicensePermission>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'permission', subBuilder: LicensePermission.create)
    ..hasRequiredFields = false
  ;

  RequestPermissionRequest_Content._() : super();
  factory RequestPermissionRequest_Content({
    LicenseInfo? licenseInfo,
    LicensePermission? permission,
  }) {
    final _result = create();
    if (licenseInfo != null) {
      _result.licenseInfo = licenseInfo;
    }
    if (permission != null) {
      _result.permission = permission;
    }
    return _result;
  }
  factory RequestPermissionRequest_Content.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RequestPermissionRequest_Content.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RequestPermissionRequest_Content clone() => RequestPermissionRequest_Content()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RequestPermissionRequest_Content copyWith(void Function(RequestPermissionRequest_Content) updates) => super.copyWith((message) => updates(message as RequestPermissionRequest_Content)) as RequestPermissionRequest_Content; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RequestPermissionRequest_Content create() => RequestPermissionRequest_Content._();
  RequestPermissionRequest_Content createEmptyInstance() => create();
  static $pb.PbList<RequestPermissionRequest_Content> createRepeated() => $pb.PbList<RequestPermissionRequest_Content>();
  @$core.pragma('dart2js:noInline')
  static RequestPermissionRequest_Content getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RequestPermissionRequest_Content>(create);
  static RequestPermissionRequest_Content? _defaultInstance;

  @$pb.TagNumber(1)
  LicenseInfo get licenseInfo => $_getN(0);
  @$pb.TagNumber(1)
  set licenseInfo(LicenseInfo v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasLicenseInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearLicenseInfo() => clearField(1);
  @$pb.TagNumber(1)
  LicenseInfo ensureLicenseInfo() => $_ensure(0);

  @$pb.TagNumber(2)
  LicensePermission get permission => $_getN(1);
  @$pb.TagNumber(2)
  set permission(LicensePermission v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPermission() => $_has(1);
  @$pb.TagNumber(2)
  void clearPermission() => clearField(2);
  @$pb.TagNumber(2)
  LicensePermission ensurePermission() => $_ensure(1);
}

class RequestPermissionRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RequestPermissionRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api.v1'), createEmptyInstance: create)
    ..aOM<Common>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'common', subBuilder: Common.create)
    ..aOM<RequestPermissionRequest_Content>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'content', subBuilder: RequestPermissionRequest_Content.create)
    ..hasRequiredFields = false
  ;

  RequestPermissionRequest._() : super();
  factory RequestPermissionRequest({
    Common? common,
    RequestPermissionRequest_Content? content,
  }) {
    final _result = create();
    if (common != null) {
      _result.common = common;
    }
    if (content != null) {
      _result.content = content;
    }
    return _result;
  }
  factory RequestPermissionRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RequestPermissionRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RequestPermissionRequest clone() => RequestPermissionRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RequestPermissionRequest copyWith(void Function(RequestPermissionRequest) updates) => super.copyWith((message) => updates(message as RequestPermissionRequest)) as RequestPermissionRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RequestPermissionRequest create() => RequestPermissionRequest._();
  RequestPermissionRequest createEmptyInstance() => create();
  static $pb.PbList<RequestPermissionRequest> createRepeated() => $pb.PbList<RequestPermissionRequest>();
  @$core.pragma('dart2js:noInline')
  static RequestPermissionRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RequestPermissionRequest>(create);
  static RequestPermissionRequest? _defaultInstance;

  @$pb.TagNumber(1)
  Common get common => $_getN(0);
  @$pb.TagNumber(1)
  set common(Common v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCommon() => $_has(0);
  @$pb.TagNumber(1)
  void clearCommon() => clearField(1);
  @$pb.TagNumber(1)
  Common ensureCommon() => $_ensure(0);

  @$pb.TagNumber(2)
  RequestPermissionRequest_Content get content => $_getN(1);
  @$pb.TagNumber(2)
  set content(RequestPermissionRequest_Content v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasContent() => $_has(1);
  @$pb.TagNumber(2)
  void clearContent() => clearField(2);
  @$pb.TagNumber(2)
  RequestPermissionRequest_Content ensureContent() => $_ensure(1);
}

class RequestPermissionResponse_Content extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RequestPermissionResponse.Content', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api.v1'), createEmptyInstance: create)
    ..aOM<LicenseInfo>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'licenseInfo', subBuilder: LicenseInfo.create)
    ..aOM<LicensePermission>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'permission', subBuilder: LicensePermission.create)
    ..hasRequiredFields = false
  ;

  RequestPermissionResponse_Content._() : super();
  factory RequestPermissionResponse_Content({
    LicenseInfo? licenseInfo,
    LicensePermission? permission,
  }) {
    final _result = create();
    if (licenseInfo != null) {
      _result.licenseInfo = licenseInfo;
    }
    if (permission != null) {
      _result.permission = permission;
    }
    return _result;
  }
  factory RequestPermissionResponse_Content.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RequestPermissionResponse_Content.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RequestPermissionResponse_Content clone() => RequestPermissionResponse_Content()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RequestPermissionResponse_Content copyWith(void Function(RequestPermissionResponse_Content) updates) => super.copyWith((message) => updates(message as RequestPermissionResponse_Content)) as RequestPermissionResponse_Content; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RequestPermissionResponse_Content create() => RequestPermissionResponse_Content._();
  RequestPermissionResponse_Content createEmptyInstance() => create();
  static $pb.PbList<RequestPermissionResponse_Content> createRepeated() => $pb.PbList<RequestPermissionResponse_Content>();
  @$core.pragma('dart2js:noInline')
  static RequestPermissionResponse_Content getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RequestPermissionResponse_Content>(create);
  static RequestPermissionResponse_Content? _defaultInstance;

  @$pb.TagNumber(1)
  LicenseInfo get licenseInfo => $_getN(0);
  @$pb.TagNumber(1)
  set licenseInfo(LicenseInfo v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasLicenseInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearLicenseInfo() => clearField(1);
  @$pb.TagNumber(1)
  LicenseInfo ensureLicenseInfo() => $_ensure(0);

  @$pb.TagNumber(2)
  LicensePermission get permission => $_getN(1);
  @$pb.TagNumber(2)
  set permission(LicensePermission v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPermission() => $_has(1);
  @$pb.TagNumber(2)
  void clearPermission() => clearField(2);
  @$pb.TagNumber(2)
  LicensePermission ensurePermission() => $_ensure(1);
}

class RequestPermissionResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RequestPermissionResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api.v1'), createEmptyInstance: create)
    ..aOM<Common>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'common', subBuilder: Common.create)
    ..aOM<RequestPermissionResponse_Content>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'content', subBuilder: RequestPermissionResponse_Content.create)
    ..hasRequiredFields = false
  ;

  RequestPermissionResponse._() : super();
  factory RequestPermissionResponse({
    Common? common,
    RequestPermissionResponse_Content? content,
  }) {
    final _result = create();
    if (common != null) {
      _result.common = common;
    }
    if (content != null) {
      _result.content = content;
    }
    return _result;
  }
  factory RequestPermissionResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RequestPermissionResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RequestPermissionResponse clone() => RequestPermissionResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RequestPermissionResponse copyWith(void Function(RequestPermissionResponse) updates) => super.copyWith((message) => updates(message as RequestPermissionResponse)) as RequestPermissionResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RequestPermissionResponse create() => RequestPermissionResponse._();
  RequestPermissionResponse createEmptyInstance() => create();
  static $pb.PbList<RequestPermissionResponse> createRepeated() => $pb.PbList<RequestPermissionResponse>();
  @$core.pragma('dart2js:noInline')
  static RequestPermissionResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RequestPermissionResponse>(create);
  static RequestPermissionResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Common get common => $_getN(0);
  @$pb.TagNumber(1)
  set common(Common v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCommon() => $_has(0);
  @$pb.TagNumber(1)
  void clearCommon() => clearField(1);
  @$pb.TagNumber(1)
  Common ensureCommon() => $_ensure(0);

  @$pb.TagNumber(2)
  RequestPermissionResponse_Content get content => $_getN(1);
  @$pb.TagNumber(2)
  set content(RequestPermissionResponse_Content v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasContent() => $_has(1);
  @$pb.TagNumber(2)
  void clearContent() => clearField(2);
  @$pb.TagNumber(2)
  RequestPermissionResponse_Content ensureContent() => $_ensure(1);
}

class ConfirmPermissionRequest_Content extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ConfirmPermissionRequest.Content', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api.v1'), createEmptyInstance: create)
    ..aOM<LicenseInfo>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'licenseInfo', subBuilder: LicenseInfo.create)
    ..aOM<LicensePermission>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'permission', subBuilder: LicensePermission.create)
    ..hasRequiredFields = false
  ;

  ConfirmPermissionRequest_Content._() : super();
  factory ConfirmPermissionRequest_Content({
    LicenseInfo? licenseInfo,
    LicensePermission? permission,
  }) {
    final _result = create();
    if (licenseInfo != null) {
      _result.licenseInfo = licenseInfo;
    }
    if (permission != null) {
      _result.permission = permission;
    }
    return _result;
  }
  factory ConfirmPermissionRequest_Content.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ConfirmPermissionRequest_Content.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ConfirmPermissionRequest_Content clone() => ConfirmPermissionRequest_Content()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ConfirmPermissionRequest_Content copyWith(void Function(ConfirmPermissionRequest_Content) updates) => super.copyWith((message) => updates(message as ConfirmPermissionRequest_Content)) as ConfirmPermissionRequest_Content; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ConfirmPermissionRequest_Content create() => ConfirmPermissionRequest_Content._();
  ConfirmPermissionRequest_Content createEmptyInstance() => create();
  static $pb.PbList<ConfirmPermissionRequest_Content> createRepeated() => $pb.PbList<ConfirmPermissionRequest_Content>();
  @$core.pragma('dart2js:noInline')
  static ConfirmPermissionRequest_Content getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ConfirmPermissionRequest_Content>(create);
  static ConfirmPermissionRequest_Content? _defaultInstance;

  @$pb.TagNumber(1)
  LicenseInfo get licenseInfo => $_getN(0);
  @$pb.TagNumber(1)
  set licenseInfo(LicenseInfo v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasLicenseInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearLicenseInfo() => clearField(1);
  @$pb.TagNumber(1)
  LicenseInfo ensureLicenseInfo() => $_ensure(0);

  @$pb.TagNumber(2)
  LicensePermission get permission => $_getN(1);
  @$pb.TagNumber(2)
  set permission(LicensePermission v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPermission() => $_has(1);
  @$pb.TagNumber(2)
  void clearPermission() => clearField(2);
  @$pb.TagNumber(2)
  LicensePermission ensurePermission() => $_ensure(1);
}

class ConfirmPermissionRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ConfirmPermissionRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api.v1'), createEmptyInstance: create)
    ..aOM<Common>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'common', subBuilder: Common.create)
    ..aOM<ConfirmPermissionRequest_Content>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'content', subBuilder: ConfirmPermissionRequest_Content.create)
    ..hasRequiredFields = false
  ;

  ConfirmPermissionRequest._() : super();
  factory ConfirmPermissionRequest({
    Common? common,
    ConfirmPermissionRequest_Content? content,
  }) {
    final _result = create();
    if (common != null) {
      _result.common = common;
    }
    if (content != null) {
      _result.content = content;
    }
    return _result;
  }
  factory ConfirmPermissionRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ConfirmPermissionRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ConfirmPermissionRequest clone() => ConfirmPermissionRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ConfirmPermissionRequest copyWith(void Function(ConfirmPermissionRequest) updates) => super.copyWith((message) => updates(message as ConfirmPermissionRequest)) as ConfirmPermissionRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ConfirmPermissionRequest create() => ConfirmPermissionRequest._();
  ConfirmPermissionRequest createEmptyInstance() => create();
  static $pb.PbList<ConfirmPermissionRequest> createRepeated() => $pb.PbList<ConfirmPermissionRequest>();
  @$core.pragma('dart2js:noInline')
  static ConfirmPermissionRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ConfirmPermissionRequest>(create);
  static ConfirmPermissionRequest? _defaultInstance;

  @$pb.TagNumber(1)
  Common get common => $_getN(0);
  @$pb.TagNumber(1)
  set common(Common v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCommon() => $_has(0);
  @$pb.TagNumber(1)
  void clearCommon() => clearField(1);
  @$pb.TagNumber(1)
  Common ensureCommon() => $_ensure(0);

  @$pb.TagNumber(2)
  ConfirmPermissionRequest_Content get content => $_getN(1);
  @$pb.TagNumber(2)
  set content(ConfirmPermissionRequest_Content v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasContent() => $_has(1);
  @$pb.TagNumber(2)
  void clearContent() => clearField(2);
  @$pb.TagNumber(2)
  ConfirmPermissionRequest_Content ensureContent() => $_ensure(1);
}

class ConfirmPermissionResponse_Content extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ConfirmPermissionResponse.Content', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api.v1'), createEmptyInstance: create)
    ..aOM<LicenseInfo>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'licenseInfo', subBuilder: LicenseInfo.create)
    ..aOM<LicensePermission>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'permission', subBuilder: LicensePermission.create)
    ..hasRequiredFields = false
  ;

  ConfirmPermissionResponse_Content._() : super();
  factory ConfirmPermissionResponse_Content({
    LicenseInfo? licenseInfo,
    LicensePermission? permission,
  }) {
    final _result = create();
    if (licenseInfo != null) {
      _result.licenseInfo = licenseInfo;
    }
    if (permission != null) {
      _result.permission = permission;
    }
    return _result;
  }
  factory ConfirmPermissionResponse_Content.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ConfirmPermissionResponse_Content.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ConfirmPermissionResponse_Content clone() => ConfirmPermissionResponse_Content()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ConfirmPermissionResponse_Content copyWith(void Function(ConfirmPermissionResponse_Content) updates) => super.copyWith((message) => updates(message as ConfirmPermissionResponse_Content)) as ConfirmPermissionResponse_Content; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ConfirmPermissionResponse_Content create() => ConfirmPermissionResponse_Content._();
  ConfirmPermissionResponse_Content createEmptyInstance() => create();
  static $pb.PbList<ConfirmPermissionResponse_Content> createRepeated() => $pb.PbList<ConfirmPermissionResponse_Content>();
  @$core.pragma('dart2js:noInline')
  static ConfirmPermissionResponse_Content getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ConfirmPermissionResponse_Content>(create);
  static ConfirmPermissionResponse_Content? _defaultInstance;

  @$pb.TagNumber(1)
  LicenseInfo get licenseInfo => $_getN(0);
  @$pb.TagNumber(1)
  set licenseInfo(LicenseInfo v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasLicenseInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearLicenseInfo() => clearField(1);
  @$pb.TagNumber(1)
  LicenseInfo ensureLicenseInfo() => $_ensure(0);

  @$pb.TagNumber(2)
  LicensePermission get permission => $_getN(1);
  @$pb.TagNumber(2)
  set permission(LicensePermission v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPermission() => $_has(1);
  @$pb.TagNumber(2)
  void clearPermission() => clearField(2);
  @$pb.TagNumber(2)
  LicensePermission ensurePermission() => $_ensure(1);
}

class ConfirmPermissionResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ConfirmPermissionResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api.v1'), createEmptyInstance: create)
    ..aOM<Common>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'common', subBuilder: Common.create)
    ..aOM<ConfirmPermissionResponse_Content>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'content', subBuilder: ConfirmPermissionResponse_Content.create)
    ..hasRequiredFields = false
  ;

  ConfirmPermissionResponse._() : super();
  factory ConfirmPermissionResponse({
    Common? common,
    ConfirmPermissionResponse_Content? content,
  }) {
    final _result = create();
    if (common != null) {
      _result.common = common;
    }
    if (content != null) {
      _result.content = content;
    }
    return _result;
  }
  factory ConfirmPermissionResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ConfirmPermissionResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ConfirmPermissionResponse clone() => ConfirmPermissionResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ConfirmPermissionResponse copyWith(void Function(ConfirmPermissionResponse) updates) => super.copyWith((message) => updates(message as ConfirmPermissionResponse)) as ConfirmPermissionResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ConfirmPermissionResponse create() => ConfirmPermissionResponse._();
  ConfirmPermissionResponse createEmptyInstance() => create();
  static $pb.PbList<ConfirmPermissionResponse> createRepeated() => $pb.PbList<ConfirmPermissionResponse>();
  @$core.pragma('dart2js:noInline')
  static ConfirmPermissionResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ConfirmPermissionResponse>(create);
  static ConfirmPermissionResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Common get common => $_getN(0);
  @$pb.TagNumber(1)
  set common(Common v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCommon() => $_has(0);
  @$pb.TagNumber(1)
  void clearCommon() => clearField(1);
  @$pb.TagNumber(1)
  Common ensureCommon() => $_ensure(0);

  @$pb.TagNumber(2)
  ConfirmPermissionResponse_Content get content => $_getN(1);
  @$pb.TagNumber(2)
  set content(ConfirmPermissionResponse_Content v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasContent() => $_has(1);
  @$pb.TagNumber(2)
  void clearContent() => clearField(2);
  @$pb.TagNumber(2)
  ConfirmPermissionResponse_Content ensureContent() => $_ensure(1);
}

class VerifyLicenseRequest_Content extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'VerifyLicenseRequest.Content', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api.v1'), createEmptyInstance: create)
    ..aOM<LicenseInfo>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'licenseInfo', subBuilder: LicenseInfo.create)
    ..aOM<LicensePermission>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'permission', subBuilder: LicensePermission.create)
    ..aOM<AppVersionInfo>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'appVerInfo', subBuilder: AppVersionInfo.create)
    ..hasRequiredFields = false
  ;

  VerifyLicenseRequest_Content._() : super();
  factory VerifyLicenseRequest_Content({
    LicenseInfo? licenseInfo,
    LicensePermission? permission,
    AppVersionInfo? appVerInfo,
  }) {
    final _result = create();
    if (licenseInfo != null) {
      _result.licenseInfo = licenseInfo;
    }
    if (permission != null) {
      _result.permission = permission;
    }
    if (appVerInfo != null) {
      _result.appVerInfo = appVerInfo;
    }
    return _result;
  }
  factory VerifyLicenseRequest_Content.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VerifyLicenseRequest_Content.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  VerifyLicenseRequest_Content clone() => VerifyLicenseRequest_Content()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  VerifyLicenseRequest_Content copyWith(void Function(VerifyLicenseRequest_Content) updates) => super.copyWith((message) => updates(message as VerifyLicenseRequest_Content)) as VerifyLicenseRequest_Content; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static VerifyLicenseRequest_Content create() => VerifyLicenseRequest_Content._();
  VerifyLicenseRequest_Content createEmptyInstance() => create();
  static $pb.PbList<VerifyLicenseRequest_Content> createRepeated() => $pb.PbList<VerifyLicenseRequest_Content>();
  @$core.pragma('dart2js:noInline')
  static VerifyLicenseRequest_Content getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VerifyLicenseRequest_Content>(create);
  static VerifyLicenseRequest_Content? _defaultInstance;

  @$pb.TagNumber(1)
  LicenseInfo get licenseInfo => $_getN(0);
  @$pb.TagNumber(1)
  set licenseInfo(LicenseInfo v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasLicenseInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearLicenseInfo() => clearField(1);
  @$pb.TagNumber(1)
  LicenseInfo ensureLicenseInfo() => $_ensure(0);

  @$pb.TagNumber(2)
  LicensePermission get permission => $_getN(1);
  @$pb.TagNumber(2)
  set permission(LicensePermission v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPermission() => $_has(1);
  @$pb.TagNumber(2)
  void clearPermission() => clearField(2);
  @$pb.TagNumber(2)
  LicensePermission ensurePermission() => $_ensure(1);

  @$pb.TagNumber(3)
  AppVersionInfo get appVerInfo => $_getN(2);
  @$pb.TagNumber(3)
  set appVerInfo(AppVersionInfo v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasAppVerInfo() => $_has(2);
  @$pb.TagNumber(3)
  void clearAppVerInfo() => clearField(3);
  @$pb.TagNumber(3)
  AppVersionInfo ensureAppVerInfo() => $_ensure(2);
}

class VerifyLicenseRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'VerifyLicenseRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api.v1'), createEmptyInstance: create)
    ..aOM<Common>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'common', subBuilder: Common.create)
    ..aOM<VerifyLicenseRequest_Content>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'content', subBuilder: VerifyLicenseRequest_Content.create)
    ..hasRequiredFields = false
  ;

  VerifyLicenseRequest._() : super();
  factory VerifyLicenseRequest({
    Common? common,
    VerifyLicenseRequest_Content? content,
  }) {
    final _result = create();
    if (common != null) {
      _result.common = common;
    }
    if (content != null) {
      _result.content = content;
    }
    return _result;
  }
  factory VerifyLicenseRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VerifyLicenseRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  VerifyLicenseRequest clone() => VerifyLicenseRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  VerifyLicenseRequest copyWith(void Function(VerifyLicenseRequest) updates) => super.copyWith((message) => updates(message as VerifyLicenseRequest)) as VerifyLicenseRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static VerifyLicenseRequest create() => VerifyLicenseRequest._();
  VerifyLicenseRequest createEmptyInstance() => create();
  static $pb.PbList<VerifyLicenseRequest> createRepeated() => $pb.PbList<VerifyLicenseRequest>();
  @$core.pragma('dart2js:noInline')
  static VerifyLicenseRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VerifyLicenseRequest>(create);
  static VerifyLicenseRequest? _defaultInstance;

  @$pb.TagNumber(1)
  Common get common => $_getN(0);
  @$pb.TagNumber(1)
  set common(Common v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCommon() => $_has(0);
  @$pb.TagNumber(1)
  void clearCommon() => clearField(1);
  @$pb.TagNumber(1)
  Common ensureCommon() => $_ensure(0);

  @$pb.TagNumber(2)
  VerifyLicenseRequest_Content get content => $_getN(1);
  @$pb.TagNumber(2)
  set content(VerifyLicenseRequest_Content v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasContent() => $_has(1);
  @$pb.TagNumber(2)
  void clearContent() => clearField(2);
  @$pb.TagNumber(2)
  VerifyLicenseRequest_Content ensureContent() => $_ensure(1);
}

class VerifyLicenseResponse_Content extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'VerifyLicenseResponse.Content', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api.v1'), createEmptyInstance: create)
    ..aOM<LicenseInfo>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'licenseInfo', subBuilder: LicenseInfo.create)
    ..aOM<LicensePermission>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'permission', subBuilder: LicensePermission.create)
    ..aOM<AppVersionInfo>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'appVerInfo', subBuilder: AppVersionInfo.create)
    ..hasRequiredFields = false
  ;

  VerifyLicenseResponse_Content._() : super();
  factory VerifyLicenseResponse_Content({
    LicenseInfo? licenseInfo,
    LicensePermission? permission,
    AppVersionInfo? appVerInfo,
  }) {
    final _result = create();
    if (licenseInfo != null) {
      _result.licenseInfo = licenseInfo;
    }
    if (permission != null) {
      _result.permission = permission;
    }
    if (appVerInfo != null) {
      _result.appVerInfo = appVerInfo;
    }
    return _result;
  }
  factory VerifyLicenseResponse_Content.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VerifyLicenseResponse_Content.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  VerifyLicenseResponse_Content clone() => VerifyLicenseResponse_Content()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  VerifyLicenseResponse_Content copyWith(void Function(VerifyLicenseResponse_Content) updates) => super.copyWith((message) => updates(message as VerifyLicenseResponse_Content)) as VerifyLicenseResponse_Content; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static VerifyLicenseResponse_Content create() => VerifyLicenseResponse_Content._();
  VerifyLicenseResponse_Content createEmptyInstance() => create();
  static $pb.PbList<VerifyLicenseResponse_Content> createRepeated() => $pb.PbList<VerifyLicenseResponse_Content>();
  @$core.pragma('dart2js:noInline')
  static VerifyLicenseResponse_Content getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VerifyLicenseResponse_Content>(create);
  static VerifyLicenseResponse_Content? _defaultInstance;

  @$pb.TagNumber(1)
  LicenseInfo get licenseInfo => $_getN(0);
  @$pb.TagNumber(1)
  set licenseInfo(LicenseInfo v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasLicenseInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearLicenseInfo() => clearField(1);
  @$pb.TagNumber(1)
  LicenseInfo ensureLicenseInfo() => $_ensure(0);

  @$pb.TagNumber(2)
  LicensePermission get permission => $_getN(1);
  @$pb.TagNumber(2)
  set permission(LicensePermission v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPermission() => $_has(1);
  @$pb.TagNumber(2)
  void clearPermission() => clearField(2);
  @$pb.TagNumber(2)
  LicensePermission ensurePermission() => $_ensure(1);

  @$pb.TagNumber(3)
  AppVersionInfo get appVerInfo => $_getN(2);
  @$pb.TagNumber(3)
  set appVerInfo(AppVersionInfo v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasAppVerInfo() => $_has(2);
  @$pb.TagNumber(3)
  void clearAppVerInfo() => clearField(3);
  @$pb.TagNumber(3)
  AppVersionInfo ensureAppVerInfo() => $_ensure(2);
}

class VerifyLicenseResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'VerifyLicenseResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api.v1'), createEmptyInstance: create)
    ..aOM<Common>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'common', subBuilder: Common.create)
    ..aOM<VerifyLicenseResponse_Content>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'content', subBuilder: VerifyLicenseResponse_Content.create)
    ..hasRequiredFields = false
  ;

  VerifyLicenseResponse._() : super();
  factory VerifyLicenseResponse({
    Common? common,
    VerifyLicenseResponse_Content? content,
  }) {
    final _result = create();
    if (common != null) {
      _result.common = common;
    }
    if (content != null) {
      _result.content = content;
    }
    return _result;
  }
  factory VerifyLicenseResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VerifyLicenseResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  VerifyLicenseResponse clone() => VerifyLicenseResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  VerifyLicenseResponse copyWith(void Function(VerifyLicenseResponse) updates) => super.copyWith((message) => updates(message as VerifyLicenseResponse)) as VerifyLicenseResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static VerifyLicenseResponse create() => VerifyLicenseResponse._();
  VerifyLicenseResponse createEmptyInstance() => create();
  static $pb.PbList<VerifyLicenseResponse> createRepeated() => $pb.PbList<VerifyLicenseResponse>();
  @$core.pragma('dart2js:noInline')
  static VerifyLicenseResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VerifyLicenseResponse>(create);
  static VerifyLicenseResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Common get common => $_getN(0);
  @$pb.TagNumber(1)
  set common(Common v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCommon() => $_has(0);
  @$pb.TagNumber(1)
  void clearCommon() => clearField(1);
  @$pb.TagNumber(1)
  Common ensureCommon() => $_ensure(0);

  @$pb.TagNumber(2)
  VerifyLicenseResponse_Content get content => $_getN(1);
  @$pb.TagNumber(2)
  set content(VerifyLicenseResponse_Content v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasContent() => $_has(1);
  @$pb.TagNumber(2)
  void clearContent() => clearField(2);
  @$pb.TagNumber(2)
  VerifyLicenseResponse_Content ensureContent() => $_ensure(1);
}

class GetLicenseListRequest_Content extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetLicenseListRequest.Content', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'storeId')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'page', $pb.PbFieldType.O3)
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'limit', $pb.PbFieldType.O3)
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'orderStoreId', $pb.PbFieldType.O3)
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'orderAppPackageId', $pb.PbFieldType.O3)
    ..a<$core.int>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'orderOpenDate', $pb.PbFieldType.O3)
    ..a<$core.int>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'orderExpireDate', $pb.PbFieldType.O3)
    ..a<$core.int>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'orderLicenseStat', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  GetLicenseListRequest_Content._() : super();
  factory GetLicenseListRequest_Content({
    $core.String? storeId,
    $core.int? page,
    $core.int? limit,
    $core.int? orderStoreId,
    $core.int? orderAppPackageId,
    $core.int? orderOpenDate,
    $core.int? orderExpireDate,
    $core.int? orderLicenseStat,
  }) {
    final _result = create();
    if (storeId != null) {
      _result.storeId = storeId;
    }
    if (page != null) {
      _result.page = page;
    }
    if (limit != null) {
      _result.limit = limit;
    }
    if (orderStoreId != null) {
      _result.orderStoreId = orderStoreId;
    }
    if (orderAppPackageId != null) {
      _result.orderAppPackageId = orderAppPackageId;
    }
    if (orderOpenDate != null) {
      _result.orderOpenDate = orderOpenDate;
    }
    if (orderExpireDate != null) {
      _result.orderExpireDate = orderExpireDate;
    }
    if (orderLicenseStat != null) {
      _result.orderLicenseStat = orderLicenseStat;
    }
    return _result;
  }
  factory GetLicenseListRequest_Content.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetLicenseListRequest_Content.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetLicenseListRequest_Content clone() => GetLicenseListRequest_Content()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetLicenseListRequest_Content copyWith(void Function(GetLicenseListRequest_Content) updates) => super.copyWith((message) => updates(message as GetLicenseListRequest_Content)) as GetLicenseListRequest_Content; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetLicenseListRequest_Content create() => GetLicenseListRequest_Content._();
  GetLicenseListRequest_Content createEmptyInstance() => create();
  static $pb.PbList<GetLicenseListRequest_Content> createRepeated() => $pb.PbList<GetLicenseListRequest_Content>();
  @$core.pragma('dart2js:noInline')
  static GetLicenseListRequest_Content getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetLicenseListRequest_Content>(create);
  static GetLicenseListRequest_Content? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get storeId => $_getSZ(0);
  @$pb.TagNumber(1)
  set storeId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStoreId() => $_has(0);
  @$pb.TagNumber(1)
  void clearStoreId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get page => $_getIZ(1);
  @$pb.TagNumber(2)
  set page($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPage() => $_has(1);
  @$pb.TagNumber(2)
  void clearPage() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get limit => $_getIZ(2);
  @$pb.TagNumber(3)
  set limit($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLimit() => $_has(2);
  @$pb.TagNumber(3)
  void clearLimit() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get orderStoreId => $_getIZ(3);
  @$pb.TagNumber(4)
  set orderStoreId($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasOrderStoreId() => $_has(3);
  @$pb.TagNumber(4)
  void clearOrderStoreId() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get orderAppPackageId => $_getIZ(4);
  @$pb.TagNumber(5)
  set orderAppPackageId($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasOrderAppPackageId() => $_has(4);
  @$pb.TagNumber(5)
  void clearOrderAppPackageId() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get orderOpenDate => $_getIZ(5);
  @$pb.TagNumber(6)
  set orderOpenDate($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasOrderOpenDate() => $_has(5);
  @$pb.TagNumber(6)
  void clearOrderOpenDate() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get orderExpireDate => $_getIZ(6);
  @$pb.TagNumber(7)
  set orderExpireDate($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasOrderExpireDate() => $_has(6);
  @$pb.TagNumber(7)
  void clearOrderExpireDate() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get orderLicenseStat => $_getIZ(7);
  @$pb.TagNumber(8)
  set orderLicenseStat($core.int v) { $_setSignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasOrderLicenseStat() => $_has(7);
  @$pb.TagNumber(8)
  void clearOrderLicenseStat() => clearField(8);
}

class GetLicenseListRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetLicenseListRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api.v1'), createEmptyInstance: create)
    ..aOM<Common>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'common', subBuilder: Common.create)
    ..aOM<GetLicenseListRequest_Content>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'content', subBuilder: GetLicenseListRequest_Content.create)
    ..hasRequiredFields = false
  ;

  GetLicenseListRequest._() : super();
  factory GetLicenseListRequest({
    Common? common,
    GetLicenseListRequest_Content? content,
  }) {
    final _result = create();
    if (common != null) {
      _result.common = common;
    }
    if (content != null) {
      _result.content = content;
    }
    return _result;
  }
  factory GetLicenseListRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetLicenseListRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetLicenseListRequest clone() => GetLicenseListRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetLicenseListRequest copyWith(void Function(GetLicenseListRequest) updates) => super.copyWith((message) => updates(message as GetLicenseListRequest)) as GetLicenseListRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetLicenseListRequest create() => GetLicenseListRequest._();
  GetLicenseListRequest createEmptyInstance() => create();
  static $pb.PbList<GetLicenseListRequest> createRepeated() => $pb.PbList<GetLicenseListRequest>();
  @$core.pragma('dart2js:noInline')
  static GetLicenseListRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetLicenseListRequest>(create);
  static GetLicenseListRequest? _defaultInstance;

  @$pb.TagNumber(1)
  Common get common => $_getN(0);
  @$pb.TagNumber(1)
  set common(Common v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCommon() => $_has(0);
  @$pb.TagNumber(1)
  void clearCommon() => clearField(1);
  @$pb.TagNumber(1)
  Common ensureCommon() => $_ensure(0);

  @$pb.TagNumber(2)
  GetLicenseListRequest_Content get content => $_getN(1);
  @$pb.TagNumber(2)
  set content(GetLicenseListRequest_Content v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasContent() => $_has(1);
  @$pb.TagNumber(2)
  void clearContent() => clearField(2);
  @$pb.TagNumber(2)
  GetLicenseListRequest_Content ensureContent() => $_ensure(1);
}

class GetLicenseListResponse_Content extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetLicenseListResponse.Content', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api.v1'), createEmptyInstance: create)
    ..pc<AppLicenseRegister>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'item', $pb.PbFieldType.PM, subBuilder: AppLicenseRegister.create)
    ..hasRequiredFields = false
  ;

  GetLicenseListResponse_Content._() : super();
  factory GetLicenseListResponse_Content({
    $core.Iterable<AppLicenseRegister>? item,
  }) {
    final _result = create();
    if (item != null) {
      _result.item.addAll(item);
    }
    return _result;
  }
  factory GetLicenseListResponse_Content.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetLicenseListResponse_Content.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetLicenseListResponse_Content clone() => GetLicenseListResponse_Content()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetLicenseListResponse_Content copyWith(void Function(GetLicenseListResponse_Content) updates) => super.copyWith((message) => updates(message as GetLicenseListResponse_Content)) as GetLicenseListResponse_Content; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetLicenseListResponse_Content create() => GetLicenseListResponse_Content._();
  GetLicenseListResponse_Content createEmptyInstance() => create();
  static $pb.PbList<GetLicenseListResponse_Content> createRepeated() => $pb.PbList<GetLicenseListResponse_Content>();
  @$core.pragma('dart2js:noInline')
  static GetLicenseListResponse_Content getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetLicenseListResponse_Content>(create);
  static GetLicenseListResponse_Content? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<AppLicenseRegister> get item => $_getList(0);
}

class GetLicenseListResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetLicenseListResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api.v1'), createEmptyInstance: create)
    ..aOM<Common>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'common', subBuilder: Common.create)
    ..aOM<GetLicenseListResponse_Content>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'content', subBuilder: GetLicenseListResponse_Content.create)
    ..hasRequiredFields = false
  ;

  GetLicenseListResponse._() : super();
  factory GetLicenseListResponse({
    Common? common,
    GetLicenseListResponse_Content? content,
  }) {
    final _result = create();
    if (common != null) {
      _result.common = common;
    }
    if (content != null) {
      _result.content = content;
    }
    return _result;
  }
  factory GetLicenseListResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetLicenseListResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetLicenseListResponse clone() => GetLicenseListResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetLicenseListResponse copyWith(void Function(GetLicenseListResponse) updates) => super.copyWith((message) => updates(message as GetLicenseListResponse)) as GetLicenseListResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetLicenseListResponse create() => GetLicenseListResponse._();
  GetLicenseListResponse createEmptyInstance() => create();
  static $pb.PbList<GetLicenseListResponse> createRepeated() => $pb.PbList<GetLicenseListResponse>();
  @$core.pragma('dart2js:noInline')
  static GetLicenseListResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetLicenseListResponse>(create);
  static GetLicenseListResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Common get common => $_getN(0);
  @$pb.TagNumber(1)
  set common(Common v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCommon() => $_has(0);
  @$pb.TagNumber(1)
  void clearCommon() => clearField(1);
  @$pb.TagNumber(1)
  Common ensureCommon() => $_ensure(0);

  @$pb.TagNumber(2)
  GetLicenseListResponse_Content get content => $_getN(1);
  @$pb.TagNumber(2)
  set content(GetLicenseListResponse_Content v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasContent() => $_has(1);
  @$pb.TagNumber(2)
  void clearContent() => clearField(2);
  @$pb.TagNumber(2)
  GetLicenseListResponse_Content ensureContent() => $_ensure(1);
}

class GetLicenseDetailRequest_Content extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetLicenseDetailRequest.Content', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'storeId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'appRegId')
    ..hasRequiredFields = false
  ;

  GetLicenseDetailRequest_Content._() : super();
  factory GetLicenseDetailRequest_Content({
    $core.String? storeId,
    $core.String? appRegId,
  }) {
    final _result = create();
    if (storeId != null) {
      _result.storeId = storeId;
    }
    if (appRegId != null) {
      _result.appRegId = appRegId;
    }
    return _result;
  }
  factory GetLicenseDetailRequest_Content.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetLicenseDetailRequest_Content.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetLicenseDetailRequest_Content clone() => GetLicenseDetailRequest_Content()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetLicenseDetailRequest_Content copyWith(void Function(GetLicenseDetailRequest_Content) updates) => super.copyWith((message) => updates(message as GetLicenseDetailRequest_Content)) as GetLicenseDetailRequest_Content; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetLicenseDetailRequest_Content create() => GetLicenseDetailRequest_Content._();
  GetLicenseDetailRequest_Content createEmptyInstance() => create();
  static $pb.PbList<GetLicenseDetailRequest_Content> createRepeated() => $pb.PbList<GetLicenseDetailRequest_Content>();
  @$core.pragma('dart2js:noInline')
  static GetLicenseDetailRequest_Content getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetLicenseDetailRequest_Content>(create);
  static GetLicenseDetailRequest_Content? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get storeId => $_getSZ(0);
  @$pb.TagNumber(1)
  set storeId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStoreId() => $_has(0);
  @$pb.TagNumber(1)
  void clearStoreId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get appRegId => $_getSZ(1);
  @$pb.TagNumber(2)
  set appRegId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAppRegId() => $_has(1);
  @$pb.TagNumber(2)
  void clearAppRegId() => clearField(2);
}

class GetLicenseDetailRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetLicenseDetailRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api.v1'), createEmptyInstance: create)
    ..aOM<Common>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'common', subBuilder: Common.create)
    ..aOM<GetLicenseDetailRequest_Content>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'content', subBuilder: GetLicenseDetailRequest_Content.create)
    ..hasRequiredFields = false
  ;

  GetLicenseDetailRequest._() : super();
  factory GetLicenseDetailRequest({
    Common? common,
    GetLicenseDetailRequest_Content? content,
  }) {
    final _result = create();
    if (common != null) {
      _result.common = common;
    }
    if (content != null) {
      _result.content = content;
    }
    return _result;
  }
  factory GetLicenseDetailRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetLicenseDetailRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetLicenseDetailRequest clone() => GetLicenseDetailRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetLicenseDetailRequest copyWith(void Function(GetLicenseDetailRequest) updates) => super.copyWith((message) => updates(message as GetLicenseDetailRequest)) as GetLicenseDetailRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetLicenseDetailRequest create() => GetLicenseDetailRequest._();
  GetLicenseDetailRequest createEmptyInstance() => create();
  static $pb.PbList<GetLicenseDetailRequest> createRepeated() => $pb.PbList<GetLicenseDetailRequest>();
  @$core.pragma('dart2js:noInline')
  static GetLicenseDetailRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetLicenseDetailRequest>(create);
  static GetLicenseDetailRequest? _defaultInstance;

  @$pb.TagNumber(1)
  Common get common => $_getN(0);
  @$pb.TagNumber(1)
  set common(Common v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCommon() => $_has(0);
  @$pb.TagNumber(1)
  void clearCommon() => clearField(1);
  @$pb.TagNumber(1)
  Common ensureCommon() => $_ensure(0);

  @$pb.TagNumber(2)
  GetLicenseDetailRequest_Content get content => $_getN(1);
  @$pb.TagNumber(2)
  set content(GetLicenseDetailRequest_Content v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasContent() => $_has(1);
  @$pb.TagNumber(2)
  void clearContent() => clearField(2);
  @$pb.TagNumber(2)
  GetLicenseDetailRequest_Content ensureContent() => $_ensure(1);
}

class GetLicenseDetailResponse_Content extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetLicenseDetailResponse.Content', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api.v1'), createEmptyInstance: create)
    ..aOM<AppLicenseRegister>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'item', subBuilder: AppLicenseRegister.create)
    ..hasRequiredFields = false
  ;

  GetLicenseDetailResponse_Content._() : super();
  factory GetLicenseDetailResponse_Content({
    AppLicenseRegister? item,
  }) {
    final _result = create();
    if (item != null) {
      _result.item = item;
    }
    return _result;
  }
  factory GetLicenseDetailResponse_Content.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetLicenseDetailResponse_Content.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetLicenseDetailResponse_Content clone() => GetLicenseDetailResponse_Content()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetLicenseDetailResponse_Content copyWith(void Function(GetLicenseDetailResponse_Content) updates) => super.copyWith((message) => updates(message as GetLicenseDetailResponse_Content)) as GetLicenseDetailResponse_Content; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetLicenseDetailResponse_Content create() => GetLicenseDetailResponse_Content._();
  GetLicenseDetailResponse_Content createEmptyInstance() => create();
  static $pb.PbList<GetLicenseDetailResponse_Content> createRepeated() => $pb.PbList<GetLicenseDetailResponse_Content>();
  @$core.pragma('dart2js:noInline')
  static GetLicenseDetailResponse_Content getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetLicenseDetailResponse_Content>(create);
  static GetLicenseDetailResponse_Content? _defaultInstance;

  @$pb.TagNumber(1)
  AppLicenseRegister get item => $_getN(0);
  @$pb.TagNumber(1)
  set item(AppLicenseRegister v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasItem() => $_has(0);
  @$pb.TagNumber(1)
  void clearItem() => clearField(1);
  @$pb.TagNumber(1)
  AppLicenseRegister ensureItem() => $_ensure(0);
}

class GetLicenseDetailResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetLicenseDetailResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api.v1'), createEmptyInstance: create)
    ..aOM<Common>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'common', subBuilder: Common.create)
    ..aOM<GetLicenseDetailResponse_Content>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'content', subBuilder: GetLicenseDetailResponse_Content.create)
    ..hasRequiredFields = false
  ;

  GetLicenseDetailResponse._() : super();
  factory GetLicenseDetailResponse({
    Common? common,
    GetLicenseDetailResponse_Content? content,
  }) {
    final _result = create();
    if (common != null) {
      _result.common = common;
    }
    if (content != null) {
      _result.content = content;
    }
    return _result;
  }
  factory GetLicenseDetailResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetLicenseDetailResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetLicenseDetailResponse clone() => GetLicenseDetailResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetLicenseDetailResponse copyWith(void Function(GetLicenseDetailResponse) updates) => super.copyWith((message) => updates(message as GetLicenseDetailResponse)) as GetLicenseDetailResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetLicenseDetailResponse create() => GetLicenseDetailResponse._();
  GetLicenseDetailResponse createEmptyInstance() => create();
  static $pb.PbList<GetLicenseDetailResponse> createRepeated() => $pb.PbList<GetLicenseDetailResponse>();
  @$core.pragma('dart2js:noInline')
  static GetLicenseDetailResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetLicenseDetailResponse>(create);
  static GetLicenseDetailResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Common get common => $_getN(0);
  @$pb.TagNumber(1)
  set common(Common v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCommon() => $_has(0);
  @$pb.TagNumber(1)
  void clearCommon() => clearField(1);
  @$pb.TagNumber(1)
  Common ensureCommon() => $_ensure(0);

  @$pb.TagNumber(2)
  GetLicenseDetailResponse_Content get content => $_getN(1);
  @$pb.TagNumber(2)
  set content(GetLicenseDetailResponse_Content v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasContent() => $_has(1);
  @$pb.TagNumber(2)
  void clearContent() => clearField(2);
  @$pb.TagNumber(2)
  GetLicenseDetailResponse_Content ensureContent() => $_ensure(1);
}

class UpdateLicenseInfoRequest_Content extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdateLicenseInfoRequest.Content', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'storeId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'appRegId')
    ..aInt64(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'expireDate')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'licenseStat')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'note')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'customVersionYn')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'appVersionName')
    ..hasRequiredFields = false
  ;

  UpdateLicenseInfoRequest_Content._() : super();
  factory UpdateLicenseInfoRequest_Content({
    $core.String? storeId,
    $core.String? appRegId,
    $fixnum.Int64? expireDate,
    $core.String? licenseStat,
    $core.String? note,
    $core.String? customVersionYn,
    $core.String? appVersionName,
  }) {
    final _result = create();
    if (storeId != null) {
      _result.storeId = storeId;
    }
    if (appRegId != null) {
      _result.appRegId = appRegId;
    }
    if (expireDate != null) {
      _result.expireDate = expireDate;
    }
    if (licenseStat != null) {
      _result.licenseStat = licenseStat;
    }
    if (note != null) {
      _result.note = note;
    }
    if (customVersionYn != null) {
      _result.customVersionYn = customVersionYn;
    }
    if (appVersionName != null) {
      _result.appVersionName = appVersionName;
    }
    return _result;
  }
  factory UpdateLicenseInfoRequest_Content.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateLicenseInfoRequest_Content.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateLicenseInfoRequest_Content clone() => UpdateLicenseInfoRequest_Content()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateLicenseInfoRequest_Content copyWith(void Function(UpdateLicenseInfoRequest_Content) updates) => super.copyWith((message) => updates(message as UpdateLicenseInfoRequest_Content)) as UpdateLicenseInfoRequest_Content; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateLicenseInfoRequest_Content create() => UpdateLicenseInfoRequest_Content._();
  UpdateLicenseInfoRequest_Content createEmptyInstance() => create();
  static $pb.PbList<UpdateLicenseInfoRequest_Content> createRepeated() => $pb.PbList<UpdateLicenseInfoRequest_Content>();
  @$core.pragma('dart2js:noInline')
  static UpdateLicenseInfoRequest_Content getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateLicenseInfoRequest_Content>(create);
  static UpdateLicenseInfoRequest_Content? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get storeId => $_getSZ(0);
  @$pb.TagNumber(1)
  set storeId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStoreId() => $_has(0);
  @$pb.TagNumber(1)
  void clearStoreId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get appRegId => $_getSZ(1);
  @$pb.TagNumber(2)
  set appRegId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAppRegId() => $_has(1);
  @$pb.TagNumber(2)
  void clearAppRegId() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get expireDate => $_getI64(2);
  @$pb.TagNumber(3)
  set expireDate($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasExpireDate() => $_has(2);
  @$pb.TagNumber(3)
  void clearExpireDate() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get licenseStat => $_getSZ(3);
  @$pb.TagNumber(4)
  set licenseStat($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasLicenseStat() => $_has(3);
  @$pb.TagNumber(4)
  void clearLicenseStat() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get note => $_getSZ(4);
  @$pb.TagNumber(5)
  set note($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasNote() => $_has(4);
  @$pb.TagNumber(5)
  void clearNote() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get customVersionYn => $_getSZ(5);
  @$pb.TagNumber(6)
  set customVersionYn($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasCustomVersionYn() => $_has(5);
  @$pb.TagNumber(6)
  void clearCustomVersionYn() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get appVersionName => $_getSZ(6);
  @$pb.TagNumber(7)
  set appVersionName($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasAppVersionName() => $_has(6);
  @$pb.TagNumber(7)
  void clearAppVersionName() => clearField(7);
}

class UpdateLicenseInfoRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdateLicenseInfoRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api.v1'), createEmptyInstance: create)
    ..aOM<Common>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'common', subBuilder: Common.create)
    ..aOM<UpdateLicenseInfoRequest_Content>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'content', subBuilder: UpdateLicenseInfoRequest_Content.create)
    ..hasRequiredFields = false
  ;

  UpdateLicenseInfoRequest._() : super();
  factory UpdateLicenseInfoRequest({
    Common? common,
    UpdateLicenseInfoRequest_Content? content,
  }) {
    final _result = create();
    if (common != null) {
      _result.common = common;
    }
    if (content != null) {
      _result.content = content;
    }
    return _result;
  }
  factory UpdateLicenseInfoRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateLicenseInfoRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateLicenseInfoRequest clone() => UpdateLicenseInfoRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateLicenseInfoRequest copyWith(void Function(UpdateLicenseInfoRequest) updates) => super.copyWith((message) => updates(message as UpdateLicenseInfoRequest)) as UpdateLicenseInfoRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateLicenseInfoRequest create() => UpdateLicenseInfoRequest._();
  UpdateLicenseInfoRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateLicenseInfoRequest> createRepeated() => $pb.PbList<UpdateLicenseInfoRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateLicenseInfoRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateLicenseInfoRequest>(create);
  static UpdateLicenseInfoRequest? _defaultInstance;

  @$pb.TagNumber(1)
  Common get common => $_getN(0);
  @$pb.TagNumber(1)
  set common(Common v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCommon() => $_has(0);
  @$pb.TagNumber(1)
  void clearCommon() => clearField(1);
  @$pb.TagNumber(1)
  Common ensureCommon() => $_ensure(0);

  @$pb.TagNumber(2)
  UpdateLicenseInfoRequest_Content get content => $_getN(1);
  @$pb.TagNumber(2)
  set content(UpdateLicenseInfoRequest_Content v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasContent() => $_has(1);
  @$pb.TagNumber(2)
  void clearContent() => clearField(2);
  @$pb.TagNumber(2)
  UpdateLicenseInfoRequest_Content ensureContent() => $_ensure(1);
}

class UpdateLicenseInfoResponse_Content extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdateLicenseInfoResponse.Content', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api.v1'), createEmptyInstance: create)
    ..aOM<AppLicenseRegister>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'item', subBuilder: AppLicenseRegister.create)
    ..hasRequiredFields = false
  ;

  UpdateLicenseInfoResponse_Content._() : super();
  factory UpdateLicenseInfoResponse_Content({
    AppLicenseRegister? item,
  }) {
    final _result = create();
    if (item != null) {
      _result.item = item;
    }
    return _result;
  }
  factory UpdateLicenseInfoResponse_Content.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateLicenseInfoResponse_Content.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateLicenseInfoResponse_Content clone() => UpdateLicenseInfoResponse_Content()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateLicenseInfoResponse_Content copyWith(void Function(UpdateLicenseInfoResponse_Content) updates) => super.copyWith((message) => updates(message as UpdateLicenseInfoResponse_Content)) as UpdateLicenseInfoResponse_Content; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateLicenseInfoResponse_Content create() => UpdateLicenseInfoResponse_Content._();
  UpdateLicenseInfoResponse_Content createEmptyInstance() => create();
  static $pb.PbList<UpdateLicenseInfoResponse_Content> createRepeated() => $pb.PbList<UpdateLicenseInfoResponse_Content>();
  @$core.pragma('dart2js:noInline')
  static UpdateLicenseInfoResponse_Content getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateLicenseInfoResponse_Content>(create);
  static UpdateLicenseInfoResponse_Content? _defaultInstance;

  @$pb.TagNumber(1)
  AppLicenseRegister get item => $_getN(0);
  @$pb.TagNumber(1)
  set item(AppLicenseRegister v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasItem() => $_has(0);
  @$pb.TagNumber(1)
  void clearItem() => clearField(1);
  @$pb.TagNumber(1)
  AppLicenseRegister ensureItem() => $_ensure(0);
}

class UpdateLicenseInfoResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdateLicenseInfoResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api.v1'), createEmptyInstance: create)
    ..aOM<Common>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'common', subBuilder: Common.create)
    ..aOM<UpdateLicenseInfoResponse_Content>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'content', subBuilder: UpdateLicenseInfoResponse_Content.create)
    ..hasRequiredFields = false
  ;

  UpdateLicenseInfoResponse._() : super();
  factory UpdateLicenseInfoResponse({
    Common? common,
    UpdateLicenseInfoResponse_Content? content,
  }) {
    final _result = create();
    if (common != null) {
      _result.common = common;
    }
    if (content != null) {
      _result.content = content;
    }
    return _result;
  }
  factory UpdateLicenseInfoResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateLicenseInfoResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateLicenseInfoResponse clone() => UpdateLicenseInfoResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateLicenseInfoResponse copyWith(void Function(UpdateLicenseInfoResponse) updates) => super.copyWith((message) => updates(message as UpdateLicenseInfoResponse)) as UpdateLicenseInfoResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateLicenseInfoResponse create() => UpdateLicenseInfoResponse._();
  UpdateLicenseInfoResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateLicenseInfoResponse> createRepeated() => $pb.PbList<UpdateLicenseInfoResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateLicenseInfoResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateLicenseInfoResponse>(create);
  static UpdateLicenseInfoResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Common get common => $_getN(0);
  @$pb.TagNumber(1)
  set common(Common v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCommon() => $_has(0);
  @$pb.TagNumber(1)
  void clearCommon() => clearField(1);
  @$pb.TagNumber(1)
  Common ensureCommon() => $_ensure(0);

  @$pb.TagNumber(2)
  UpdateLicenseInfoResponse_Content get content => $_getN(1);
  @$pb.TagNumber(2)
  set content(UpdateLicenseInfoResponse_Content v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasContent() => $_has(1);
  @$pb.TagNumber(2)
  void clearContent() => clearField(2);
  @$pb.TagNumber(2)
  UpdateLicenseInfoResponse_Content ensureContent() => $_ensure(1);
}

class LoginDomain_Content extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LoginDomain.Content', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api.v1'), createEmptyInstance: create)
    ..pPS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'domain')
    ..hasRequiredFields = false
  ;

  LoginDomain_Content._() : super();
  factory LoginDomain_Content({
    $core.Iterable<$core.String>? domain,
  }) {
    final _result = create();
    if (domain != null) {
      _result.domain.addAll(domain);
    }
    return _result;
  }
  factory LoginDomain_Content.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LoginDomain_Content.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LoginDomain_Content clone() => LoginDomain_Content()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LoginDomain_Content copyWith(void Function(LoginDomain_Content) updates) => super.copyWith((message) => updates(message as LoginDomain_Content)) as LoginDomain_Content; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LoginDomain_Content create() => LoginDomain_Content._();
  LoginDomain_Content createEmptyInstance() => create();
  static $pb.PbList<LoginDomain_Content> createRepeated() => $pb.PbList<LoginDomain_Content>();
  @$core.pragma('dart2js:noInline')
  static LoginDomain_Content getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LoginDomain_Content>(create);
  static LoginDomain_Content? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get domain => $_getList(0);
}

class LoginDomain extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LoginDomain', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api.v1'), createEmptyInstance: create)
    ..aOM<Common>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'common', subBuilder: Common.create)
    ..aOM<LoginDomain_Content>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'content', subBuilder: LoginDomain_Content.create)
    ..hasRequiredFields = false
  ;

  LoginDomain._() : super();
  factory LoginDomain({
    Common? common,
    LoginDomain_Content? content,
  }) {
    final _result = create();
    if (common != null) {
      _result.common = common;
    }
    if (content != null) {
      _result.content = content;
    }
    return _result;
  }
  factory LoginDomain.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LoginDomain.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LoginDomain clone() => LoginDomain()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LoginDomain copyWith(void Function(LoginDomain) updates) => super.copyWith((message) => updates(message as LoginDomain)) as LoginDomain; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LoginDomain create() => LoginDomain._();
  LoginDomain createEmptyInstance() => create();
  static $pb.PbList<LoginDomain> createRepeated() => $pb.PbList<LoginDomain>();
  @$core.pragma('dart2js:noInline')
  static LoginDomain getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LoginDomain>(create);
  static LoginDomain? _defaultInstance;

  @$pb.TagNumber(1)
  Common get common => $_getN(0);
  @$pb.TagNumber(1)
  set common(Common v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCommon() => $_has(0);
  @$pb.TagNumber(1)
  void clearCommon() => clearField(1);
  @$pb.TagNumber(1)
  Common ensureCommon() => $_ensure(0);

  @$pb.TagNumber(2)
  LoginDomain_Content get content => $_getN(1);
  @$pb.TagNumber(2)
  set content(LoginDomain_Content v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasContent() => $_has(1);
  @$pb.TagNumber(2)
  void clearContent() => clearField(2);
  @$pb.TagNumber(2)
  LoginDomain_Content ensureContent() => $_ensure(1);
}

class StoreTokenInfo_Content extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'StoreTokenInfo.Content', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api.v1'), createEmptyInstance: create)
    ..pPS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'addresses')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'loginId', protoName: 'loginId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'storeName')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'telNo')
    ..hasRequiredFields = false
  ;

  StoreTokenInfo_Content._() : super();
  factory StoreTokenInfo_Content({
    $core.Iterable<$core.String>? addresses,
    $core.String? loginId,
    $core.String? storeName,
    $core.String? telNo,
  }) {
    final _result = create();
    if (addresses != null) {
      _result.addresses.addAll(addresses);
    }
    if (loginId != null) {
      _result.loginId = loginId;
    }
    if (storeName != null) {
      _result.storeName = storeName;
    }
    if (telNo != null) {
      _result.telNo = telNo;
    }
    return _result;
  }
  factory StoreTokenInfo_Content.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StoreTokenInfo_Content.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StoreTokenInfo_Content clone() => StoreTokenInfo_Content()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StoreTokenInfo_Content copyWith(void Function(StoreTokenInfo_Content) updates) => super.copyWith((message) => updates(message as StoreTokenInfo_Content)) as StoreTokenInfo_Content; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StoreTokenInfo_Content create() => StoreTokenInfo_Content._();
  StoreTokenInfo_Content createEmptyInstance() => create();
  static $pb.PbList<StoreTokenInfo_Content> createRepeated() => $pb.PbList<StoreTokenInfo_Content>();
  @$core.pragma('dart2js:noInline')
  static StoreTokenInfo_Content getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StoreTokenInfo_Content>(create);
  static StoreTokenInfo_Content? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get addresses => $_getList(0);

  @$pb.TagNumber(2)
  $core.String get loginId => $_getSZ(1);
  @$pb.TagNumber(2)
  set loginId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLoginId() => $_has(1);
  @$pb.TagNumber(2)
  void clearLoginId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get storeName => $_getSZ(2);
  @$pb.TagNumber(3)
  set storeName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasStoreName() => $_has(2);
  @$pb.TagNumber(3)
  void clearStoreName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get telNo => $_getSZ(3);
  @$pb.TagNumber(4)
  set telNo($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTelNo() => $_has(3);
  @$pb.TagNumber(4)
  void clearTelNo() => clearField(4);
}

class StoreTokenInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'StoreTokenInfo', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api.v1'), createEmptyInstance: create)
    ..aOM<Common>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'common', subBuilder: Common.create)
    ..aOM<StoreTokenInfo_Content>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'content', subBuilder: StoreTokenInfo_Content.create)
    ..hasRequiredFields = false
  ;

  StoreTokenInfo._() : super();
  factory StoreTokenInfo({
    Common? common,
    StoreTokenInfo_Content? content,
  }) {
    final _result = create();
    if (common != null) {
      _result.common = common;
    }
    if (content != null) {
      _result.content = content;
    }
    return _result;
  }
  factory StoreTokenInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StoreTokenInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StoreTokenInfo clone() => StoreTokenInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StoreTokenInfo copyWith(void Function(StoreTokenInfo) updates) => super.copyWith((message) => updates(message as StoreTokenInfo)) as StoreTokenInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StoreTokenInfo create() => StoreTokenInfo._();
  StoreTokenInfo createEmptyInstance() => create();
  static $pb.PbList<StoreTokenInfo> createRepeated() => $pb.PbList<StoreTokenInfo>();
  @$core.pragma('dart2js:noInline')
  static StoreTokenInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StoreTokenInfo>(create);
  static StoreTokenInfo? _defaultInstance;

  @$pb.TagNumber(1)
  Common get common => $_getN(0);
  @$pb.TagNumber(1)
  set common(Common v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCommon() => $_has(0);
  @$pb.TagNumber(1)
  void clearCommon() => clearField(1);
  @$pb.TagNumber(1)
  Common ensureCommon() => $_ensure(0);

  @$pb.TagNumber(2)
  StoreTokenInfo_Content get content => $_getN(1);
  @$pb.TagNumber(2)
  set content(StoreTokenInfo_Content v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasContent() => $_has(1);
  @$pb.TagNumber(2)
  void clearContent() => clearField(2);
  @$pb.TagNumber(2)
  StoreTokenInfo_Content ensureContent() => $_ensure(1);
}


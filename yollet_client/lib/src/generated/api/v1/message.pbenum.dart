///
//  Generated code. Do not modify.
//  source: api/v1/message.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class YolletPayData_State extends $pb.ProtobufEnum {
  static const YolletPayData_State START_PAY = YolletPayData_State._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'START_PAY');
  static const YolletPayData_State REQUEST_TRANSFER = YolletPayData_State._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'REQUEST_TRANSFER');
  static const YolletPayData_State TRANSFER = YolletPayData_State._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'TRANSFER');
  static const YolletPayData_State END_PAY = YolletPayData_State._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'END_PAY');
  static const YolletPayData_State START_REWARD = YolletPayData_State._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'START_REWARD');
  static const YolletPayData_State END_REWARD = YolletPayData_State._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'END_REWARD');

  static const $core.List<YolletPayData_State> values = <YolletPayData_State> [
    START_PAY,
    REQUEST_TRANSFER,
    TRANSFER,
    END_PAY,
    START_REWARD,
    END_REWARD,
  ];

  static final $core.Map<$core.int, YolletPayData_State> _byValue = $pb.ProtobufEnum.initByValue(values);
  static YolletPayData_State? valueOf($core.int value) => _byValue[value];

  const YolletPayData_State._($core.int v, $core.String n) : super(v, n);
}


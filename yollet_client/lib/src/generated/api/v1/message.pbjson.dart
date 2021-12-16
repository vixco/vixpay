///
//  Generated code. Do not modify.
//  source: api/v1/message.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use routeDescriptor instead')
const Route$json = const {
  '1': 'Route',
  '2': const [
    const {'1': 'next_svc', '3': 1, '4': 1, '5': 9, '10': 'nextSvc'},
    const {'1': 'next_package', '3': 2, '4': 1, '5': 9, '10': 'nextPackage'},
    const {'1': 'next_api', '3': 3, '4': 1, '5': 9, '10': 'nextApi'},
    const {'1': 'hold_res', '3': 4, '4': 1, '5': 8, '10': 'holdRes'},
    const {'1': 'completed', '3': 5, '4': 1, '5': 8, '10': 'completed'},
  ],
};

/// Descriptor for `Route`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List routeDescriptor = $convert.base64Decode('CgVSb3V0ZRIZCghuZXh0X3N2YxgBIAEoCVIHbmV4dFN2YxIhCgxuZXh0X3BhY2thZ2UYAiABKAlSC25leHRQYWNrYWdlEhkKCG5leHRfYXBpGAMgASgJUgduZXh0QXBpEhkKCGhvbGRfcmVzGAQgASgIUgdob2xkUmVzEhwKCWNvbXBsZXRlZBgFIAEoCFIJY29tcGxldGVk');
@$core.Deprecated('Use commonDescriptor instead')
const Common$json = const {
  '1': 'Common',
  '2': const [
    const {'1': 'target_name', '3': 1, '4': 1, '5': 9, '10': 'targetName'},
    const {'1': 'target_svc', '3': 2, '4': 1, '5': 9, '10': 'targetSvc'},
    const {'1': 'target_package', '3': 3, '4': 1, '5': 9, '10': 'targetPackage'},
    const {'1': 'target_api', '3': 4, '4': 1, '5': 9, '10': 'targetApi'},
    const {'1': 'source_svc', '3': 5, '4': 1, '5': 9, '10': 'sourceSvc'},
    const {'1': 'source_ver', '3': 6, '4': 1, '5': 9, '10': 'sourceVer'},
    const {'1': 'source_addr', '3': 7, '4': 1, '5': 9, '10': 'sourceAddr'},
    const {'1': 'req_timestamp', '3': 8, '4': 1, '5': 9, '10': 'reqTimestamp'},
    const {'1': 'language_code', '3': 9, '4': 1, '5': 9, '10': 'languageCode'},
    const {'1': 'rsp_timestamp', '3': 10, '4': 1, '5': 9, '10': 'rspTimestamp'},
    const {'1': 'tran_no', '3': 11, '4': 1, '5': 9, '10': 'tranNo'},
    const {'1': 'res_code', '3': 12, '4': 1, '5': 9, '10': 'resCode'},
    const {'1': 'res_message', '3': 13, '4': 1, '5': 9, '10': 'resMessage'},
    const {'1': 'routes', '3': 14, '4': 3, '5': 11, '6': '.api.v1.Route', '10': 'routes'},
    const {'1': 'authorization', '3': 15, '4': 1, '5': 9, '10': 'authorization'},
  ],
};

/// Descriptor for `Common`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List commonDescriptor = $convert.base64Decode('CgZDb21tb24SHwoLdGFyZ2V0X25hbWUYASABKAlSCnRhcmdldE5hbWUSHQoKdGFyZ2V0X3N2YxgCIAEoCVIJdGFyZ2V0U3ZjEiUKDnRhcmdldF9wYWNrYWdlGAMgASgJUg10YXJnZXRQYWNrYWdlEh0KCnRhcmdldF9hcGkYBCABKAlSCXRhcmdldEFwaRIdCgpzb3VyY2Vfc3ZjGAUgASgJUglzb3VyY2VTdmMSHQoKc291cmNlX3ZlchgGIAEoCVIJc291cmNlVmVyEh8KC3NvdXJjZV9hZGRyGAcgASgJUgpzb3VyY2VBZGRyEiMKDXJlcV90aW1lc3RhbXAYCCABKAlSDHJlcVRpbWVzdGFtcBIjCg1sYW5ndWFnZV9jb2RlGAkgASgJUgxsYW5ndWFnZUNvZGUSIwoNcnNwX3RpbWVzdGFtcBgKIAEoCVIMcnNwVGltZXN0YW1wEhcKB3RyYW5fbm8YCyABKAlSBnRyYW5ObxIZCghyZXNfY29kZRgMIAEoCVIHcmVzQ29kZRIfCgtyZXNfbWVzc2FnZRgNIAEoCVIKcmVzTWVzc2FnZRIlCgZyb3V0ZXMYDiADKAsyDS5hcGkudjEuUm91dGVSBnJvdXRlcxIkCg1hdXRob3JpemF0aW9uGA8gASgJUg1hdXRob3JpemF0aW9u');
@$core.Deprecated('Use emptyDescriptor instead')
const Empty$json = const {
  '1': 'Empty',
  '2': const [
    const {'1': 'common', '3': 1, '4': 1, '5': 11, '6': '.api.v1.Common', '10': 'common'},
  ],
};

/// Descriptor for `Empty`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emptyDescriptor = $convert.base64Decode('CgVFbXB0eRImCgZjb21tb24YASABKAsyDi5hcGkudjEuQ29tbW9uUgZjb21tb24=');
@$core.Deprecated('Use userDescriptor instead')
const User$json = const {
  '1': 'User',
  '2': const [
    const {'1': 'common', '3': 1, '4': 1, '5': 11, '6': '.api.v1.Common', '10': 'common'},
    const {'1': 'content', '3': 2, '4': 1, '5': 11, '6': '.api.v1.User.Content', '10': 'content'},
  ],
  '3': const [User_Content$json],
};

@$core.Deprecated('Use userDescriptor instead')
const User_Content$json = const {
  '1': 'Content',
  '2': const [
    const {'1': 'uuid', '3': 1, '4': 1, '5': 9, '10': 'uuid'},
    const {'1': 'user_type', '3': 2, '4': 1, '5': 9, '10': 'userType'},
    const {'1': 'user_id', '3': 3, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'domain', '3': 4, '4': 1, '5': 9, '10': 'domain'},
    const {'1': 'password', '3': 5, '4': 1, '5': 9, '10': 'password'},
    const {'1': 'user_name', '3': 6, '4': 1, '5': 9, '10': 'userName'},
    const {'1': 'tel_no', '3': 7, '4': 1, '5': 9, '10': 'telNo'},
    const {'1': 'email', '3': 8, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'user_info', '3': 9, '4': 3, '5': 11, '6': '.api.v1.KeyValue', '10': 'userInfo'},
    const {'1': 'device', '3': 10, '4': 1, '5': 11, '6': '.api.v1.Device', '10': 'device'},
    const {'1': 'old_password', '3': 11, '4': 1, '5': 9, '10': 'oldPassword'},
  ],
};

/// Descriptor for `User`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userDescriptor = $convert.base64Decode('CgRVc2VyEiYKBmNvbW1vbhgBIAEoCzIOLmFwaS52MS5Db21tb25SBmNvbW1vbhIuCgdjb250ZW50GAIgASgLMhQuYXBpLnYxLlVzZXIuQ29udGVudFIHY29udGVudBrLAgoHQ29udGVudBISCgR1dWlkGAEgASgJUgR1dWlkEhsKCXVzZXJfdHlwZRgCIAEoCVIIdXNlclR5cGUSFwoHdXNlcl9pZBgDIAEoCVIGdXNlcklkEhYKBmRvbWFpbhgEIAEoCVIGZG9tYWluEhoKCHBhc3N3b3JkGAUgASgJUghwYXNzd29yZBIbCgl1c2VyX25hbWUYBiABKAlSCHVzZXJOYW1lEhUKBnRlbF9ubxgHIAEoCVIFdGVsTm8SFAoFZW1haWwYCCABKAlSBWVtYWlsEi0KCXVzZXJfaW5mbxgJIAMoCzIQLmFwaS52MS5LZXlWYWx1ZVIIdXNlckluZm8SJgoGZGV2aWNlGAogASgLMg4uYXBpLnYxLkRldmljZVIGZGV2aWNlEiEKDG9sZF9wYXNzd29yZBgLIAEoCVILb2xkUGFzc3dvcmQ=');
@$core.Deprecated('Use identityVerificationDescriptor instead')
const IdentityVerification$json = const {
  '1': 'IdentityVerification',
  '2': const [
    const {'1': 'common', '3': 1, '4': 1, '5': 11, '6': '.api.v1.Common', '10': 'common'},
    const {'1': 'content', '3': 2, '4': 1, '5': 11, '6': '.api.v1.IdentityVerification.Content', '10': 'content'},
  ],
  '3': const [IdentityVerification_Content$json],
};

@$core.Deprecated('Use identityVerificationDescriptor instead')
const IdentityVerification_Content$json = const {
  '1': 'Content',
  '2': const [
    const {'1': 'tel_no', '3': 1, '4': 1, '5': 9, '10': 'telNo'},
    const {'1': 'email', '3': 2, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'verification_code', '3': 3, '4': 1, '5': 9, '10': 'verificationCode'},
  ],
};

/// Descriptor for `IdentityVerification`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List identityVerificationDescriptor = $convert.base64Decode('ChRJZGVudGl0eVZlcmlmaWNhdGlvbhImCgZjb21tb24YASABKAsyDi5hcGkudjEuQ29tbW9uUgZjb21tb24SPgoHY29udGVudBgCIAEoCzIkLmFwaS52MS5JZGVudGl0eVZlcmlmaWNhdGlvbi5Db250ZW50Ugdjb250ZW50GmMKB0NvbnRlbnQSFQoGdGVsX25vGAEgASgJUgV0ZWxObxIUCgVlbWFpbBgCIAEoCVIFZW1haWwSKwoRdmVyaWZpY2F0aW9uX2NvZGUYAyABKAlSEHZlcmlmaWNhdGlvbkNvZGU=');
@$core.Deprecated('Use keyValueDescriptor instead')
const KeyValue$json = const {
  '1': 'KeyValue',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
};

/// Descriptor for `KeyValue`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List keyValueDescriptor = $convert.base64Decode('CghLZXlWYWx1ZRIQCgNrZXkYASABKAlSA2tleRIUCgV2YWx1ZRgCIAEoCVIFdmFsdWU=');
@$core.Deprecated('Use deviceDescriptor instead')
const Device$json = const {
  '1': 'Device',
  '2': const [
    const {'1': 'connection_type', '3': 1, '4': 1, '5': 9, '10': 'connectionType'},
    const {'1': 'connection_data', '3': 2, '4': 3, '5': 9, '10': 'connectionData'},
  ],
};

/// Descriptor for `Device`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deviceDescriptor = $convert.base64Decode('CgZEZXZpY2USJwoPY29ubmVjdGlvbl90eXBlGAEgASgJUg5jb25uZWN0aW9uVHlwZRInCg9jb25uZWN0aW9uX2RhdGEYAiADKAlSDmNvbm5lY3Rpb25EYXRh');
@$core.Deprecated('Use yolletPayDataDescriptor instead')
const YolletPayData$json = const {
  '1': 'YolletPayData',
  '2': const [
    const {'1': 'common', '3': 1, '4': 1, '5': 11, '6': '.api.v1.Common', '10': 'common'},
    const {'1': 'content', '3': 2, '4': 1, '5': 11, '6': '.api.v1.YolletPayData.Content', '10': 'content'},
  ],
  '3': const [YolletPayData_Content$json],
  '4': const [YolletPayData_State$json],
};

@$core.Deprecated('Use yolletPayDataDescriptor instead')
const YolletPayData_Content$json = const {
  '1': 'Content',
  '2': const [
    const {'1': 'state', '3': 1, '4': 1, '5': 14, '6': '.api.v1.YolletPayData.State', '10': 'state'},
    const {'1': 'tran_no', '3': 2, '4': 1, '5': 9, '10': 'tranNo'},
    const {'1': 'user_uuid', '3': 3, '4': 1, '5': 9, '10': 'userUuid'},
    const {'1': 'token_id', '3': 4, '4': 1, '5': 9, '10': 'tokenId'},
    const {'1': 'user_address', '3': 5, '4': 1, '5': 9, '10': 'userAddress'},
    const {'1': 'expiration_time', '3': 6, '4': 1, '5': 3, '10': 'expirationTime'},
    const {'1': 'settlement_address', '3': 7, '4': 1, '5': 9, '10': 'settlementAddress'},
    const {'1': 'store_name', '3': 8, '4': 1, '5': 9, '10': 'storeName'},
    const {'1': 'token_amount', '3': 9, '4': 1, '5': 9, '10': 'tokenAmount'},
    const {'1': 'transfer_key', '3': 10, '4': 1, '5': 9, '10': 'transferKey'},
    const {'1': 'transfer_signature', '3': 11, '4': 1, '5': 9, '10': 'transferSignature'},
    const {'1': 'transfer_comment', '3': 12, '4': 1, '5': 9, '10': 'transferComment'},
    const {'1': 'transfer_transaction_id', '3': 13, '4': 1, '5': 9, '10': 'transferTransactionId'},
    const {'1': 'approval_no', '3': 14, '4': 1, '5': 9, '10': 'approvalNo'},
    const {'1': 'approval_date', '3': 15, '4': 1, '5': 9, '10': 'approvalDate'},
    const {'1': 'exchange_date_index', '3': 16, '4': 1, '5': 9, '10': 'exchangeDateIndex'},
    const {'1': 'exchange_rate', '3': 17, '4': 1, '5': 9, '10': 'exchangeRate'},
    const {'1': 'exchange_amount', '3': 18, '4': 1, '5': 9, '10': 'exchangeAmount'},
    const {'1': 'exchange_currency', '3': 19, '4': 1, '5': 9, '10': 'exchangeCurrency'},
    const {'1': 'reward_id', '3': 20, '4': 1, '5': 9, '10': 'rewardId'},
    const {'1': 'reward_date', '3': 21, '4': 1, '5': 9, '10': 'rewardDate'},
    const {'1': 'reward_reason', '3': 22, '4': 1, '5': 9, '10': 'rewardReason'},
    const {'1': 'tid', '3': 23, '4': 1, '5': 9, '10': 'tid'},
  ],
};

@$core.Deprecated('Use yolletPayDataDescriptor instead')
const YolletPayData_State$json = const {
  '1': 'State',
  '2': const [
    const {'1': 'START_PAY', '2': 0},
    const {'1': 'REQUEST_TRANSFER', '2': 1},
    const {'1': 'TRANSFER', '2': 2},
    const {'1': 'END_PAY', '2': 3},
    const {'1': 'START_REWARD', '2': 4},
    const {'1': 'END_REWARD', '2': 5},
  ],
};

/// Descriptor for `YolletPayData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List yolletPayDataDescriptor = $convert.base64Decode('Cg1Zb2xsZXRQYXlEYXRhEiYKBmNvbW1vbhgBIAEoCzIOLmFwaS52MS5Db21tb25SBmNvbW1vbhI3Cgdjb250ZW50GAIgASgLMh0uYXBpLnYxLllvbGxldFBheURhdGEuQ29udGVudFIHY29udGVudBrlBgoHQ29udGVudBIxCgVzdGF0ZRgBIAEoDjIbLmFwaS52MS5Zb2xsZXRQYXlEYXRhLlN0YXRlUgVzdGF0ZRIXCgd0cmFuX25vGAIgASgJUgZ0cmFuTm8SGwoJdXNlcl91dWlkGAMgASgJUgh1c2VyVXVpZBIZCgh0b2tlbl9pZBgEIAEoCVIHdG9rZW5JZBIhCgx1c2VyX2FkZHJlc3MYBSABKAlSC3VzZXJBZGRyZXNzEicKD2V4cGlyYXRpb25fdGltZRgGIAEoA1IOZXhwaXJhdGlvblRpbWUSLQoSc2V0dGxlbWVudF9hZGRyZXNzGAcgASgJUhFzZXR0bGVtZW50QWRkcmVzcxIdCgpzdG9yZV9uYW1lGAggASgJUglzdG9yZU5hbWUSIQoMdG9rZW5fYW1vdW50GAkgASgJUgt0b2tlbkFtb3VudBIhCgx0cmFuc2Zlcl9rZXkYCiABKAlSC3RyYW5zZmVyS2V5Ei0KEnRyYW5zZmVyX3NpZ25hdHVyZRgLIAEoCVIRdHJhbnNmZXJTaWduYXR1cmUSKQoQdHJhbnNmZXJfY29tbWVudBgMIAEoCVIPdHJhbnNmZXJDb21tZW50EjYKF3RyYW5zZmVyX3RyYW5zYWN0aW9uX2lkGA0gASgJUhV0cmFuc2ZlclRyYW5zYWN0aW9uSWQSHwoLYXBwcm92YWxfbm8YDiABKAlSCmFwcHJvdmFsTm8SIwoNYXBwcm92YWxfZGF0ZRgPIAEoCVIMYXBwcm92YWxEYXRlEi4KE2V4Y2hhbmdlX2RhdGVfaW5kZXgYECABKAlSEWV4Y2hhbmdlRGF0ZUluZGV4EiMKDWV4Y2hhbmdlX3JhdGUYESABKAlSDGV4Y2hhbmdlUmF0ZRInCg9leGNoYW5nZV9hbW91bnQYEiABKAlSDmV4Y2hhbmdlQW1vdW50EisKEWV4Y2hhbmdlX2N1cnJlbmN5GBMgASgJUhBleGNoYW5nZUN1cnJlbmN5EhsKCXJld2FyZF9pZBgUIAEoCVIIcmV3YXJkSWQSHwoLcmV3YXJkX2RhdGUYFSABKAlSCnJld2FyZERhdGUSIwoNcmV3YXJkX3JlYXNvbhgWIAEoCVIMcmV3YXJkUmVhc29uEhAKA3RpZBgXIAEoCVIDdGlkImkKBVN0YXRlEg0KCVNUQVJUX1BBWRAAEhQKEFJFUVVFU1RfVFJBTlNGRVIQARIMCghUUkFOU0ZFUhACEgsKB0VORF9QQVkQAxIQCgxTVEFSVF9SRVdBUkQQBBIOCgpFTkRfUkVXQVJEEAU=');
@$core.Deprecated('Use licenseInfoDescriptor instead')
const LicenseInfo$json = const {
  '1': 'LicenseInfo',
  '2': const [
    const {'1': 'ver', '3': 1, '4': 1, '5': 9, '10': 'ver'},
    const {'1': 'key', '3': 2, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'pkg', '3': 3, '4': 1, '5': 9, '10': 'pkg'},
    const {'1': 'sign', '3': 4, '4': 1, '5': 9, '10': 'sign'},
  ],
};

/// Descriptor for `LicenseInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List licenseInfoDescriptor = $convert.base64Decode('CgtMaWNlbnNlSW5mbxIQCgN2ZXIYASABKAlSA3ZlchIQCgNrZXkYAiABKAlSA2tleRIQCgNwa2cYAyABKAlSA3BrZxISCgRzaWduGAQgASgJUgRzaWdu');
@$core.Deprecated('Use licensePermissionDescriptor instead')
const LicensePermission$json = const {
  '1': 'LicensePermission',
  '2': const [
    const {'1': 'device_id', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'store_id', '3': 2, '4': 1, '5': 9, '10': 'storeId'},
    const {'1': 'terminal_id', '3': 3, '4': 1, '5': 9, '10': 'terminalId'},
    const {'1': 'reg_date', '3': 4, '4': 1, '5': 9, '10': 'regDate'},
    const {'1': 'expire_date', '3': 5, '4': 1, '5': 3, '10': 'expireDate'},
    const {'1': 'update_date', '3': 6, '4': 1, '5': 9, '10': 'updateDate'},
    const {'1': 'app_version', '3': 7, '4': 1, '5': 9, '10': 'appVersion'},
    const {'1': 'app_version_code', '3': 8, '4': 1, '5': 9, '10': 'appVersionCode'},
    const {'1': 'sign', '3': 9, '4': 1, '5': 9, '10': 'sign'},
    const {'1': 'state', '3': 10, '4': 1, '5': 9, '10': 'state'},
    const {'1': 'note', '3': 11, '4': 1, '5': 9, '10': 'note'},
  ],
};

/// Descriptor for `LicensePermission`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List licensePermissionDescriptor = $convert.base64Decode('ChFMaWNlbnNlUGVybWlzc2lvbhIbCglkZXZpY2VfaWQYASABKAlSCGRldmljZUlkEhkKCHN0b3JlX2lkGAIgASgJUgdzdG9yZUlkEh8KC3Rlcm1pbmFsX2lkGAMgASgJUgp0ZXJtaW5hbElkEhkKCHJlZ19kYXRlGAQgASgJUgdyZWdEYXRlEh8KC2V4cGlyZV9kYXRlGAUgASgDUgpleHBpcmVEYXRlEh8KC3VwZGF0ZV9kYXRlGAYgASgJUgp1cGRhdGVEYXRlEh8KC2FwcF92ZXJzaW9uGAcgASgJUgphcHBWZXJzaW9uEigKEGFwcF92ZXJzaW9uX2NvZGUYCCABKAlSDmFwcFZlcnNpb25Db2RlEhIKBHNpZ24YCSABKAlSBHNpZ24SFAoFc3RhdGUYCiABKAlSBXN0YXRlEhIKBG5vdGUYCyABKAlSBG5vdGU=');
@$core.Deprecated('Use appVersionInfoDescriptor instead')
const AppVersionInfo$json = const {
  '1': 'AppVersionInfo',
  '2': const [
    const {'1': 'min_ver', '3': 1, '4': 1, '5': 9, '10': 'minVer'},
    const {'1': 'last_ver', '3': 2, '4': 1, '5': 9, '10': 'lastVer'},
    const {'1': 'is_lock', '3': 3, '4': 1, '5': 9, '10': 'isLock'},
  ],
};

/// Descriptor for `AppVersionInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List appVersionInfoDescriptor = $convert.base64Decode('Cg5BcHBWZXJzaW9uSW5mbxIXCgdtaW5fdmVyGAEgASgJUgZtaW5WZXISGQoIbGFzdF92ZXIYAiABKAlSB2xhc3RWZXISFwoHaXNfbG9jaxgDIAEoCVIGaXNMb2Nr');
@$core.Deprecated('Use appLicenseRegisterDescriptor instead')
const AppLicenseRegister$json = const {
  '1': 'AppLicenseRegister',
  '2': const [
    const {'1': 'app_reg_id', '3': 1, '4': 1, '5': 9, '10': 'appRegId'},
    const {'1': 'license_issued_id', '3': 2, '4': 1, '5': 9, '10': 'licenseIssuedId'},
    const {'1': 'store_id', '3': 3, '4': 1, '5': 9, '10': 'storeId'},
    const {'1': 'store_terminal_id', '3': 4, '4': 1, '5': 9, '10': 'storeTerminalId'},
    const {'1': 'device_unique_value', '3': 5, '4': 1, '5': 9, '10': 'deviceUniqueValue'},
    const {'1': 'app_package_id', '3': 6, '4': 1, '5': 9, '10': 'appPackageId'},
    const {'1': 'reg_date', '3': 7, '4': 1, '5': 9, '10': 'regDate'},
    const {'1': 'open_date', '3': 8, '4': 1, '5': 9, '10': 'openDate'},
    const {'1': 'expire_date', '3': 9, '4': 1, '5': 3, '10': 'expireDate'},
    const {'1': 'license_stat', '3': 10, '4': 1, '5': 9, '10': 'licenseStat'},
    const {'1': 'note', '3': 11, '4': 1, '5': 9, '10': 'note'},
    const {'1': 'custom_version_yn', '3': 12, '4': 1, '5': 9, '10': 'customVersionYn'},
    const {'1': 'app_version_name', '3': 13, '4': 1, '5': 9, '10': 'appVersionName'},
    const {'1': 'app_current_version_code', '3': 14, '4': 1, '5': 9, '10': 'appCurrentVersionCode'},
    const {'1': 'app_min_version_code', '3': 15, '4': 1, '5': 9, '10': 'appMinVersionCode'},
    const {'1': 'app_last_version_code', '3': 16, '4': 1, '5': 9, '10': 'appLastVersionCode'},
    const {'1': 'state_code', '3': 17, '4': 1, '5': 9, '10': 'stateCode'},
  ],
};

/// Descriptor for `AppLicenseRegister`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List appLicenseRegisterDescriptor = $convert.base64Decode('ChJBcHBMaWNlbnNlUmVnaXN0ZXISHAoKYXBwX3JlZ19pZBgBIAEoCVIIYXBwUmVnSWQSKgoRbGljZW5zZV9pc3N1ZWRfaWQYAiABKAlSD2xpY2Vuc2VJc3N1ZWRJZBIZCghzdG9yZV9pZBgDIAEoCVIHc3RvcmVJZBIqChFzdG9yZV90ZXJtaW5hbF9pZBgEIAEoCVIPc3RvcmVUZXJtaW5hbElkEi4KE2RldmljZV91bmlxdWVfdmFsdWUYBSABKAlSEWRldmljZVVuaXF1ZVZhbHVlEiQKDmFwcF9wYWNrYWdlX2lkGAYgASgJUgxhcHBQYWNrYWdlSWQSGQoIcmVnX2RhdGUYByABKAlSB3JlZ0RhdGUSGwoJb3Blbl9kYXRlGAggASgJUghvcGVuRGF0ZRIfCgtleHBpcmVfZGF0ZRgJIAEoA1IKZXhwaXJlRGF0ZRIhCgxsaWNlbnNlX3N0YXQYCiABKAlSC2xpY2Vuc2VTdGF0EhIKBG5vdGUYCyABKAlSBG5vdGUSKgoRY3VzdG9tX3ZlcnNpb25feW4YDCABKAlSD2N1c3RvbVZlcnNpb25ZbhIoChBhcHBfdmVyc2lvbl9uYW1lGA0gASgJUg5hcHBWZXJzaW9uTmFtZRI3ChhhcHBfY3VycmVudF92ZXJzaW9uX2NvZGUYDiABKAlSFWFwcEN1cnJlbnRWZXJzaW9uQ29kZRIvChRhcHBfbWluX3ZlcnNpb25fY29kZRgPIAEoCVIRYXBwTWluVmVyc2lvbkNvZGUSMQoVYXBwX2xhc3RfdmVyc2lvbl9jb2RlGBAgASgJUhJhcHBMYXN0VmVyc2lvbkNvZGUSHQoKc3RhdGVfY29kZRgRIAEoCVIJc3RhdGVDb2Rl');
@$core.Deprecated('Use issueLicenseRequestDescriptor instead')
const IssueLicenseRequest$json = const {
  '1': 'IssueLicenseRequest',
  '2': const [
    const {'1': 'common', '3': 1, '4': 1, '5': 11, '6': '.api.v1.Common', '10': 'common'},
    const {'1': 'content', '3': 2, '4': 1, '5': 11, '6': '.api.v1.IssueLicenseRequest.Content', '10': 'content'},
  ],
  '3': const [IssueLicenseRequest_Content$json],
};

@$core.Deprecated('Use issueLicenseRequestDescriptor instead')
const IssueLicenseRequest_Content$json = const {
  '1': 'Content',
  '2': const [
    const {'1': 'license_info', '3': 1, '4': 1, '5': 11, '6': '.api.v1.LicenseInfo', '10': 'licenseInfo'},
  ],
};

/// Descriptor for `IssueLicenseRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List issueLicenseRequestDescriptor = $convert.base64Decode('ChNJc3N1ZUxpY2Vuc2VSZXF1ZXN0EiYKBmNvbW1vbhgBIAEoCzIOLmFwaS52MS5Db21tb25SBmNvbW1vbhI9Cgdjb250ZW50GAIgASgLMiMuYXBpLnYxLklzc3VlTGljZW5zZVJlcXVlc3QuQ29udGVudFIHY29udGVudBpBCgdDb250ZW50EjYKDGxpY2Vuc2VfaW5mbxgBIAEoCzITLmFwaS52MS5MaWNlbnNlSW5mb1ILbGljZW5zZUluZm8=');
@$core.Deprecated('Use issueLicenseResponseDescriptor instead')
const IssueLicenseResponse$json = const {
  '1': 'IssueLicenseResponse',
  '2': const [
    const {'1': 'common', '3': 1, '4': 1, '5': 11, '6': '.api.v1.Common', '10': 'common'},
    const {'1': 'content', '3': 2, '4': 1, '5': 11, '6': '.api.v1.IssueLicenseResponse.Content', '10': 'content'},
  ],
  '3': const [IssueLicenseResponse_Content$json],
};

@$core.Deprecated('Use issueLicenseResponseDescriptor instead')
const IssueLicenseResponse_Content$json = const {
  '1': 'Content',
  '2': const [
    const {'1': 'license_info', '3': 1, '4': 1, '5': 11, '6': '.api.v1.LicenseInfo', '10': 'licenseInfo'},
  ],
};

/// Descriptor for `IssueLicenseResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List issueLicenseResponseDescriptor = $convert.base64Decode('ChRJc3N1ZUxpY2Vuc2VSZXNwb25zZRImCgZjb21tb24YASABKAsyDi5hcGkudjEuQ29tbW9uUgZjb21tb24SPgoHY29udGVudBgCIAEoCzIkLmFwaS52MS5Jc3N1ZUxpY2Vuc2VSZXNwb25zZS5Db250ZW50Ugdjb250ZW50GkEKB0NvbnRlbnQSNgoMbGljZW5zZV9pbmZvGAEgASgLMhMuYXBpLnYxLkxpY2Vuc2VJbmZvUgtsaWNlbnNlSW5mbw==');
@$core.Deprecated('Use requestPermissionRequestDescriptor instead')
const RequestPermissionRequest$json = const {
  '1': 'RequestPermissionRequest',
  '2': const [
    const {'1': 'common', '3': 1, '4': 1, '5': 11, '6': '.api.v1.Common', '10': 'common'},
    const {'1': 'content', '3': 2, '4': 1, '5': 11, '6': '.api.v1.RequestPermissionRequest.Content', '10': 'content'},
  ],
  '3': const [RequestPermissionRequest_Content$json],
};

@$core.Deprecated('Use requestPermissionRequestDescriptor instead')
const RequestPermissionRequest_Content$json = const {
  '1': 'Content',
  '2': const [
    const {'1': 'license_info', '3': 1, '4': 1, '5': 11, '6': '.api.v1.LicenseInfo', '10': 'licenseInfo'},
    const {'1': 'permission', '3': 2, '4': 1, '5': 11, '6': '.api.v1.LicensePermission', '10': 'permission'},
  ],
};

/// Descriptor for `RequestPermissionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List requestPermissionRequestDescriptor = $convert.base64Decode('ChhSZXF1ZXN0UGVybWlzc2lvblJlcXVlc3QSJgoGY29tbW9uGAEgASgLMg4uYXBpLnYxLkNvbW1vblIGY29tbW9uEkIKB2NvbnRlbnQYAiABKAsyKC5hcGkudjEuUmVxdWVzdFBlcm1pc3Npb25SZXF1ZXN0LkNvbnRlbnRSB2NvbnRlbnQafAoHQ29udGVudBI2CgxsaWNlbnNlX2luZm8YASABKAsyEy5hcGkudjEuTGljZW5zZUluZm9SC2xpY2Vuc2VJbmZvEjkKCnBlcm1pc3Npb24YAiABKAsyGS5hcGkudjEuTGljZW5zZVBlcm1pc3Npb25SCnBlcm1pc3Npb24=');
@$core.Deprecated('Use requestPermissionResponseDescriptor instead')
const RequestPermissionResponse$json = const {
  '1': 'RequestPermissionResponse',
  '2': const [
    const {'1': 'common', '3': 1, '4': 1, '5': 11, '6': '.api.v1.Common', '10': 'common'},
    const {'1': 'content', '3': 2, '4': 1, '5': 11, '6': '.api.v1.RequestPermissionResponse.Content', '10': 'content'},
  ],
  '3': const [RequestPermissionResponse_Content$json],
};

@$core.Deprecated('Use requestPermissionResponseDescriptor instead')
const RequestPermissionResponse_Content$json = const {
  '1': 'Content',
  '2': const [
    const {'1': 'license_info', '3': 1, '4': 1, '5': 11, '6': '.api.v1.LicenseInfo', '10': 'licenseInfo'},
    const {'1': 'permission', '3': 2, '4': 1, '5': 11, '6': '.api.v1.LicensePermission', '10': 'permission'},
  ],
};

/// Descriptor for `RequestPermissionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List requestPermissionResponseDescriptor = $convert.base64Decode('ChlSZXF1ZXN0UGVybWlzc2lvblJlc3BvbnNlEiYKBmNvbW1vbhgBIAEoCzIOLmFwaS52MS5Db21tb25SBmNvbW1vbhJDCgdjb250ZW50GAIgASgLMikuYXBpLnYxLlJlcXVlc3RQZXJtaXNzaW9uUmVzcG9uc2UuQ29udGVudFIHY29udGVudBp8CgdDb250ZW50EjYKDGxpY2Vuc2VfaW5mbxgBIAEoCzITLmFwaS52MS5MaWNlbnNlSW5mb1ILbGljZW5zZUluZm8SOQoKcGVybWlzc2lvbhgCIAEoCzIZLmFwaS52MS5MaWNlbnNlUGVybWlzc2lvblIKcGVybWlzc2lvbg==');
@$core.Deprecated('Use confirmPermissionRequestDescriptor instead')
const ConfirmPermissionRequest$json = const {
  '1': 'ConfirmPermissionRequest',
  '2': const [
    const {'1': 'common', '3': 1, '4': 1, '5': 11, '6': '.api.v1.Common', '10': 'common'},
    const {'1': 'content', '3': 2, '4': 1, '5': 11, '6': '.api.v1.ConfirmPermissionRequest.Content', '10': 'content'},
  ],
  '3': const [ConfirmPermissionRequest_Content$json],
};

@$core.Deprecated('Use confirmPermissionRequestDescriptor instead')
const ConfirmPermissionRequest_Content$json = const {
  '1': 'Content',
  '2': const [
    const {'1': 'license_info', '3': 1, '4': 1, '5': 11, '6': '.api.v1.LicenseInfo', '10': 'licenseInfo'},
    const {'1': 'permission', '3': 2, '4': 1, '5': 11, '6': '.api.v1.LicensePermission', '10': 'permission'},
  ],
};

/// Descriptor for `ConfirmPermissionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List confirmPermissionRequestDescriptor = $convert.base64Decode('ChhDb25maXJtUGVybWlzc2lvblJlcXVlc3QSJgoGY29tbW9uGAEgASgLMg4uYXBpLnYxLkNvbW1vblIGY29tbW9uEkIKB2NvbnRlbnQYAiABKAsyKC5hcGkudjEuQ29uZmlybVBlcm1pc3Npb25SZXF1ZXN0LkNvbnRlbnRSB2NvbnRlbnQafAoHQ29udGVudBI2CgxsaWNlbnNlX2luZm8YASABKAsyEy5hcGkudjEuTGljZW5zZUluZm9SC2xpY2Vuc2VJbmZvEjkKCnBlcm1pc3Npb24YAiABKAsyGS5hcGkudjEuTGljZW5zZVBlcm1pc3Npb25SCnBlcm1pc3Npb24=');
@$core.Deprecated('Use confirmPermissionResponseDescriptor instead')
const ConfirmPermissionResponse$json = const {
  '1': 'ConfirmPermissionResponse',
  '2': const [
    const {'1': 'common', '3': 1, '4': 1, '5': 11, '6': '.api.v1.Common', '10': 'common'},
    const {'1': 'content', '3': 2, '4': 1, '5': 11, '6': '.api.v1.ConfirmPermissionResponse.Content', '10': 'content'},
  ],
  '3': const [ConfirmPermissionResponse_Content$json],
};

@$core.Deprecated('Use confirmPermissionResponseDescriptor instead')
const ConfirmPermissionResponse_Content$json = const {
  '1': 'Content',
  '2': const [
    const {'1': 'license_info', '3': 1, '4': 1, '5': 11, '6': '.api.v1.LicenseInfo', '10': 'licenseInfo'},
    const {'1': 'permission', '3': 2, '4': 1, '5': 11, '6': '.api.v1.LicensePermission', '10': 'permission'},
  ],
};

/// Descriptor for `ConfirmPermissionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List confirmPermissionResponseDescriptor = $convert.base64Decode('ChlDb25maXJtUGVybWlzc2lvblJlc3BvbnNlEiYKBmNvbW1vbhgBIAEoCzIOLmFwaS52MS5Db21tb25SBmNvbW1vbhJDCgdjb250ZW50GAIgASgLMikuYXBpLnYxLkNvbmZpcm1QZXJtaXNzaW9uUmVzcG9uc2UuQ29udGVudFIHY29udGVudBp8CgdDb250ZW50EjYKDGxpY2Vuc2VfaW5mbxgBIAEoCzITLmFwaS52MS5MaWNlbnNlSW5mb1ILbGljZW5zZUluZm8SOQoKcGVybWlzc2lvbhgCIAEoCzIZLmFwaS52MS5MaWNlbnNlUGVybWlzc2lvblIKcGVybWlzc2lvbg==');
@$core.Deprecated('Use verifyLicenseRequestDescriptor instead')
const VerifyLicenseRequest$json = const {
  '1': 'VerifyLicenseRequest',
  '2': const [
    const {'1': 'common', '3': 1, '4': 1, '5': 11, '6': '.api.v1.Common', '10': 'common'},
    const {'1': 'content', '3': 2, '4': 1, '5': 11, '6': '.api.v1.VerifyLicenseRequest.Content', '10': 'content'},
  ],
  '3': const [VerifyLicenseRequest_Content$json],
};

@$core.Deprecated('Use verifyLicenseRequestDescriptor instead')
const VerifyLicenseRequest_Content$json = const {
  '1': 'Content',
  '2': const [
    const {'1': 'license_info', '3': 1, '4': 1, '5': 11, '6': '.api.v1.LicenseInfo', '10': 'licenseInfo'},
    const {'1': 'permission', '3': 2, '4': 1, '5': 11, '6': '.api.v1.LicensePermission', '10': 'permission'},
    const {'1': 'app_ver_info', '3': 3, '4': 1, '5': 11, '6': '.api.v1.AppVersionInfo', '10': 'appVerInfo'},
  ],
};

/// Descriptor for `VerifyLicenseRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List verifyLicenseRequestDescriptor = $convert.base64Decode('ChRWZXJpZnlMaWNlbnNlUmVxdWVzdBImCgZjb21tb24YASABKAsyDi5hcGkudjEuQ29tbW9uUgZjb21tb24SPgoHY29udGVudBgCIAEoCzIkLmFwaS52MS5WZXJpZnlMaWNlbnNlUmVxdWVzdC5Db250ZW50Ugdjb250ZW50GrYBCgdDb250ZW50EjYKDGxpY2Vuc2VfaW5mbxgBIAEoCzITLmFwaS52MS5MaWNlbnNlSW5mb1ILbGljZW5zZUluZm8SOQoKcGVybWlzc2lvbhgCIAEoCzIZLmFwaS52MS5MaWNlbnNlUGVybWlzc2lvblIKcGVybWlzc2lvbhI4CgxhcHBfdmVyX2luZm8YAyABKAsyFi5hcGkudjEuQXBwVmVyc2lvbkluZm9SCmFwcFZlckluZm8=');
@$core.Deprecated('Use verifyLicenseResponseDescriptor instead')
const VerifyLicenseResponse$json = const {
  '1': 'VerifyLicenseResponse',
  '2': const [
    const {'1': 'common', '3': 1, '4': 1, '5': 11, '6': '.api.v1.Common', '10': 'common'},
    const {'1': 'content', '3': 2, '4': 1, '5': 11, '6': '.api.v1.VerifyLicenseResponse.Content', '10': 'content'},
  ],
  '3': const [VerifyLicenseResponse_Content$json],
};

@$core.Deprecated('Use verifyLicenseResponseDescriptor instead')
const VerifyLicenseResponse_Content$json = const {
  '1': 'Content',
  '2': const [
    const {'1': 'license_info', '3': 1, '4': 1, '5': 11, '6': '.api.v1.LicenseInfo', '10': 'licenseInfo'},
    const {'1': 'permission', '3': 2, '4': 1, '5': 11, '6': '.api.v1.LicensePermission', '10': 'permission'},
    const {'1': 'app_ver_info', '3': 3, '4': 1, '5': 11, '6': '.api.v1.AppVersionInfo', '10': 'appVerInfo'},
  ],
};

/// Descriptor for `VerifyLicenseResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List verifyLicenseResponseDescriptor = $convert.base64Decode('ChVWZXJpZnlMaWNlbnNlUmVzcG9uc2USJgoGY29tbW9uGAEgASgLMg4uYXBpLnYxLkNvbW1vblIGY29tbW9uEj8KB2NvbnRlbnQYAiABKAsyJS5hcGkudjEuVmVyaWZ5TGljZW5zZVJlc3BvbnNlLkNvbnRlbnRSB2NvbnRlbnQatgEKB0NvbnRlbnQSNgoMbGljZW5zZV9pbmZvGAEgASgLMhMuYXBpLnYxLkxpY2Vuc2VJbmZvUgtsaWNlbnNlSW5mbxI5CgpwZXJtaXNzaW9uGAIgASgLMhkuYXBpLnYxLkxpY2Vuc2VQZXJtaXNzaW9uUgpwZXJtaXNzaW9uEjgKDGFwcF92ZXJfaW5mbxgDIAEoCzIWLmFwaS52MS5BcHBWZXJzaW9uSW5mb1IKYXBwVmVySW5mbw==');
@$core.Deprecated('Use getLicenseListRequestDescriptor instead')
const GetLicenseListRequest$json = const {
  '1': 'GetLicenseListRequest',
  '2': const [
    const {'1': 'common', '3': 1, '4': 1, '5': 11, '6': '.api.v1.Common', '10': 'common'},
    const {'1': 'content', '3': 2, '4': 1, '5': 11, '6': '.api.v1.GetLicenseListRequest.Content', '10': 'content'},
  ],
  '3': const [GetLicenseListRequest_Content$json],
};

@$core.Deprecated('Use getLicenseListRequestDescriptor instead')
const GetLicenseListRequest_Content$json = const {
  '1': 'Content',
  '2': const [
    const {'1': 'store_id', '3': 1, '4': 1, '5': 9, '10': 'storeId'},
    const {'1': 'page', '3': 2, '4': 1, '5': 5, '10': 'page'},
    const {'1': 'limit', '3': 3, '4': 1, '5': 5, '10': 'limit'},
    const {'1': 'order_store_id', '3': 4, '4': 1, '5': 5, '10': 'orderStoreId'},
    const {'1': 'order_app_package_id', '3': 5, '4': 1, '5': 5, '10': 'orderAppPackageId'},
    const {'1': 'order_open_date', '3': 6, '4': 1, '5': 5, '10': 'orderOpenDate'},
    const {'1': 'order_expire_date', '3': 7, '4': 1, '5': 5, '10': 'orderExpireDate'},
    const {'1': 'order_license_stat', '3': 8, '4': 1, '5': 5, '10': 'orderLicenseStat'},
  ],
};

/// Descriptor for `GetLicenseListRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getLicenseListRequestDescriptor = $convert.base64Decode('ChVHZXRMaWNlbnNlTGlzdFJlcXVlc3QSJgoGY29tbW9uGAEgASgLMg4uYXBpLnYxLkNvbW1vblIGY29tbW9uEj8KB2NvbnRlbnQYAiABKAsyJS5hcGkudjEuR2V0TGljZW5zZUxpc3RSZXF1ZXN0LkNvbnRlbnRSB2NvbnRlbnQapwIKB0NvbnRlbnQSGQoIc3RvcmVfaWQYASABKAlSB3N0b3JlSWQSEgoEcGFnZRgCIAEoBVIEcGFnZRIUCgVsaW1pdBgDIAEoBVIFbGltaXQSJAoOb3JkZXJfc3RvcmVfaWQYBCABKAVSDG9yZGVyU3RvcmVJZBIvChRvcmRlcl9hcHBfcGFja2FnZV9pZBgFIAEoBVIRb3JkZXJBcHBQYWNrYWdlSWQSJgoPb3JkZXJfb3Blbl9kYXRlGAYgASgFUg1vcmRlck9wZW5EYXRlEioKEW9yZGVyX2V4cGlyZV9kYXRlGAcgASgFUg9vcmRlckV4cGlyZURhdGUSLAoSb3JkZXJfbGljZW5zZV9zdGF0GAggASgFUhBvcmRlckxpY2Vuc2VTdGF0');
@$core.Deprecated('Use getLicenseListResponseDescriptor instead')
const GetLicenseListResponse$json = const {
  '1': 'GetLicenseListResponse',
  '2': const [
    const {'1': 'common', '3': 1, '4': 1, '5': 11, '6': '.api.v1.Common', '10': 'common'},
    const {'1': 'content', '3': 2, '4': 1, '5': 11, '6': '.api.v1.GetLicenseListResponse.Content', '10': 'content'},
  ],
  '3': const [GetLicenseListResponse_Content$json],
};

@$core.Deprecated('Use getLicenseListResponseDescriptor instead')
const GetLicenseListResponse_Content$json = const {
  '1': 'Content',
  '2': const [
    const {'1': 'item', '3': 1, '4': 3, '5': 11, '6': '.api.v1.AppLicenseRegister', '10': 'item'},
  ],
};

/// Descriptor for `GetLicenseListResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getLicenseListResponseDescriptor = $convert.base64Decode('ChZHZXRMaWNlbnNlTGlzdFJlc3BvbnNlEiYKBmNvbW1vbhgBIAEoCzIOLmFwaS52MS5Db21tb25SBmNvbW1vbhJACgdjb250ZW50GAIgASgLMiYuYXBpLnYxLkdldExpY2Vuc2VMaXN0UmVzcG9uc2UuQ29udGVudFIHY29udGVudBo5CgdDb250ZW50Ei4KBGl0ZW0YASADKAsyGi5hcGkudjEuQXBwTGljZW5zZVJlZ2lzdGVyUgRpdGVt');
@$core.Deprecated('Use getLicenseDetailRequestDescriptor instead')
const GetLicenseDetailRequest$json = const {
  '1': 'GetLicenseDetailRequest',
  '2': const [
    const {'1': 'common', '3': 1, '4': 1, '5': 11, '6': '.api.v1.Common', '10': 'common'},
    const {'1': 'content', '3': 2, '4': 1, '5': 11, '6': '.api.v1.GetLicenseDetailRequest.Content', '10': 'content'},
  ],
  '3': const [GetLicenseDetailRequest_Content$json],
};

@$core.Deprecated('Use getLicenseDetailRequestDescriptor instead')
const GetLicenseDetailRequest_Content$json = const {
  '1': 'Content',
  '2': const [
    const {'1': 'store_id', '3': 1, '4': 1, '5': 9, '10': 'storeId'},
    const {'1': 'app_reg_id', '3': 2, '4': 1, '5': 9, '10': 'appRegId'},
  ],
};

/// Descriptor for `GetLicenseDetailRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getLicenseDetailRequestDescriptor = $convert.base64Decode('ChdHZXRMaWNlbnNlRGV0YWlsUmVxdWVzdBImCgZjb21tb24YASABKAsyDi5hcGkudjEuQ29tbW9uUgZjb21tb24SQQoHY29udGVudBgCIAEoCzInLmFwaS52MS5HZXRMaWNlbnNlRGV0YWlsUmVxdWVzdC5Db250ZW50Ugdjb250ZW50GkIKB0NvbnRlbnQSGQoIc3RvcmVfaWQYASABKAlSB3N0b3JlSWQSHAoKYXBwX3JlZ19pZBgCIAEoCVIIYXBwUmVnSWQ=');
@$core.Deprecated('Use getLicenseDetailResponseDescriptor instead')
const GetLicenseDetailResponse$json = const {
  '1': 'GetLicenseDetailResponse',
  '2': const [
    const {'1': 'common', '3': 1, '4': 1, '5': 11, '6': '.api.v1.Common', '10': 'common'},
    const {'1': 'content', '3': 2, '4': 1, '5': 11, '6': '.api.v1.GetLicenseDetailResponse.Content', '10': 'content'},
  ],
  '3': const [GetLicenseDetailResponse_Content$json],
};

@$core.Deprecated('Use getLicenseDetailResponseDescriptor instead')
const GetLicenseDetailResponse_Content$json = const {
  '1': 'Content',
  '2': const [
    const {'1': 'item', '3': 1, '4': 1, '5': 11, '6': '.api.v1.AppLicenseRegister', '10': 'item'},
  ],
};

/// Descriptor for `GetLicenseDetailResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getLicenseDetailResponseDescriptor = $convert.base64Decode('ChhHZXRMaWNlbnNlRGV0YWlsUmVzcG9uc2USJgoGY29tbW9uGAEgASgLMg4uYXBpLnYxLkNvbW1vblIGY29tbW9uEkIKB2NvbnRlbnQYAiABKAsyKC5hcGkudjEuR2V0TGljZW5zZURldGFpbFJlc3BvbnNlLkNvbnRlbnRSB2NvbnRlbnQaOQoHQ29udGVudBIuCgRpdGVtGAEgASgLMhouYXBpLnYxLkFwcExpY2Vuc2VSZWdpc3RlclIEaXRlbQ==');
@$core.Deprecated('Use updateLicenseInfoRequestDescriptor instead')
const UpdateLicenseInfoRequest$json = const {
  '1': 'UpdateLicenseInfoRequest',
  '2': const [
    const {'1': 'common', '3': 1, '4': 1, '5': 11, '6': '.api.v1.Common', '10': 'common'},
    const {'1': 'content', '3': 2, '4': 1, '5': 11, '6': '.api.v1.UpdateLicenseInfoRequest.Content', '10': 'content'},
  ],
  '3': const [UpdateLicenseInfoRequest_Content$json],
};

@$core.Deprecated('Use updateLicenseInfoRequestDescriptor instead')
const UpdateLicenseInfoRequest_Content$json = const {
  '1': 'Content',
  '2': const [
    const {'1': 'store_id', '3': 1, '4': 1, '5': 9, '10': 'storeId'},
    const {'1': 'app_reg_id', '3': 2, '4': 1, '5': 9, '10': 'appRegId'},
    const {'1': 'expire_date', '3': 3, '4': 1, '5': 3, '10': 'expireDate'},
    const {'1': 'license_stat', '3': 4, '4': 1, '5': 9, '10': 'licenseStat'},
    const {'1': 'note', '3': 5, '4': 1, '5': 9, '10': 'note'},
    const {'1': 'custom_version_yn', '3': 6, '4': 1, '5': 9, '10': 'customVersionYn'},
    const {'1': 'app_version_name', '3': 7, '4': 1, '5': 9, '10': 'appVersionName'},
  ],
};

/// Descriptor for `UpdateLicenseInfoRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateLicenseInfoRequestDescriptor = $convert.base64Decode('ChhVcGRhdGVMaWNlbnNlSW5mb1JlcXVlc3QSJgoGY29tbW9uGAEgASgLMg4uYXBpLnYxLkNvbW1vblIGY29tbW9uEkIKB2NvbnRlbnQYAiABKAsyKC5hcGkudjEuVXBkYXRlTGljZW5zZUluZm9SZXF1ZXN0LkNvbnRlbnRSB2NvbnRlbnQa8AEKB0NvbnRlbnQSGQoIc3RvcmVfaWQYASABKAlSB3N0b3JlSWQSHAoKYXBwX3JlZ19pZBgCIAEoCVIIYXBwUmVnSWQSHwoLZXhwaXJlX2RhdGUYAyABKANSCmV4cGlyZURhdGUSIQoMbGljZW5zZV9zdGF0GAQgASgJUgtsaWNlbnNlU3RhdBISCgRub3RlGAUgASgJUgRub3RlEioKEWN1c3RvbV92ZXJzaW9uX3luGAYgASgJUg9jdXN0b21WZXJzaW9uWW4SKAoQYXBwX3ZlcnNpb25fbmFtZRgHIAEoCVIOYXBwVmVyc2lvbk5hbWU=');
@$core.Deprecated('Use updateLicenseInfoResponseDescriptor instead')
const UpdateLicenseInfoResponse$json = const {
  '1': 'UpdateLicenseInfoResponse',
  '2': const [
    const {'1': 'common', '3': 1, '4': 1, '5': 11, '6': '.api.v1.Common', '10': 'common'},
    const {'1': 'content', '3': 2, '4': 1, '5': 11, '6': '.api.v1.UpdateLicenseInfoResponse.Content', '10': 'content'},
  ],
  '3': const [UpdateLicenseInfoResponse_Content$json],
};

@$core.Deprecated('Use updateLicenseInfoResponseDescriptor instead')
const UpdateLicenseInfoResponse_Content$json = const {
  '1': 'Content',
  '2': const [
    const {'1': 'item', '3': 1, '4': 1, '5': 11, '6': '.api.v1.AppLicenseRegister', '10': 'item'},
  ],
};

/// Descriptor for `UpdateLicenseInfoResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateLicenseInfoResponseDescriptor = $convert.base64Decode('ChlVcGRhdGVMaWNlbnNlSW5mb1Jlc3BvbnNlEiYKBmNvbW1vbhgBIAEoCzIOLmFwaS52MS5Db21tb25SBmNvbW1vbhJDCgdjb250ZW50GAIgASgLMikuYXBpLnYxLlVwZGF0ZUxpY2Vuc2VJbmZvUmVzcG9uc2UuQ29udGVudFIHY29udGVudBo5CgdDb250ZW50Ei4KBGl0ZW0YASABKAsyGi5hcGkudjEuQXBwTGljZW5zZVJlZ2lzdGVyUgRpdGVt');
@$core.Deprecated('Use loginDomainDescriptor instead')
const LoginDomain$json = const {
  '1': 'LoginDomain',
  '2': const [
    const {'1': 'common', '3': 1, '4': 1, '5': 11, '6': '.api.v1.Common', '10': 'common'},
    const {'1': 'content', '3': 2, '4': 1, '5': 11, '6': '.api.v1.LoginDomain.Content', '10': 'content'},
  ],
  '3': const [LoginDomain_Content$json],
};

@$core.Deprecated('Use loginDomainDescriptor instead')
const LoginDomain_Content$json = const {
  '1': 'Content',
  '2': const [
    const {'1': 'domain', '3': 1, '4': 3, '5': 9, '10': 'domain'},
  ],
};

/// Descriptor for `LoginDomain`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginDomainDescriptor = $convert.base64Decode('CgtMb2dpbkRvbWFpbhImCgZjb21tb24YASABKAsyDi5hcGkudjEuQ29tbW9uUgZjb21tb24SNQoHY29udGVudBgCIAEoCzIbLmFwaS52MS5Mb2dpbkRvbWFpbi5Db250ZW50Ugdjb250ZW50GiEKB0NvbnRlbnQSFgoGZG9tYWluGAEgAygJUgZkb21haW4=');
@$core.Deprecated('Use storeTokenInfoDescriptor instead')
const StoreTokenInfo$json = const {
  '1': 'StoreTokenInfo',
  '2': const [
    const {'1': 'common', '3': 1, '4': 1, '5': 11, '6': '.api.v1.Common', '10': 'common'},
    const {'1': 'content', '3': 2, '4': 1, '5': 11, '6': '.api.v1.StoreTokenInfo.Content', '10': 'content'},
  ],
  '3': const [StoreTokenInfo_Content$json],
};

@$core.Deprecated('Use storeTokenInfoDescriptor instead')
const StoreTokenInfo_Content$json = const {
  '1': 'Content',
  '2': const [
    const {'1': 'addresses', '3': 1, '4': 3, '5': 9, '10': 'addresses'},
    const {'1': 'loginId', '3': 2, '4': 1, '5': 9, '10': 'loginId'},
    const {'1': 'store_name', '3': 3, '4': 1, '5': 9, '10': 'storeName'},
    const {'1': 'tel_no', '3': 4, '4': 1, '5': 9, '10': 'telNo'},
  ],
};

/// Descriptor for `StoreTokenInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List storeTokenInfoDescriptor = $convert.base64Decode('Cg5TdG9yZVRva2VuSW5mbxImCgZjb21tb24YASABKAsyDi5hcGkudjEuQ29tbW9uUgZjb21tb24SOAoHY29udGVudBgCIAEoCzIeLmFwaS52MS5TdG9yZVRva2VuSW5mby5Db250ZW50Ugdjb250ZW50GncKB0NvbnRlbnQSHAoJYWRkcmVzc2VzGAEgAygJUglhZGRyZXNzZXMSGAoHbG9naW5JZBgCIAEoCVIHbG9naW5JZBIdCgpzdG9yZV9uYW1lGAMgASgJUglzdG9yZU5hbWUSFQoGdGVsX25vGAQgASgJUgV0ZWxObw==');

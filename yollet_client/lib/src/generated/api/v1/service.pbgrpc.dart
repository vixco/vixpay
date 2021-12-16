///
//  Generated code. Do not modify.
//  source: api/v1/service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'message.pb.dart' as $1;
export 'service.pb.dart';

class UserServiceClient extends $grpc.Client {
  static final _$signUp = $grpc.ClientMethod<$1.User, $1.User>(
      '/api.v1.UserService/SignUp',
      ($1.User value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.User.fromBuffer(value));
  static final _$getUser = $grpc.ClientMethod<$1.User, $1.User>(
      '/api.v1.UserService/GetUser',
      ($1.User value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.User.fromBuffer(value));
  static final _$updateUser = $grpc.ClientMethod<$1.User, $1.Empty>(
      '/api.v1.UserService/UpdateUser',
      ($1.User value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$findUserId = $grpc.ClientMethod<$1.User, $1.User>(
      '/api.v1.UserService/FindUserId',
      ($1.User value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.User.fromBuffer(value));
  static final _$resetPassword =
      $grpc.ClientMethod<$1.IdentityVerification, $1.Empty>(
          '/api.v1.UserService/ResetPassword',
          ($1.IdentityVerification value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$verifyIdentity =
      $grpc.ClientMethod<$1.IdentityVerification, $1.Empty>(
          '/api.v1.UserService/VerifyIdentity',
          ($1.IdentityVerification value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$unregister = $grpc.ClientMethod<$1.User, $1.Empty>(
      '/api.v1.UserService/Unregister',
      ($1.User value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));

  UserServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$1.User> signUp($1.User request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$signUp, request, options: options);
  }

  $grpc.ResponseFuture<$1.User> getUser($1.User request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getUser, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> updateUser($1.User request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateUser, request, options: options);
  }

  $grpc.ResponseFuture<$1.User> findUserId($1.User request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$findUserId, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> resetPassword($1.IdentityVerification request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$resetPassword, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> verifyIdentity($1.IdentityVerification request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$verifyIdentity, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> unregister($1.User request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$unregister, request, options: options);
  }
}

abstract class UserServiceBase extends $grpc.Service {
  $core.String get $name => 'api.v1.UserService';

  UserServiceBase() {
    $addMethod($grpc.ServiceMethod<$1.User, $1.User>(
        'SignUp',
        signUp_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.User.fromBuffer(value),
        ($1.User value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.User, $1.User>(
        'GetUser',
        getUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.User.fromBuffer(value),
        ($1.User value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.User, $1.Empty>(
        'UpdateUser',
        updateUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.User.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.User, $1.User>(
        'FindUserId',
        findUserId_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.User.fromBuffer(value),
        ($1.User value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.IdentityVerification, $1.Empty>(
        'ResetPassword',
        resetPassword_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.IdentityVerification.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.IdentityVerification, $1.Empty>(
        'VerifyIdentity',
        verifyIdentity_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.IdentityVerification.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.User, $1.Empty>(
        'Unregister',
        unregister_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.User.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
  }

  $async.Future<$1.User> signUp_Pre(
      $grpc.ServiceCall call, $async.Future<$1.User> request) async {
    return signUp(call, await request);
  }

  $async.Future<$1.User> getUser_Pre(
      $grpc.ServiceCall call, $async.Future<$1.User> request) async {
    return getUser(call, await request);
  }

  $async.Future<$1.Empty> updateUser_Pre(
      $grpc.ServiceCall call, $async.Future<$1.User> request) async {
    return updateUser(call, await request);
  }

  $async.Future<$1.User> findUserId_Pre(
      $grpc.ServiceCall call, $async.Future<$1.User> request) async {
    return findUserId(call, await request);
  }

  $async.Future<$1.Empty> resetPassword_Pre($grpc.ServiceCall call,
      $async.Future<$1.IdentityVerification> request) async {
    return resetPassword(call, await request);
  }

  $async.Future<$1.Empty> verifyIdentity_Pre($grpc.ServiceCall call,
      $async.Future<$1.IdentityVerification> request) async {
    return verifyIdentity(call, await request);
  }

  $async.Future<$1.Empty> unregister_Pre(
      $grpc.ServiceCall call, $async.Future<$1.User> request) async {
    return unregister(call, await request);
  }

  $async.Future<$1.User> signUp($grpc.ServiceCall call, $1.User request);
  $async.Future<$1.User> getUser($grpc.ServiceCall call, $1.User request);
  $async.Future<$1.Empty> updateUser($grpc.ServiceCall call, $1.User request);
  $async.Future<$1.User> findUserId($grpc.ServiceCall call, $1.User request);
  $async.Future<$1.Empty> resetPassword(
      $grpc.ServiceCall call, $1.IdentityVerification request);
  $async.Future<$1.Empty> verifyIdentity(
      $grpc.ServiceCall call, $1.IdentityVerification request);
  $async.Future<$1.Empty> unregister($grpc.ServiceCall call, $1.User request);
}

class PaymentsServiceClient extends $grpc.Client {
  static final _$doYolletPayment =
      $grpc.ClientMethod<$1.YolletPayData, $1.YolletPayData>(
          '/api.v1.PaymentsService/DoYolletPayment',
          ($1.YolletPayData value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.YolletPayData.fromBuffer(value));

  PaymentsServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseStream<$1.YolletPayData> doYolletPayment(
      $async.Stream<$1.YolletPayData> request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$doYolletPayment, request, options: options);
  }
}

abstract class PaymentsServiceBase extends $grpc.Service {
  $core.String get $name => 'api.v1.PaymentsService';

  PaymentsServiceBase() {
    $addMethod($grpc.ServiceMethod<$1.YolletPayData, $1.YolletPayData>(
        'DoYolletPayment',
        doYolletPayment,
        true,
        true,
        ($core.List<$core.int> value) => $1.YolletPayData.fromBuffer(value),
        ($1.YolletPayData value) => value.writeToBuffer()));
  }

  $async.Stream<$1.YolletPayData> doYolletPayment(
      $grpc.ServiceCall call, $async.Stream<$1.YolletPayData> request);
}

class LicenseServiceClient extends $grpc.Client {
  static final _$issueLicense =
      $grpc.ClientMethod<$1.IssueLicenseRequest, $1.IssueLicenseResponse>(
          '/api.v1.LicenseService/IssueLicense',
          ($1.IssueLicenseRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.IssueLicenseResponse.fromBuffer(value));
  static final _$requestPermission = $grpc.ClientMethod<
          $1.RequestPermissionRequest, $1.RequestPermissionResponse>(
      '/api.v1.LicenseService/RequestPermission',
      ($1.RequestPermissionRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $1.RequestPermissionResponse.fromBuffer(value));
  static final _$confirmPermission = $grpc.ClientMethod<
          $1.ConfirmPermissionRequest, $1.ConfirmPermissionResponse>(
      '/api.v1.LicenseService/ConfirmPermission',
      ($1.ConfirmPermissionRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $1.ConfirmPermissionResponse.fromBuffer(value));
  static final _$verifyLicense =
      $grpc.ClientMethod<$1.VerifyLicenseRequest, $1.VerifyLicenseResponse>(
          '/api.v1.LicenseService/VerifyLicense',
          ($1.VerifyLicenseRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.VerifyLicenseResponse.fromBuffer(value));
  static final _$getLicenseList =
      $grpc.ClientMethod<$1.GetLicenseListRequest, $1.GetLicenseListResponse>(
          '/api.v1.LicenseService/GetLicenseList',
          ($1.GetLicenseListRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.GetLicenseListResponse.fromBuffer(value));
  static final _$getLicenseDetail = $grpc.ClientMethod<
          $1.GetLicenseDetailRequest, $1.GetLicenseDetailResponse>(
      '/api.v1.LicenseService/GetLicenseDetail',
      ($1.GetLicenseDetailRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $1.GetLicenseDetailResponse.fromBuffer(value));
  static final _$updateLicenseInfo = $grpc.ClientMethod<
          $1.UpdateLicenseInfoRequest, $1.UpdateLicenseInfoResponse>(
      '/api.v1.LicenseService/UpdateLicenseInfo',
      ($1.UpdateLicenseInfoRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $1.UpdateLicenseInfoResponse.fromBuffer(value));

  LicenseServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$1.IssueLicenseResponse> issueLicense(
      $1.IssueLicenseRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$issueLicense, request, options: options);
  }

  $grpc.ResponseFuture<$1.RequestPermissionResponse> requestPermission(
      $1.RequestPermissionRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$requestPermission, request, options: options);
  }

  $grpc.ResponseFuture<$1.ConfirmPermissionResponse> confirmPermission(
      $1.ConfirmPermissionRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$confirmPermission, request, options: options);
  }

  $grpc.ResponseFuture<$1.VerifyLicenseResponse> verifyLicense(
      $1.VerifyLicenseRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$verifyLicense, request, options: options);
  }

  $grpc.ResponseFuture<$1.GetLicenseListResponse> getLicenseList(
      $1.GetLicenseListRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getLicenseList, request, options: options);
  }

  $grpc.ResponseFuture<$1.GetLicenseDetailResponse> getLicenseDetail(
      $1.GetLicenseDetailRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getLicenseDetail, request, options: options);
  }

  $grpc.ResponseFuture<$1.UpdateLicenseInfoResponse> updateLicenseInfo(
      $1.UpdateLicenseInfoRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateLicenseInfo, request, options: options);
  }
}

abstract class LicenseServiceBase extends $grpc.Service {
  $core.String get $name => 'api.v1.LicenseService';

  LicenseServiceBase() {
    $addMethod(
        $grpc.ServiceMethod<$1.IssueLicenseRequest, $1.IssueLicenseResponse>(
            'IssueLicense',
            issueLicense_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $1.IssueLicenseRequest.fromBuffer(value),
            ($1.IssueLicenseResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.RequestPermissionRequest,
            $1.RequestPermissionResponse>(
        'RequestPermission',
        requestPermission_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.RequestPermissionRequest.fromBuffer(value),
        ($1.RequestPermissionResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.ConfirmPermissionRequest,
            $1.ConfirmPermissionResponse>(
        'ConfirmPermission',
        confirmPermission_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.ConfirmPermissionRequest.fromBuffer(value),
        ($1.ConfirmPermissionResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$1.VerifyLicenseRequest, $1.VerifyLicenseResponse>(
            'VerifyLicense',
            verifyLicense_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $1.VerifyLicenseRequest.fromBuffer(value),
            ($1.VerifyLicenseResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.GetLicenseListRequest,
            $1.GetLicenseListResponse>(
        'GetLicenseList',
        getLicenseList_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.GetLicenseListRequest.fromBuffer(value),
        ($1.GetLicenseListResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.GetLicenseDetailRequest,
            $1.GetLicenseDetailResponse>(
        'GetLicenseDetail',
        getLicenseDetail_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.GetLicenseDetailRequest.fromBuffer(value),
        ($1.GetLicenseDetailResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.UpdateLicenseInfoRequest,
            $1.UpdateLicenseInfoResponse>(
        'UpdateLicenseInfo',
        updateLicenseInfo_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.UpdateLicenseInfoRequest.fromBuffer(value),
        ($1.UpdateLicenseInfoResponse value) => value.writeToBuffer()));
  }

  $async.Future<$1.IssueLicenseResponse> issueLicense_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.IssueLicenseRequest> request) async {
    return issueLicense(call, await request);
  }

  $async.Future<$1.RequestPermissionResponse> requestPermission_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.RequestPermissionRequest> request) async {
    return requestPermission(call, await request);
  }

  $async.Future<$1.ConfirmPermissionResponse> confirmPermission_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.ConfirmPermissionRequest> request) async {
    return confirmPermission(call, await request);
  }

  $async.Future<$1.VerifyLicenseResponse> verifyLicense_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.VerifyLicenseRequest> request) async {
    return verifyLicense(call, await request);
  }

  $async.Future<$1.GetLicenseListResponse> getLicenseList_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.GetLicenseListRequest> request) async {
    return getLicenseList(call, await request);
  }

  $async.Future<$1.GetLicenseDetailResponse> getLicenseDetail_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.GetLicenseDetailRequest> request) async {
    return getLicenseDetail(call, await request);
  }

  $async.Future<$1.UpdateLicenseInfoResponse> updateLicenseInfo_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.UpdateLicenseInfoRequest> request) async {
    return updateLicenseInfo(call, await request);
  }

  $async.Future<$1.IssueLicenseResponse> issueLicense(
      $grpc.ServiceCall call, $1.IssueLicenseRequest request);
  $async.Future<$1.RequestPermissionResponse> requestPermission(
      $grpc.ServiceCall call, $1.RequestPermissionRequest request);
  $async.Future<$1.ConfirmPermissionResponse> confirmPermission(
      $grpc.ServiceCall call, $1.ConfirmPermissionRequest request);
  $async.Future<$1.VerifyLicenseResponse> verifyLicense(
      $grpc.ServiceCall call, $1.VerifyLicenseRequest request);
  $async.Future<$1.GetLicenseListResponse> getLicenseList(
      $grpc.ServiceCall call, $1.GetLicenseListRequest request);
  $async.Future<$1.GetLicenseDetailResponse> getLicenseDetail(
      $grpc.ServiceCall call, $1.GetLicenseDetailRequest request);
  $async.Future<$1.UpdateLicenseInfoResponse> updateLicenseInfo(
      $grpc.ServiceCall call, $1.UpdateLicenseInfoRequest request);
}

class BusinessServiceClient extends $grpc.Client {
  static final _$getLoginDomains = $grpc.ClientMethod<$1.Empty, $1.LoginDomain>(
      '/api.v1.BusinessService/GetLoginDomains',
      ($1.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.LoginDomain.fromBuffer(value));
  static final _$getStoreTokenInfo =
      $grpc.ClientMethod<$1.StoreTokenInfo, $1.StoreTokenInfo>(
          '/api.v1.BusinessService/GetStoreTokenInfo',
          ($1.StoreTokenInfo value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.StoreTokenInfo.fromBuffer(value));

  BusinessServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$1.LoginDomain> getLoginDomains($1.Empty request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getLoginDomains, request, options: options);
  }

  $grpc.ResponseFuture<$1.StoreTokenInfo> getStoreTokenInfo(
      $1.StoreTokenInfo request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getStoreTokenInfo, request, options: options);
  }
}

abstract class BusinessServiceBase extends $grpc.Service {
  $core.String get $name => 'api.v1.BusinessService';

  BusinessServiceBase() {
    $addMethod($grpc.ServiceMethod<$1.Empty, $1.LoginDomain>(
        'GetLoginDomains',
        getLoginDomains_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($1.LoginDomain value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.StoreTokenInfo, $1.StoreTokenInfo>(
        'GetStoreTokenInfo',
        getStoreTokenInfo_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.StoreTokenInfo.fromBuffer(value),
        ($1.StoreTokenInfo value) => value.writeToBuffer()));
  }

  $async.Future<$1.LoginDomain> getLoginDomains_Pre(
      $grpc.ServiceCall call, $async.Future<$1.Empty> request) async {
    return getLoginDomains(call, await request);
  }

  $async.Future<$1.StoreTokenInfo> getStoreTokenInfo_Pre(
      $grpc.ServiceCall call, $async.Future<$1.StoreTokenInfo> request) async {
    return getStoreTokenInfo(call, await request);
  }

  $async.Future<$1.LoginDomain> getLoginDomains(
      $grpc.ServiceCall call, $1.Empty request);
  $async.Future<$1.StoreTokenInfo> getStoreTokenInfo(
      $grpc.ServiceCall call, $1.StoreTokenInfo request);
}

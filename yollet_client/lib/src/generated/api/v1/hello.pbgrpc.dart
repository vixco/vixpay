///
//  Generated code. Do not modify.
//  source: api/v1/hello.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'hello.pb.dart' as $0;
export 'hello.pb.dart';

class HelloClient extends $grpc.Client {
  static final _$sayHello = $grpc.ClientMethod<$0.HelloRequest, $0.HelloReply>(
      '/api.v1.Hello/SayHello',
      ($0.HelloRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.HelloReply.fromBuffer(value));
  static final _$lotsOfReplies =
      $grpc.ClientMethod<$0.HelloRequest, $0.HelloReply>(
          '/api.v1.Hello/LotsOfReplies',
          ($0.HelloRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.HelloReply.fromBuffer(value));
  static final _$lotsOfGreetings =
      $grpc.ClientMethod<$0.HelloRequest, $0.HelloReply>(
          '/api.v1.Hello/LotsOfGreetings',
          ($0.HelloRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.HelloReply.fromBuffer(value));
  static final _$bidiHello = $grpc.ClientMethod<$0.HelloRequest, $0.HelloReply>(
      '/api.v1.Hello/BidiHello',
      ($0.HelloRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.HelloReply.fromBuffer(value));

  HelloClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.HelloReply> sayHello($0.HelloRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$sayHello, request, options: options);
  }

  $grpc.ResponseStream<$0.HelloReply> lotsOfReplies($0.HelloRequest request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$lotsOfReplies, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseFuture<$0.HelloReply> lotsOfGreetings(
      $async.Stream<$0.HelloRequest> request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$lotsOfGreetings, request, options: options)
        .single;
  }

  $grpc.ResponseStream<$0.HelloReply> bidiHello(
      $async.Stream<$0.HelloRequest> request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$bidiHello, request, options: options);
  }
}

abstract class HelloServiceBase extends $grpc.Service {
  $core.String get $name => 'api.v1.Hello';

  HelloServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.HelloRequest, $0.HelloReply>(
        'SayHello',
        sayHello_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.HelloRequest.fromBuffer(value),
        ($0.HelloReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.HelloRequest, $0.HelloReply>(
        'LotsOfReplies',
        lotsOfReplies_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.HelloRequest.fromBuffer(value),
        ($0.HelloReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.HelloRequest, $0.HelloReply>(
        'LotsOfGreetings',
        lotsOfGreetings,
        true,
        false,
        ($core.List<$core.int> value) => $0.HelloRequest.fromBuffer(value),
        ($0.HelloReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.HelloRequest, $0.HelloReply>(
        'BidiHello',
        bidiHello,
        true,
        true,
        ($core.List<$core.int> value) => $0.HelloRequest.fromBuffer(value),
        ($0.HelloReply value) => value.writeToBuffer()));
  }

  $async.Future<$0.HelloReply> sayHello_Pre(
      $grpc.ServiceCall call, $async.Future<$0.HelloRequest> request) async {
    return sayHello(call, await request);
  }

  $async.Stream<$0.HelloReply> lotsOfReplies_Pre(
      $grpc.ServiceCall call, $async.Future<$0.HelloRequest> request) async* {
    yield* lotsOfReplies(call, await request);
  }

  $async.Future<$0.HelloReply> sayHello(
      $grpc.ServiceCall call, $0.HelloRequest request);
  $async.Stream<$0.HelloReply> lotsOfReplies(
      $grpc.ServiceCall call, $0.HelloRequest request);
  $async.Future<$0.HelloReply> lotsOfGreetings(
      $grpc.ServiceCall call, $async.Stream<$0.HelloRequest> request);
  $async.Stream<$0.HelloReply> bidiHello(
      $grpc.ServiceCall call, $async.Stream<$0.HelloRequest> request);
}

import 'generated/api/v1/message.pb.dart';

class GRpcException implements Exception {
  String code;
  String? message;
  dynamic rawData;

  GRpcException({required this.code, this.message});

  GRpcException.network(Common common, [dynamic rawData])
      : code = common.resCode,
        message = common.resMessage,
        rawData = rawData;

  @override
  String toString() => '[$code] $message';
}

class TokenException implements Exception {
  int code;
  String? message;

  TokenException({required this.code, this.message});

  @override
  String toString() => '[$code] $message';
}

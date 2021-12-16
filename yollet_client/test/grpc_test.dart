import 'package:flutter_test/flutter_test.dart';
import 'package:yollet_client/src/grpc.dart';

void main() {
  test('authenticate', () async {
    var success = await gRpcClient.login(id: 'test', password: '1111');
    expect(success, true);
  });

  test('hello grpc', () async {
    String message = await gRpcClient.hello();
    expect(message, "Hello gRPC");
  });

  test('validate token', () async {
    var success = await gRpcClient.validateToken(
        'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ0ZXN0Iiwicm9sZSI6IlJPTEVfVVNFUiIsImV4cCI6MTYxNDEzNTk1NSwidXNlciI6IjQ3MDA2MDM1QjQzNTAwMDAiLCJpYXQiOjE2MTQxMzIzNTV9.HMPns1_cSJ4runOOj1jkN3gFGxFAHHKaCPoOX8YnvnI');
    expect(success, false);
  });

  setUpAll(() {
    gRpcClient
      ..url = 'https://dev-grpc.yoshop.net'
      ..authUrl = 'https://dev-auth.yoshop.net'
      ..onAuthenticate = () async {
        await gRpcClient.login(id: 'test', password: '1111');
        return true;
      };
  });
}

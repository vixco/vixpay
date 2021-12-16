import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:pointycastle/export.dart';
import 'package:yollet_client/yollet_client.dart';

void main() {
  test('sign and verify', () {
    // EC key generate
    final keyPair = tokenClient.generateKey();

    // EC key pem encode
    final priKeyPem = tokenClient.encodePrivateKey(keyPair.privateKey as ECPrivateKey);
    final pubKeyPem = tokenClient.encodePublicKey(keyPair.publicKey as ECPublicKey);
    print('from Private key: $priKeyPem');
    print('from Public key: $pubKeyPem');

    // EC Key pem decode
    var priKey = tokenClient.decodePrivateKey(priKeyPem);
    var pubKey = tokenClient.decodePublicKey(pubKeyPem);
    var sameKeyPair = AsymmetricKeyPair(pubKey, priKey);

    // EC key sign and verify test
    var bytes = utf8.encode('abcd');
    var sig = tokenClient.sign(keyPair.privateKey as ECPrivateKey, Uint8List.fromList(bytes));
    print('sig: $sig');

    var result = tokenClient.verify(sameKeyPair.publicKey, Uint8List.fromList(bytes), sig);
    print('verify result: $result');
    expect(result, true);
  });

  test('transfer "from" to "to"', () async {
    final fromId = 'from';
    final toId = 'to';
    final tokenId = 'TOKEN'; // string 2..5 length, only alphabet, upper case
    final fromKeyPair = tokenClient.generateKey();
    final fromPubKeyPem = tokenClient.encodePublicKey(fromKeyPair.publicKey as ECPublicKey);
    final fromPriKeyPem = tokenClient.encodePrivateKey(fromKeyPair.privateKey as ECPrivateKey);
    final toKeyPair = tokenClient.generateKey();
    final toPubKeyPem = tokenClient.encodePublicKey(toKeyPair.publicKey as ECPublicKey);

    print('#################################################################');
    print('create from address');
    print('#################################################################');

    var fromAddress = await tokenClient.createAddress(fromId, fromPubKeyPem);
    print('fromAddress = $fromAddress');
    expect(fromAddress, isNotEmpty);

    var fromAddressInfo = await tokenClient.queryAddress(fromAddress);
    print('fromAddress info = $fromAddressInfo');
    expect(fromAddressInfo, isNotEmpty);

    print('#################################################################');
    print('create to address');
    print('#################################################################');

    var toAddress = await tokenClient.createAddress(toId, toPubKeyPem);
    print('toAddress = $toAddress');
    expect(toAddress, isNotEmpty);

    var toAddressInfo = await tokenClient.queryAddress(toAddress);
    print('toAddress info = $toAddressInfo');
    expect(toAddressInfo, isNotEmpty);

    print('#################################################################');
    print('create Token tokenId=$tokenId');
    print('#################################################################');

    var success = await tokenClient.createToken(
      address: fromAddress,
      tokenId: tokenId,
      tokenName: '$tokenId description',
      totalSupply: '1000000',
      decimalPoint: '8',
      feeAddress: toAddress,
      priKey: fromPriKeyPem,
    );
    print('createToken $success');
    expect(success, true);

    print('#################################################################');
    print('transfer from to to');
    print('#################################################################');

    // success = await tokenClient.transfer(
    //   from: fromAddress,
    //   tokenId: tokenId,
    //   to: toAddress,
    //   amount: '100',
    //   comment: 'comment',
    //   priKey: fromPriKeyPem,
    // );
    // print('transfer transactionID ${tokenClient.transactionId}');
    // expect(success, true);

    print('#################################################################');
    print('Get from address info');
    print('#################################################################');

    fromAddressInfo = await tokenClient.queryAddress(fromAddress);
    print('fromAddress info = $fromAddressInfo');
    expect(fromAddressInfo, isNotEmpty);

    print('#################################################################');
    print('Get to address info');
    print('#################################################################');

    toAddressInfo = await tokenClient.queryAddress(toAddress);
    print('toAddress info = $toAddressInfo');
    expect(toAddressInfo, isNotEmpty);
  });
}

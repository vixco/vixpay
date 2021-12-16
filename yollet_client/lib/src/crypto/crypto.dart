import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:asn1lib/asn1lib.dart';
import 'package:pem/pem.dart';
import 'package:pointycastle/export.dart';

import 'util.dart';

//================================================================
// encode ECSignature
//================================================================
String encodeECSignature(ECSignature sig) {
  ASN1ObjectIdentifier.registerFrequentNames();
  var outer = ASN1Sequence();

  outer.add(ASN1Integer(sig.r));
  outer.add(ASN1Integer(sig.s));

  var encodePkData = base64.encode(outer.encodedBytes);
  print('encodeSig: $encodePkData');
  return encodePkData;
}

//================================================================
// encode ECPrivateKey
//================================================================
String encodeECPrivateKey(ECPrivateKey ecPrivateKey) {
  ASN1ObjectIdentifier.registerFrequentNames();

  var privateKeyAsBytes = bigIntToUint8List(ecPrivateKey.d!);
  var privateKey = ASN1OctetString(privateKeyAsBytes);

  var algorithm = ASN1Sequence();
  algorithm.add(ASN1ObjectIdentifier.fromName('ecPublicKey'));
  algorithm.add(ASN1ObjectIdentifier.fromComponentString(prime256v1));

  var curve = ASN1Sequence(tag: 0xA0);
  var curveInfo = ASN1ObjectIdentifier.fromComponentString(prime256v1);
  curve.add(curveInfo);

  var publicKey = ASN1Sequence(tag: 0xA1);
  var subjectPublicKey =
      ASN1BitString(ecPrivateKey.parameters!.G.getEncoded(false));
  publicKey.add(subjectPublicKey);

  var keyInfo = ASN1Sequence();
  keyInfo.add(ASN1Integer(BigInt.from(1)));
  keyInfo.add(privateKey);
  keyInfo.add(curve);
  keyInfo.add(publicKey);

  var outer = ASN1Sequence();
  outer.add(ASN1Integer(BigInt.from(0)));
  outer.add(algorithm);
  outer.add(ASN1OctetString(keyInfo.encodedBytes));

  var encodePkData = PemCodec(PemLabel.privateKey).encode(outer.encodedBytes);
  return encodePkData;
}

//================================================================
// encode ECPublicKey
//================================================================
String encodeECPublicKey(ECPublicKey publicKey) {
  ASN1ObjectIdentifier.registerFrequentNames();
  var outer = ASN1Sequence();
  var algorithm = ASN1Sequence();
  algorithm.add(ASN1ObjectIdentifier.fromName('ecPublicKey'));
  algorithm.add(ASN1ObjectIdentifier.fromComponentString(prime256v1));

  var subjectPublicKey = ASN1BitString(publicKey.Q!.getEncoded(false));

  outer.add(algorithm);
  outer.add(subjectPublicKey);
  var encodePkData = PemCodec(PemLabel.publicKey).encode(outer.encodedBytes);

  return encodePkData;
}

//================================================================
// Decode EC private key
//================================================================
ECPrivateKey decodeECPrivateKey(String pemPkString) {
  var decodedPkData = PemCodec(PemLabel.privateKey).decode(pemPkString);

  var p = ASN1Parser(Uint8List.fromList(decodedPkData));
  var s1 = p.nextObject() as ASN1Sequence;
  final out = s1.elements;
  if (out.length < 3) {
    throw Exception();
  }
  final s2 = out[2] as ASN1OctetString;
  final s3 = ASN1Parser(s2.contentBytes()!);
  final s4 = s3.nextObject() as ASN1Sequence;

  final keyInfo = s4.elements;
  if (keyInfo.length < 4) {
    throw Exception();
  }
  final privateKeyAsBytes = keyInfo[1] as ASN1OctetString;
  final d = decodeBigInt(privateKeyAsBytes.contentBytes()!);

  return ECPrivateKey(d, ECDomainParameters('secp256r1'));
}

//================================================================
// Decode EC public key
//================================================================
ECPublicKey decodeECPublicKey(String pemPkString) {
  var decodedPkData = PemCodec(PemLabel.publicKey).decode(pemPkString);
  var p = ASN1Parser(Uint8List.fromList(decodedPkData));
  var s1 = p.nextObject() as ASN1Sequence;
  final out = s1.elements;
  if (out.length < 2) {
    throw Exception();
  }
  final subjectPublicKey = out[1] as ASN1BitString;

  var _secp256r1 = ECDomainParameters('secp256r1');
  var Q = _secp256r1.curve.decodePoint(subjectPublicKey.contentBytes());

  return ECPublicKey(Q, ECDomainParameters('secp256r1'));
}

//================================================================
// ECC secp521r1 Key generation
//----------------------------------------------------------------
AsymmetricKeyPair<PublicKey, PrivateKey> generateKeyPair(
    SecureRandom secureRandom,
    {int bitLength = 2048}) {
  final ECKeyGenerator generator = KeyGenerator('EC') as ECKeyGenerator;
  generator.init(
    ParametersWithRandom(
      ECKeyGeneratorParameters(
        ECDomainParameters('secp256r1'),
      ),
      secureRandom,
    ),
  );

  final pair = generator.generateKeyPair();
  return pair;
}

//================================================================
// Create a secure random number generator and seed it with random bytes
//================================================================
SecureRandom getSecureRandom() {
  //final result = SecureRandom('Fortuna'); // Get using registry
  final secureRandom = FortunaRandom(); // Get directly

  final seedSource = Random.secure();
  final seeds = <int>[];
  for (var i = 0; i < 32; i++) {
    seeds.add(seedSource.nextInt(255));
  }
  secureRandom.seed(KeyParameter(Uint8List.fromList(seeds)));

  return secureRandom;
}

//================================================================
// ECC Sign with Uint8List Message
//================================================================
ECSignature signWithUint8List(ECPrivateKey privateKey, Uint8List message) {
  final signer = ECDSASigner(SHA256Digest(), HMac.withDigest(SHA256Digest()));
  signer.init(true, PrivateKeyParameter(privateKey));
  final ECSignature sig = signer.generateSignature(message) as ECSignature;
  return sig;
}

//================================================================
// ECC Verify with Uint8List Message and Signature
//================================================================
bool verify(ECPublicKey publicKey, Uint8List message, Signature sig) {
  final verifier = ECDSASigner(SHA256Digest(), HMac.withDigest(SHA256Digest()));
  verifier.init(false, PublicKeyParameter(publicKey));
  final result = verifier.verifySignature(message, sig as ECSignature);

  return result;
}

//================================================================
// ECC Key generation
//================================================================
AsymmetricKeyPair<PublicKey, PrivateKey> generateECKey() {
  final pair = generateKeyPair(getSecureRandom(), bitLength: 256);
  return pair;
}

//================================================================
// ECC Sign
//================================================================
String sign(ECPrivateKey privateKey, String message) {
  var outputAsUint8List = Uint8List.fromList(message.codeUnits);
  final sig = signWithUint8List(privateKey, outputAsUint8List);
  return encodeECSignature(sig);
}

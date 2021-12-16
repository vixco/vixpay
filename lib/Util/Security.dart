import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:blowfish_ecb/blowfish_ecb.dart';
import 'package:flutter/material.dart';
// import 'package:encryptblowfish/encryptblowfish.dart';
import 'package:pointycastle/export.dart';

class Security {

  static Future<String> digestFile(String path, String nonce) async {
    var digest = SHA512Digest();
    var content = await File(path).readAsBytes();
    var hash = digest.process(content);
    var hash2 = digest.process(Uint8List.fromList(hash + utf8.encode(nonce)));
    return base64.encode(hash2);
  }

  static String digestSHA256(String text) {
    var digest = SHA256Digest();
    var hash = digest.process(utf8.encode(text) as Uint8List);
    return base64.encode(hash);
  }

  static Future<String?> md5File(String path) async {
    try {
      var digest = MD5Digest();
      var content = await File(path).readAsBytes();
      var hash = digest.process(content);
      return _bin2hex(hash);
    } on Exception catch (e) {
      print('md5File($path): $e');
      return null;
    }
  }

  // The PKCS #7 padding just fills the extra bytes with the same value.
  // That value is the number of bytes of padding there is.
  //
  // For example, something that requires 3 bytes of padding with append
  // [0x03, 0x03, 0x03] to the bytes. If the bytes is already a multiple of the
  // block size, a full block of padding is added.
  static Uint8List _pad(Uint8List bytes, int blockSize) {
    var padLength = blockSize - (bytes.length % blockSize);
    var padded = Uint8List(bytes.length + padLength)..setAll(0, bytes);
    PKCS7Padding().addPadding(padded, bytes.length);
    return padded;
  }

  static Uint8List _unpad(Uint8List padded) =>
      padded.sublist(0, padded.length - PKCS7Padding().padCount(padded));

  static String _bin2hex(Uint8List bytes) {
    var buf = StringBuffer();

    for (var b in bytes) {
      var s = b.toRadixString(16);
      buf.write('${(s.length == 1) ? '0' : ''}$s');
    }

    return buf.toString();
  }

  static Uint8List _hex2bin(String hexStr) {
    if (hexStr.length % 2 != 0) {
      throw const FormatException('not an even number of hexadecimal characters');
    }

    var result = Uint8List(hexStr.length ~/ 2);

    for (var i = 0; i < result.length; i++) {
      result[i] = int.parse(hexStr.substring(2 * i, 2 * (i + 1)), radix: 16);
    }

    return result;
  }
  //
  // static Future<String> encrypt(String plainText, String keyText) async {
  //   String encrypt = await Encryptblowfish.getStringAfterEncrypt(keyText, plainText);
  //   encrypt = encrypt.replaceAll("\n", "");
  //   return _bin2hex(base64.decode(encrypt.trim()));
  // }
  //
  // static Future<String> decrypt(String encryptedText, String keyText) async {
  //   encryptedText = base64.encode(_hex2bin(encryptedText));
  //   String decrypt = await Encryptblowfish.getStringAfterDecrypt(keyText, encryptedText);
  //   // decrypt 에는 PKCS#7 padding 포함하고 있어 padding 제거
  //   return String.fromCharCodes(_unpad(Uint8List.fromList(decrypt.codeUnits)));
  // }

  static String hexEncode(List<int> bytes) =>
      bytes.map((byte) => byte.toRadixString(16).padLeft(2, '0')).join();

  static List<int> hexDecode(String hex) {
    const String _ALPHABET = "0123456789abcdef";

    String str = hex.replaceAll(" ", "");
    str = str.toLowerCase();
    if(str.length % 2 != 0) {
      str = "0" + str;
    }
    Uint8List result = Uint8List(str.length ~/ 2);
    for(int i = 0 ; i < result.length ; i++) {
      int firstDigit = _ALPHABET.indexOf(str[i*2]);
      int secondDigit = _ALPHABET.indexOf(str[i*2+1]);
      if (firstDigit == -1 || secondDigit == -1) {
        throw new FormatException("Non-hex character detected in $hex");
      }
      result[i] = (firstDigit << 4) + secondDigit;
    }
    return result;
  }

  static Uint8List padPKCS5(List<int> input) {
    final inputLength = input.length;
    final paddingValue = 8 - (inputLength % 8);
    final outputLength = inputLength + paddingValue;

    final output = Uint8List(outputLength);
    for (var i = 0; i < inputLength; ++i) {
      output[i] = input[i];
    }
    output.fillRange(outputLength - paddingValue, outputLength, paddingValue);

    return output;
  }

  static int getPKCS5PadCount(List<int> input) {
    if (input.length % 8 != 0) {
      throw FormatException('Block size is invalid!', input);
    }

    final count = input.last;
    final paddingStartIndex = input.length - count;
    for (var i = input.length - 1; i >= paddingStartIndex; --i) {
      if (input[i] != count) {
        throw const FormatException('Padding is not valid PKCS5 padding!');
      }
    }
    return count;
  }

  static Future<String> encrypt(String plainText, String keyText) async {
    // Encode the key and instantiate the codec.
    final blowfish = BlowfishECB(Uint8List.fromList(utf8.encode(keyText)));

    // Encrypt the input (with padding to fit the 8-bit block size).
    debugPrint('Encrypting "$plainText" with PKCS #5 padding.');
    final List<int> encryptedData = blowfish.encode(padPKCS5(utf8.encode(plainText)));
    // Decrypt the encrypted data.
    debugPrint('Encrypting Decrypting "${hexEncode(encryptedData)}".');
    return hexEncode(encryptedData);
  }

  static Future<String> decrypt(String encryptedText, String keyText) async {
    debugPrint('Decrypting Decrypting "${hexDecode(encryptedText)}".');

    // Encode the key and instantiate the codec.
    final blowfish = BlowfishECB(Uint8List.fromList(utf8.encode(keyText)));

    // Decrypt the encrypted data.
    debugPrint('Decrypting "encryptedText".');
    var decryptedData = blowfish.decode(hexDecode(encryptedText));
    // Remove PKCS5 padding.
    decryptedData = decryptedData.sublist(
        0, decryptedData.length - getPKCS5PadCount(decryptedData));
    debugPrint('Got "${utf8.decode(decryptedData)}".');
    return utf8.decode(decryptedData);
  }
}

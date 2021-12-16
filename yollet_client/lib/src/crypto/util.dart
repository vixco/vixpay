import 'dart:typed_data';

const secp521r1ASN1OID = '1.3.132.0.35';
const prime256v1 = '1.2.840.10045.3.1.7';

//================================================================
// Convert List<int> to BigInt
//================================================================
BigInt decodeBigInt(List<int> bytes) {
  var result = BigInt.from(0);
  for (var i = 0; i < bytes.length; i++) {
    result += BigInt.from(bytes[bytes.length - i - 1]) << (8 * i);
  }
  return result;
}

//================================================================
// Convert bigInt to Uint8List
//================================================================
Uint8List bigIntToUint8List(BigInt bigInt) =>
    bigIntToByteData(bigInt).buffer.asUint8List();

//================================================================
// Convert bigInt to ByteDate
//================================================================
ByteData bigIntToByteData(BigInt bigInt) {
  final data = ByteData((bigInt.bitLength / 8).ceil());
  var _bigInt = bigInt;

  for (var i = 1; i <= data.lengthInBytes; i++) {
    data.setUint8(data.lengthInBytes - i, _bigInt.toUnsigned(8).toInt());
    _bigInt = _bigInt >> 8;
  }

  return data;
}

//================================================================
// Convetenate ByteData
//================================================================
ByteData concatenateByteData(ByteData byte1, ByteData byte2) {
  final data = ByteData(byte1.lengthInBytes + byte2.lengthInBytes);

  for (var i = 0; i < byte1.lengthInBytes; i++) {
    data.setUint8(i, byte1.getUint8(i));
  }
  for (var i = 0; i < byte2.lengthInBytes; i++) {
    data.setUint8(i + byte1.lengthInBytes, byte2.getUint8(i));
  }

  return data;
}

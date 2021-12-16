import 'package:yollet/Util/Common/utils.dart';

import 'BalanceInfo.dart';

class TransactionInfoWriteValue with ToString {
  /*
  "transactionID":"44537b311253076a206cbe6602c33032324f0cd455e7856acca6d5e898458296",
"transactionCreatorID":"ibexlab",
"transactionCreatorMspID":"Org1MSP",
"transactionTime":"Tue Mar 09 09:39:53 KST 2021",
"channelID":"mychannel",
"chaincodeIDName":"ibexlabtoken",
"chaincodeIDVersion":"2.0",
"chaincodeIDPath":"",
"responseStatus":"200",
"responsePayload":"",
"chaincodeInputArgs":[]
 - String
"readSet":[]
 - "nameSpace":"ibexlabtoken",
 - "key":"address_3eaea2ce66f599c6e8bf7387fc67c1c29fa6a46f18ddd40ac79f9d3829c942ba",
 - "blockNo":"760"
"writeSet":[]
 - "nameSpace":"ibexlabtoken",
 - "key":"address_3eaea2ce66f599c6e8bf7387fc67c1c29fa6a46f18ddd40ac79f9d3829c942ba",
 - "value":"{\"publicKey\":\"-----BEGIN PUBLIC KEY-----\\nMFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAE8AF+DBpU4H2zPkuCn9O5pbn/6PaJ\\nIheebaJ7sm4jwH6Lr4fg7PPskiVWNVZG9MynIl3LZy1unnJO2NpU77aUtQ==\\n-----END PUBLIC KEY-----\\n\",
 \"addInfo\":\"VIX-\",
 \"createDate\":1614824884,
 \"balanceInfo\":[{\"tokenId\":\"VIX\",\"balance\":31,\"unlockDate\":1614853434}]}",
 - "isDelete":"false"
   */


  String? publicKey;
  String? addInfo;
  num? createDate;
  List<BalanceInfo>? balanceInfoList;
  TransactionInfoWriteValue({this.publicKey, this.addInfo, this.createDate,this.balanceInfoList});

  TransactionInfoWriteValue.fromJson(Map json)
      : publicKey = json['publicKey']??"",
        addInfo = json['addInfo']??"",
        createDate = json['createDate']??0,
        balanceInfoList = (json['balanceInfo']??[]).map<BalanceInfo>((json)=>BalanceInfo.fromJson(json)).toList()
  ;

  @override
  Map stringContentMap() =>
      {'publicKey:': publicKey, 'addInfo': addInfo, 'createDate': createDate};
}

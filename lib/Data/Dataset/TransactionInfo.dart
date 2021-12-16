import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:yollet/Data/Dataset/TransactionInfoRead.dart';
import 'package:yollet/Data/Dataset/TransactionInfoWrite.dart';
import 'package:yollet/Util/Common/utils.dart';

class TransactionInfo with ToString {
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
 - "value":"{\"publicKey\":\"-----BEGIN PUBLIC KEY-----\\nMFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAE8AF+DBpU4H2zPkuCn9O5pbn/6PaJ\\nIheebaJ7sm4jwH6Lr4fg7PPskiVWNVZG9MynIl3LZy1unnJO2NpU77aUtQ==\\n-----END PUBLIC KEY-----\\n\",\"addInfo\":\"VIX-\",\"createDate\":1614824884,\"balanceInfo\":[{\"tokenId\":\"VIX\",\"balance\":31,\"unlockDate\":1614853434}]}",
 - "isDelete":"false"
   */


  String? transactionID;
  String? transactionCreatorID;
  String? transactionCreatorMspID;
  String? transactionTime;
  String? channelID;
  String? chaincodeIDName;
  String? chaincodeIDVersion;
  String? chaincodeIDPath;
  String? responseStatus;
  String? responsePayload;
  List? chaincodeInputArgs;
  List<TransactionInfoRead>? readSet;
  String? readSetText;
  List<TransactionInfoWrite>? writeSet;
  String? writeSetText;
   DateTime? transactionDateTime;

  TransactionInfo({this.transactionID, this.transactionCreatorID, this.transactionCreatorMspID, this.transactionTime, this.channelID,
    this.chaincodeIDName, this.chaincodeIDVersion, this.chaincodeIDPath, this.responseStatus, this.responsePayload,
    this.chaincodeInputArgs, this.readSet, this.writeSet,
  });

  TransactionInfo.fromJson(Map json)
      : transactionID = json['transactionID']??"",
        transactionCreatorID = json['transactionCreatorID']??"",
        transactionCreatorMspID = json['transactionCreatorMspID']??"",
        transactionTime = json['transactionTime']??"",
        channelID = json['channelID']??"",
        chaincodeIDName = json['chaincodeIDName']??"",
        chaincodeIDVersion = json['chaincodeIDVersion']??"",
        chaincodeIDPath = json['chaincodeIDPath']??"",
        responseStatus = json['responseStatus']??"",
        responsePayload = json['responsePayload']??"",
        chaincodeInputArgs = (json['chaincodeInputArgs']??[]).toList(),
        readSet = (json['readSet']??[]).map<TransactionInfoRead>((json)=>TransactionInfoRead.fromJson(json)).toList(),
        writeSet = (json['writeSet']??[]).map<TransactionInfoWrite>((json)=>TransactionInfoWrite.fromJson(json)).toList(),
        readSetText = JsonEncoder.withIndent('  ').convert(json['readSet']),
        writeSetText = JsonEncoder.withIndent('  ').convert(json['writeSet']),
         // ,transactionDateTime = DateTime.parse(json['transactionTime'])??DateTime.now()
        //"Tue Mar 09 09:39:53 KST 2021",
        // transactionDateTime = DateFormat("EEE MMM dd HH:mm:ss 'KST' yyyy").parse(json['transactionTime'])??DateTime.now()
  //"transactionTime": "2021-03-19 05:04:55",
        transactionDateTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(json['transactionTime'])
  ;

  @override
  Map stringContentMap() =>
      {'transactionID:': transactionID, 'transactionCreatorID': transactionCreatorID, 'transactionCreatorMspID': transactionCreatorMspID,
        'transactionTime': transactionTime, 'channelID': channelID, 'chaincodeIDName': chaincodeIDName,
        'chaincodeIDVersion': chaincodeIDVersion, 'chaincodeIDPath':chaincodeIDPath,  'responseStatus': responseStatus,  'responsePayload': responsePayload,
        'readSetText': readSetText,  'writeSetText': writeSetText,
      };
}

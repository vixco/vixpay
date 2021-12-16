import 'package:yollet/Util/Common/utils.dart';

class TransferInfo with ToString {
  String? fromAddress;
  String? toAddress;
  String? tokenId;
  String? amount;
  String? transactionID;
  String? transactionTime;
  String? comment;
  late DateTime transactionDateTime;

  TransferInfo({this.fromAddress, this.toAddress, this.tokenId, this.amount, this.transactionID, this.transactionTime,this.comment});

  TransferInfo.fromJson(Map json)
      : fromAddress = json['fromAddress']??"",
        toAddress = json['toAddress']??"",
        tokenId = json['tokenId']??"",
        amount = json['amount']??"",
        transactionID = json['txId']??"",
        transactionTime = json['txTime']??"",
        comment = json['comment']??"",
        transactionDateTime = DateTime.parse(json['txTime'])
  ;

  @override
  Map stringContentMap() =>
      {'fromAddress:': fromAddress, 'toAddress': toAddress, 'tokenId': tokenId, 'amount': amount, 'txId': transactionID, 'txTime': transactionTime, 'comment': comment};
}

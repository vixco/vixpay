import 'package:yollet/Util/Common/utils.dart';

class BalanceInfo with ToString {
  String? tokenId;
  num? balance;
  num? unlockDate;

  BalanceInfo({this.tokenId,this.balance,this.unlockDate});

  BalanceInfo.fromJson(Map json)
      : tokenId = json['tokenId']??"",
        balance = json['balance']??0,
        unlockDate = json['unlockDate']??0;

  @override
  Map stringContentMap() =>
      {'tokenId:': tokenId, 'balance': balance, 'unlockDate': unlockDate};
}

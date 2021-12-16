import 'package:yollet/Util/Common/utils.dart';
import 'package:yollet/Data/Dataset/BalanceInfo.dart';


class QueryBalanceInfo with ToString {
  String? tokenId;
  num? totalBalance;
  num? availableBalance;

  List<BalanceInfo>? balanceInfoList;

  num? exchangeRate;
  String? exchangeDateIndex;
  num? exchangeTotalBalance;
  num? exchangeAvailableBalance;

  QueryBalanceInfo({this.tokenId, this.totalBalance,  this.availableBalance, this.balanceInfoList});

  QueryBalanceInfo.fromJson(Map json)
      : tokenId = json['tokenId']??"",
        totalBalance = json['totalBalance']??0,
        availableBalance = json['availableBalance']??0,
        balanceInfoList = (json['balanceInfo']?? []).map<BalanceInfo>((json)=>BalanceInfo.fromJson(json)).toList()
        ,
        exchangeRate = json['exchangeRate']??0,
        exchangeDateIndex = json['exchangeDateIndex']??"",
        exchangeTotalBalance = json['exchangeTotalBalance']??0,
        exchangeAvailableBalance = json['exchangeAvailableBalance']??0
  ;

  @override
  Map stringContentMap() =>
      {'tokenId:': tokenId,
        'totalBalance': totalBalance,
        'availableBalance': availableBalance,
        'balanceInfoList': balanceInfoList.toString(),
        'exchangeRate': exchangeRate,
        'exchangeDateIndex': exchangeDateIndex,
        'exchangeTotalBalance': exchangeTotalBalance,
        'exchangeAvailableBalance': exchangeAvailableBalance,
      };
}

import 'package:yollet/Util/Common/utils.dart';

class ExchangeRateInfo with ToString {
  String? date;
  num? exchangeRate;
  String? dateIndex;
  num? index;
  DateTime? timestamp;
  String? tokenId;
  ExchangeRateInfo({this.date, this.exchangeRate, this.dateIndex, this.index, this.timestamp});

  ExchangeRateInfo.fromJson(Map json)
      : date = json['date']??"",
        exchangeRate = json['exchangeRate']??0,
        dateIndex = json['dateIndex']??"",
        index = json['index']??0,
        tokenId = json['tokenId']??"",
        timestamp = DateTime.fromMillisecondsSinceEpoch(json['timestamp']??0)
  ;
    void setTokenId(String tokenId){
      this.tokenId  =tokenId;
    }
  @override
  Map stringContentMap() =>
      {'date:': date, 'exchangeRate': exchangeRate, 'index': index,  'tokenId': tokenId,};
}

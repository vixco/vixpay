import 'package:yollet/Util/Common/utils.dart';

class TokenInfo with ToString {
  String? owner;
  String? tokenId;
  String? tokenName;
  String? totalSupply;
  num? decimalPoint;
  num? createDate;
  num? balance;

  String url="";
  String symbol="";

  TokenInfo({this.owner, this.tokenId, this.tokenName, this.totalSupply,this.decimalPoint, this.createDate,
    this.symbol="",this.balance});

  TokenInfo.fromJson(Map json)
      : owner = json['owner']??"",
        tokenId = json['tokenId']??"",
        tokenName = json['tokenName']??"",
        totalSupply = (json['totalSupply'] ?? 0).toString(),
        decimalPoint = json['decimalPoint']??0,
        createDate = json['createDate']??0,
        symbol = json['symbol']??json['tokenId']??"",
        balance = json['balance']??0
  ;

  setUrl(String url){
    this.url=url;
  }
  setSymbol(String symbol){
    this.symbol=symbol;
  }
  @override
  Map stringContentMap() =>
      {'owner:': owner, 'tokenId': tokenId, 'tokenName': tokenName, 'totalSupply': totalSupply, 'decimalPoint': decimalPoint, 'createDate': createDate};
}

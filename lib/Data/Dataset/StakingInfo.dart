import 'package:yollet/Util/Common/utils.dart';

class StakingInfo with ToString {
  String address;
  String amount;
  int decimalPoint;
  String symbol;
  String tokenId;
  StakingInfo({this.address="", this.amount="0", this.decimalPoint=0, this.symbol="", this.tokenId=""});

  StakingInfo.fromJson(Map json)
      : address = json['address']??"",
        amount = json['amount']??"0",
        decimalPoint = json['decimalPoint']??0,
        symbol = json['symbol']??"",
        tokenId = json['tokenId']??""
  ;
    void setTokenId(String tokenId){
      this.tokenId  =tokenId;
    }
  @override
  Map stringContentMap() =>
      {'address:': address, 'amount': amount, 'decimalPoint': decimalPoint,  'symbol': symbol,};
}

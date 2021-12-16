import 'package:yollet/Data/Dataset/QueryBalanceInfo.dart';
import 'package:yollet/Data/Dataset/TokenInfo.dart';
import 'package:yollet/Util/Common/utils.dart';

class AddressInfo with ToString {
  String? address;
  String? addInfo;
  String? publicKey;
  num? createDate;
  // List<BalanceInfo>? balanceInfoList; //not used;
  List<QueryBalanceInfo>? queryBalanceInfoList;
  List<TokenInfo>? tokenInfoList;
  bool isStoreAddress = false;
  bool hasKeyIndex = false;

  AddressInfo({this.address, this.addInfo, this.publicKey, this.createDate
    // , this.balanceInfoList
  });

  AddressInfo.fromJson(Map json)
      : address = json['address']??"",
        addInfo = json['addInfo']??"",
        publicKey = json['publicKey']??"",
        createDate = num.tryParse(json['createDate']??"0") ?? 0
        // balanceInfoList = (json['balanceInfo']?? []).map<BalanceInfo>((json)=>BalanceInfo.fromJson(json)).toList()
  ;

  // setBalanceInfoList(List<BalanceInfo> balanceInfoList){
  //   this.balanceInfoList=balanceInfoList;
  // }
  // setBalanceInfoListFromJson(List balanceInfoList){
  //   this.balanceInfoList=balanceInfoList.map<BalanceInfo>((json)=>BalanceInfo.fromJson(json)).toList();
  // }

  setQueryBalanceInfoList(List<QueryBalanceInfo> queryBalanceInfoList){
    this.queryBalanceInfoList=queryBalanceInfoList;
  }
  setQueryBalanceInfoListFromJson(List queryBalanceInfoList){
    this.queryBalanceInfoList=queryBalanceInfoList.map<QueryBalanceInfo>((json)=>QueryBalanceInfo.fromJson(json)).toList();
  }

  setTokenInfoList(List<TokenInfo> tokenInfoList){
    this.tokenInfoList=tokenInfoList;
  }
  setTokenInfoListFromJson(List tokenInfoList){
    this.tokenInfoList=tokenInfoList.map<TokenInfo>((json)=>TokenInfo.fromJson(json)).toList();
  }

  bool get isEmptyBalance{
    return (queryBalanceInfoList==null || queryBalanceInfoList!.isEmpty);
  }
  setStoreAddress(bool isStoreAddress){
    this.isStoreAddress=isStoreAddress;
  }
  setKeyIndex(bool hasKeyIndex){
    this.hasKeyIndex=hasKeyIndex;
  }
  @override
  Map stringContentMap() =>
      {'address:': address, 'addInfo': addInfo, 'publicKey': publicKey, 'createDate': createDate,
        // 'balanceInfoList': balanceInfoList.toString()
      };
}

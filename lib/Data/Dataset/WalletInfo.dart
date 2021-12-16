import 'package:yollet/Data/Dataset/AddressInfo.dart';
import 'package:yollet/Util/Common/utils.dart';

class WalletInfo with ToString {
  String? id;
  int? location;
  String? address;
  String? name;
  int index;
  AddressInfo? addressInfo;

  WalletInfo({
    this.id,
    this.location,
    this.address,
    this.name,
    this.index=0,
    this.addressInfo});

  WalletInfo.fromJson(Map json)
      : id = json['id']??"",
        location = json['location']??0,
        address = json['address']??"",
        name = json['walletName']??"",
        index = json['walletColorIndex']??0
  ;

  setAddressInfo(AddressInfo info){
    this.addressInfo = info;
  }

  @override
  Map stringContentMap() =>
      {'address:': address, 'name': name, 'index': index, };
}

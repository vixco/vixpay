import 'package:yollet/Util/Common/utils.dart';

class UserAddress with ToString {
  String id;
  int location;
  String addressName;
  // String? addressKeyIndex;
  String address;
  bool isStoreAddress;

  UserAddress({
    required this.id,
    required this.location,
    required this.addressName,
    /*this.addressKeyIndex,*/
    required this.address,
    this.isStoreAddress = false
  });

  UserAddress.fromJson(Map json)
      : id = json['id']??"",
        location = json['location']??0,
        addressName = json['addressName']??"",
        // addressKeyIndex = json['addressKeyIndex']??"",
        address = json['address']??"",
        isStoreAddress =false
  ;

  @override
  Map stringContentMap() =>
      {'id:': id, 'location': location, 'addressName': addressName, 'address': address};
}

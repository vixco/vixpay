import 'dart:io';
import 'dart:typed_data';

// import 'package:get_mac/get_mac.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:package_info/package_info.dart';
import 'package:unique_identifier/unique_identifier.dart';


class CommonUtil {
  static final String TAG = "CommonUtil";

  static List<int>? convertInt2Bytes(int value, [Endian order=Endian.big, int bytesSize=-1] ) {
    if(bytesSize==-1){
      bytesSize = (value.toString().length/2).floor();
    }
    try{
      final kMaxBytes = 8;
      var bytes = Uint8List(kMaxBytes)
        ..buffer.asByteData().setInt64(0, value, order);
      List<int> intArray;
      if(order == Endian.big){
        intArray = bytes.sublist(kMaxBytes-bytesSize, kMaxBytes).toList();
      }else{
        intArray = bytes.sublist(0, bytesSize).toList();
      }
      return intArray;
    }catch(e) {
      print('util convert error: $e');
    }
    return null;
  }

   static bool isNullEmpty(String? s) {
    return s == null || s.isEmpty;
  }

   static bool isNullZero(int i) {
    return i == null || i == 0;
  }

   static double stringToDouble(String? s) {
    if (isNullEmpty(s)) {
      return 0;
    }

    try {
      return double.parse(s!);
    } catch (e) {
    return 0;
    }
  }

   static int stringToInteger(String? s) {
    if (isNullEmpty(s)) {
      return 0;
    }

    try {
      return num.parse(s!).toInt();
    } catch (e) {
      return 0;
    }
  }

   static int stringToLong(String? s) {
    if (isNullEmpty(s)) {
      return 0;
    }

    try {
      return num.parse(s!).toInt();
    } catch (e) {
    return 0;
    }
  }


   static String substring(String str, int beginIndex) {
    return str.substring(beginIndex);
  }

  static Future<String> getPackageName() async {
    PackageInfo info = await PackageInfo.fromPlatform();
    return info.packageName;
  }

   static Future<String> getVersionName() async {
     PackageInfo info = await PackageInfo.fromPlatform();
     return info.version;
  }

   static Future<int> getVersionCode() async {
     PackageInfo info = await PackageInfo.fromPlatform();
     int versionCode = int.parse(info.buildNumber);
     // --split-per-abi 로 빌드할 시 버전코드의 천 자리에 abi 를 구분하는 값이 들어감
     // 정확한 버전코드를 구하기 위해 % 1000 사용
     return versionCode % 1000;
  }

   static String getAreaCode(String tel) {
    if (tel != null) {
      int index = tel.indexOf("-");

      if (index > 0) {
        return tel.substring(0, index);
      }
    }

    return "0";
  }


  // @SuppressLint("HardwareIds")
  static Future<String> _getMacAddress() async {
    // String platformVersion;
    // // Platform messages may fail, so we use a try/catch PlatformException.
    // try {
    //   platformVersion = await GetMac.macAddress;
    // } on PlatformException {
    //   // platformVersion = 'Failed to get Device MAC Address.';
    //   platformVersion =  "02:00:00:00:00:00";
    // }
    // Map<String, dynamic> deviceData = <String, dynamic>{};
    // final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    // String id="";
    // debugPrint("_getMacAddress");
    // try {
    //   if (Platform.isAndroid) {
    //     deviceData = _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
    //     debugPrint(deviceData.toString());
    //   } else if (Platform.isIOS) {
    //     deviceData = _readIosDeviceInfo(await deviceInfoPlugin.iosInfo);
    //     debugPrint(deviceData.toString());
    //   }
    // } on PlatformException {
    //   deviceData = <String, dynamic>{
    //     'Error:': 'Failed to get platform version.'
    //   };
    // }

    // String id = await appStore.dispatch(GetDeviceIdAction());

    // await ActionMgr.dispatchSync(OpenDrawerAction());
    // throw Exception('Failed to load terms');


    String identifier="";
    try {
      identifier = (await UniqueIdentifier.serial)??"";
    } on PlatformException {
      identifier = '';
    }

    return identifier;
  }
  //
  // static Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
  //   return <String, dynamic>{
  //     'version.securityPatch': build.version.securityPatch,
  //     'version.sdkInt': build.version.sdkInt,
  //     'version.release': build.version.release,
  //     'version.previewSdkInt': build.version.previewSdkInt,
  //     'version.incremental': build.version.incremental,
  //     'version.codename': build.version.codename,
  //     'version.baseOS': build.version.baseOS,
  //     'board': build.board,
  //     'bootloader': build.bootloader,
  //     'brand': build.brand,
  //     'device': build.device,
  //     'display': build.display,
  //     'fingerprint': build.fingerprint,
  //     'hardware': build.hardware,
  //     'host': build.host,
  //     'id': build.id,
  //     'manufacturer': build.manufacturer,
  //     'model': build.model,
  //     'product': build.product,
  //     'supported32BitAbis': build.supported32BitAbis,
  //     'supported64BitAbis': build.supported64BitAbis,
  //     'supportedAbis': build.supportedAbis,
  //     'tags': build.tags,
  //     'type': build.type,
  //     'isPhysicalDevice': build.isPhysicalDevice,
  //     'androidId': build.androidId,
  //     'systemFeatures': build.systemFeatures,
  //   };
  // }
  //
  // static Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
  //   return <String, dynamic>{
  //     'name': data.name,
  //     'systemName': data.systemName,
  //     'systemVersion': data.systemVersion,
  //     'model': data.model,
  //     'localizedModel': data.localizedModel,
  //     'identifierForVendor': data.identifierForVendor,
  //     'isPhysicalDevice': data.isPhysicalDevice,
  //     'utsname.sysname:': data.utsname.sysname,
  //     'utsname.nodename:': data.utsname.nodename,
  //     'utsname.release:': data.utsname.release,
  //     'utsname.version:': data.utsname.version,
  //     'utsname.machine:': data.utsname.machine,
  //   };
  // }

   static Future<String> getDeviceId() async {
    String mac =await _getMacAddress();
    return mac;
  }

}
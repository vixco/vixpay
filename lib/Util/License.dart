import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

// import 'package:install_apk_plugin/install_apk_plugin.dart';
import 'package:intl/intl.dart';
import 'package:yollet/Util/CommonUtil.dart';
import 'package:yollet/Util/Log.dart';
import 'package:yollet/Util/Security.dart';
import 'package:yollet_client/yollet_client.dart';

class License {
    static const String TAG = "License";
    static const VERSION = 1.0;
    static final _YOSHOPPOS_DIR ="/sdcard/YoshopPOS";
    static Map? license;
    static final String LIC_STAT_USED = "0000"; //사용중
    static final String LIC_STAT_WAITING_FOR_APPROVAL = "1000"; //승인대기
    static final String LIC_STAT_PAUSE = "8000"; //일시중지
    static final String LIC_STAT_DISPOSAL = "9000"; //폐기
    static final String LIC_STAT_EXPIRED = "9100"; //만료
    static final String LIC_STAT_INVALID_LICENSE = "9200"; //invalid license
    static final String storeId="";
    static final String storeTerminalId=Platform.operatingSystem;


    static Future<String> get _localPath async {
        /*if(Platform.isAndroid){
            return Future.value(_YOSHOPPOS_DIR);
        }*/
        final directory = await getApplicationDocumentsDirectory();

        return directory.path;
    }

    static Future<Map> checkLicenseFile() async {
        Log.d(TAG, '+++ License/checkLicenseFile >>> Start');
        // PackageInfo packageInfo = await PackageInfo.fromPlatform();
        // String appName = packageInfo.appName;
        // String packageName =  await CommonUtil.getPackageName();
        // var version = await CommonUtil.getVersionName();
        // var versionCode = await CommonUtil.getVersionCode();

        Map<String, Object> map = Map();
        map["success"]= true;
        map["invalidLicense"]=false;

        String packageName =  await CommonUtil.getPackageName();

        try {
            File file = File('${await _localPath}/$packageName.lic');
            Log.d(TAG, '+++ License/FilePath >>> ${await _localPath}/$packageName.lic');
            // for a file
            if(await file.exists()){
                String contents = await file.readAsString();
                license  = jsonDecode(contents);

                if(license!.containsKey("permission")){
                    Map? permissionMap =license!["permission"];
                    if(permissionMap!=null&& permissionMap.containsKey("deviceId") && permissionMap.containsKey("storeId") && permissionMap.containsKey("terminalId")) {
                        String deviceId = await CommonUtil.getDeviceId();
                        String? storeId = License.storeId;
                        String? terminalId = License.storeTerminalId;
                        if (permissionMap["deviceId"] == deviceId &&
                            permissionMap["storeId"] == storeId &&
                            permissionMap["terminalId"] == terminalId) {

                        } else {
                            map["success"]= false;
                            map["invalidLicense"]= true;
                        }
                    }
                }
            }else{
                license = await gRpcClient.issueLicense(
                    licenseVersion: License.VERSION.toString(),
                    packageName: packageName
                );
                file.writeAsString(jsonEncode(license));
            }
        } catch (e, stacktrace) {
            Log.d(TAG, '+++ License/checkLicenseFile >>> FAIL ($e)');
            print(stacktrace);
            map["success"]= false;
        }
        return map;
    }


    static Future<void> issueLicense() async {
        Log.d(TAG, '+++ License/issueLicense >>> Start');
        String packageName =  await CommonUtil.getPackageName();
        try {
            File file = File('${await _localPath}/$packageName.lic');
            // for a file
                license = await gRpcClient.issueLicense(
                    licenseVersion: License.VERSION.toString(),
                    packageName: packageName
                );
                file.writeAsString(jsonEncode(license));
        } catch (e, stacktrace) {
            Log.d(TAG, '+++ License/issueLicense >>> FAIL ($e)');
            print(stacktrace);
        }
    }

    static Future<void> requestPermission() async {
        Log.d(TAG, '+++ License/requestPermission >>> Start');
        if(license!.containsKey("permission")){
            Map? permissionMap =license!["permission"];
            if(permissionMap!=null  && permissionMap.containsKey("sign") && permissionMap.containsKey("state")){
                if(permissionMap["state"]==License.LIC_STAT_USED){
                    return;
                }
            }
        }

        String packageName =  await CommonUtil.getPackageName();
        try {
            File file = File('${await _localPath}/$packageName.lic');
            // // for a file
            // if(await file.exists()){
            //     String contents = await file.readAsString();
            //     license  = jsonDecode(contents);
            // }else{
            //
            // }

            String regDate  = DateFormat('yyyyMMdd').format(DateTime.now());
            try {
                license = await gRpcClient.requestPermission(
                    licenseMap:license!,
                    deviceId: await CommonUtil.getDeviceId(),
                    storeId:License.storeId,
                    terminalId:License.storeTerminalId,
                    regDate:regDate,
                    expireDate:0,
                    updateDate:regDate,
                    appVersion:await CommonUtil.getVersionName(),
                    appVersionCode:(await CommonUtil.getVersionCode()).toString(),
                    sign:"",
                    state:"",
                    note:"",
                );
            } on GRpcException catch (e) {
                switch (e.code) {
                    case '14':
                    //GRPC ERROR: [14]Error connecting: SocketException: Connection failed
                    // (OS Error: Network is unreachable, errno = 101), address = dev-grpc.yoshop.net, port = 6500
                    //     return bizResponse(0, 'success'); //OFF Line Mode
                    default:
                        Log.e(TAG, e.toString());
                // return bizResponse(-6, 'internal_error');
                }
            }
            file.writeAsString(jsonEncode(license));
        } catch (e, stacktrace) {
            Log.d(TAG, '+++ License/requestPermission >>> FAIL ($e)');
            print(stacktrace);
        }
    }

    static Future<Map> verifyLicense() async {
        Log.d(TAG, '+++ License/verifyLicense >>> Start');
        String appPackage =  await CommonUtil.getPackageName();

        try {
            File file = File('${await _localPath}/$appPackage.lic');
            String updateDate  = DateFormat('yyyyMMdd').format(DateTime.now());
            String appVersion = await CommonUtil.getVersionName();
            String appVersionCode = (await CommonUtil.getVersionCode()).toString();
            license = await gRpcClient.verifyLicense(
                licenseMap:license!,
                updateDate:updateDate,
                appVersion:appVersion,
                appVersionCode:appVersionCode,
            );
            file.writeAsString(jsonEncode(license));
            return {
                'minVer': license!["appVerInfo"]["minVer"]??"0",
                'isLock': license!["appVerInfo"]["isLock"]??"0",
                'lastVer': license!["appVerInfo"]["lastVer"]??"0",
                'currVer': license!["permission"]["appVersionCode"]??(await CommonUtil.getVersionCode()).toString(),
                'appVersion': license!["permission"]["appVersion"]??"",
                'appPackage': license!["licenseInfo"]["pkg"]??appPackage,
                'currAppVersion': await CommonUtil.getVersionName(),
                'state': license!["permission"]["state"]??"",
                'licenseKey': license!["licenseInfo"]["key"]??"",
                'success': (license!["permission"]["state"]??"")==License.LIC_STAT_USED,
            };
        } catch (e, stacktrace) {
            Log.d(TAG, '+++ License/verifyLicense >>> FAIL ($e)');
            print(stacktrace);
            String deviceUniqueValue =license!["permission"]["deviceId"];//await CommonUtil.getDeviceId();//licensePermission.getDeviceId();
            String storeId =License.storeId;//licensePermission.getStoreId();
            String storeTerminalId =License.storeTerminalId;//licensePermission.getTerminalId();
            String appPackage  = await CommonUtil.getPackageName();//licenseInfo.getPkg();
            int expireDate =license!["permission"]["expireDate"] ;//licensePermission.getExpireDate();

            String state = license!["permission"]["state"]??"";

            debugPrint(DateFormat('yyyyMMdd').format(DateTime(expireDate)));
            debugPrint(DateFormat('yyyyMMdd').format(DateTime.now()));
            debugPrint("expireDate $expireDate");
            debugPrint("now ${DateTime.now().millisecondsSinceEpoch}");

            String text = deviceUniqueValue + "|" + (storeId) + "|" +
                (storeTerminalId) + "|" + appPackage + "|" +
                expireDate.toString();
            String sign = await Security.encrypt(text, "license");
            if(license!["permission"]["sign"].toLowerCase()!=sign.toLowerCase()){
                state = License.LIC_STAT_INVALID_LICENSE;
            }
            else if(DateTime.now().millisecondsSinceEpoch>expireDate) {
                state = License.LIC_STAT_EXPIRED;
            }

            return {
                'minVer': license!["appVerInfo"]["minVer"]??"0",
                'isLock': license!["appVerInfo"]["isLock"]??"0",
                'lastVer': license!["appVerInfo"]["lastVer"]??"0",
                'currVer': license!["permission"]["appVersionCode"]??(await CommonUtil.getVersionCode()).toString(),
                'appVersion': license!["permission"]["appVersion"]??"",
                'appPackage': license!["licenseInfo"]["pkg"]??appPackage,
                'currAppVersion': await CommonUtil.getVersionName(),
                'state': state,
                'licenseKey': license!["licenseInfo"]["key"]??"",
                'success': state==License.LIC_STAT_USED,
            };
        }
    }
}
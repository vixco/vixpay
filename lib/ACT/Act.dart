import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yollet/ACT/ActionIF.dart';
import 'package:yollet/Mgr/Bridge/JavaBridge.dart';
import 'package:yollet/Mgr/redux/action.dart';
import 'package:yollet/Mgr/redux/state.dart';
import 'package:yollet/UI/template/Popup/popup.dart';
import 'package:yollet/Util/Format/date_format_base.dart';

abstract class Act implements ActionIF {
  Map content = HashMap<String, dynamic>();
  String? command;
  final BuildContext? context;
  Function? successCallback;
  Function? failCallback;
  Function? syncCallback;
  bool showProgress;

  Act({this.context, this.command, this.showProgress = false}) {
    if (showProgress) {
      progressDialog();
    }

    String date =
        formatDate(new DateTime.now(), [yyyy, '-', mm, '-', dd, ' ', HH, ':', nn, ':', ss]);
    debugPrint("Start of $command: $date");
  }

  @override
  String toString() {
    return 'Action{actionName: $runtimeType}';
  }

  void bridgeWith(Map map) {
    map.forEach((key, value) {
      if (value != null) {
        content[key] = value;
      }
    });

    bridge();
  }

  void bridge() {
    JavaBridge.send(
      command: command,
      data: content,
    ).then((data) => setResult(data));
  }

  void setResult(dynamic data) {
    if (showProgress) {
      appStore.dispatch(DismissPopupAction());
    }

    if (syncCallback != null) {
      syncCallback!(data);
    }

    if (success(data)!) {
      if (successCallback != null) {
        successCallback!(data["content"]);
      }
    } else {
      if (failCallback != null) {
        failCallback!(resCode(data), message(data));
      } else if (syncCallback == null) {
        debugPrint("$runtimeType : resMessage: " + message(data)!);
        alert("error", message(data));
      }
    }

    String date = formatDate(new DateTime.now(), [yyyy, '-', mm, '-', dd, ' ', HH, ':', nn, ':', ss]);
    debugPrint("End of $command: $date");
  }

  @override
  void dispose() {
    debugPrint("$runtimeType dispose()");

    if (showProgress) {
      appStore.dispatch(DismissPopupAction());
    }

    setResult(null);
  }

  static bool? success(r) => r != null && r['common'] != null ? r['common']['resCode'] >= 0 : false;

  static int? resCode(r) => r != null && r['common'] != null ? r['common']['resCode'] : -1;

  static String? message(r) => r != null && r['common'] != null ? r['common']['resMessage'] : '';

  static dynamic result(r, k) => r != null && r['content'] != null ? r['content'][k] : null;

  static Map? resultMap(r) => r != null ? r['content'] : null;

  static Map setResCode(int resCode) => {'common': {'resCode': resCode}};
}

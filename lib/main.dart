import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yollet/UI/template/RestartWidget.dart';
import 'package:yollet/app.dart';
 import 'package:permission_handler/permission_handler.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Map<Permission, PermissionStatus> statuses = await [
    Permission.camera,
    Permission.storage,
  ].request();

  statuses.forEach((key, value) {
    if (value.isDenied) {
      print('$key is denied');
      SystemNavigator.pop();
      return;
    }
  });
  runApp(
    RestartWidget(
      child: YolletApp(),
    ),
  );
}

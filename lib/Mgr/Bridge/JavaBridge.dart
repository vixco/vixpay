import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';

class JavaBridge {
  static const MethodChannel _channel = const MethodChannel('JavaBridge');
  static const _stream = const EventChannel('JavaStream');
  static const _systemStream = const EventChannel("SystemJavaStream");

  static StreamSubscription listen(Function listener, {bool system = false}) {
    return (system ? _systemStream : _stream).receiveBroadcastStream().listen((data) {
      listener(json.decode(data));
    });
  }

  static JavaBridgeReader channelReader = new JavaBridgeReader(_channel);

  static Future<dynamic> send({required String? command, dynamic data, JavaBridgeHandler? javaCallback}) async {
    channelReader.setJavaBridgeHandler(javaCallback);
    String result = await _channel.invokeMethod<String>('bridge', _encode(command, data)) ?? '{}';
    return json.decode(result);
  }

  static String _encode(String? command, dynamic data) {
    return json.encode({
      'common': {'targetSys': 'Android', 'command': command, 'reqTime': DateTime.now().millisecondsSinceEpoch},
      'content': data
    });
  }
}

typedef void JavaBridgeHandler(dynamic qr);

class JavaBridgeReader {
  JavaBridgeReader(this.channel) {
    channel.setMethodCallHandler((MethodCall call) async {
      switch (call.method) {
        case 'send':
          if (javaBridgeHandler != null) {
            assert(call.arguments is String);
            javaBridgeHandler!(json.decode(call.arguments));
          }
          break;

        default:
          print("JavaBridgeReader: unknown method call received at "
              "${call.method}");
      }
    });
  }

  void setJavaBridgeHandler(JavaBridgeHandler? qrch) {
    this.javaBridgeHandler = qrch;
  }

  MethodChannel channel;
  JavaBridgeHandler? javaBridgeHandler;
}

import 'package:flutter/material.dart';
import 'package:yollet/Mgr/Navigation/app_routes.dart';
import 'package:yollet/UI/template.dart';

class GlobalWidgets {
  static final GlobalWidgets _singleton = GlobalWidgets._internal();

  final _keys = <String, GlobalKey>{};

  factory GlobalWidgets() => _singleton;

  GlobalWidgets._internal();

  GlobalKey<T> key<T extends State<StatefulWidget>>(String name) {
    if (_keys[name] == null) {
      _keys[name] = GlobalKey<T>();
    }

    return _keys[name] as GlobalKey<T>;
  }

  T? state<T extends State?>(String name) {
    if (_keys[name] == null) {
      return null;
    }

    return _keys[name]!.currentState as T;
  }

  void reload(String? name) {
    if (_keys[name!] == null || !(_keys[name]!.currentState is Reloadable)) {
      return;
    }

    (_keys[name]!.currentState as Reloadable).reload();
  }

  void refresh(String name) {
    if (_keys[name] == null) {
      return;
    }

    // ignore: invalid_use_of_protected_member
    _keys[name]!.currentState!.setState(() {});
  }
}

/// pop() 하여 특정 페이지로 이동 시 데이터를 새로 읽을 필요가 있다면
/// 해당 페이지의 State 클래스를 Reloadable 믹신을 사용하도록 함
/// 데이터 초기화 코드는 reload() 안에 구현
/// NavigateTo(to: 경로, reload: true)하면 reload()가 호출됨
class Reloadable {
  void reload() {}
}

class Global {
  static final navKey = GlobalKey<NavigatorState>();
  static final navState = navKey.currentState;
  static final appKey = GlobalWidgets().key(AppRoutes.home);
  static final appContext = appKey.currentContext;
  static getString(String key) => AppLocalizations.of(appContext!)!.getString(key);
}
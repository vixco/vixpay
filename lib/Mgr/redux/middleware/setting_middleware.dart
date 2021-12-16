import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:yollet/Mgr/redux/action.dart';
import 'package:yollet/Mgr/redux/state.dart';
import 'package:shared_preferences/shared_preferences.dart';


/// Middleware 구현
///   Middleware 를 포함할 경우 다음과 같이 동작함
///   UI => Action1 => Middleware => Action2 => Reducer => Store => UI
///
/// 1. middleware 로 동작하기 위해서는 MiddlewareClass<AppState> 상속 받음
/// 2. call()에서 action 별 분기
/// 3. next(Action2()) 식으로 다음 action 을 호출

///
/// Setting Middleware
///
class SettingMiddleware extends MiddlewareClass<AppState> {
  @override
  call(Store<AppState> store, action, next) {
    /////////cartState
    if (action is GetSettingAction) {
      return _getSettingAction(store.state.settingState, action, next);
    } else if (action is SetSettingAction) {
      return _setSettingArrayAction(store.state.settingState, action, next);
    }else {
      return next(action);
    }
  }

  Future<String> _getSettingAction(SettingState state, action, next) async {
    String key = action.key;
    HashMap<String, dynamic> setting = HashMap<String, dynamic>();
    setting.clear();

    setting.addAll(state.setting);
    String value= await _loadSettingData(key);
    setting[key]=value;
    debugPrint("Get setting[$key] = $value");
    next(UpdateSettingAction(setting: setting));
    return value;
  }

  void _setSettingArrayAction(SettingState state,action, next) async {
    String key=  action.key;
    String value = action.value;
    // Map keyValues = action.keyValues;
    HashMap<String, dynamic> setting = HashMap<String, dynamic>();
    setting.clear();
    setting.addAll(state.setting);

    await _saveSettingData(key,value);
    setting[key]=value;
    debugPrint("Set setting[$key] = $value");
    next(UpdateSettingAction(setting: setting));
  }

//----
  String Setting = 'setting-';

  Future<String> _loadSettingData(String key) async {
    SharedPreferences _storage = await SharedPreferences.getInstance();
    return _storage.getString(Setting+key)??"";
  }

  Future<void>  _saveSettingData(String key,String data) async {
    SharedPreferences _storage = await SharedPreferences.getInstance();
    await _storage.setString(Setting+key, data);
  }
//-----
}

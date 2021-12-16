import 'dart:async';
import 'dart:core';

import 'package:yollet/ACT/Act.dart';

class ActionMgr {
  ActionMgr();

  static dynamic dispatch(Act action) {
    print(action.toString());
    return action.call();
  }

  static Future dispatchSync(Act action) async {
    print(action.toString());
    Completer completer = Completer();
    action.syncCallback = (data) => completer.complete(data);
    action.call();
    return completer.future;
  }
}

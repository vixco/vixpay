import 'package:yollet/ACT/Act.dart';

class DssServerListAction extends Act {
  DssServerListAction(context) : super(context: context, command: "sync.dssServerList");

  @override
  bool call() {
    try {
      var valid = true;
      if (valid) {
        bridge();
      } else {
        dispose();
      }
    } on Exception {
      dispose();
    }

    return true;
  }
}

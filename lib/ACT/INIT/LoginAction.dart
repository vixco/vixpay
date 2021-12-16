import 'package:yollet/ACT/Act.dart';

class LoginAction extends Act {
  LoginAction(context) : super(context: context, command: "sync.login");
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

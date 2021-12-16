import 'package:yollet/ACT/Act.dart';

class CommonAction extends Act {
  CommonAction(context) : super(context: context);

  @override
  bool call() {
    content.toString();
    return true;
  }
}

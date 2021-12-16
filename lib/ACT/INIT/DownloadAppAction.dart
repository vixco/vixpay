import 'package:yollet/ACT/Act.dart';

class DownloadAppAction extends Act {
  bool? forceUpdate;
  String? downloadPath;
  String? baseFilename;


  DownloadAppAction(context) : super(context: context, command: "sync.downloadApp");
  @override
  bool call() {
    try {
      var valid = true;
      if (downloadPath == null ||baseFilename == null) {
        valid = false;
      }

      if (valid) {
        content["forceUpdate"] = forceUpdate;
        content["downloadPath"] = downloadPath;
        content["baseFilename"] = baseFilename;
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

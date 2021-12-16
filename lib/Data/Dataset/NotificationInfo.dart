import 'package:yollet/Util/Common/utils.dart';

class NotificationInfo with ToString {
  String? id;
  String? type;
  String? title;
  String? contents;
  String? date;
  bool isRead;
  DateTime? receivedDate;

  NotificationInfo({this.id, this.type, this.title, this.contents, this.date ,this.isRead =false, this.receivedDate}){
  this.receivedDate??=DateTime.now();
  }

  NotificationInfo.fromJson(Map json)
      : id = json['id']??"",
        type = json['type']??"",
        title = json['title']??"",
        contents = json['contents']??"",
        date = json['date']??"",
      isRead = json['isRead']??false,
  receivedDate =  DateTime.parse(json['receivedDate'])
  ;

  @override
  Map stringContentMap() =>
      {'id:': id, 'type': type, 'title': title, 'contents': contents, 'date': date,'isRead': isRead, 'receivedDate':receivedDate!.toIso8601String()};
}

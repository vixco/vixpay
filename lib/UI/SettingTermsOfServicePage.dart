
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:yollet/UI/template.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/services.dart' show PlatformException, rootBundle;
import 'package:http/http.dart' as http;
import 'package:charset_converter/charset_converter.dart';

class SettingTermsOfServicePage extends StatefulWidget {
  @override
  SettingTermsOfServicePageState createState() => SettingTermsOfServicePageState();
}

class SettingTermsOfServicePageState extends State<SettingTermsOfServicePage> {
  String terms="";
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance!.addPostFrameCallback(init);
  }
  Future<void> init(Duration timeStamp) async {
    // terms =  await rootBundle.loadString('assets/text/terms_of_service.txt');
    final response =
    await http.get(Uri.parse('http://www.vixco.net/resource/agreement/vixpay_term.txt'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      try {
        terms =   (await CharsetConverter.decode("EUC-KR",response.bodyBytes))!;
      } on PlatformException {
        setState(() {
        });
        return;
      }
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load terms');
    }
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultScrollBody(Text(terms,
        // maxLines: 1,
        // softWrap: true,
        // overflow: TextOverflow.fade,
        // ),
      )
        ,appBarWidget: CustomAppBar(title: "terms_of_service_view",),paddingTop: 0,
        // paddingLR: 0,
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:package_info/package_info.dart';
import 'package:yollet/Mgr/redux/action.dart';
import 'package:yollet/Mgr/redux/state.dart';
import 'package:yollet/UI/template.dart';
import 'package:yollet/themeStyle.dart';
import 'package:flutter/services.dart' show rootBundle;

class SettingVersionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultBody(Body(),appBarWidget: CustomAppBar(title: "version",),paddingTop: 0,paddingLR: 0,),
    );
  }
}

class Body extends StatefulWidget {

  @override
  BodyState createState() => BodyState();
}

class BodyState extends State<Body> {
  String licenseKey="";
  PackageInfo? info;
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance!.addPostFrameCallback(init);
  }
  Future<void> init(Duration timeStamp) async {
    info = await PackageInfo.fromPlatform();
    licenseKey = await appStore.dispatch(GetLicenseKeyAction());

    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width:MediaQuery.of(context).size.width,
      color:ThemeColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SettingInfoWidget(text: "Name",description:(info?.appName)??""),
          SettingInfoWidget(text: "version",description:(info?.version)??""),
          SettingInfoWidget(text: "info",description:(licenseKey)),
        ],
      ),
    );

  }

}
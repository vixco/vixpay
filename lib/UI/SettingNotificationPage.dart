import 'package:flutter/material.dart';
import 'package:yollet/UI/template.dart';
import 'package:yollet/themeStyle.dart';
import 'package:yollet/Mgr/redux/action.dart';
import 'package:yollet/Mgr/redux/state.dart';
import 'package:flutter_redux/flutter_redux.dart';


class SettingNotificationPage  extends StatefulWidget {
  @override
  _SettingNotificationPageState createState() => _SettingNotificationPageState();
}

class _SettingNotificationPageState extends State<SettingNotificationPage> {
  @override
  void initState() {
    super.initState();
    // appStore.dispatch(GetSettingAction(key: SettingState.KEY_SERVICE_NOTIFICATION));
    // appStore.dispatch(GetSettingAction(key: SettingState.KEY_MARKETING_NOTIFICATION));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultBody(Body(),appBarWidget: CustomAppBar(title: "notification",),paddingTop: 0,paddingLR: 0,),
    );
  }
}

class Body extends StatefulWidget {

  @override
  BodyState createState() => BodyState();
}

class BodyState extends State<Body> {

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, SettingState>(
        converter: (store) => store.state.settingState,
        builder: (_, SettingState state) =>Container(color:ThemeColors.white,
          child: Column(
            children: <Widget>[
              SettingToggleItemWidget(text:"service_notification",description: "receive_service_related_notification",
                  groupValue: state.value(SettingState.KEY_SERVICE_NOTIFICATION)=="1",onChanged: (v)=> appStore.dispatch(SetSettingAction(key: SettingState.KEY_SERVICE_NOTIFICATION,value: v?"1":"0"))
              ),
              Divider(height: 1.h, thickness: 1, color: ThemeColors.gray_100,),
              SettingToggleItemWidget(text:"marketing_notification",description: "receive_marketing_related_notification",
                  groupValue: state.value(SettingState.KEY_MARKETING_NOTIFICATION)=="1",onChanged: (v)=> appStore.dispatch(SetSettingAction(key: SettingState.KEY_MARKETING_NOTIFICATION,value: v?"1":"0"))
              ),
              Divider(height: 1.h, thickness: 1, color: ThemeColors.gray_100,),
            ],
          ),
        )
    );
  }
}
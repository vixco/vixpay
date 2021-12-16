import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yollet/Data/Dataset/QueryBalanceInfo.dart';
import 'package:yollet/Mgr/Navigation/app_routes.dart';
import 'package:yollet/Mgr/redux/action.dart';
import 'package:yollet/Mgr/redux/state.dart';
import 'package:yollet/UI/template.dart';
import 'package:yollet/Util/Common/global_widgets.dart';
import 'package:yollet/themeStyle.dart';
import 'package:yollet_client/yollet_client.dart';

class SettingAccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultBody(
        Body(),
        appBarWidget: CustomAppBar(title: "setting"),
        paddingTop: 0,
        paddingLR: 0,
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        currentIndex: 2,
      ),
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
    InitState initState = StoreProvider.of<AppState>(context).state.initState;
    return Container(
      width: MediaQuery.of(context).size.width,
      color: ThemeColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Visibility(
            visible: initState.loginUserName.isNotEmpty,
            child: SettingInfoWidget(
                text: "user_name", description: initState.loginUserName),
          ),
          SettingItemWidget(
            text: "phone_number",
            description: initState.loginPhone,
            descriptionTextStyle: ThemeTextStyles.SettingAccount,
          ),
          // SizedBox(height: 24.h,),
          SettingItemWidget(
              text: "change_password",
              onTap: () => appStore.dispatch(
                    NavigateToAction(to: AppRoutes.settingCheckChangeAccount),
                  )),
          Visibility(
            visible: initState.loginEmail.isNotEmpty,
            child: SettingInfoWidget(
                text: "email_id", description: initState.loginEmail),
          ),
          SettingItemWidget(
            text: "logout",
            onTap: () async {
              await appStore.dispatch(DoLogoutAction());
              appStore.dispatch(NavigateToAction(to: AppRoutes.intro));
            },
          ),
          SettingInfoWidget(
            text: "delete_account",
            textStyle: ThemeTextStyles.SettingDeleteAccount,
            onTap: () {
              appStore.dispatch(NavigateToAction(to: AppRoutes.settingCheckDeleteAccount));
            },
          ),
        ],
      ),
    );
  }
}

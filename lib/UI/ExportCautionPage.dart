import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:yollet/Mgr/Navigation/app_routes.dart';
import 'package:yollet/Mgr/redux/action.dart';
import 'package:yollet/Mgr/redux/state.dart';
import 'package:yollet/UI/template.dart';
import 'package:yollet/Util/Common/CountDownTimer.dart';
import 'package:yollet/Util/Format/NumberFormatUtil.dart';
import 'package:yollet/themeStyle.dart';

class ExportCautionPage extends StatefulWidget {
  @override
  ExportCautionPageState createState() => ExportCautionPageState();
}

class ExportCautionPageState extends State<ExportCautionPage> {
  String mnemonicPhrase = "";

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, YolletState>(
        converter: (store) => store.state.yolletState,
        builder: (_, YolletState state) => Scaffold(
              body: DefaultBody(Body(state),
                  appBarWidget: CustomAppBar(
                    title: "create_vixco_address",
                    showBackIcon: false,
                  )),
              bottomSheet: Footer(),
            ));
  }

  Widget Footer() {
    return Container(
        height: 72.h,
        color: ThemeColors.white,
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BottomButton(
                  text: "confirm",
                  onPressed: () {
                    appStore.dispatch(
                      NavigateToAction(
                          to: AppRoutes.createVixcoAddressPassCodePage,
                          replace: true),
                    );
                  })
            ],
          ),
        ]));
  }

  Widget Body(YolletState state) {
    return Container(
      color: ThemeColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 30.h,
          ),
          Container(
              child: Center(
                  child: Icon(
            YolletIcons.warning,
            color: ThemeColors.sub_color_pink,
            size: 58.w,
          ))),
          SizedBox(
            height: 14.h,
          ),
          SizedText(
            text: "export_caution_guide1",
            textStyle: ThemeTextStyles.ExportCautionGuide1,
            alignment: Alignment.center,
          ),
          SizedBox(
            height: 37.h,
          ),
          SizedText(
            text: "export_caution_guide2",
            textStyle: ThemeTextStyles.ExportCautionGuide2,
            alignment: Alignment.center,
          ),
          SizedBox(
            height: 130.h,
          ),
          Row(
            children: [
              IconButton(
                  icon: Icon(
                    Icons.check_circle,
                    color: Colors.cyan,
                  ),
                  onPressed: () {}),
              SizedText(
                width: 270.w,
                text: 'export_caution_guide3',
                textStyle: ThemeTextStyles.ExportCautionGuide3,
                // maxLines: 3,
              ),
            ],
          )
        ],
      ),
    );
  }
}

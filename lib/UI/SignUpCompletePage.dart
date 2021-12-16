import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:yollet/Mgr/Navigation/app_routes.dart';
import 'package:yollet/Mgr/redux/action.dart';
import 'package:yollet/Mgr/redux/state.dart';
import 'package:yollet/UI/template.dart';
import 'package:yollet/themeStyle.dart';

class SignUpCompletePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultBody(Body(),appBarWidget: CustomAppBar(title: "sign_up",showBackIcon:false)),
      bottomSheet: Footer(),
    );
  }
}

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height:72.h ,
        color:ThemeColors.white,
        child:
        Column(
            children: [ Row(
              mainAxisAlignment:MainAxisAlignment.center ,
              children: [
                BottomButton(
                  text: "continue",
                  onPressed: () async {
                    appStore.dispatch(NavigateToAction(to: AppRoutes.login));
                  },
                ),
              ],),
              ThemeSpacingBox.spacing_l,
            ]
        )
    );
  }
}
class Body extends StatefulWidget {

@override
BodyState createState() => BodyState();
}

class BodyState extends State<Body> {
  @override
  void initState() {
    super.initState();
  }

 @override
  Widget build(BuildContext context) {
   InitState initState = StoreProvider.of<AppState>(context).state.initState;

   return Container(color:ThemeColors.white,
      child: Column(
        children: <Widget>[
          // ThemeSpacingBox.spacing_xl,
          SizedBox(height: 36.h,),
          Container(
            width: 56.w,
            height: 56.h,
            decoration: BoxDecoration( shape: BoxShape.circle,
                color: ThemeColors.checkedCircle
            ),
              child: Icon(Icons.check,color: ThemeColors.checked,size: 24.w,)
          ),
          // ThemeSpacingBox.spacing_l,
          SizedBox(height: 20.h,),
          SizedText(text: "welcome_abroad",textStyle: ThemeTextStyles.AppbarMessage,alignment: Alignment.center,),
          ThemeSpacingBox.spacing_m,
          SizedText(text: "\""+initState.loginId+"\"",textStyle: ThemeTextStyles.NormalText,alignment: Alignment.center,),
          SizedText(text: "account_has_been_created",textStyle: ThemeTextStyles.NormalText,alignment: Alignment.center,),
        ],
      ),
      );
  }
}
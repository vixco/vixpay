import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yollet/Mgr/Navigation/app_routes.dart';
import 'package:yollet/Mgr/redux/action.dart';
import 'package:yollet/Mgr/redux/state.dart';
import 'package:yollet/UI/template.dart';
import 'package:yollet/themeStyle.dart';

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          SystemChannels.platform.invokeMethod('SystemNavigator.pop');
          return Future.value(false);
        },
        child: Scaffold(
          body: DefaultBody(Body(),paddingTop:0),
          bottomSheet: Footer(),
        )
    );
  }
}

class Footer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
        height:150.h ,
        color:ThemeColors.white,
        child: Column(
          children: [
            BottomButton(
              text: "create_new_user_account",
              onPressed: () {
                appStore.dispatch(NavigateToAction(to: AppRoutes.signUpTerms));
              },
            ),
            ThemeSpacingBox.spacing_l,
            TextButton(
              child:AutoSizeText(AppLocalizations.of(context)!.getString("already_have_user_account"),style: ThemeTextStyles.introLogin,),
              onPressed: (){
                appStore.dispatch(NavigateToAction(to: AppRoutes.login));
              },
            ),
            ThemeSpacingBox.spacing_l,
          ],)
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
    return Center(
      child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              width: 96.w,
              height: 96.h,
              fit: BoxFit.contain,
              image: AssetImage('assets/img/logo_o.png'),
            ),
            SizedBox(height:16.h),
            SizedText(width: 272.w,height: 30.h,text: "most_secure_platform_that_makes_it_easy_to_buy_sell_and_store_crypto",textAlign:TextAlign.center),
          ]),);
  }
}
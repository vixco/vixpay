
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:yollet/Mgr/Navigation/app_routes.dart';
import 'package:yollet/Mgr/redux/action.dart';
import 'package:yollet/Mgr/redux/state.dart';
import 'package:yollet/UI/template.dart';
import 'package:yollet/themeStyle.dart';
import 'package:flutter/services.dart' show PlatformException, rootBundle;
import 'package:http/http.dart' as http;
import 'package:charset_converter/charset_converter.dart';


class SignUpTermsOfServicePage extends StatefulWidget {
  @override
  SignUpTermsOfServicePageState createState() => SignUpTermsOfServicePageState();
}

class SignUpTermsOfServicePageState extends State<SignUpTermsOfServicePage> {
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
          // _errored = true;
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
        ,appBarWidget: CustomAppBar(title: "terms_of_service",),paddingTop: 0,
        // paddingLR: 0,
          footerHeight:150.h
      ),
      bottomSheet: Footer(),

    );
  }
}

class Footer extends StatefulWidget {

  @override
  FooterState createState() => FooterState();
}

class FooterState extends State<Footer> {
  bool isKeepLogin=false;

  @override
  Widget build(BuildContext context) {
    return Container(
        height:150.h ,
        color:ThemeColors.white,
        child: Column(
          children: [
            ThemeSpacingBox.spacing_l,
            Container(
              padding:  EdgeInsets.symmetric(horizontal: 20.w),
              child:
            Row(children: [
              CircleCheckbox(value: isKeepLogin,
                size: 20.w,
                onChanged: (v){
                  setState(() {
                    isKeepLogin = v;
                  });
                },),
              SizedBox(width: 8.w,),
              AutoSizeText(AppLocalizations.of(context)!.getString("i_agree_terms")),
            ],),
                ),
            ThemeSpacingBox.spacing_l,

            BottomButton(
              text: "continue",
              onPressed: isKeepLogin
                  ?() {
                appStore.dispatch(NavigateToAction(to: AppRoutes.signUpVerifyPhoneNumber));
              }
              :null,
            ),
            ThemeSpacingBox.spacing_l,
          ],)
    );
  }
}
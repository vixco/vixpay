import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:yollet/Mgr/redux/state.dart';
import 'package:yollet/UI/IntroPage.dart';
import 'package:yollet/UI/MainPage.dart';

class IntroCheckPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    InitState state = StoreProvider.of<AppState>(context).state.initState;
    if (state.isLogin) {
      return MainPage();
    } else {
      return IntroPage();
    }
  }
}

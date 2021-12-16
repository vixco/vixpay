import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:yollet/Mgr/Navigation/app_routes.dart';
import 'package:yollet/Mgr/redux/action.dart';
import 'package:yollet/Mgr/redux/state.dart';
import 'package:yollet/UI/template.dart';
import 'package:yollet/UI/template/Theme/ThemeData.dart';
import 'package:yollet/Util/Common/global_widgets.dart';
import 'package:yollet/Util/localization/localizations.dart';

class YolletApp extends StatefulWidget {
  // static final Map<String, dynamic> globalMap = Map<String, dynamic>();

  static Future<void> setLocale(BuildContext context, Locale newLocale) async {
    // print('setLocale()');
    // _YolletAppState state =  context.ancestorStateOfType(TypeMatcher<_YolletAppState>());
    // final _YolletAppState? state =
    //     context.findAncestorStateOfType<_YolletAppState>();
    // state.locale = newLocale;
    Intl.defaultLocale = newLocale.languageCode;
    // state.setState(() {
    //   state.locale = newLocale;
    //   Intl.defaultLocale = newLocale.languageCode;
    // });
  }

  PosApp() {}

  @override
  State<StatefulWidget> createState() {
    return _YolletAppState();
  }
}

class _YolletAppState extends State<YolletApp> {
  Locale? locale;
  bool localeLoaded = false;

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    // SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
    print('initState()');

    this._fetchLocale().then((locale) {
      setState(() {
        this.localeLoaded = true;
        this.locale = locale;
        Intl.defaultLocale = locale.languageCode;
      });
    });
    this._setCurrency();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIOverlays(
        [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    super.dispose();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // String lang = 'ko';
    // AppLocalizations.languageCode = lang;
    // YolletApp.setLocale(context, Locale(lang));

    if (ThemeValue.isTablet) {
      print('Preferred orientation: landscape');
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    } else {
      print('Preferred orientation: portrait');
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    }

    ///Set color status bar
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent, //or set color with: Color(0xFF0000FF)
    ));

    if (this.localeLoaded == false) {
      // return Container(
      //   color:  ThemeColors.orange_400,
      //     child:CircularProgressIndicator()
      // );

      return ScreenUtilInit(
          designSize: Size(360, 690),
          // allowFontScaling: false,
          builder: () => Container(
                color: ThemeColors.white,
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(
                        width: 104.w,
                        height: 104.h,
                        fit: BoxFit.contain,
                        image: AssetImage('assets/img/logo_w.png')),
                    SizedBox(height: 16.h),
                    Image(
                        width: 128.w,
                        height: 43.h,
                        fit: BoxFit.contain,
                        image: AssetImage('assets/img/vixpay.png'))
                  ],
                )),
              ));

      /* return  Scaffold(
    backgroundColor: ThemeColors.orange_400,
    body: Container(
    child:CircularProgressIndicator()
    )
      );*/
//      return CircularProgressIndicator();
    } else {
      return ScreenUtilInit(
          designSize: Size(360, 690),
          // allowFontScaling: false,
          builder: () => StoreProvider(
              store: appStore,
              child: MaterialApp(
                builder: (context, child) {
                  return MediaQuery(
                    child: child!,
                    data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                  );
                },
                navigatorKey: Global.navKey,
                title: '빅스페이',
                theme: kTheme,
                debugShowCheckedModeBanner: false,
                initialRoute: AppRoutes.splash,
                routes: AppRoutes.getRoutes(),
                navigatorObservers: [AppRouterObserver()],
                localizationsDelegates: [
                  const AppLocalizationsDelegate(),
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                ],
                supportedLocales: [
                  const Locale('en'), // English
                  const Locale('ko'), // Korean
                  const Locale('ru'), // Russia
                  const Locale('kk'), // Kazakhstan
                  // const Locale('zh'), //ID 표시용
                ],
                locale: locale,
              )));
    }
  }

  _fetchLocale() async {
    var selectedLanguage = await appStore.dispatch(GetSettingAction(key: SettingState.KEY_LANGUAGE));

    if (selectedLanguage == null || selectedLanguage.isEmpty || selectedLanguage=="KRW") {
      selectedLanguage = 'ko';
      await appStore.dispatch(SetSettingAction(
          key: SettingState.KEY_LANGUAGE, value: selectedLanguage));
    }
    var show_code = await appStore
        .dispatch(GetSettingAction(key: SettingState.KEY_SHOW_CODE));

    if (show_code == null) {
      show_code = "0";
      await appStore.dispatch(
          SetSettingAction(key: SettingState.KEY_SHOW_CODE, value: show_code));
    }
    AppLocalizations.showCode = show_code == "1";

    print('_fetchLocale():' + selectedLanguage);
    AppLocalizations.languageCode = selectedLanguage;
    return Locale(selectedLanguage);
  }

  _setCurrency() async {
    var currency = await appStore
        .dispatch(GetSettingAction(key: SettingState.KEY_CURRENCY));

    if (currency == null || currency.isEmpty) {
      currency = 'KRW';
      await appStore.dispatch(SetSettingAction(
          key: SettingState.KEY_CURRENCY, value: currency));
    }
  }
}

class AppRouterObserver extends RouteObserver<Route<dynamic>> {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    appStore.dispatch(UpdateNavigationAction(
        name: route.settings.name, isPage: route is PageRoute, method: 'push'));
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    appStore.dispatch(UpdateNavigationAction(
        name: (previousRoute?.settings.name) ?? "",
        isPage: previousRoute is PageRoute,
        method: 'pop'));
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    appStore.dispatch(UpdateNavigationAction(
        name: newRoute!.settings.name,
        isPage: newRoute is PageRoute,
        method: 'replace'));
  }
}


import 'package:flutter/material.dart';
import 'package:yollet/UI/template.dart';
import 'package:yollet/UI/template/RadioList.dart';
import 'package:yollet/app.dart';
import 'package:yollet/themeStyle.dart';
import 'package:yollet/Mgr/redux/action.dart';
import 'package:yollet/Mgr/redux/state.dart';
import 'package:flutter_redux/flutter_redux.dart';


class SettingLanguagePage  extends StatefulWidget {
  @override
  _SettingLanguagePageState createState() => _SettingLanguagePageState();
}

class _SettingLanguagePageState extends State<SettingLanguagePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultBody(Body(),appBarWidget: CustomAppBar(title: "language_setting",),paddingLR: 0,paddingTop: 0,),
    );
  }
}

class Body extends StatefulWidget {

  @override
  BodyState createState() => BodyState();
}

class BodyState extends State<Body> {
  String? selectedLanguage = "ko";
  late Map _languageMap;
  // List<DropdownMenuItem<String>> _dropDownMenuItemsLanguage;
  List<RadioModel>? _radioItemsLanguage;

  @override
  void initState() {
    super.initState();
  }

  Future _getSettingData() async {
//      _languageMap = {"en":"en","ko":"ko","kk":"kk","ru":"ru"};
      _languageMap = {"en":"en","ko":"ko"};
      // _dropDownMenuItemsLanguage =[];
      // _languageMap.forEach(
      //       (k, v) => _dropDownMenuItemsLanguage.add(
      //     DropdownMenuItem(
      //       value: k,
      //       child: Text(AppLocalizations.of(Global.appContext).getString(v)),
      //     ),
      //   ),
      // );
      // selectedLanguage = await appStore.dispatch(GetSettingAction(key: SettingState.KEY_LANGUAGE));
      SettingState state = StoreProvider.of<AppState>(context).state.settingState;

      selectedLanguage = state.value(SettingState.KEY_LANGUAGE);

      _radioItemsLanguage =[];
      _languageMap.forEach(
            (k, v) => _radioItemsLanguage!.add(
          RadioModel(
              value: k,
              title: v,
              isSelected: (k==selectedLanguage)
          ),
        ),
      );
  }

  Future<void> _updateLocale(BuildContext context, [String selectedLanguage="ko"]) async {
    this.selectedLanguage = selectedLanguage;
    await appStore.dispatch(SetSettingAction(key: SettingState.KEY_LANGUAGE,value: selectedLanguage));
    AppLocalizations.languageCode = selectedLanguage;
    await YolletApp.setLocale(context, Locale(selectedLanguage));
  }

  @override
  Widget build(BuildContext context) {
    _getSettingData();

    return StoreConnector<AppState, SettingState>(
        converter: (store) => store.state.settingState,
        builder: (_, SettingState state) =>Container(
          color:ThemeColors.white,
          child: Column(
            children: <Widget>[
              // DefaultDropdownButton(
              //   label: 'default_language',
              //   value: selectedLanguage,
              //   items: _dropDownMenuItemsLanguage,
              //   onChanged: (v) => setState(() {_updateLocale(context,v);}),
              // ),
              SettingRadioItemWidget(text: "default_language",
                radioList: _radioItemsLanguage,
                onChanged: (v) async {
                  await _updateLocale(context,v!);
                  setState(() {});
                  },
              ),
              // SettingToggleItemWidget(text:"code",description: "debug_only",
              //     groupValue: state.value(SettingState.KEY_SHOW_CODE)=="1",onChanged: (v)=> appStore.dispatch(SetSettingAction(key: SettingState.KEY_SHOW_CODE,value: v?"1":"0"))
              // ),
            ],
          ),
        )
    );
  }
}
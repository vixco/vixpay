import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:yollet/Mgr/Navigation/app_routes.dart';
import 'package:yollet/Mgr/redux/action.dart';
import 'package:yollet/Mgr/redux/state.dart';
import 'package:yollet/UI/template.dart';
import 'package:yollet/Util/Common/CountDownTimer.dart';
import 'package:yollet/themeStyle.dart';

class ImportMnemonicPhasePage extends StatefulWidget {
  @override
  ImportMnemonicPhasePageState createState() => ImportMnemonicPhasePageState();
}

class ImportMnemonicPhasePageState extends State<ImportMnemonicPhasePage> {
  String mnemonicPhrase = "";

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, InitState>(
        converter: (store) => store.state.initState,
        builder: (_, InitState state) => Scaffold(
              body: DefaultScrollBody(Body(state),
                  appBarWidget: CustomAppBar(
                    title: "import_vixco_address",
                  )),
              // bottomSheet: ,
            ));
  }

  Widget Footer() {
    return Container(
        // height: 72.h,
        color: ThemeColors.white,
        child: BottomButton(
            horizontalPadding: 0,
            text: "import",
            onPressed: mnemonicPhrase.isEmpty
                ? null
                : () async {
                    await appStore.dispatch(
                        ImportMnemonicPhraseAction(mnemonic: mnemonicPhrase));
                    appStore.dispatch(
                      NavigateToAction(
                          to: AppRoutes.importVixcoAddressPassCodePage,
                          replace: true),
                    );
                    // String? address = await appStore.dispatch(ImportEthereumKeyAction(mnemonic:
                    // mnemonicPhrase));
                    //  Map<String, dynamic>? others = Map();
                    //  others["ethereum"] = address;
                    //  await appStore.dispatch(UpdateUserOthers(others: others));
                  }));
  }

  Widget Body(InitState state) {
    return Container(
      color: ThemeColors.white,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 20.h,
          ),
          SizedText(
            text: "import_vixco_mnemonic_phase_guide1",
            textStyle: ThemeTextStyles.ImportMnemonicPhaseGuide1,
            alignment: Alignment.center,
          ),
          // InputGroupSubject(text: "가져올 주소의 시드 구문을 입력해 주세요"),
          SizedBox(
            height: 24.h,
          ),
          SizedText(
            text: "import_vixco_mnemonic_phase_guide2",
            textStyle: ThemeTextStyles.ImportMnemonicPhaseGuide2,
            alignment: Alignment.center,
          ),
          // InputGroupSubject(text: "시드구문은 키 백업시 표시된 12개의 단어를 순서대로 입력하십시오. 각 단어는 띄어쓰기로 구분해 주십시요."),
          SizedBox(
            height: 114.h,
          ),
          CustomTextFieldWidget(
              hintText: "input_seed_phrase",
              maxLines: 5,
              onChanged: (s) => setState(() => mnemonicPhrase = s),
              labelText: "seed_phrase",
              autofocus: true),
          SizedBox(
            height: 24.h,
          ),
          SizedText(
            text: "import_vixco_verify_guide",
            textStyle: ThemeTextStyles.ImportMnemonicPhaseGuide3,
            alignment: Alignment.center,
          ),
          // InputGroupSubject(text: "VIXCO 주소 가져오기를 완료하면 현재등록된 주소가 변경됩니다. 복구를 위해 VIXCO주소 내보내기를 통해 현재 주소를 백업했는지 확인하십시요."),
          SizedBox(
            height: 50.h,
          ),
          Footer(),
        ],
      ),
    );
  }

  String? validateMobile(String? value) {
    // String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    const pattern = r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$';

    RegExp regExp = RegExp(pattern);
    if (value != null && value.length == 0) {
      return AppLocalizations.of(context)!
          .getString("please_enter_mobile_number");
    } else if (value != null && !regExp.hasMatch(value)) {
      return AppLocalizations.of(context)!
          .getString("please_enter_valid_mobile_number");
    }
    return null;
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:yollet/Mgr/Navigation/app_routes.dart';
import 'package:yollet/Mgr/redux/action.dart';
import 'package:yollet/Mgr/redux/state.dart';
import 'package:yollet/UI/template.dart';
import 'package:yollet/themeStyle.dart';

class CreateAccountNamePage extends StatefulWidget {
  @override
  CreateAccountNamePageState createState() => CreateAccountNamePageState();
}

class CreateAccountNamePageState extends State<CreateAccountNamePage> {
  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;
  String _accountName = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultBody(Body(),
          appBarWidget: CustomAppBar(
            title: "create_account",
          )),
      bottomSheet: Footer(),
    );
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
                onPressed: () async {
                  if (_key.currentState!.validate()) {
                    _validate = false;
                    _key.currentState!.save();
                    if (_accountName.isEmpty) {
                      return;
                    }
                    YolletState state =
                        StoreProvider.of<AppState>(context).state.yolletState;

                    var success = await appStore.dispatch(
                        CheckDuplicateAccountName(name: _accountName));
                    if (!success) {
                      alert("information", "fail");
                      return;
                    }
                    // _accountName already saved
                    await appStore
                        .dispatch(DoCreateAddressInfo(name: _accountName));
                    appStore.dispatch(
                        NavigateToAction(to: AppRoutes.createAccountConfirm));
                  } else {
                    setState(() {
                      _validate = true;
                    });
                  }
                },
              ),
            ],
          ),
          ThemeSpacingBox.spacing_l,
        ]));
  }

  Widget Body() {
    YolletState state = StoreProvider.of<AppState>(context).state.yolletState;
    // var tokenItem;
    // for(Map item in state.tokenList){
    //   if(item["id"]==state.createAccountTokenId){
    //     tokenItem = item;
    //   }
    // }
    return Container(
      color: ThemeColors.white,
      child: Form(
        key: _key,
        autovalidate: _validate,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 12.h,
            ),
            InputGroupSubject(text: "enter_account_name"),
            SizedBox(height: 16.h),
            CustomTextFieldWidget(
                labelText: "ex_account_name",
                onChanged: (s) => _accountName = s,
                validator: validateInput),
            // _customTextField(controller: _inputController,hintText:tokenItem["name"]),
          ],
        ),
      ),
    );
  }

  String? validateInput(String? value) {
    if (value != null && value.length < 1)
      return AppLocalizations.of(context)!.getString('enter_account_name');
    else
      return null;
  }
}

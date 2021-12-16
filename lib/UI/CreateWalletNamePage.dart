import 'package:flutter/material.dart';
import 'package:yollet/Mgr/Navigation/app_routes.dart';
import 'package:yollet/Mgr/redux/action.dart';
import 'package:yollet/Mgr/redux/state.dart';
import 'package:yollet/UI/template.dart';
import 'package:yollet/themeStyle.dart';

class CreateWalletNamePage extends StatefulWidget {
  @override
  _CreateWalletNamePageState createState() => _CreateWalletNamePageState();
}

class _CreateWalletNamePageState extends State<CreateWalletNamePage> {
  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultScrollBody(
        Body(context),
        appBarWidget: CustomAppBar(
          title: "add_payment_method",
        ),
        footerHeight: 72.h,
      ),
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
                    await appStore
                        .dispatch(SetWalletInfo(name: _name, colorIndex: index));
                    await appStore.dispatch(MakeWalletInfo());
                    appStore.dispatch(
                        NavigateToAction(to: AppRoutes.createWalletComplete));
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

  int index = 0;
  Color backgroundColor = ThemeColors.sub_color[0];
  String _name = "";
  Widget Body(context) {
    return Container(
      color: ThemeColors.white,
      child: Form(
        key: _key,
        autovalidate: _validate,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10.h,
            ),
            InputGroupSubject(text: "enter_wallet_name"),
            SizedBox(
              height: 16.h,
            ),
            CustomTextFieldWidget(
              hintText: "ex_my_wallet",
              onChanged: (s) => setState(() => _name = s),
                validator: validateInput
            ),
            // _customTextField(controller: _searchController,hintText:"Add payment address"),
            SizedBox(
              height: 36.h,
            ),
            InputGroupSubject(text: "select_wallet_color"),
            SizedBox(
              height: 16.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ColorCheckbox(
                    value: index == 0,
                    onChanged: (value) {
                      setState(() {
                        index = 0;
                        backgroundColor = ThemeColors.sub_color[0];
                      });
                    },
                    activeColor: ThemeColors.sub_color[0],
                    borderColor: ThemeColors.sub_color[0]),
                ColorCheckbox(
                    value: index == 1,
                    onChanged: (value) {
                      setState(() {
                        index = 1;
                        backgroundColor = ThemeColors.sub_color[1];
                      });
                    },
                    activeColor: ThemeColors.sub_color[1],
                    borderColor: ThemeColors.sub_color[1]),
                ColorCheckbox(
                    value: index == 2,
                    onChanged: (value) {
                      setState(() {
                        index = 2;
                        backgroundColor = ThemeColors.sub_color[2];
                      });
                    },
                    activeColor: ThemeColors.sub_color[2],
                    borderColor: ThemeColors.sub_color[2]),
                ColorCheckbox(
                    value: index == 3,
                    onChanged: (value) {
                      setState(() {
                        index = 3;
                        backgroundColor = ThemeColors.sub_color[3];
                      });
                    },
                    activeColor: ThemeColors.sub_color[3],
                    borderColor: ThemeColors.sub_color[3]),
                ColorCheckbox(
                    value: index == 4,
                    onChanged: (value) {
                      setState(() {
                        index = 4;
                        backgroundColor = ThemeColors.sub_color[4];
                      });
                    },
                    activeColor: ThemeColors.sub_color[4],
                    borderColor: ThemeColors.sub_color[4]),
              ],
            ),
            SizedBox(
              height: 36.h,
            ),
            SizedBox(
              height: 16.h,
            ),
            CardWidget(
              color: backgroundColor,
              balance: "0",
              currentTradePrice: 0,
              tokenName: "VIX",
              address: "VIXCO",
              onPayPress: () {
                // Navigator.pop(context);
              },
              onRewardPress: () {
                // Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
  String? validateInput(String? value) {
    if (value!=null && value.length < 1)
      return AppLocalizations.of(context)!.getString('enter_wallet_name');
    else
      return null;
  }
}

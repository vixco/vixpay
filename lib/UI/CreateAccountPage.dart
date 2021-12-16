
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:yollet/Data/Dataset/TokenInfo.dart';
import 'package:yollet/Mgr/Navigation/app_routes.dart';
import 'package:yollet/Mgr/redux/action.dart';
import 'package:yollet/Mgr/redux/state.dart';
import 'package:yollet/UI/template.dart';
import 'package:yollet/themeStyle.dart';


class CreateAccountPage  extends StatefulWidget {
  @override
  CreateAccountPageState createState() => CreateAccountPageState();
}

class CreateAccountPageState extends State<CreateAccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultScrollBody(Body(),appBarWidget: CustomAppBar(title: "create_account",)),
    );
  }
}

class Body extends StatefulWidget {
  String? value;
  Body({this.value});
  @override
  BodyState createState() => BodyState();
}

class BodyState extends State<Body> {
  // TextEditingController _searchController = TextEditingController();
   String _search="";

  @override
  void initState() {
    super.initState();
    // _searchController.text="";
    initData();
  }
  // @override
  // void dispose() {
  //   _searchController.dispose();
  //   super.dispose();
  // }
  //
  initData() async {
    await appStore.dispatch(GetTokenList());
  }

  List<Widget> getList()  {
    YolletState state = StoreProvider.of<AppState>(context).state.yolletState;
    List<Widget> list =[];
    for(TokenInfo info in state.tokenList){
      if(info.tokenName!.toLowerCase().contains(_search.toLowerCase())) {
        list.add(
          CoinListItemWidget(text: info.tokenName,
            textAbbreviation: info.tokenId,
            onPressed: () async {
              await appStore.dispatch(DoCreateAddressInfo(tokenId: info.tokenId));
              await appStore.dispatch(NavigateToAction(to: AppRoutes.createAccountName));
            },
            coinImage: CoinImageWidget(url: info.url,)
            ,),
        );
      }
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Container(color:ThemeColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 12.h,),
          InputGroupSubject(text: "select_a_coin"),
          SizedBox(height: 16.h,),
          CustomTextFieldWidget(labelText: "search_coin", onChanged: (s)=>setState(() { _search=s;   }),),
          // _customTextField(controller: _searchController,hintText:"Search coin"),
          // SizedBox(height: 24.h,),
          // InputGroupSubject(text: "suggested"),
          // SizedBox(height: 24.h,),
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: getList(),
          // ),
          SizedBox(height: 24,),
          InputGroupSubject(text: "all_coins"),
          SizedBox(height: 24,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: getList(),
          ),
        ],
      ),
    );
  }
}
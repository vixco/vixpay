
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:yollet/Data/Dataset/AddressInfo.dart';
import 'package:yollet/Data/Dataset/TokenInfo.dart';
import 'package:yollet/Mgr/Navigation/app_routes.dart';
import 'package:yollet/Mgr/redux/action.dart';
import 'package:yollet/Mgr/redux/state.dart';
import 'package:yollet/UI/template.dart';
import 'package:yollet/themeStyle.dart';


class AssignTokenPage  extends StatefulWidget {
  @override
  AssignTokenPageState createState() => AssignTokenPageState();
}

class AssignTokenPageState extends State<AssignTokenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultScrollBody(Body(),appBarWidget: CustomAppBar(title: "assign_token",),paddingLR: 0,),
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
  String _search="";
  List<String> assignTokenIdList=[];
  @override
  void initState() {
    super.initState();
    initData();
  }

  initData() async {
    //현재 address의 token list조회

    await appStore.dispatch(GetTokenList());
  }
  List<Widget> getAssignTokenList()  {
    YolletState state = StoreProvider.of<AppState>(context).state.yolletState;
    List<Widget> list =[];

    assignTokenIdList.clear();
    for (AddressInfo info in state.addressInfoList) {
      if(info.address==state.currentAccountAddress){
        if(info.tokenInfoList!=null) {
          for (TokenInfo info in info.tokenInfoList!) {
            assignTokenIdList.add(info.tokenId??"");
            if (info.tokenName!.toLowerCase().contains(_search.toLowerCase())) {
              list.add(
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child:CoinListItemWidget(text: info.tokenName,
                      textAbbreviation: info.tokenId,
                      coinImage: CoinImageWidget(url: info.url,)
                      ,),
                  )
              );
              list.add(
                Divider(height: 1.h, thickness: 1, color: ThemeColors.gray_100,),
              );
            }
          }
        }
      }
    }



    return list;
  }

  List<Widget> getList()  {
    YolletState state = StoreProvider.of<AppState>(context).state.yolletState;
    List<Widget> list =[];
    for(TokenInfo info in state.tokenList){
      if(assignTokenIdList.contains(info.tokenId)){
        continue;
      }

      if(info.tokenName!.toLowerCase().contains(_search.toLowerCase())) {
        list.add(
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: CoinListItemWidget(
                text: info.tokenName,
                textAbbreviation: info.tokenId,
                onPressed: () async {
                  await appStore.dispatch(AssignTokenInfo(tokenId: info.tokenId??"" ,isNew: assignTokenIdList.isEmpty));
                  await appStore.dispatch(NavigateToAction(to: AppRoutes.assignTokenConfirm));
                },
                coinImage: CoinImageWidget(url: info.url,)
                ,),
            )
        );
        list.add(
          Divider(height: 1.h, thickness: 1, color: ThemeColors.gray_100,),
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
          Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 12.h,),
                    InputGroupSubject(text: "select_a_coin"),
                    SizedBox(height: 16.h,),
                    // CustomTextFieldWidget(labelText: "search_coin", onChanged: (s)=>setState(() { _search=s;   }),),
                    Container(
                      // width:276.w,
                      height: 58.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.w),
                        ),
                        color: ThemeColors.gray_100,
                      ),
                      padding: EdgeInsets.all(0.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 12.w,
                          ),
                          InkWell(
                            onTap: () async {

                            },
                            child: Container(
                              width: 30.w, height: 28.h,
                              child: Icon(
                                YolletIcons.search,
                                color: ThemeColors.gray_300,
                                size: 18.r,
                              ),
                            ),
                          ),
                          Container(
                            width: 270.w,
                            child: CustomTextFieldWidget(
                                hintText: "search_coin",
                                onChanged: (s) => setState(() => _search = s),
                                isTransparent: true,),
                          ),
                          // SizedBox(width: 6.w,),
                        ],
                      ),
                    ),
                    SizedBox(height: 24,),
                    InputGroupSubject(text: "assigned_token_list"),
                    SizedBox(height: 20,),
                  ])
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: getAssignTokenList(),
          ),
          Divider(height: 1.h, thickness: 1.h, color: ThemeColors.gray_200,),
          Divider(height: 12.h, thickness: 12.h, color: ThemeColors.gray_100,),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 24,),
                    InputGroupSubject(text: "addable_token_list"),
                    SizedBox(height: 20,),
                  ])
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: getList(),
          ),
        ],
      ),
    );
  }
}
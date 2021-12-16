import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:yollet/Mgr/Navigation/app_routes.dart';
import 'package:yollet/Mgr/redux/action.dart';
import 'package:yollet/Mgr/redux/state.dart';
import 'package:yollet/UI/template.dart';
import 'package:yollet/Util/Common/Common.dart';
import 'package:yollet/Util/Format/NumberFormatUtil.dart';
import 'package:yollet/Util/Format/date_format_base.dart';
import 'package:yollet/themeStyle.dart';
import 'package:collection/collection.dart';

class CreateAccountEthMnemonicQuizPage extends StatefulWidget {
  BuildContext context;

  CreateAccountEthMnemonicQuizPage({required this.context});
  @override
  _CreateAccountEthMnemonicQuizPageState createState() =>
      _CreateAccountEthMnemonicQuizPageState();
}

class _CreateAccountEthMnemonicQuizPageState
    extends State<CreateAccountEthMnemonicQuizPage> {
  // List<String> selectedMnemList = [];
  Map<int,String> selectedMnemMap = Map();
  // int isCurrent = 0;
  List<String> mnemList = [];
  List<String> mnemListCopy = [];

  List<Widget> widgets = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }
  void init(){
    YolletState state =
        StoreProvider.of<AppState>(widget.context).state.yolletState;
    setState(() {
      mnemListCopy = state.ethereumMnemonic.split(' ');
      mnemList = state.ethereumMnemonic.split(' ');
      selectedMnemMap =Map();
      // isCurrent = 0;
      mnemListCopy.shuffle();
      drawList();
      // for (int i = 0; i < mnemList.length / 2; i++) {
      //   // print(selectedMnemList);
      //   widgets.add(
      //     Row(
      //       children: [
      //         SizedText(
      //           width: 20.w,
      //           text: (i + 1).toString(),
      //           textStyle: ThemeTextStyles
      //               .CustomTableNumberCreateAccountConfirmMnemonic,
      //         ),
      //         SizedBox(width: 4.w),
      //         isCurrent == i
      //             ? Container(
      //           width: 80.w,
      //           height: 18.h,
      //           color: ThemeColors.cyan_400,
      //         )
      //             : Container(
      //             width: 80.w, height: 18.h, color: ThemeColors.gray_200),
      //       ],
      //     ),
      //   );
      // }
      // for (int i = (mnemList.length / 2).toInt(); i < mnemList.length; i++) {
      //   // print(selectedMnemList);
      //   widgets.add(
      //     Row(
      //       children: [
      //         SizedText(
      //           width: 20.w,
      //           height: 18.h,
      //           text: (i + 1).toString(),
      //           textStyle: ThemeTextStyles
      //               .CustomTableNumberCreateAccountConfirmMnemonic,
      //         ),
      //         SizedBox(width: 4.w),
      //         isCurrent == i
      //             ? Container(
      //           width: 80.w,
      //           height: 18.h,
      //           color: ThemeColors.cyan_400,
      //         )
      //             : Container(
      //             width: 80.w, height: 18.h, color: ThemeColors.gray_200),
      //       ],
      //     ),
      //   );
      // }
    });
  }
  insertData(String key){
    for(int i=0; i< mnemList.length; i++) {
      if(!selectedMnemMap.containsKey(i)){
        selectedMnemMap[i]=key;
        break;
      }
    }
  }
  void canceladder(int i) async {
    setState(() {
      mnemListCopy.add(selectedMnemMap[i]??"");
      selectedMnemMap.remove(i);
      drawList();
    });
  }
  void removerAndAdder(int i) async {
    setState(() {
      insertData(mnemListCopy[i]);
      // selectedMnemList.add(mnemListCopy[i]);
      mnemListCopy.remove(mnemListCopy[i]);
      drawList();

    });
  }

  drawList(){
    widgets.clear();
    for(int i=0; i< mnemList.length; i++) {
      Widget _widget;
      if(selectedMnemMap.containsKey(i)){
        _widget = Row(
          children: [
            SizedText(
              width: 20.w,
              text: (i + 1).toString(),
              textStyle:
              ThemeTextStyles.CustomTableNumberCreateAccountConfirmMnemonic,
            ),
            SizedBox(width: 4.w),
            InkWell(
              onTap: (){
                canceladder(i);
              },
              child: SizedText(
                  width: 80.w,
                  height: 18.h,
                  text: selectedMnemMap[i],
                  textStyle:
                  ThemeTextStyles.CustomTableTextCreateAccountConfirmMnemonic
                      .apply(color: (mnemList[i]==selectedMnemMap[i])
                      ?ThemeColors.gray_700
                      :ThemeColors.error
                  ),
                  disableLocalizations:true
              ),
            )
          ],
        );
      }else{
        _widget = Row(
          children: [
            SizedText(
              width: 20.w,
              height: 18.h,
              text: (i + 1).toString(),
              textStyle: ThemeTextStyles
                  .CustomTableNumberCreateAccountConfirmMnemonic,
            ),
            SizedBox(width: 4.w),
            Container(
              width: 80.w,
              height: 18.h,
              color: ThemeColors.cyan_400,
            ),
          ],
        );
      }
      widgets.add(_widget);
      // widgets[i] = _widget;
    }
  }

  @override
  Widget build(BuildContext context) {


    return WillPopScope(
        onWillPop: () async {
          await appStore.dispatch(NavigateToAction(to: 'up'));
          return Future.value(false);
        },
        child: StoreConnector<AppState, YolletState>(
            converter: (store) => store.state.yolletState,
            builder: (_, YolletState state) => Scaffold(
              body: DefaultBody(
                Body(
                  selectedMnemMap: selectedMnemMap,
                  // isCurrent: isCurrent,
                  onTap: removerAndAdder,
                  mnemList: mnemList,
                  mnemListCopy: mnemListCopy,
                  widgets: widgets,
                ),
                appBarWidget: CustomAppBar(
                  title: "vixco_seed_phrase_history",
                  style: ThemeTextStyles
                      .AppbarTitleCreateAccountConfirmMnemonic,
                  showBackIcon: false,
                ),
                appBarSubWidget: _AppBarSubWidget(
                  "choose_each_word",
                ),
              ),
              bottomSheet: Footer(
                  ethMnem: state.ethereumMnemonic.split(' '),
                  selectedMnemMap: selectedMnemMap,
                  mnemList: mnemList,
                  invalidSortingFunction:()=>init()
              ),
            )));
  }

  Widget _AppBarSubWidget(String message) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          SizedText(
            text: message,
            textStyle:
            ThemeTextStyles.AppbarSubTitleCreateAccountConfirmMnemonic,
            alignment: Alignment.center,
          ),
          SizedBox(
            height: 36.h,
          ),
        ],
      ),
    );
  }
}

class Footer extends StatelessWidget {
  Map<int,String> selectedMnemMap;
  List<String> ethMnem;
  List<String> mnemList;
  Function invalidSortingFunction;

  Footer(
      {required this.selectedMnemMap,
        required this.mnemList,
        required this.ethMnem,
        required this.invalidSortingFunction,
      });
  @override
  Widget build(BuildContext context) {
    // print(selectedMnemList);
    // List<String> selectedMnemList=List.filled(mnemList.length, "",growable: true);
    // selectedMnemMap.entries.forEach((e) => selectedMnemList.insert(e.key, e.value));

    List<String> selectedMnemList= List<String>.generate(mnemList.length, (idx) {
      if(selectedMnemMap.containsKey(idx)){
        return selectedMnemMap[idx]!;
      }else {
        return "";
      }
    }).toList();

    print(mnemList);
    return Container(
        height: 72.h,
        color: ThemeColors.white,
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BottomButton(
                text: "backup_complete",
                onPressed: selectedMnemMap.length == mnemList.length
                    ? () async {
                  Function eq = const ListEquality().equals;
                  if (eq(selectedMnemList, ethMnem)) {
                    appStore.dispatch(NavigateToAction(
                        to: AppRoutes
                            .createAccountEthMnemonicQuizConfirmPage,
                        replace: true));
                  } else {
                    actionDialog(text: 'invalid_sorting',                               actions: <Widget>[
                      TextButton(
                        child:AutoSizeText(AppLocalizations.of(context)!.getString('ok')),
                        onPressed: () {
                          appStore.dispatch(DismissPopupAction());
                          // invalidSortingFunction();
                        },
                      ),
                    ]);
                  }
                }
                    : null,
                // onPressed: () {
                //   appStore.dispatch(NavigateToAction(
                //       to: AppRoutes.createAccountEthMnemonicQuizConfirmPage,
                //       replace: false));
                // },
              )
            ],
          ),
        ]));
  }
}

class Body extends StatefulWidget {
  Map<int,String> selectedMnemMap;
  List<String> mnemListCopy;
  List<String> mnemList;
  // int isCurrent;
  Function onTap;
  List<Widget> widgets;

  Body({
    required this.selectedMnemMap,
    // required this.isCurrent,
    required this.mnemList,
    required this.mnemListCopy,
    required this.onTap,
    required this.widgets,
  });
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
    // Widget CustomTableIsQuiz(
    //     int isCurrent, List<String> mnemList, List<String> selectedMnemList) {
    //   return Container(
    //     color: ThemeColors.emerald_50.withOpacity(0.5),
    //     padding: EdgeInsets.symmetric(vertical: 15.h),
    //     height: 256.h,
    //     child: Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceAround,
    //       children: [
    //         Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: widget.widgets,
    //         ),
    //         // Column(
    //         //   crossAxisAlignment: CrossAxisAlignment.start,
    //         //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         //   children: _row2isQuiz(),
    //         // ),
    //       ],
    //     ),
    //   );
    // }

    Widget QuizTable(Map<int,String> selectedMnemMap) {
      List<Widget> SelectMnemButton(
          // int isCurrent,
          List<String> mnemListCopy, Function onTap) {
        List<Widget> widget = [];

        for (int i = 0; i < mnemListCopy.length; i++) {
          widget.add(InkWell(
            onTap: () {
              onTap(i);
            },
            borderRadius: BorderRadius.circular(16.r),
            child: FittedBox(
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 16.h),
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.w,
                      color: ThemeColors.cyan_400,
                    ),
                    borderRadius: BorderRadius.circular(16.r)),
                child: SizedText(
                  height: 18.h,
                  alignment: Alignment.center,
                  text: mnemListCopy[i],
                  textStyle: ThemeTextStyles.cardBalance
                      .apply(color: ThemeColors.cyan_500),
                  disableLocalizations: true,
                ),
              ),
            ),
          ));
        }
        return widget;
      }

      return Wrap(
        runSpacing: 8.w,
        spacing: 8.w,
        direction: Axis.horizontal,
        children: SelectMnemButton(
            // widget.isCurrent,
            widget.mnemListCopy, widget.onTap),
      );
    }

    List<Widget> row1 = [];
    for (int i = 0; i < widget.widgets.length / 2; i++) {
      row1.add(widget.widgets[i]);
    }
    List<Widget> row2 = [];
    for (int i = (widget.widgets.length / 2).toInt();    i < widget.widgets.length;    i++) {
      row2.add(widget.widgets[i]);
    }

    return Column(
      children: [
        Container(
          color: ThemeColors.emerald_50.withOpacity(0.5),
          padding: EdgeInsets.symmetric(vertical: 15.h),
          height: 256.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: row1,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: row2,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 24.h,
        ),
        Container(
            height: 152.h,
            child: SingleChildScrollView(
                child: QuizTable(widget.selectedMnemMap))),
      ],
    );
  }
}

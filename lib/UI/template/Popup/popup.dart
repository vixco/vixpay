import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yollet/Mgr/redux/action.dart';
import 'package:yollet/Mgr/redux/state.dart';
import 'package:yollet/UI/template.dart';
import 'package:yollet/Util/localization/localizations.dart';

Future<void>? popup(String text) async {
  return actionDialog(title: "information",text: text);
}

//Ok btn
Future<void>? alert(String title, String? text) {
  return actionDialog(title: title,text: text);
}

//Ok btn
Future<T>? alertCallback<T>(String title, String? text, {VoidCallback? callback,bool dismissAll = true}) {
  return actionDialog(title: title,text: text,callback: callback,dismissAll:dismissAll);
}

Future<T>? actionDialog<T>({String? title, String? text, AutoSizeText? customText, List<Widget>? actions,
  WillPopCallback? onWillPop,VoidCallback? callback,bool dismissAll = true,bool disableCloseButton=false}) {
  return appStore.dispatch(ShowPopupAction<T>(builder: (BuildContext context)
  {
    if(actions==null){
      actions = <Widget>[
        TextButton(
          child:AutoSizeText(AppLocalizations.of(context)!.getString("cancel"),style: ThemeTextStyles.PopupButton,),
          onPressed: () {
            onWillPop!=null?onWillPop():appStore.dispatch(DismissPopupAction(result:null));
          },
        ),
        TextButton(
          child:AutoSizeText(AppLocalizations.of(context)!.getString("ok"),style: ThemeTextStyles.PopupButton,),
          onPressed: () {
            if (callback != null) {
              callback();
            } else {
              appStore.dispatch(DismissPopupAction(result: null));
            }
          },
        ),
      ];
    }
    if(actions!.length==1){
      Widget action1 = actions![0];
      if(actions![0] is MaterialButton){
        MaterialButton btn= actions![0] as MaterialButton;
        action1 = BtnFillPopup(child: btn.child!,
          onPressed: btn.onPressed,);
      }
      actions!.clear();
      // actions.add(SizedBox(width: ThemeSizeStyle.popupButtonWidthSingle.w,child:action1));
      actions!.add(action1);
    }else if(actions!.length==2){
      Widget action1 = actions![0];
      if(actions![0] is MaterialButton){
        MaterialButton btn= actions![0] as MaterialButton;
        action1 = BtnFillPopup(child: btn.child!,
          onPressed: btn.onPressed,
        backgroundColor: ThemeColors.gray_400,);
      }
      Widget action2 = actions![1];
      if(actions![1] is MaterialButton){
        MaterialButton btn= actions![1] as MaterialButton;
        action2 = BtnFillPopup(child: btn.child!,
          onPressed: btn.onPressed,);
      }
      actions!.clear();
      // actions.add(SizedBox(width: ThemeSizeStyle.popupButtonWidthDouble.w,child:action1));//-9
      // actions.add(SizedBox(width: ThemeSizeStyle.popupButtonWidthDoubleSpace.w,));
      // actions.add(SizedBox(width: ThemeSizeStyle.popupButtonWidthDouble.w,child:action2));//9
      actions!.add(action1);
      actions!.add(action2);
    }

    return WillPopScope(
      onWillPop: onWillPop,
      child: Dialog(
        insetPadding: EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
//              side: BorderSide(color: Colors.transparent, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(16.w))),
        elevation:0,
        backgroundColor:Color(0x80000000),
        child:
        Container(width: ThemeSizeStyle.popupWidth.w,
//          height: 320,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
                Radius.circular(16.w)
            ),
            color: ThemeColors.white,
          ),
          child:
          Container(
              padding: EdgeInsets.symmetric(
                  // horizontal: 24.w,
                  vertical: 20.h),
              child:SizedBox(width: ThemeSizeStyle.popupInnerWidth.w,
                child:
                Stack(
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Visibility(
                            visible:(title!=null && title.isNotEmpty),
                            child:                             Container(
                                width: 264.w,
                                padding: EdgeInsets.symmetric(horizontal: 24.w,),
                                decoration: BoxDecoration(
                                  color: ThemeColors.white,
                                ),
                                child:Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  AutoSizeText( AppLocalizations.of(context)!.getString(title), style: ThemeTextStyles.AppbarTitle, ),
                                  SizedBox(height: 16.h,),
                                  ThemeValue.isTablet
                                      ?Divider(height: 2.h,thickness: 1.h,color: ThemeColors.brownish_grey_shadow,)
                                      :SizedBox(height: 0,),
                                  ThemeValue.isTablet
                                      ?SizedBox(height: 24.h,)
                                      :SizedBox(height: 0,),
                                  ])
                          )
                          ),
                          Container(
                            width: 264.w,
                            padding: EdgeInsets.symmetric(horizontal: 24.w,),
                            decoration: BoxDecoration(
                              color: ThemeColors.white,
                            ),
                            // padding: EdgeInsets.all(12.w),
                            // child:ConstrainedBox(
                            //   constraints: BoxConstraints(minHeight: 113.0.h,maxWidth: 264.w),
                            //   child:AutoSizeText( AppLocalizations.of(context)!.getString(text)!, style: ThemeTextStyles.InputText, ),
                            // ),
                            child: customText ?? AutoSizeText( AppLocalizations.of(context)!.getString(text), style: ThemeTextStyles.InputText,),
                          ),
                          SizedBox(height: 16.h,),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 16.w,),
                            child: SafeArea(
                              top: false,
                              child: ButtonBar(
                                buttonHeight: 18.h,
                                children: actions!,
                              ),
                            ),
                          ),
                          // SizedBox(height: 20.h,),
                        ],
                      ),
                      (actions!.length>=2 || disableCloseButton)
                          ?SizedBox(width: 0,height: 0,)
                          :Positioned(
                          top: 0,
                          right: 24.w,
                          child:IconButton(
                              iconSize: 29.0.w,
                              padding: EdgeInsets.all(0.0),
                              alignment:Alignment.topRight,
                              icon: Icon(YoshopIcons.y0407_close, color: ThemeColors.black,size: 29.w,),
                              onPressed: () {
                                onWillPop!=null?onWillPop():appStore.dispatch(DismissPopupAction(result:false));
                              }))
                    ]),
              )
          ),
        ),
      ),
    );
  }
  ,dismissAll: dismissAll));
}

Future<void>? progressDialog() {
  return appStore.dispatch(ShowPopupAction<void>(builder: (BuildContext context) {
    return new Stack(
      children: [
        Center(
          child: CircularProgressIndicator(),
        ),
      ],
    );
  }));
}


Future<String?> asyncInputDialog({
  String? title,
  String? text, //context
  String? hint,//input
  String? initialString = "",//input
  TextInputType keyboardType = TextInputType.text,//input
  bool obscureText = false,//input
  // List<TextInputFormatter> inputFormatter,//input
  WillPopCallback? onWillPop,
  List<Widget>? actions,
  bool barrierDismissible=true,
  bool dismissAll = true,
  VoidCallback? callback}) async {
  String inputResult = '';
  // TextEditingController _controller;
  // _controller = new TextEditingController(text: initialString);
  return appStore.dispatch(ShowPopupAction<String>(
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        if(actions==null){
          actions = <Widget>[
            TextButton(
              child:AutoSizeText(AppLocalizations.of(context)!.getString("cancel"),style: ThemeTextStyles.PopupButton,),
              onPressed: () {
                onWillPop!=null?onWillPop():appStore.dispatch(DismissPopupAction(result:null));
              },
            ),
            TextButton(
              child:AutoSizeText(AppLocalizations.of(context)!.getString("ok"),style: ThemeTextStyles.PopupButton,),
              onPressed: () {
                if (callback != null) {
                  callback();
                } else {
                  appStore.dispatch(DismissPopupAction(result: inputResult));
                }
              },
            ),
          ];
        }

        if(actions!.length==1){
          Widget action1 = actions![0];
          if(actions![0] is MaterialButton){
            MaterialButton btn= actions![0] as MaterialButton;
            action1 = TextButton(child: btn.child!,
              onPressed: btn.onPressed,);
          }
          actions!.clear();
          // actions.add(SizedBox(width: ThemeSizeStyle.popupButtonWidthSingle,child:action1));
          actions!.add(action1);

        }else if(actions!.length==2){
          Widget action1 = actions![0];
          if(actions![0] is MaterialButton){
            MaterialButton btn= actions![0] as MaterialButton;
            action1 = TextButton(child: btn.child!,
              onPressed: btn.onPressed,);
          }
          Widget action2 = actions![1];
          if(actions![1] is MaterialButton){
            MaterialButton btn= actions![1] as MaterialButton;
            action2 = TextButton(child: btn.child!,
              onPressed: btn.onPressed,);
          }
          actions!.clear();
          // actions.add(SizedBox(width: ThemeSizeStyle.popupButtonWidthDouble.w,child:action1));//-9
          // actions.add(SizedBox(width: ThemeSizeStyle.popupButtonWidthDoubleSpace.w,));
          // actions.add(SizedBox(width: ThemeSizeStyle.popupButtonWidthDouble.w,child:action2));//9
          actions!.add(action1);
          actions!.add(action2);
        }

        return WillPopScope(
          onWillPop: onWillPop,
          child: Dialog(
            insetPadding: EdgeInsets.all(0),
            shape: RoundedRectangleBorder(
//              side: BorderSide(color: Colors.transparent, width: 1),
                borderRadius: BorderRadius.all(Radius.circular(16.w))),
            elevation:0,
            backgroundColor:Color(0x80000000),
            child:
            Container(width: ThemeSizeStyle.popupWidth.w,
//          height: 320,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                    Radius.circular(16.w)
                ),
                color: ThemeColors.white,
              ),
              child: DefaultBody(
                SizedBox(width: ThemeSizeStyle.popupInnerWidth.w,
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Stack(
                          children: <Widget>[
                            SizedText(width:ThemeSizeStyle.popupInnerWidth.w, height: 21.h,text: AppLocalizations.of(context)!.getString(title), textStyle:ThemeTextStyles.AppbarTitle,),
                            (actions!.length>=2)
                                ?Container()
                                :Positioned(
                                top: 0,
                                right: 0,
                                child:IconButton(
                                    iconSize: 21.0.w,
                                    padding: EdgeInsets.all(0.0),
                                    alignment:Alignment.topRight,
                                    icon: Icon(YoshopIcons.y0407_close, color: ThemeColors.black,size: 21.w,),
                                    onPressed: () {
                                      onWillPop!=null?onWillPop():appStore.dispatch(DismissPopupAction(result:false));
                                    }))
                          ]),
                      SizedBox(height: 16,),
                      Container(
                        width:MediaQuery.of(context).size.width,
                        // height: 48,
                        decoration: BoxDecoration(
                          borderRadius : BorderRadius.all(Radius.circular(15.w),),
                          color : ThemeColors.gray_100,
                        ),
                        child:Center(
                            child:CustomTextFieldWidget(hintText: hint,onChanged: (s)=>inputResult=s,isTransparent: true,initText:initialString ,
                              keyboardType: keyboardType,isPassword: obscureText,)
                        ),
                      ),
                      SizedBox(height: 16.h,),
                      Container(
                        child: SafeArea(
                          top: false,
                          child: ButtonBar(
                            buttonHeight: 18.h,
                            children: actions!,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h,),
                    ],
                  )
                  ,),
              ),),
          ),
        );
      },dismissAll: dismissAll));
}
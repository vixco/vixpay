import 'dart:async';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:yollet/Mgr/Navigation/app_routes.dart';
import 'package:yollet/Mgr/redux/action.dart';
import 'package:yollet/Mgr/redux/state.dart';
import 'package:yollet/UI/AccountInfoPage.dart';
import 'package:yollet/UI/AccountTransferPage.dart';
import 'package:yollet/UI/MainPage.dart';
import 'package:yollet/UI/template.dart';
import 'package:yollet/UI/template/RadioList.dart';
import 'package:yollet/UI/template/button/CustomSwitch.dart';
import 'package:yollet/Util/Common/Common.dart';
import 'package:yollet/UI/template/Popup/PopupContent.dart';
import 'package:yollet/UI/template/Popup/PopupLayout.dart';
import 'package:yollet/Util/Format/NumberFormatUtil.dart';

class BottomButton extends StatefulWidget {
  final String? text;
  TextStyle? style;
  final double? width;
  double? height;
  final GestureTapCallback? onPressed;
  double? horizontalPadding;

  BottomButton(
      {this.width,
      this.height,
      this.onPressed,
      this.text,
      this.style,
      this.horizontalPadding}) {
    this.style ??= ThemeTextStyles.BottomButton;
    this.height ??= 48.h;
    this.horizontalPadding ??= 24.w;
  }

  @override
  BottomButtonState createState() => BottomButtonState();
}

class BottomButtonState extends State<BottomButton> {
  static final Color defaultTextColor = ThemeColors.white;
  static final Color defaultBackgroundColor = ThemeColors.theme_400;
  Color? textColor;
  Color? backgroundColor;

  @override
  void initState() {
    super.initState();
    setDefaultColor();
  }

  setDefaultColor() {
    textColor = defaultTextColor;
    backgroundColor = defaultBackgroundColor;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          setDefaultColor();
          if (widget.onPressed != null) {
            widget.onPressed!();
          }
        });
      },
      onTapCancel: () {
        setState(() {
          setDefaultColor();
        });
      },
      onTapDown: (_) {
        setState(() {
          // textColor = ThemeColors.gray_400;
          // backgroundColor = ThemeColors.gray_200;
        });
      },
      child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: widget.horizontalPadding!),
          child: Container(
              // width: widget.width,
              height: widget.height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.w)),
                boxShadow: (widget.onPressed != null)
                    ? ThemeBoxShadow.bottomButton
                    : null,
                color: (widget.onPressed != null)
                    ? backgroundColor
                    : ThemeColors.gray_400,
              ),
              child: Container(
                  color: Colors.transparent,
                  padding: const EdgeInsets.only(
                    left: 24,
                    right: 24,
                  ),
                  child: Center(
                      child: AutoSizeText(
                    AppLocalizations.of(context)!.getString(widget.text),
                    style: widget.style!.apply(color: textColor),
                  ))))),
    );
  }
}

class BtnBorder extends StatefulWidget {
  final String? text;
  TextStyle? style;
  double? width;
  double? height;
  final GestureTapCallback? onPressed;

  BtnBorder({this.width, this.height, this.onPressed, this.text, this.style}) {
    this.style ??=
        ThemeTextStyles.BottomButton.apply(color: ThemeColors.theme_400);
    this.width ??= 96.w;
    this.height ??= 32.h;
  }

  @override
  BtnBorderState createState() => BtnBorderState();
}

class BtnBorderState extends State<BtnBorder> {
  static final Color defaultBorderColor = ThemeColors.theme_400;
  static final Color defaultBackgroundColor = Colors.transparent;
  Color? borderColor;
  Color? backgroundColor;

  @override
  void initState() {
    super.initState();
    setDefaultColor();
  }

  setDefaultColor() {
    borderColor = defaultBorderColor;
    backgroundColor = defaultBackgroundColor;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          setDefaultColor();
          if (widget.onPressed != null) {
            widget.onPressed!();
          }
        });
      },
      onTapCancel: () {
        setState(() {
          setDefaultColor();
        });
      },
      onTapDown: (_) {
        setState(() {
          borderColor = ThemeColors.theme_400;
          backgroundColor = ThemeColors.white;
        });
      },
      child: Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.w)),
            border: Border.all(color: borderColor!, width: 1.w),
            color: backgroundColor,
          ),
          child: Container(
//              color: backgroundColor,
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Center(
                  child: AutoSizeText(
                AppLocalizations.of(context)!.getString(widget.text),
                style: widget.style!.apply(color: borderColor),
              )))),
    );
  }
}

class BtnFill extends StatefulWidget {
  final String? text;
  TextStyle? style;
  double? width;
  double? height;
  final GestureTapCallback? onPressed;

  BtnFill({this.width, this.height, this.onPressed, this.text, this.style}) {
    this.style ??= ThemeTextStyles.BottomButton;
    this.width ??= 96.w;
    this.height ??= 32.h;
  }

  @override
  BtnFillState createState() => BtnFillState();
}

class BtnFillState extends State<BtnFill> {
  static final Color defaultTextColor = ThemeColors.white;
  static final Color defaultBackgroundColor = ThemeColors.theme_400;
  Color? textColor;
  Color? backgroundColor;

  @override
  void initState() {
    super.initState();
    setDefaultColor();
  }

  setDefaultColor() {
    textColor = defaultTextColor;
    backgroundColor = defaultBackgroundColor;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          setState(() {
            setDefaultColor();
            if (widget.onPressed != null) {
              widget.onPressed!();
            }
          });
        },
        onTapCancel: () {
          setState(() {
            setDefaultColor();
          });
        },
        onTapDown: (_) {
          setState(() {
            // textColor = ThemeColors.gray_400;
            // backgroundColor = ThemeColors.gray_200;
          });
        },
        child: Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.w)),
//            border: Border.all(
//              color: borderColor,
//              width: 2
//            ),
//               boxShadow: [
//                 BoxShadow(color: const Color(0x3d000000), offset: Offset(0, 2), blurRadius: 2, spreadRadius: 0)
//               ],
              color: backgroundColor,
            ),
            child: Container(
                color: Colors.transparent,
                padding: const EdgeInsets.only(
                  left: 24,
                  right: 24,
                ),
                child: Center(
                    child: AutoSizeText(
                  AppLocalizations.of(context)!.getString(widget.text),
                  style: widget.style!.apply(color: textColor),
                )))));
  }
}

class BtnFillPopup extends StatefulWidget {
  Widget? child;
  double? width;
  double? height;
  Color? backgroundColor;
  final GestureTapCallback? onPressed;

  BtnFillPopup(
      {this.width,
      this.height,
      this.onPressed,
      this.backgroundColor,
      this.child}) {
    this.width ??= 128.w;
    this.height ??= 48.h;
    this.backgroundColor ??= ThemeColors.theme_400;
  }

  @override
  BtnFillPopupState createState() => BtnFillPopupState();
}

class BtnFillPopupState extends State<BtnFillPopup> {
  @override
  Widget build(BuildContext context) {
    return Theme(
        data: Theme.of(context).copyWith(
          textTheme: TextTheme(button: ThemeTextStyles.BottomButton).apply(
            displayColor: ThemeColors.white,
            bodyColor: ThemeColors.white,
          ),
          // buttonTheme:ButtonThemeData(textTheme: )
          //
          // ButtonThemeData.textTheme
        ),
        child: InkWell(
            onTap: () {
              setState(() {
                if (widget.onPressed != null) {
                  widget.onPressed!();
                }
              });
            },
            child: Container(
                width: widget.width,
                height: widget.height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.w)),
                  color: widget.backgroundColor,
                ),
                child: Center(
                  child: widget.child,
                ))));
  }
}

class BtnCard extends StatefulWidget {
  final String? text;
  TextStyle? style;
  double? width;
  double? height;
  final GestureTapCallback? onPressed;
  final IconData icon;
  final Color backgroundColor;
  final Color textColor;

  BtnCard(
      {this.width,
      this.height,
      this.onPressed,
      this.text,
      this.style,
      this.icon = Icons.perm_scan_wifi,
      this.backgroundColor = const Color.fromRGBO(255, 255, 255, 0.25),
      this.textColor = ThemeColors.white}) {
    this.style ??= ThemeTextStyles.BottomButton.apply(fontFamily: 'SpoqaBold');
    this.width ??= 132.w;
    this.height ??= 48.h;
  }

  @override
  BtnCardState createState() => BtnCardState();
}

class BtnCardState extends State<BtnCard> {
  // static final Color defaultTextColor = ThemeColors.white;
  // static final Color defaultBackgroundColor = Color.fromRGBO(255, 255, 255, 0.25);
  Color? textColor;
  Color? backgroundColor;

  @override
  void initState() {
    super.initState();
    setDefaultColor();
  }

  setDefaultColor() {
    textColor = widget.textColor;
    backgroundColor = widget.backgroundColor;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          setState(() {
            setDefaultColor();
            if (widget.onPressed != null) {
              widget.onPressed!();
            }
          });
        },
        onTapCancel: () {
          setState(() {
            setDefaultColor();
          });
        },
        onTapDown: (_) {
          setState(() {
            // textColor = ThemeColors.gray_400;
            // backgroundColor = ThemeColors.gray_200;
          });
        },
        child: Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.w)),
//            border: Border.all(
//              color: borderColor,
//              width: 2
//            ),
//               boxShadow: [
//                 BoxShadow(color: const Color(0x3d000000), offset: Offset(0, 2), blurRadius: 2, spreadRadius: 0)
//               ],
              color: backgroundColor,
            ),
            child: Container(
                color: Colors.transparent,
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                ),
                child: Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      widget.icon,
                      color: textColor,
                      size: 20.w,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    // SizedText(
                    //   //left_pad+icon+space+right_pad
                    //   width: ((widget.width??MediaQuery.of(context).size.width)-16.w- 20.w-10.w-16.w),
                    //   text:AppLocalizations.of(context)!.getString(widget.text),
                    //   textStyle: widget.style!.apply(color: textColor),
                    //   alignment: Alignment.center,
                    //   maxLines: 2,
                    // )
                    Text(
                      AppLocalizations.of(context)!.getString(widget.text),
                      style: widget.style!.apply(color: textColor),
                    )
                  ],
                )))));
  }
}

class BtnCardDropdown extends StatefulWidget {
  final String? text;
  final Widget? child;
  TextStyle? style;
  double? width;
  double? height;
  final GestureTapCallback? onPressed;
  final IconData? icon;
  final Widget? iconWidget;
  final Color backgroundColor;
  final Color textColor;

  BtnCardDropdown(
      {this.width,
      this.height,
      this.onPressed,
      this.text,
      this.child,
      this.style,
      this.icon = Icons.perm_scan_wifi,
      this.iconWidget,
      this.backgroundColor = const Color.fromRGBO(255, 255, 255, 0.25),
      this.textColor = ThemeColors.white}) {
    this.style ??= ThemeTextStyles.BottomButton;
    this.width ??= 150.w;
    this.height ??= 48.h;
  }

  @override
  BtnCardDropdownState createState() => BtnCardDropdownState();
}

class BtnCardDropdownState extends State<BtnCardDropdown> {
  // static final Color defaultTextColor = ThemeColors.white;
  // static final Color defaultBackgroundColor = Color.fromRGBO(255, 255, 255, 0.25);
  Color? textColor;
  Color? backgroundColor;

  @override
  void initState() {
    super.initState();
    setDefaultColor();
  }

  setDefaultColor() {
    textColor = widget.textColor;
    backgroundColor = widget.backgroundColor;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          setState(() {
            setDefaultColor();
            if (widget.onPressed != null) {
              widget.onPressed!();
            }
          });
        },
        onTapCancel: () {
          setState(() {
            setDefaultColor();
          });
        },
        onTapDown: (_) {
          setState(() {
            // textColor = ThemeColors.gray_400;
            // backgroundColor = ThemeColors.gray_200;
          });
        },
        child: Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15.w)),
//            border: Border.all(
//              color: borderColor,
//              width: 2
//            ),
//               boxShadow: [
//                 BoxShadow(color: const Color(0x3d000000), offset: Offset(0, 2), blurRadius: 2, spreadRadius: 0)
//               ],
              color: backgroundColor,
            ),
            child: Container(
              color: Colors.transparent,
              padding: EdgeInsets.symmetric(
                horizontal: 12.w,
              ),
              child: widget.child == null
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              widget.iconWidget == null
                                  ? Icon(
                                      widget.icon,
                                      color: ThemeColors.gray_300,
                                      size: 20.w,
                                    )
                                  : widget.iconWidget!,
                              SizedBox(
                                width: 8.w,
                              ),
                              SizedText(
                                width: 75.w,
                                text: widget.text!,
                                textStyle:
                                    widget.style!.apply(color: textColor),
                                maxLines: 1,
                              )
                            ],
                          ),
                          // Icon(
                          //   Icons.arrow_drop_down,
                          //   color: ThemeColors.gray_500,
                          //   size: 24.w,
                          // )
                          Icon(
                            YolletIcons.arrow_down,
                            size: 8.w,
                            color: ThemeColors.gray_500,
                          ),
                        ])
                  : Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      widget.iconWidget == null
                          ? Icon(
                              widget.icon,
                              color: ThemeColors.gray_300,
                              size: 20.w,
                            )
                          : widget.iconWidget!,
                      SizedBox(
                        width: 8.w,
                      ),
                      Container(width: 95.w, child: widget.child),
                    ]),
            )));
  }
}

class CustomDrpDownButton extends StatefulWidget {
  final String? labelText;
  String? hintText;
  final String? initText;
  final bool isPassword;
  final bool isTransparent;
  final ValueChanged<String?>? onChanged;
  final TextInputType keyboardType;
  final FormFieldValidator<String>? validator;
  final bool readOnly;
  final List<String> itemsList;

  // String value;

  CustomDrpDownButton({
    Key? key,
    this.labelText,
    this.hintText,
    this.initText = "",
    this.isPassword = false,
    this.isTransparent = false,
    this.onChanged,
    this.validator,
    this.readOnly = false,
    this.keyboardType = TextInputType.text,
    this.itemsList = const [''],
  }) : super(key: key);

  @override
  _CustomDrpDownButtonState createState() => _CustomDrpDownButtonState();
}

class _CustomDrpDownButtonState extends State<CustomDrpDownButton> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      icon: Icon(
        YolletIcons.down,
        color: ThemeColors.gray_300,
      ),
      value: (widget.itemsList.isEmpty) ? "" : widget.itemsList[0],
      iconSize: 16.h,
      validator: widget.validator,
      style: ThemeTextStyles.InputHint,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 15.h),
        labelText: AppLocalizations.of(context)!.getString(widget.labelText),
        labelStyle: ThemeTextStyles.InputText.apply(
          color: widget.isTransparent
              ? ThemeColors.transparent
              : ThemeColors.gray_500,
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0.w)),
            borderSide: BorderSide(
              color: widget.isTransparent
                  ? ThemeColors.transparent
                  : ThemeColors.gray_200,
            )),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0.w)),
          borderSide: BorderSide(
              color: widget.isTransparent
                  ? ThemeColors.transparent
                  : ThemeColors.theme_400),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0.w)),
          borderSide: BorderSide(
              color: widget.isTransparent
                  ? ThemeColors.transparent
                  : ThemeColors.gray_200),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0.w)),
          borderSide: BorderSide(
              color: widget.isTransparent
                  ? ThemeColors.transparent
                  : ThemeColors.error),
        ),
      ),
      onChanged: widget.onChanged,
      items: widget.itemsList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: SizedText(
            //TODO needs localization to be added
            text: value,
            textStyle: ThemeTextStyles.CustomDrpDownButtonItem,
          ),
        );
      }).toList(),
    );
  }
}

class BtnBorderQRCode extends StatefulWidget {
  final String? text;
  TextStyle? style;
  double? width;
  double? height;
  final GestureTapCallback? onPressed;
  final IconData icon;

  BtnBorderQRCode(
      {this.width,
      this.height,
      this.onPressed,
      this.text,
      this.style,
      this.icon = YolletIcons.qr}) {
    this.style ??=
        ThemeTextStyles.BottomButton.apply(color: ThemeColors.theme_500);
    this.width ??= 128.w;
    this.height ??= 40.h;
  }

  @override
  BtnBorderQRCodeState createState() => BtnBorderQRCodeState();
}

class BtnBorderQRCodeState extends State<BtnBorderQRCode> {
  static final Color defaultBorderColor = ThemeColors.theme_400;
  static final Color defaultBackgroundColor = Colors.transparent;
  late Color borderColor;
  Color? backgroundColor;

  @override
  void initState() {
    super.initState();
    setDefaultColor();
  }

  setDefaultColor() {
    borderColor = defaultBorderColor;
    backgroundColor = defaultBackgroundColor;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          setDefaultColor();
          if (widget.onPressed != null) {
            widget.onPressed!();
          }
        });
      },
      onTapCancel: () {
        setState(() {
          setDefaultColor();
        });
      },
      onTapDown: (_) {
        setState(() {
          borderColor = ThemeColors.theme_400;
          backgroundColor = ThemeColors.white;
        });
      },
      child: Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.w)),
            border: Border.all(color: borderColor, width: 2.w),
            color: backgroundColor,
          ),
          child: Container(
//              color: backgroundColor,
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    widget.icon,
                    color: ThemeColors.theme_500,
                    size: 24.w,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  AutoSizeText(
                    AppLocalizations.of(context)!.getString(widget.text),
                    style: widget.style,
                  )
                ],
              )))),
    );
  }
}

class SizedText extends StatelessWidget {
  final double? width;
  final double? height;
  final AlignmentGeometry alignment;
  final String? text;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final bool disableLocalizations;

  SizedText({
    this.width,
    this.height,
    this.alignment = Alignment.centerLeft,
    this.text,
    this.textStyle,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.disableLocalizations = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        height: height,
        child: Align(
            alignment: alignment,
            child: AutoSizeText(
              disableLocalizations
                  ? text!
                  : AppLocalizations.of(context)!.getString(text),
              style: textStyle,
              textAlign: textAlign,
              maxLines: maxLines,
              overflow: overflow,
            )));
  }
}

class CustomAppBar extends StatelessWidget {
  final String title;
  TextStyle? style;
  final double? width;
  double? height;
  final GestureTapCallback? onPressed;
  final Color backIconColor;
  final Color backgroundColor;
  final Color iconBorderColor;
  final Widget? titleIcon;
  final bool showBackIcon;
  final String actionText;
  final GestureTapCallback? onActionTap;

  CustomAppBar(
      {this.title = "",
      this.style,
      this.width,
      this.height,
      this.onPressed,
      this.backIconColor = ThemeColors.black,
      this.backgroundColor = ThemeColors.white,
      this.iconBorderColor = ThemeColors.gray_200,
      this.titleIcon,
      this.showBackIcon = true,
      this.actionText = "",
      this.onActionTap}) {
    style ??= ThemeTextStyles.AppbarTitle;
    this.height ??= 88.h;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        color: backgroundColor,
        child: Stack(children: [
          showBackIcon
              ? Positioned(
                  child: Container(
                      width: height, // not width
                      height: height,
                      padding: EdgeInsets.symmetric(
                          horizontal: 18.w, vertical: 22.h),
                      child: Container(
                        // decoration: BoxDecoration(
                        //   shape: BoxShape.circle,
                        //   border: Border.all(
                        //       color: iconBorderColor,
                        //       width: 1
                        //   ),
                        //   color: backgroundColor,
                        // ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15.w)),
                          color: backgroundColor,
                          border: Border.all(
                            color: iconBorderColor,
                            width: 1.w,
                          ),
                        ),
                      )),
                  left: 0,
                  top: 0,
                )
              : Container(),
          showBackIcon
              ? Positioned(
                  child: Container(
                      width: height, // not width
                      height: height,
                      child: Center(
                          child: IconButton(
                              icon: Icon(
                                Icons.chevron_left_rounded,
                                color: backIconColor,
                                size: 24.w,
                              ),
                              onPressed: () {
                                if (onPressed == null) {
                                  appStore.dispatch(NavigateToAction(to: 'up'));
                                } else {
                                  onPressed!();
                                }
                              }))),
                  left: 0,
                  top: 0,
                )
              : Container(),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                (titleIcon != null)
                    ? Container(
                        padding: EdgeInsets.only(right: 12.w),
                        child: titleIcon,
                      )
                    : Container(),
                AutoSizeText(
                  AppLocalizations.of(context)!.getString(title),
                  style: style,
                ),
              ],
            ),
          ),
          actionText.isNotEmpty
              ? Positioned(
                  child: InkWell(
                      onTap: onActionTap,
                      child: Container(
                          width: height, // not width
                          height: height,
                          child: Center(
                              child: SizedText(
                                  text: actionText,
                                  textStyle: ThemeTextStyles.AppbarActionText,
                                  alignment: Alignment.centerRight)))),
                  right: 24.w,
                  top: 24.h,
                  bottom: 24.h,
                )
              : Container(),
        ]));
  }
}

class MainPageAppBar extends StatelessWidget {
  final bool isVisibleLogo;
  final String? title;
  final double? width;
  double? height;
  final Color backgroundColor;
  final Color iconBorderColor;

  MainPageAppBar({
    this.width,
    this.height,
    this.backgroundColor = ThemeColors.white,
    this.iconBorderColor = ThemeColors.gray_200,
    this.isVisibleLogo = true,
    this.title,
  }) {
    this.height ??= 88.h;
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, YolletState>(
      converter: (store) => store.state.yolletState,
      builder: (_, YolletState state) => Container(
          width: width,
          height: height,
          color: backgroundColor,
          child: Stack(children: [
            isVisibleLogo
                ? Positioned(
                    child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 0,
                        ),
                        child: Row(
                          children: [
                            Image(
                                width: 40.w,
                                height: 40.h,
                                fit: BoxFit.contain,
                                image:
                                    AssetImage('assets/img/logo_small_o.png')),
                            // SizedBox(width: 6.w,),
                            // SizedText(height : 27.w,text:"Yollet",textStyle: ThemeTextStyles.mainAppBarAppName,)
                          ],
                        )),
                    left: 24.w,
                    top: 24.h,
                  )
                : Container(),
            Center(
              child: AutoSizeText(
                AppLocalizations.of(context)!.getString(title),
                style: ThemeTextStyles.AppbarTitle,
              ),
            ),
            Positioned(
              child: InkWell(
                  onTap: () {
                    appStore
                        .dispatch(NavigateToAction(to: AppRoutes.notification));
                  },
                  child: Container(
                      width: 40.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15.w)),
                        border:
                            Border.all(color: ThemeColors.gray_200, width: 1),
                        // color : Color.fromRGBO(248, 249, 250, 1),
                      ),
                      child: Stack(children: [
                        Center(
                          child: Icon(
                            Icons.notifications_none,
                            size: 24,
                            color: ThemeColors.black,
                          ),
                        ),
                        state.hasUnreadNotification
                            ? Positioned(
                                child: Icon(
                                  Icons.circle,
                                  size: 6,
                                  color: ThemeColors.notiPoint,
                                ),
                                right: 7.w,
                                top: 6.h)
                            : Container(),
                      ]))),
              right: 24.w,
              top: 24.h,
              bottom: 24.h,
            ),
          ])),
    );
  }
}

class WalletPageAppBar extends StatelessWidget {
  final bool isVisibleLogo;
  final String? title;
  final double? width;
  double? height;
  final Color backgroundColor;
  final Color iconBorderColor;
  final double? statusBarHeight;

  WalletPageAppBar({
    this.width,
    this.height,
    this.backgroundColor = ThemeColors.white,
    this.iconBorderColor = ThemeColors.gray_200,
    this.isVisibleLogo = true,
    this.title,
    this.statusBarHeight,
  }) {
    this.height ??= 88.h;
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, YolletState>(
      converter: (store) => store.state.yolletState,
      builder: (_, YolletState state) => Container(
        width: width,
        height: height,
        color: backgroundColor,
        child: Stack(
          children: [
            isVisibleLogo
                ? Positioned(
                    child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 0,
                        ),
                        child: Row(
                          children: [
                            Image(
                                width: 40.w,
                                height: 40.h,
                                fit: BoxFit.contain,
                                image:
                                    AssetImage('assets/img/logo_small_o.png')),
                          ],
                        )),
                    left: 24.w,
                    top:
                        statusBarHeight != 0.0 ? statusBarHeight! - 24.h : 24.h,
                  )
                : Container(),
            Center(
              child: AutoSizeText(
                AppLocalizations.of(context)!.getString(title),
                style: ThemeTextStyles.AppbarTitle,
              ),
            ),
            Positioned(
              child: InkWell(
                  onTap: () {
                    appStore
                        .dispatch(NavigateToAction(to: AppRoutes.notification));
                  },
                  child: Container(
                      width: 40.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15.w)),
                        border:
                            Border.all(color: ThemeColors.gray_200, width: 1),
                        // color : Color.fromRGBO(248, 249, 250, 1),
                      ),
                      child: Stack(children: [
                        Center(
                          child: Icon(
                            Icons.notifications_none_rounded,
                            size: 24,
                            color: ThemeColors.black,
                          ),
                        ),
                        state.hasUnreadNotification
                            ? Positioned(
                                child: Icon(
                                  Icons.circle,
                                  size: 6,
                                  color: ThemeColors.notiPoint,
                                ),
                                right: 7.w,
                                top: 6.h)
                            : Container(),
                      ]))),
              right: 24.w,
              top: statusBarHeight != 0.0 ? statusBarHeight! - 24.h : 24.h,
              bottom: 24.h,
            ),
          ],
        ),
      ),
    );
  }
}

class DefaultBody extends StatelessWidget {
  final Widget? appBarWidget;
  final Widget appBarSubWidget;
  final Widget bodyWidget;
  double? paddingTop;
  double? paddingLR;

  DefaultBody(this.bodyWidget,
      {this.paddingTop,
      this.paddingLR,
      this.appBarWidget,
      this.appBarSubWidget = const SizedBox(
        width: 0,
        height: 0,
      )}) {
    this.paddingTop ??= ThemeSizeStyle.paddingBodyTop.h;
    this.paddingLR ??= ThemeSizeStyle.paddingBodySide.w;
  }

  @override
  Widget build(BuildContext context) {
    if (appBarWidget != null) {
      return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            appBarWidget!,
            appBarSubWidget,
            Padding(
              padding: EdgeInsets.only(
                  left: paddingLR!,
                  right: paddingLR!,
                  top: paddingTop!,
                  bottom: 0),
              child: bodyWidget,
            )
          ]);
    } else {
      return Padding(
        padding: EdgeInsets.only(
            left: paddingLR!, right: paddingLR!, top: paddingTop!, bottom: 0),
        child: bodyWidget,
      );
    }
  }
}

class DefaultScrollBody extends StatelessWidget {
  final Widget? appBarWidget;
  final Widget? appBarSubWidget;
  final Widget? bodyWidget;
  double? paddingTop;
  double? paddingLR;
  final double footerHeight;

  DefaultScrollBody(this.bodyWidget,
      {this.paddingTop,
      this.paddingLR,
      this.appBarWidget,
      this.appBarSubWidget,
      this.footerHeight = 0}) {
    this.paddingTop ??= ThemeSizeStyle.paddingBodyTop.h;
    this.paddingLR ??= ThemeSizeStyle.paddingBodySide.w;
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    if (appBarWidget != null) {
      height -= 88.h;
    }
    if (appBarSubWidget != null) {
      height -= 169.h;
    }
    height -= footerHeight;
    height -= 1.h;
    // height = ScreenUtil().setHeight(height);
    if (appBarWidget != null) {
      return Container(
          height: MediaQuery.of(context).size.height - footerHeight,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  height: 88.h,
                  child: appBarWidget!,
                ),
                appBarSubWidget ??
                    const SizedBox(
                      width: 0,
                      height: 0,
                    ),
                // SizedBox(
                // height: height,
                Expanded(
                    child: SingleChildScrollView(
                  padding: EdgeInsets.only(
                      left: paddingLR!,
                      right: paddingLR!,
                      top: paddingTop!,
                      bottom: 0),
                  child: bodyWidget,
                ))
              ]));
    } else {
      return Container(
          height: height,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
                left: paddingLR!,
                right: paddingLR!,
                top: paddingTop!,
                bottom: 0),
            child: bodyWidget,
          ));
    }
  }
}

class BottomNavigationBarWidget extends StatefulWidget {
  final int currentIndex;

  const BottomNavigationBarWidget({Key? key, this.currentIndex = 0})
      : super(key: key);

  @override
  _BottomNavigationBarWidgetState createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  /// Set a type current number a layout class
  void callPage(int current) {
    switch (current) {
      case 0:
        appStore.dispatch(NavigateToAction(to: AppRoutes.home));
        break;
      case 1:
        // case 2:
        appStore.dispatch(NavigateToAction(to: AppRoutes.wallet));
        break;
      // appStore.dispatch(NavigateToAction(to: AppRoutes.transfer));
      // break;
      case 2:
        appStore.dispatch(NavigateToAction(to: AppRoutes.setting));
        break;
      default:
        break;
    }
  }

  /// Build BottomNavigationBar Widget
  @override
  Widget build(BuildContext context) {
    return Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.white,
        ),
        child: SizedBox(
            height: kBottomNavigationBarHeight.h,
            child: BottomNavigationBar(
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              currentIndex: widget.currentIndex,
              fixedColor: ThemeColors.theme_500,
              unselectedItemColor: ThemeColors.gray_300,
              onTap: (value) {
                callPage(value);
              },
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedFontSize: 1.0,
              unselectedFontSize: 1.0,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(
                      YolletIcons.home,
                      size: 24.0.r,
                    ),
                    label: ""),
                BottomNavigationBarItem(
                    icon: Icon(
                      YolletIcons.wallet,
                      size: 24.0.r,
                    ),
                    label: ""),
                // BottomNavigationBarItem(
                //     icon: Icon(
                //       YolletIcons.shop,
                //       size: 24.0.r,
                //     ),
                //     label: ""),
                BottomNavigationBarItem(
                    icon: Icon(
                      YolletIcons.more,
                      size: 24.0.r,
                    ),
                    label: ""),
              ],
            )));
  }
}

class KeyPadNumButton extends StatefulWidget {
  final String? text;
  TextStyle? style;
  double? width;
  double? height;
  final GestureTapCallback? onPressed;

  KeyPadNumButton(
      {this.width, this.height, this.onPressed, this.text, this.style}) {
    style ??= ThemeTextStyles.KeypadNum;
    this.width ??= 102.w;
    this.height ??= 56.h;
  }

  @override
  KeyPadNumButtonState createState() => KeyPadNumButtonState();
}

class KeyPadNumButtonState extends State<KeyPadNumButton> {
  static final Color defaultTextColor = ThemeColors.black;
  static final Color defaultBackgroundColor = Colors.white;
  Color? textColor;
  Color? backgroundColor;

  @override
  void initState() {
    super.initState();
    setDefaultColor();
  }

  setDefaultColor() {
    textColor = defaultTextColor;
    backgroundColor = defaultBackgroundColor;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          setState(() {
            setDefaultColor();
            if (widget.onPressed != null) {
              widget.onPressed!();
            }
          });
        },
        onTapCancel: () {
          setState(() {
            setDefaultColor();
          });
        },
        onTapDown: (_) {
          if (widget.text!.isNotEmpty)
            setState(() {
              textColor = ThemeColors.theme_400;
              backgroundColor = ThemeColors.theme_50;
            });
        },
        child: Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              // border: Border.all(
              //     color: borderColor,
              //     width: 1
              // ),
              color: backgroundColor,
            ),
            child: Container(
                color: Colors.transparent,
                padding: const EdgeInsets.only(
                  left: 24,
                  right: 24,
                ),
                child: Center(
                    child: AutoSizeText(
                  AppLocalizations.of(context)!.getString(widget.text),
                  style: widget.style!.apply(color: textColor),
                )))));
  }
}

class KeyPadBackButton extends StatefulWidget {
  TextStyle? style;
  double? width;
  double? height;
  final GestureTapCallback? onPressed;

  KeyPadBackButton({this.width, this.height, this.onPressed, this.style}) {
    style ??= ThemeTextStyles.KeypadNum;
    this.width ??= 102.w;
    this.height ??= 64.h;
  }

  @override
  KeyPadBackButtonState createState() => KeyPadBackButtonState();
}

class KeyPadBackButtonState extends State<KeyPadBackButton> {
  static final Color defaultTextColor = ThemeColors.black;
  static final Color defaultBackgroundColor = Colors.white;
  Color? textColor;
  Color? backgroundColor;

  @override
  void initState() {
    super.initState();
    setDefaultColor();
  }

  setDefaultColor() {
    textColor = defaultTextColor;
    backgroundColor = defaultBackgroundColor;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          setState(() {
            setDefaultColor();
            if (widget.onPressed != null) {
              widget.onPressed!();
            }
          });
        },
        onTapCancel: () {
          setState(() {
            setDefaultColor();
          });
        },
        onTapDown: (_) {
          setState(() {
            textColor = ThemeColors.theme_400;
            backgroundColor = ThemeColors.theme_50;
          });
        },
        child: Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              // border: Border.all(
              //     color: borderColor,
              //     width: 1
              // ),
              color: backgroundColor,
            ),
            child: Container(
                color: Colors.transparent,
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Center(
                    child: Icon(
                  YolletIcons.delete,
                  color: textColor,
                  size: 28,
                )))));
  }
}

typedef StringCallback = void Function(String? text);

class KeypadBody extends StatefulWidget {
  final bool showDecimalPoint;
  final int maxInputLength;
  final StringCallback? onValue;
  String inputText;
  final int decimalPointLength;

  KeypadBody(
      {this.showDecimalPoint = false,
      this.onValue,
      this.maxInputLength = 6,
      this.inputText = "",
      this.decimalPointLength = 2});

  @override
  KeypadBodyState createState() => KeypadBodyState();
}

class KeypadBodyState extends State<KeypadBody> {
  final String DECIMAL_POINT = ".";

  // @override
  // void initState() {
  //   super.initState();
  //   // inputText=widget.inputText;
  //   // displayNumber();
  // }
  displayNumber({String? input = ""}) async {
    if (widget.onValue != null) {
      widget.onValue!(input);
    }
  }

  setNumber({String? add, bool clear = false}) {
    if (clear) {
      if (widget.inputText.length <= 1) {
        if (widget.showDecimalPoint) {
          widget.inputText = "0";
        } else {
          widget.inputText = "";
        }
      } else {
        widget.inputText =
            widget.inputText.substring(0, widget.inputText.length - 1);
      }
    } else {
      if (widget.inputText.length >= widget.maxInputLength) {
        return;
      } else {
        if (widget.showDecimalPoint) {
          if (widget.inputText.length == 0 && add == DECIMAL_POINT) {
            return;
          }
          if (widget.inputText.contains(DECIMAL_POINT) &&
              add == DECIMAL_POINT) {
            return;
          }
          if (widget.inputText.length == 1 &&
              widget.inputText == "0" &&
              add != DECIMAL_POINT) {
            widget.inputText = add!;
          } else if (widget.inputText.contains(DECIMAL_POINT)) {
            List<String> split = widget.inputText.split(DECIMAL_POINT);
            if (split.length == 2 &&
                split[1].length < widget.decimalPointLength) {
              widget.inputText += add!;
            }
          } else {
            widget.inputText += add!;
          }
        } else {
          widget.inputText += add!;
        }
      }
    }
    displayNumber(input: widget.inputText);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 360.w,
        height: 224.h,
        child: WidgetListViewVerticalBuilder(
                columnCnt: 3,
                hSpace: 20.h,
                // vSpace: ThemeSizeStyle.spacing_l,
                children: getKeypadTable())
            .build());
  }

  List<Widget> getKeypadTable() {
    List<Widget> list = [
      KeyPadNumButton(
        text: '1',
        onPressed: () {
          setNumber(add: "1");
        },
      ),
      KeyPadNumButton(
        text: '2',
        onPressed: () {
          setNumber(add: "2");
        },
      ),
      KeyPadNumButton(
        text: '3',
        onPressed: () {
          setNumber(add: "3");
        },
      ),
      KeyPadNumButton(
        text: '4',
        onPressed: () {
          setNumber(add: "4");
        },
      ),
      KeyPadNumButton(
        text: '5',
        onPressed: () {
          setNumber(add: "5");
        },
      ),
      KeyPadNumButton(
        text: '6',
        onPressed: () {
          setNumber(add: "6");
        },
      ),
      KeyPadNumButton(
        text: '7',
        onPressed: () {
          setNumber(add: "7");
        },
      ),
      KeyPadNumButton(
        text: '8',
        onPressed: () {
          setNumber(add: "8");
        },
      ),
      KeyPadNumButton(
        text: '9',
        onPressed: () {
          setNumber(add: "9");
        },
      ),
      KeyPadNumButton(
        text: (widget.showDecimalPoint && widget.decimalPointLength > 0)
            ? '.'
            : '',
        onPressed: () {
          if (widget.showDecimalPoint && widget.decimalPointLength > 0) {
            setNumber(add: DECIMAL_POINT);
          }
        },
      ),
      KeyPadNumButton(
        text: '0',
        onPressed: () {
          setNumber(add: "0");
        },
      ),
      KeyPadBackButton(
        onPressed: () {
          //clear
          // inputText = "";
          setNumber(clear: true);
        },
      ),
    ];
    return list;
  }
}

class InputGroupSubject extends StatelessWidget {
  final String text;
  TextStyle? textStyle;
  final Color? textColor;
  final double marginLeft;
  final double marginRight;
  final double marginUnder;

  InputGroupSubject(
      {required this.text,
      this.textStyle,
      this.textColor,
      this.marginLeft = 0.0,
      this.marginRight = 0.0,
      this.marginUnder = 0.0}) {
    this.textStyle ??= ThemeTextStyles.InputGroupSubject;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if (textColor != null) textStyle = textStyle!.apply(color: textColor);

    return Padding(
        padding: EdgeInsets.only(
            top: 0,
            left: this.marginLeft,
            right: this.marginRight,
            bottom: this.marginUnder),
        child: Container(
            alignment: Alignment.centerLeft,
            child: Text(
              AppLocalizations.of(context)!.getString(text),
              style: textStyle,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ).build(context)));
  }
}

class MainSubject extends StatelessWidget {
  final String text;
  TextStyle? textStyle;
  final Color? textColor;
  final double marginLeft;
  final double marginRight;
  final double marginUnder;

  MainSubject(
      {required this.text,
      this.textStyle,
      this.textColor,
      this.marginLeft = 0.0,
      this.marginRight = 0.0,
      this.marginUnder = 0.0}) {
    this.textStyle ??= ThemeTextStyles.MainSubject;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if (textColor != null) textStyle = textStyle!.apply(color: textColor);

    return Padding(
        padding: EdgeInsets.only(
            top: 0,
            left: this.marginLeft,
            right: this.marginRight,
            bottom: this.marginUnder),
        child: Container(
            alignment: Alignment.centerLeft,
            child: Text(
              AppLocalizations.of(context)!.getString(text),
              style: textStyle,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ).build(context)));
  }
}

class CardWidget extends StatefulWidget {
  final Color color;
  final Widget? coinImage;
  final String? balance;
  final String? currencyBalance;
  final String? tokenName;
  final String? address;
  final num? currentTradePrice;
  final void Function()? onPayPress;
  final void Function()? onRewardPress;
  final bool isEmpty;
  final GestureTapCallback? onAddPress;
  final String? titleName;

  CardWidget(
      {required this.color,
      this.coinImage,
      this.balance,
      this.currencyBalance,
      this.tokenName,
      this.address,
      this.onPayPress,
      this.onRewardPress,
      this.isEmpty = false,
      this.onAddPress,
      this.titleName,
      this.currentTradePrice = 0.0});

  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
          width: 312.w,
          height: 214.h, // +height
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(24.w)),
            boxShadow: ThemeBoxShadow.shadow_lg,
            color: widget.isEmpty ? ThemeColors.transparent : widget.color,
          ),
          child: Stack(children: <Widget>[
            Positioned(
              top: -407.h,
              left: 0.w,
              child: Container(
                width: 698.w,
                height: 615.h,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 0,
                      left: 83.w,
                      child: Container(
                        width: 615.w,
                        height: 615.h,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 255, 255, 0.09),
                          borderRadius: BorderRadius.all(
                            Radius.elliptical(615, 615),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
                top: 48.h,
                left: 20.w,
                child: Container(
                    // width: 187,
                    width: 272.w,
                    // height: 88,
                    height: 168.h,
                    child: Column(
                      children: [
                        SizedText(
                          text: widget.address,
                          textStyle: ThemeTextStyles.cardCoinAddress,
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedText(
                              text: widget.balance,
                              textStyle: ThemeTextStyles.cardAmount,
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            SizedText(
                                height: 26.h,
                                text: widget.tokenName,
                                textStyle: ThemeTextStyles.cardCurrency,
                                textAlign: TextAlign.center),
                          ],
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Row(
                          children: [
                            SizedText(
                                //width: 36.w,
                                height: 23.h,
                                text: widget.currencyBalance,
                                textStyle:
                                    ThemeTextStyles.cardCurrentTradePrice.apply(
                                  color: ThemeColors.white,
                                ),
                                overflow: TextOverflow.ellipsis),
                            SizedBox(width: 4.w),
                            SizedText(
                                //width: 36.w,
                                height: 23.h,
                                text: "krw",
                                textStyle: ThemeTextStyles
                                    .cardCurrentTradeCurrency
                                    .apply(
                                  color: ThemeColors.white,
                                ),
                                overflow: TextOverflow.ellipsis),
                          ],
                        ),
                        SizedBox(
                          height: 18.h,
                        ),
                        Row(
                          children: [
                            BtnCard(
                              text: 'pay',
                              icon: YolletIcons.barcode,
                              onPressed: widget.onPayPress,
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            BtnCard(
                              text: 'reward',
                              icon: YolletIcons.coin,
                              onPressed: widget.onRewardPress,
                            ),
                          ],
                        ),
                      ],
                    ))),
            Positioned(
                top: 20.h,
                right: 20.w,
                child: Row(
                  children: [
                    SizedText(
                      height: 21.h,
                      text: widget.titleName ?? "balance",
                      textStyle: ThemeTextStyles.cardName,
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    Container(
                        width: 36.w,
                        height: 36.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ThemeColors.white,
                        ),
                        child: widget.coinImage),
                  ],
                )),
          ])),
      widget.isEmpty
          ? Positioned.fill(
              child: Opacity(
                  opacity: 0.4,
                  child: InkWell(
                    onTap: widget.onAddPress,
                    child: Container(
                      width: 312.w,
                      height: 208.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(24.w)),
                        boxShadow: ThemeBoxShadow.shadow_lg,
                        color: ThemeColors.gray_700,
                      ),
                      child: Center(
                          child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          DottedBorder(
                            borderType: BorderType.Oval,
                            color: ThemeColors.white,
                            strokeWidth: 1,
                            padding: const EdgeInsets.all(2),
                            dashPattern: const <double>[2, 2],
                            child: Container(
                              height: 64.h,
                              width: 64.w,
                              child: Icon(
                                YolletIcons.add,
                                size: 36.w,
                                color: ThemeColors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          SizedText(
                            text: "add_payment_method",
                            textStyle: ThemeTextStyles.cardAdd,
                            alignment: Alignment.center,
                          )
                        ],
                      )),
                    ),
                  )))
          : Container(
              height: 0,
              width: 0,
            ),
    ]);
  }
}

class CoinListItemWidget extends StatefulWidget {
  final String? text;
  final String? textAbbreviation;
  final Function? onPressed;
  final Color? color;
  final Widget? coinImage;

  CoinListItemWidget(
      {this.text,
      this.textAbbreviation,
      this.onPressed,
      this.color,
      this.coinImage});

  @override
  _CoinListItemWidgetState createState() => _CoinListItemWidgetState();
}

class _CoinListItemWidgetState extends State<CoinListItemWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          setState(() {
            if (widget.onPressed != null) {
              widget.onPressed!();
            }
          });
        },
        child: Container(
          padding: EdgeInsets.only(bottom: 40),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              widget.coinImage == null
                  ? Container(
                      width: 32.w,
                      height: 32.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(64.w)),
                        color: widget.color,
                        image: DecorationImage(
                            image: AssetImage('assets/img/logo_small_o.png'),
                            fit: BoxFit.fitWidth),
                      ))
                  : widget.coinImage!,
              SizedBox(width: 12.w),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  AutoSizeText(
                    AppLocalizations.of(context)!.getString(widget.text),
                    textAlign: TextAlign.left,
                    style: ThemeTextStyles.InputText,
                  ),
                  SizedBox(width: 8.w),
                  AutoSizeText(
                    AppLocalizations.of(context)!
                        .getString(widget.textAbbreviation),
                    textAlign: TextAlign.left,
                    style: ThemeTextStyles.CoinListItemTextAbbreviation,
                  ),
                ],
              )
            ],
          ),
        ));
  }
}

class ColorCheckbox extends StatefulWidget {
  bool value;
  final ValueChanged<bool>? onChanged;
  final Color activeColor;
  final Color checkColor;
  final Color borderColor;
  final Color disabledColor;
  double? size;
  double? buttonSize;
  final AlignmentGeometry buttonAlignment;

  ColorCheckbox({
    required this.value,
    required this.onChanged,
    this.activeColor = ThemeColors.tangerine,
    this.checkColor = ThemeColors.white,
    this.borderColor = ThemeColors.tangerine,
    this.disabledColor = ThemeColors.very_light_pink_box,
    this.size,
    this.buttonSize,
    this.buttonAlignment = Alignment.center,
  }) {
    this.size ??= 24.w;
    this.buttonSize ??= 40.w;
  }

  @override
  _ColorCheckboxState createState() => _ColorCheckboxState();
}

class _ColorCheckboxState extends State<ColorCheckbox> {
  @override
  Widget build(BuildContext context) {
    void Function() onTap = () {
      if (widget.onChanged != null) {
        widget.value = !widget.value;
        widget.onChanged!(widget.value);
      }
    };
    return InkWell(
        onTap: onTap,
        child: Container(
            width: widget.buttonSize,
            height: widget.buttonSize,
            child: Align(
              alignment: widget.buttonAlignment,
              child: getContent(),
            )));
  }

  Widget getContent() {
    if (widget.value) {
      return Container(
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: ThemeColors.white,
            border: Border.all(
              color: widget.onChanged != null
                  ? widget.activeColor
                  : widget.disabledColor,
              width: 2.5.w,
            ),
          ),
          child: Container(
            width: 28.w,
            height: 28.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: widget.onChanged != null
                  ? widget.activeColor
                  : widget.disabledColor,
              border: Border.all(
                color: ThemeColors.white,
                width: 2.5.w,
              ),
            ),
            child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Icon(
                  Icons.check,
                  size: widget.size! * 0.8,
                  color: widget.checkColor,
                )),
          ));
    } else {
      return Container(
        width: 32.w,
        height: 32.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: widget.borderColor,
          border: Border.all(
            color: widget.onChanged != null
                ? widget.borderColor
                : widget.disabledColor,
            width: 2.5.w,
          ),
        ),
      );
    }
  }
}

class CoinItemWidget extends StatefulWidget {
  final DecorationImage? image;
  final String? accountName;
  final String? coinName;
  final Widget? coinImage;

  CoinItemWidget(
      {Key? key, this.image, this.accountName, this.coinName, this.coinImage})
      : super(key: key);

  @override
  _CoinItemWidgetState createState() => _CoinItemWidgetState();
}

class _CoinItemWidgetState extends State<CoinItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          widget.coinImage == null
              ? Container(
                  width: 40.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(64.w)),
                    color: Color.fromRGBO(255, 148, 22, 1),
                    image: widget.image,
                  ))
              : widget.coinImage!,
          SizedBox(width: 12.w),
          Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AutoSizeText(
                  widget.accountName!,
                  textAlign: TextAlign.left,
                  style: ThemeTextStyles.CoinListItemText,
                ),
                SizedBox(height: 2.h),
                AutoSizeText(
                  widget.coinName!,
                  textAlign: TextAlign.left,
                  style: ThemeTextStyles.CoinItemCoinName,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AddressWidget extends StatefulWidget {
  final String? address;
  final Color backgroundColor;
  final Color iconBackgroundColor;
  final Color iconForegroundColor;
  bool isSuccessCopyOpen = false;

  AddressWidget(
      {this.address,
      this.backgroundColor = const Color.fromRGBO(0, 0, 0, 0.01),
      this.iconBackgroundColor = const Color.fromRGBO(228, 228, 231, 1),
      this.iconForegroundColor = Colors.black});

  @override
  _AddressWidgetState createState() => _AddressWidgetState();
}

class _AddressWidgetState extends State<AddressWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320.w,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 312.w,
            height: 76.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15.w)),
              color: widget.backgroundColor,
            ),
            padding: EdgeInsets.only(left: 20.w, right: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedText(
                  width: 240.w,
                  text: widget.address,
                  textStyle: ThemeTextStyles.coinAddress,
                ),
                Container(
                  width: 24.w,
                  height: 24.h,
                  decoration: BoxDecoration(
                    color: widget.iconBackgroundColor,
                    borderRadius: BorderRadius.all(Radius.elliptical(24, 24)),
                  ),
                  child: IconButton(
                    icon: Icon(
                      YolletIcons.copy,
                      color: widget.iconForegroundColor,
                    ),
                    iconSize: 20.w,
                    padding: EdgeInsets.all(0),
                    onPressed: () {
                      setState(() {
                        widget.isSuccessCopyOpen = true;
                      });
                      Clipboard.setData(ClipboardData(text: widget.address));
                    },
                  ),
                ),
              ],
            ),
          ),
          widget.backgroundColor == ThemeColors.theme_50
              ? CopiedAlert(
                  isSuccessCopyOpen: widget.isSuccessCopyOpen,
                )
              : CopiedAlert(
                  small: true,
                  isSuccessCopyOpen: widget.isSuccessCopyOpen,
                )
        ],
      ),
    );
  }
}

class CopiedAlert extends StatefulWidget {
  bool isSuccessCopyOpen;
  String? title;
  String? subtitle;
  bool? small;
  double? height;

  CopiedAlert(
      {required this.isSuccessCopyOpen,
      this.title,
      this.subtitle,
      this.small,
      this.height});

  @override
  _CopiedAlertState createState() => _CopiedAlertState();
}

class _CopiedAlertState extends State<CopiedAlert> {
  var timer;

  void timeFunc() {
    widget.isSuccessCopyOpen
        ? timer = Timer(Duration(seconds: 3), () {
            setState(() {
              widget.isSuccessCopyOpen = false;
            });
            print('----------------done----------------');
          })
        : timer;
  }

  @override
  Widget build(BuildContext context) {
    timeFunc();
    return Visibility(
      visible: widget.isSuccessCopyOpen,
      child: Positioned(
        top: widget.height != null ? 0.0 : 11.h,
        child: Container(
          width: widget.small == null ? 320.w : 310.w,
          height: widget.height ?? 65.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.r),
            boxShadow: ThemeBoxShadow.copiedAlert,
            color: ThemeColors.green_three,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                YolletIcons.success,
                size: 32.w,
              ),
              SizedBox(
                width: 12.w,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedText(
                    text: AppLocalizations.of(context)!
                        .getString(widget.title ?? 'copied'),
                    textStyle: ThemeTextStyles.WalletCopiedHeader,
                  ),
                  SizedBox(height: 2.h),
                  SizedText(
                    text: AppLocalizations.of(context)!.getString(
                        widget.subtitle ?? 'link_has_been_copied_to_clipboard'),
                    textStyle: ThemeTextStyles.WalletCopiedBody,
                  ),
                ],
              ),
              IconButton(
                alignment: Alignment.topRight,
                icon: Icon(
                  YolletIcons.close,
                  size: 16.w,
                ),
                onPressed: () {
                  setState(() {
                    widget.isSuccessCopyOpen = false;
                    timer.cancel();
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppbarSub extends StatelessWidget {
  final String? message;
  final Color? customColor;

  const AppbarSub({Key? key, this.message, this.customColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 169.h,
      color: customColor == null ? ThemeColors.theme_50 : customColor,
      child: Column(
        children: [
          SizedBox(
            height: 36.h,
          ),
          Container(
            width: 56.w,
            height: 56.h,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: ThemeColors.checkedCircle),
            child: Icon(
              YolletIcons.check,
              color: ThemeColors.checked,
              size: 32.w,
            ),
          ),
          // ThemeSpacingBox.spacing_l,
          SizedBox(
            height: 20.h,
          ),
          SizedText(
            text: message,
            textStyle: ThemeTextStyles.AppbarMessage,
            alignment: Alignment.center,
          ),
        ],
      ),
    );
  }
}

class SettingGroupWidget extends StatelessWidget {
  final String? text;

  const SettingGroupWidget({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        decoration: BoxDecoration(color: ThemeColors.gray_100),
        child: SizedText(
          height: 40.h,
          text: text,
          textStyle: ThemeTextStyles.SettingGroup,
        ));
  }
}

class SettingInfoWidget extends StatelessWidget {
  final String? text;
  final String? description;
  TextStyle? textStyle;
  TextStyle? descriptionTextStyle;
  final GestureTapCallback? onTap;

  SettingInfoWidget(
      {Key? key,
      this.text,
      this.description,
      this.textStyle,
      this.descriptionTextStyle,
      this.onTap})
      : super(key: key) {
    this.textStyle ??= ThemeTextStyles.SettingGroup;
    this.descriptionTextStyle ??= ThemeTextStyles.SettingAccount;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          decoration: BoxDecoration(
            border: Border(
              bottom: Divider.createBorderSide(context,
                  width: 1.0, color: ThemeColors.gray_100),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 21.h,
              ),
              SizedText(
                height: 18.h,
                text: text,
                textStyle: textStyle,
              ),
              (description != null)
                  ? SizedBox(
                      height: 8.h,
                    )
                  : Container(),
              (description != null)
                  ? SizedText(
                      height: 18.h,
                      text: description,
                      textStyle: descriptionTextStyle,
                    )
                  : Container(),
              SizedBox(
                height: 21.h,
              ),
            ],
          ),
        ));
  }
}

class SettingItemWidget extends StatelessWidget {
  final String? text;
  final String? description;
  TextStyle? textStyle;
  TextStyle? descriptionTextStyle;
  final GestureTapCallback? onTap;

  SettingItemWidget(
      {Key? key,
      this.text,
      this.description,
      this.textStyle,
      this.descriptionTextStyle,
      this.onTap})
      : super(key: key) {
    this.textStyle ??= ThemeTextStyles.SettingItem;
    this.descriptionTextStyle ??= ThemeTextStyles.SettingItemDesc;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: Divider.createBorderSide(context,
                    width: 1.0, color: ThemeColors.gray_100),
              ),
            ),
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 21.h,
                    ),
                    SizedText(
                      height: 18.h,
                      text: text,
                      textStyle: textStyle,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    (description != null)
                        ? SizedText(
                            height: 18.h,
                            text: description,
                            textStyle: descriptionTextStyle,
                          )
                        : Container(),
                    (description != null)
                        ? SizedBox(
                            height: 12.h,
                          )
                        : Container(),
                    SizedBox(
                      height: 9.h,
                    ),
                  ],
                ),
                Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: SizedBox(
                      width: 16.w,
                      height: 16.h,
                      child: Icon(
                        YolletIcons.right,
                        color: ThemeColors.gray_300,
                        size: 16.w,
                      ),
                    ))
              ],
            )));
  }
}

class DisplayPasswordWidget extends StatelessWidget {
  final int? inputCount;
  final int maxCount;
  final Function? inputDone;
  final int milliseconds;

  const DisplayPasswordWidget(
      {Key? key,
      this.inputCount,
      this.maxCount = 6,
      this.inputDone,
      this.milliseconds = 500})
      : super(key: key);

  startTime() async {
    var _duration = Duration(milliseconds: milliseconds);
    return Timer(_duration, moveNext);
  }

  Future<void> moveNext() async {
    if (inputDone != null) {
      inputDone!();
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> list = <Widget>[];
    for (int i = 0; i < maxCount; i++) {
      Widget w;
      if (i < inputCount!) {
        w = Container(
          width: 44.w,
          height: 48.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12.w)),
            color: Color.fromRGBO(248, 249, 250, 1),
          ),
          child: Icon(
            Icons.circle,
            size: 10,
            color: ThemeColors.gray_700,
          ),
        );
      } else {
        w = Container(
          width: 44.w,
          height: 48.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12.w)),
            color: Color.fromRGBO(248, 249, 250, 1),
          ),
          // child: Icon(Icons.circle, size: 10, color: ThemeColors.black,),
        );
      }
      list.add(w);
      if (i != maxCount - 1) {
        list.add(SizedBox(
          width: 9.w,
        ));
      }
    }

    if (inputCount == maxCount) {
      startTime();
    }

    return Container(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: list,
        ));
  }
}

class CoinImageWidget extends StatelessWidget {
  double? width;
  double? height;
  String? url;

  CoinImageWidget({Key? key, this.url = "", this.width, this.height})
      : super(key: key) {
    this.width ??= 32.w;
    this.height ??= 32.h;
  }

  @override
  Widget build(BuildContext context) {
    if (url == null || url!.isEmpty) {
      url = 'assets/img/vix.png';
    }
    if (url!.contains("http")) {
      return Container(
          width: width, height: height, child: Image.network(url!));
    } else {
      return Container(
          padding: EdgeInsets.all(7.w),
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(64.w),
            ),
            color: Color.fromRGBO(240, 240, 240, 1),
            // image : DecorationImage(
            //     image: AssetImage(url),
            //     fit: BoxFit.contain
            // ),
          ),
          child: Container(
              decoration: BoxDecoration(
            // borderRadius : BorderRadius.all(Radius.circular(64.w),),
            // color : Color.fromRGBO(240, 240, 240, 1),
            image:
                DecorationImage(image: AssetImage(url!), fit: BoxFit.contain),
          )));
    }
  }
}

class EmptyCoinImageWidget extends StatelessWidget {
  double? width;
  double? height;

  EmptyCoinImageWidget({Key? key, this.width, this.height}) : super(key: key) {
    this.width ??= 32.w;
    this.height ??= 32.h;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(7.w),
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(64.w),
          ),
          color: ThemeColors.gray_400,
          // image : DecorationImage(
          //     image: AssetImage(url),
          //     fit: BoxFit.contain
          // ),
        ),
        // child: Container(
        //   child: Icon(
        //     YolletIcons.wallet,
        //     size: 18.0.r,
        //   ),)
        child: Container(
            width: 17.h,
            height: 17.w,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/img/empty_wallet.png'),
                  fit: BoxFit.contain),
            )));
  }
}

class BottomPopupWidget extends StatefulWidget {
  final String? title;
  final String? qrText;
  final String? address;
  final String? coinUrl;
  final String? coinName;
  final double? ht;

  const BottomPopupWidget({
    Key? key,
    this.title,
    this.qrText,
    this.address,
    this.coinUrl,
    this.coinName,
    this.ht,
  }) : super(key: key);

  @override
  _BottomPopupWidgetState createState() => _BottomPopupWidgetState();
}

class _BottomPopupWidgetState extends State<BottomPopupWidget> {
  bool isLeftTopSelected = true;
  bool isRightTopSelected = false;
  bool isRightBottomSelected = false;
  bool isLeftBottomSelected = false;

  @override
  Widget build(BuildContext context) {
    return widget.ht == null
        ? Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: ThemeColors.transparent,
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 463.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16.w),
                            topRight: Radius.circular(16.w)),
                        color: ThemeColors.white),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            appStore.dispatch(DismissPopupAction());
                          },
                          child: Column(children: [
                            SizedBox(
                              height: 8.h,
                            ),
                            Container(
                              height: 20.h,
                              child: Center(
                                child: Container(
                                    width: 32.w,
                                    height: 4.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(100.w)),
                                      color: Color.fromRGBO(231, 231, 231, 1),
                                    )),
                              ),
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                          ]),
                        ),
                        SizedText(
                            height: 23.h,
                            text: widget.title,
                            textStyle: ThemeTextStyles.MainSubject.apply(
                                fontFamily: 'SpoqaBold'),
                            alignment: Alignment.center),
                        SizedBox(
                          height: 32.h,
                        ),
                        QrImage(
                          data: widget.qrText ?? widget.address!,
                          version: QrVersions.auto,
                          size: 184.0.w,
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            (widget.coinUrl != null)
                                ? CoinImageWidget(
                                    url: widget.coinUrl,
                                    width: 28.w,
                                    height: 28.h)
                                : Container(
                                    width: 28.w,
                                    height: 28.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(36.w)),
                                      color: Color.fromRGBO(255, 148, 22, 1),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/img/logo_small_o.png'),
                                          fit: BoxFit.fitWidth),
                                    )),
                            SizedText(
                              width: 12.w,
                            ),
                            AutoSizeText(
                              widget.coinName!,
                              textAlign: TextAlign.left,
                              style: ThemeTextStyles.CoinListItemText,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        AddressWidget(
                          address: widget.address,
                          backgroundColor: ThemeColors.theme_50,
                          iconBackgroundColor: ThemeColors.gray_200,
                          iconForegroundColor: ThemeColors.gray_400,
                        ),
                      ],
                    ))))
        : Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: ThemeColors.transparent,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: widget.ht!,
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.w),
                        topRight: Radius.circular(16.w)),
                    color: ThemeColors.white),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        appStore.dispatch(DismissPopupAction());
                      },
                      child: Column(
                        children: [
                          SizedBox(
                            height: 8.h,
                          ),
                          Container(
                            height: 20.h,
                            child: Center(
                              child: Container(
                                  width: 32.w,
                                  height: 4.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(100.w)),
                                    color: Color.fromRGBO(231, 231, 231, 1),
                                  )),
                            ),
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 72.h,
                      child: ToogleButtonFilterWidget(
                        month1: "This month",
                        month3: "3 months",
                        monthLast: "Last month",
                        custom: "Custom",
                        isLeftTopSelected: isLeftTopSelected,
                        isRightTopSelected: isRightTopSelected,
                        isRightBottomSelected: isRightBottomSelected,
                        isLeftBottomSelected: isLeftBottomSelected,
                        onMonth1Press: () {
                          setState(() {
                            isLeftTopSelected = true;
                            isRightTopSelected = false;
                            isRightBottomSelected = false;
                            isLeftBottomSelected = false;
                          });
                        },
                        onMonth3Press: () {
                          setState(() {
                            isLeftTopSelected = false;
                            isRightTopSelected = true;
                            isRightBottomSelected = false;
                            isLeftBottomSelected = false;
                          });
                        },
                        onMonthLastPress: () {
                          setState(() {
                            isLeftTopSelected = false;
                            isRightTopSelected = false;
                            isRightBottomSelected = false;
                            isLeftBottomSelected = true;
                          });
                        },
                        onCustomPress: () {
                          setState(() {
                            isLeftTopSelected = false;
                            isRightTopSelected = false;
                            isRightBottomSelected = true;
                            isLeftBottomSelected = false;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}

class CustomTextFieldWidget extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final String? initText;
  final bool isPassword;
  final bool isTransparent;
  final ValueChanged<String>? onChanged;
  final TextInputType keyboardType;
  final FormFieldValidator<String>? validator;
  final bool readOnly;
  final int? maxLines;
  final bool autofocus;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onFieldSubmitted;

  CustomTextFieldWidget(
      {Key? key,
      this.labelText,
      this.hintText,
      this.initText = "",
      this.isPassword = false,
      this.isTransparent = false,
      this.onChanged,
      this.validator,
      this.readOnly = false,
      this.maxLines,
      this.autofocus = false,
      this.textInputAction,
      this.onFieldSubmitted,
      this.keyboardType = TextInputType.text})
      : super(key: key);

  @override
  CustomTextFieldWidgetState createState() => CustomTextFieldWidgetState();
}

class CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {
  TextEditingController inputController = TextEditingController();

  @override
  void initState() {
    super.initState();
    inputController.text = widget.initText!;
  }

  @override
  void dispose() {
    inputController.dispose();
    super.dispose();
  }

  void _hideKeyboard() {
    Future.microtask(() => FocusScope.of(context).requestFocus(FocusNode()));
  }

  void clear(controller) async {
    _hideKeyboard();
    // Fix for ripple effect throwing exception
    // and the field staying gray.
    // https://github.com/flutter/flutter/issues/36324
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      setState(() {
        controller.clear();
        inputController.text = widget.initText!;
        widget.onChanged!(inputController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: inputController,
      obscureText: widget.isPassword,
      style: ThemeTextStyles.InputText.apply(
          color: widget.readOnly ? ThemeColors.gray_400 : ThemeColors.black),
      readOnly: widget.readOnly,
      decoration: InputDecoration(
          labelText: AppLocalizations.of(context)!.getString(widget.labelText),
          hintText: AppLocalizations.of(context)!.getString(widget.hintText),
          hintStyle: ThemeTextStyles.InputHint,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0.w)),
              borderSide: BorderSide(
                  color: widget.isTransparent
                      ? ThemeColors.transparent
                      : ThemeColors.gray_200)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0.w)),
            borderSide: BorderSide(
                color: widget.isTransparent
                    ? ThemeColors.transparent
                    : ThemeColors.gray_200),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0.w)),
            borderSide: BorderSide(
                color: widget.isTransparent
                    ? ThemeColors.transparent
                    : ThemeColors.theme_400),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0.w)),
            borderSide: BorderSide(
                color: widget.isTransparent
                    ? ThemeColors.transparent
                    : ThemeColors.error),
          ),
          suffixIcon: widget.readOnly
              ? null
              : IconButton(
                  icon: Icon(
                    Icons.cancel,
                    color: ThemeColors.gray_300,
                  ),
                  onPressed: () => clear(inputController),
                )),
      onChanged: widget.onChanged,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      maxLines: widget.isPassword ? 1 : widget.maxLines,
      autofocus: widget.autofocus,
      textInputAction: widget.textInputAction,
      onFieldSubmitted: widget.onFieldSubmitted,

      // onSaved: (String val) {
      //   widget.value = val;
      // }
    );
  }
}

class MyAccountsItem extends StatelessWidget {
  final String? address;
  final String? name;
  final String url;
  final bool emptyToken;

  MyAccountsItem({
    Key? key,
    this.url = "",
    this.address,
    this.name,
    this.emptyToken = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(64.w)),
                color: Color.fromRGBO(240, 240, 240, 1),
              ),
              child: emptyToken
                  ? EmptyCoinImageWidget()
                  : CoinImageWidget(
                      url: url,
                    ),
            ),
            SizedBox(width: 12),
            Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  AutoSizeText(
                    name!,
                    textAlign: TextAlign.left,
                    style: ThemeTextStyles.CoinListItemText,
                  ),
                  SizedBox(height: 2),
                  SizedText(
                      width: 253.w,
                      height: 17.h,
                      text: Common.getAbbreviatedAddress34(address!),
                      textStyle: ThemeTextStyles.CoinItemCoinName,
                      overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
          ],
        ),
        // Positioned(bottom: 0,left: 0,right: 0,
        // child: Divider(height: 1.h, thickness: 1, color: ThemeColors.gray_100,),)
      ],
    );
  }
}

class RecentTransferItem extends StatelessWidget {
  final String? address;
  final String? name;
  final String url;
  final String? infoText;

  RecentTransferItem(
      {Key? key,
      this.url = "assets/img/vix.png",
      this.address,
      this.name,
      this.infoText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(64.w)),
                color: Color.fromRGBO(240, 240, 240, 1),
                // image: DecorationImage(
                //     image:  AssetImage('assets/img/vix.png'),
                //     fit: BoxFit.contain
                // )
              ),
              child: CoinImageWidget(
                url: url,
              ),
            ),
            SizedBox(width: 12),
            Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedText(
                      width: 253.w,
                      height: 17.h,
                      text: Common.getAbbreviatedAddress34(address!),
                      textStyle: ThemeTextStyles.CoinItemCoinName,
                      overflow: TextOverflow.ellipsis),
                  SizedBox(height: 2),
                  AutoSizeText(
                    infoText!,
                    textAlign: TextAlign.left,
                    style: ThemeTextStyles.CoinItemCoinName.apply(
                        color: ThemeColors.dark_gray),
                  ),
                ],
              ),
            ),
          ],
        ),
        // Positioned(bottom: 0,
        //   child: Divider(height: 1.h, thickness: 1, color: ThemeColors.gray_100,),)
      ],
    );
  }
}

class ToggleSwitch extends StatelessWidget {
  double marginUnder;
  String label;
  TextStyle? labelStyle;
  TextStyle? optionStyle;
  String left;
  String right;
  bool? groupValue;
  ValueChanged<bool>? onChanged;
  bool isVertical;

  ToggleSwitch({
    this.label = "",
    this.labelStyle,
    this.left = "",
    this.right = "",
    this.optionStyle,
    this.groupValue,
    this.onChanged,
    this.marginUnder = 0,
    this.isVertical = true,
  }) {
    labelStyle ??= ThemeTextStyles.MainSubject;
    optionStyle ??= ThemeTextStyles.NormalText;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Widget labelWidget = Text(
      AppLocalizations.of(context)!.getString(label),
      style: labelStyle,
    );
    Widget switchWidget = CustomSwitch(
      value: groupValue!,
      onChanged: onChanged,
      activeColor: ThemeColors.toggleOn,
      trackColor: ThemeColors.gray_200,
      trackHeight: ThemeSizeStyle.customSwitchTrackHeight.h,
      trackWidth: ThemeSizeStyle.customSwitchTrackWidth.w,
      switchHeight: ThemeSizeStyle.customSwitchHeight.h,
      switchWidth: ThemeSizeStyle.customSwitchWidth.w,
      inactiveThumbColor: ThemeColors.white,
      activeThumbColor: ThemeColors.white,
    );
    Widget switchTextWidget = Row(
      children: [
        Text(
          left.isEmpty ? '' : AppLocalizations.of(context)!.getString(left),
          style: optionStyle,
          overflow: TextOverflow.ellipsis,
        ),
        switchWidget,
        Text(
          right.isEmpty ? '' : AppLocalizations.of(context)!.getString(right),
          style: optionStyle,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
    if (label.isEmpty) {
      if (left.isEmpty && right.isEmpty) {
        return Container(
            padding: EdgeInsets.only(bottom: this.marginUnder),
            child: switchWidget);
      } else {
        return Container(
            padding: EdgeInsets.only(bottom: this.marginUnder),
            child: switchTextWidget);
      }
    } else if (isVertical) {
      return Container(
          padding: EdgeInsets.only(bottom: this.marginUnder),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 0, bottom: 21, top: 8),
                child: labelWidget,
              ),
              switchTextWidget
            ],
          ));
    } else {
      return Container(
          padding: EdgeInsets.only(bottom: this.marginUnder),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[labelWidget, switchTextWidget],
          ));
    }
  }
}

class SettingToggleItemWidget extends StatelessWidget {
  final String? text;
  final String? description;
  TextStyle? textStyle;
  TextStyle? descriptionTextStyle;
  final bool? groupValue;
  final ValueChanged<bool>? onChanged;

  SettingToggleItemWidget(
      {Key? key,
      this.text,
      this.description,
      this.textStyle,
      this.descriptionTextStyle,
      this.groupValue,
      this.onChanged})
      : super(key: key) {
    this.textStyle ??= ThemeTextStyles.SettingItem;
    this.descriptionTextStyle ??= ThemeTextStyles.SettingItemDesc;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
        decoration: BoxDecoration(
          border: Border(
            bottom: Divider.createBorderSide(context,
                width: 1.0, color: ThemeColors.gray_100),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 234.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedText(
                    height: 18.h,
                    text: text,
                    textStyle: textStyle,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  SizedText(
                      text: description,
                      textStyle: descriptionTextStyle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
            Center(
              child: Padding(
                  padding: EdgeInsets.only(left: 0.w),
                  child: SizedBox(
                      width: 51.w,
                      height: 31.h,
                      child: ToggleSwitch(
                        groupValue: groupValue,
                        onChanged: onChanged,
                      ))),
            )
          ],
        ));
  }
}

class SettingRadioItemWidget extends StatelessWidget {
  final String? text;
  TextStyle? textStyle;
  final ValueChanged<String?>? onChanged;
  final List<RadioModel>? radioList;

  SettingRadioItemWidget({Key? key, this.text, this.onChanged, this.radioList})
      : super(key: key) {
    this.textStyle ??= ThemeTextStyles.SettingItem;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
      decoration: BoxDecoration(
        border: Border(
          bottom: Divider.createBorderSide(context,
              width: 1.0, color: ThemeColors.gray_100),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedText(
            height: 18.h,
            text: text,
            textStyle: textStyle,
          ),
          SizedBox(
            height: 18.h,
          ),
          SizedBox(
              height: radioList!.length * 60.h,
              child: Padding(
                  padding: EdgeInsets.only(left: 12.w),
                  child: RadioList(
                      width: 264.w,
                      onChanged: onChanged,
                      radioList: radioList)))
        ],
      ),
    );
  }
}

class AccountItem extends StatelessWidget {
  final String? url;
  final String? name;
  final num? balance;
  final num? currencyBalance;
  final String? coinName;

  final String? address;

  AccountItem(
      {Key? key,
      this.url,
      this.name,
      this.balance,
      this.currencyBalance,
      this.coinName,
      this.address})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String formatBalance = "";
    String formatExchangeBalance = "";

    if (balance == null) {
      formatBalance = "0";
    } else {
      YolletState state = appStore.state.yolletState;
      num? decimalPoint = state.currentTokenInfo.decimalPoint;
      formatBalance = CurrencyFormatter.get(decimalPoint?.toInt() ?? 0)
          .format(balance)
          .toString();
    }
    if (currencyBalance == null) {
      formatExchangeBalance = "0";
    } else {
      // YolletState state = appStore.state.yolletState;
      // num? decimalPoint = state.currentTokenInfo.decimalPoint;
      formatExchangeBalance =
          CurrencyFormatter.get(0).format(currencyBalance).toString();
    }

    double? currencyBalanceLeftSpace() {
      if (AppLocalizations.languageCode == 'ko') {
        return 35.w;
      } else if (AppLocalizations.languageCode == 'en') {
        return 62.w;
      }
      // else if(AppLocalizations.languageCode == 'ru'){
      //   return 59.w;
      // }
      // else if(AppLocalizations.languageCode == 'kz'){
      //   return 59.w;
      // }
      // else if(AppLocalizations.languageCode == 'zh'){
      //   return 59.w;
      // }
    }

    return Container(
        width: MediaQuery.of(context).size.width,
        height: (address == null) ? 91.h : 72.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(17.w),
          ),
          color: Color.fromRGBO(0, 0, 0, 0.028),
        ),
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(64.w)),
                color: Color.fromRGBO(240, 240, 240, 1),
              ),
              child: CoinImageWidget(
                url: url,
              ),
            ),
            SizedBox(width: 12.w),
            Container(
              child: (address == null)
                  ? Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        AutoSizeText(
                          name!,
                          textAlign: TextAlign.left,
                          style: ThemeTextStyles.CoinListItemText.apply(
                              fontFamily: 'RubikMedium'),
                        ),
                        SizedBox(height: 2.h),
                        // SizedText(
                        //     height: 18.h,
                        //     text: AppLocalizations.of(context)!
                        //             .getString("balance")! +
                        //         " : " +
                        //         formatBalance +
                        //         " " +
                        //         coinName!,
                        //     textStyle: ThemeTextStyles.CoinItemCoinName.apply(
                        //         color:
                        //             // (balance == 0)
                        //             //     ? ThemeColors.error
                        //             //     :
                        //             ThemeColors.gray_400),
                        //     overflow: TextOverflow.ellipsis),
                        Row(
                          children: [
                            SizedText(
                                height: 18.h,
                                text: AppLocalizations.of(context)!
                                        .getString("balance") +
                                    " : ",
                                textStyle:
                                    ThemeTextStyles.CoinItemCoinName.apply(
                                        color:
                                            // (balance == 0)
                                            //     ? ThemeColors.error
                                            //     :
                                            ThemeColors.gray_400),
                                overflow: TextOverflow.ellipsis),
                            SizedText(
                                height: 18.h,
                                text: formatBalance + " ",
                                textStyle:
                                    ThemeTextStyles.CoinItemCoinNamePrice.apply(
                                        color:
                                            // (balance == 0)
                                            //     ? ThemeColors.error
                                            //     :
                                            ThemeColors.gray_400),
                                overflow: TextOverflow.ellipsis),
                            SizedText(
                                height: 18.h,
                                text: coinName!,
                                textStyle:
                                    ThemeTextStyles.CoinItemCoinNamePriceCoin
                                        .apply(
                                            color:
                                                // (balance == 0)
                                                //     ? ThemeColors.error
                                                //     :
                                                ThemeColors.gray_400),
                                overflow: TextOverflow.ellipsis),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(width: currencyBalanceLeftSpace()),
                            SizedText(
                              height: 15.h,
                              text: "(" +
                                  formatExchangeBalance +
                                  " " +
                                  AppLocalizations.of(context)!
                                      .getString("krw") +
                                  ")",
                              textStyle: ThemeTextStyles.CoinItemCoinTradePrice,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ],
                    )
                  : Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedText(
                          height: 34.h,
                          width: 223.w,
                          text: address,
                          textStyle:
                              ThemeTextStyles.AccountTransferPopupAddress,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ],
                    ),
            ),
          ],
        ));
  }
}

class CustomTable extends StatelessWidget {
  final List<String>? mnemonic;

  const CustomTable({Key? key, this.mnemonic}) : super(key: key);

  List<Widget> _row1() {
    List<Widget> widget = [];

    for (int i = 0; i < mnemonic!.length / 2; i++) {
      widget.add(
        Row(
          children: [
            SizedText(
              width: 20.w,
              text: (i + 1).toString(),
              textStyle:
                  ThemeTextStyles.CustomTableNumberCreateAccountConfirmMnemonic,
            ),
            SizedBox(
              width: 4.w,
            ),
            SizedText(
              text: mnemonic![i],
              textStyle:
                  ThemeTextStyles.CustomTableTextCreateAccountConfirmMnemonic,
              disableLocalizations: true,
            ),
          ],
        ),
      );
    }
    return widget;
  }

  List<Widget> _row2() {
    List<Widget> widget = [];

    for (int i = (mnemonic!.length / 2).toInt(); i < mnemonic!.length; i++) {
      widget.add(
        Row(
          children: [
            SizedText(
              width: 20.w,
              text: (i + 1).toString(),
              textStyle:
                  ThemeTextStyles.CustomTableNumberCreateAccountConfirmMnemonic,
            ),
            SizedBox(
              width: 4.w,
            ),
            SizedText(
              text: mnemonic![i],
              textStyle:
                  ThemeTextStyles.CustomTableTextCreateAccountConfirmMnemonic,
              disableLocalizations: true,
            ),
          ],
        ),
      );
    }
    return widget;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ThemeColors.emerald_50.withOpacity(0.5),
      padding: EdgeInsets.symmetric(vertical: 15.h),
      height: 256.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _row1(),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _row2(),
          ),
        ],
      ),
    );
  }
}

Future<dynamic> showPopup(BuildContext context, Widget contentWidget) {
  return Navigator.push(
    context,
    PopupLayout(
      top: 0,
      left: 0,
      right: 0,
      bottom: 0,
      child: PopupContent(content: contentWidget),
    ),
  );
}

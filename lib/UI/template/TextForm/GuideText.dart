import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yollet/UI/template.dart';

//Body에서 바로 사용하는 메인 카테고리의 제목들
class MainSubjectOrange extends StatelessWidget {
  String text;
  TextStyle textStyle;
  Color? textColor;
  double marginLeft;
  double marginRight;
  double marginUnder;

  MainSubjectOrange(
      {required this.text,
      this.textStyle = ThemeTextStyles.bodyBlack26,
      this.textColor,
      this.marginLeft = 0.0,
      this.marginRight = 0.0,
      this.marginUnder = 12.0});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if (textColor != null) textStyle = textStyle.apply(color: textColor);

    return Padding(
        padding: EdgeInsets.only(
            top: 0, left: marginLeft, right: marginRight, bottom: this.marginUnder),
        child: Container(
            alignment: Alignment.centerLeft,
            child:Text(
              AppLocalizations.of(context)!.getString(text),
              style: textStyle,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ).build(context)));
  }
}
class MainSubjectOrangeTable extends StatelessWidget {
  String text;
  TextStyle textStyle;
  Color? textColor;
  double marginLeft;
  double marginRight;
  double marginUnder;

  MainSubjectOrangeTable(
    {required this.text,
      this.textStyle = ThemeTextStyles.bodyBlack26,
      this.textColor,
      this.marginLeft = 0.0,
      this.marginRight = 0.0,
      this.marginUnder = 12.0});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if (textColor != null) textStyle = textStyle.apply(color: textColor);

    return Padding(
      padding: EdgeInsets.only(
        top: 0, left: marginLeft, right: marginRight, bottom: this.marginUnder),
      child: Container(
        alignment: Alignment.centerLeft,
        child:Text(
          AppLocalizations.of(context)!.getString(text),
          style: textStyle,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ).build(context)));
  }
}
//바탕화면에 제목형태로 표시하는 Text
class MainCaptionOrange extends StatelessWidget {
  String text;
  TextStyle? textStyle;
  Color? textColor;
  double marginLeft;
  double marginUnder;

  MainCaptionOrange(
      {required this.text,
      this.textStyle,
      this.textColor,
      this.marginLeft = 0.0,
      this.marginUnder = ThemeSizeStyle.minUnit});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if (textStyle == null)
      textStyle = ThemeTextStyles.Body1.apply(
        fontSizeDelta: 3,
      );
    if (textColor != null) textStyle = textStyle!.apply(color: textColor);

    return Padding(
        padding: EdgeInsets.only(
            top: 0, left: marginLeft, right: 8.0, bottom: this.marginUnder),
        child: Align(
            alignment: Alignment.centerLeft,
            child:Text(AppLocalizations.of(context)!.getString(text),
                    style: textStyle)
                .build(context)));
  }
}

class GuideTextBoxOrange extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  final Decoration? decoration;

  final BoxDecoration _boxDeco = new BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(8.0.w)),
      boxShadow: [
        BoxShadow(
          color: ThemeColors.ReplyBlue100,
          blurRadius: 1.0,
        ),
      ]
      );

  GuideTextBoxOrange(
      {required this.child,
      this.padding ,//= const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      this.margin ,//= const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      this.decoration});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        padding: padding,
        margin: margin,
//        decoration: decoration == null ? themeBoxDecoOrange.guideBoxDeco : decoration,
      decoration: decoration,
        child: child);
  }
}

class TangerineGuideTextBoxOrange extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;

  final Decoration? decoration;

  TangerineGuideTextBoxOrange(
    {required this.child,
      this.padding = const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      this.margin = const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      this.decoration});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
     decoration: decoration == null ? ThemeBoxDeco.guideBoxDeco : decoration,
      child: child);
  }
}

class KVTextOrange extends StatelessWidget {
  String title;
  String value;
  TextStyle titleStyle;
  TextStyle valueStyle;
  bool isVertical;
  bool hasDivider;
  AlignmentGeometry valueAlignment;
  CrossAxisAlignment crossAxisAlignment;
  Widget underSpaceBox;
  bool isSingleLine;

  KVTextOrange(
      {required this.title,
      required this.value,
      this.isVertical = false,
      this.titleStyle = ThemeTextStyles.KVTextTitleText,
      this.valueStyle = ThemeTextStyles.KVTextValueText,
      this.valueAlignment = Alignment.centerLeft,
      this.hasDivider = true,
      this.crossAxisAlignment = CrossAxisAlignment.start,
      this.underSpaceBox = const SizedBox(height : ThemeSizeStyle.margin_underComponentsKVText),
      this.isSingleLine = true });

  @override
  Widget build(BuildContext context) {
//    // TODO: implement build
//    if (valueStyle == null) {
//      valueStyle = titleStyle.apply(fontWeightDelta: 4, fontSizeDelta: 2);
//    }
    Widget _child;
    if (!isVertical) {
      _child = Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: crossAxisAlignment,
        children: <Widget>[
         AutoSizeText(
            AppLocalizations.of(context)!.getString(title),
            maxLines: isSingleLine ? 1 : null,
            style: titleStyle,
            overflow: isSingleLine ? TextOverflow.ellipsis : null,
          ), //금액
          Container(
            alignment: Alignment.centerRight,
            child:AutoSizeText(
              AppLocalizations.of(context)!.getString(value),
              style: valueStyle,
              overflow: isSingleLine ? TextOverflow.ellipsis : null,
            ),
          ),
        ],
      );
    } else {
      _child = Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: crossAxisAlignment,
        children: <Widget>[
         AutoSizeText(
            AppLocalizations.of(context)!.getString(title),
            style: titleStyle,
            maxLines: isSingleLine ? 1 : null,
            overflow: isSingleLine ? TextOverflow.ellipsis : null,
          ),
          SizedBox(
            height: 4,
          ),
          Container(
              alignment: valueAlignment,
              child:
              Padding(
              padding: EdgeInsets.only(left: ThemeSizeStyle.KVTextValueLeftPadding),
              child:AutoSizeText(
                AppLocalizations.of(context)!.getString(value),
                style: valueStyle,
                overflow: isSingleLine ? TextOverflow.ellipsis : null,
              ))),
        ],
      );
    }
//    return _child;

    return hasDivider?Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: crossAxisAlignment,
      children: <Widget>[
        _child,
        SizedBox(
          height: 7,
        ),
        const Divider(
          color: ThemeColors.DividerLineColor,
          height: 2.0,
        ),
        underSpaceBox,
      ],
    ):Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: crossAxisAlignment,
      children: <Widget>[
        _child,
        underSpaceBox,
      ]
    );

  }
}

class KVTextOrangePaymentDetail extends StatelessWidget {
  String title;
  String value;
  TextStyle titleStyle;
  TextStyle valueStyle;
  bool isVertical;
  bool hasDivider;
  AlignmentGeometry valueAlignment;
  CrossAxisAlignment crossAxisAlignment;
  Widget underSpaceBox;
  bool isSingleLine;

  KVTextOrangePaymentDetail(
    {required this.title,
      required this.value,
      this.isVertical = false,
      this.titleStyle = ThemeTextStyles.KVTextTitleText,
      this.valueStyle = ThemeTextStyles.KVTextValueText,
      this.valueAlignment = Alignment.centerLeft,
      this.hasDivider = true,
      this.crossAxisAlignment = CrossAxisAlignment.start,
      this.underSpaceBox = const SizedBox(height : 17),
      this.isSingleLine = true });

  @override
  Widget build(BuildContext context) {
//    // TODO: implement build
//    if (valueStyle == null) {
//      valueStyle = titleStyle.apply(fontWeightDelta: 4, fontSizeDelta: 2);
//    }
    Widget _child;
    if (!isVertical) {
      _child = Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
         AutoSizeText(
            AppLocalizations.of(context)!.getString(title),
            maxLines: isSingleLine ? 1 : null,
            style: titleStyle,
            overflow: isSingleLine ? TextOverflow.ellipsis : null,
          ), //금액
          Container(
            alignment: Alignment.centerRight,
            child:AutoSizeText(
              AppLocalizations.of(context)!.getString(value),
              style: valueStyle,
              overflow: isSingleLine ? TextOverflow.ellipsis : null,
            ),
          ),
        ],
      );
    } else {
      _child = Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: crossAxisAlignment,
        children: <Widget>[
         AutoSizeText(
            AppLocalizations.of(context)!.getString(title),
            style: titleStyle,
            maxLines: isSingleLine ? 1 : null,
            overflow: isSingleLine ? TextOverflow.ellipsis : null,
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            alignment: valueAlignment,
            child:
            Padding(
              padding: EdgeInsets.only(left: ThemeSizeStyle.KVTextValueLeftPadding),
              child:AutoSizeText(
                AppLocalizations.of(context)!.getString(value),
                style: valueStyle,
                overflow: isSingleLine ? TextOverflow.ellipsis : null,
              ))),
        ],
      );
    }
//    return _child;

    return hasDivider?Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: crossAxisAlignment,
      children: <Widget>[
        _child,
        SizedBox(
          height: 14,
        ),
        const Divider(
          color: ThemeColors.DividerLineColor,
          height: 2.0,
        ),
        underSpaceBox,
      ],
    ):Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: crossAxisAlignment,
      children: <Widget>[
        _child,
        underSpaceBox,
      ]
    );

  }
}
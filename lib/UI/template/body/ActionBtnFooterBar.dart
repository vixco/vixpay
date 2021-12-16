import 'package:flutter/material.dart';
import 'package:yollet/UI/template.dart';

class ActionBtnFooterBarOrange extends StatelessWidget {
  var _widgets = <Widget>[];
  double? _height;
  Color? _footerColor;
  double bottomPadding;
  bool isVertical;

  ActionBtnFooterBarOrange(widgets,
      {double height = ThemeSizeStyle.footerBarHeight,
      Color footerColor = ThemeColors.txtMainWhite,
      this.isVertical = !ThemeValue.isTablet,
      this.bottomPadding = ThemeSizeStyle.footerBarPadding}) {
    _height = height;
    _footerColor = footerColor;

    //여기에서 버튼 Size(Width 도 잘 조정하면 화면에 꽉 차게 나옴)
    var widgetCnt = widgets.length;

    if (widgetCnt == 1 && !ThemeValue.isTablet) {
      _height = 88.0;
      bottomPadding = 12;
    }

    _widgets = <Widget>[];
    for (int i = 0; i < widgetCnt - 1; i++) {
      _widgets.add(Expanded(
          child: SizedBox(
              width: double.infinity,
              height: ThemeSizeStyle.footerBtnHeight, // match_parent
              child: widgets[i])));
//      _widgets.add(widgets[i]);
      _widgets.add(SizedBox(width: 16, height: 4));
    }
    _widgets.add(Expanded(
        child: SizedBox(
            width: double.infinity,
            height: ThemeSizeStyle.footerBtnHeight, // match_parent
            child: widgets[widgetCnt - 1])));
  }

  @override
  Widget build(BuildContext context) {
    //위젯들의 길이 계산

    return BottomAppBar(
        elevation: 0.0,
        color: _footerColor,
        child: Container(
          height: _height,
          decoration: ThemeSizeStyle.footerShdow,
          child: Padding(
            padding: EdgeInsets.only(
                left: ThemeSizeStyle.paddingBodySide,
                right: ThemeSizeStyle.paddingBodySide,
                top: ThemeSizeStyle.footerBarPadding,
                bottom: bottomPadding),
            child: isVertical
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: _widgets,
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: _widgets,
                  ),
          ),
        ));
  }
}

class ActionBtnFooterBarLoginOrange extends StatelessWidget {
  final _widgets = <Widget>[];

  ActionBtnFooterBarLoginOrange(widgets) {
    //여기에서 버튼 Size(Width 도 잘 조정하면 화면에 꽉 차게 나옴)
    var widgetCnt = widgets.length;

    for (int i = 0; i < widgetCnt - 1; i++) {
      _widgets.add(Expanded(child: widgets[i]));
      _widgets.add(new SizedBox(
          width: ThemeSizeStyle.ActionBtnFooterBarLoginWidthSpace));
    }

    _widgets.add(Expanded(child: widgets[widgetCnt - 1]));
  }

  @override
  Widget build(BuildContext context) {
    //위젯들의 길이 계산

    return Container(
//        padding: const EdgeInsets.only(
//            left: ThemeSizeStyle.bodyLRPadding,
//            right: ThemeSizeStyle.bodyLRPadding,
//            top: 8.0,
//            bottom: 8.0),
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: _widgets,
    ));
  }
}

//Information 의 한줄의 갯수는 themeSizeStyle.footerBtnHeight를 기준으로 함
class InformationFootBarOrange extends StatelessWidget {
  List<Widget>? buttons;
  List<Widget>? datas;
  EdgeInsetsGeometry padding;
  double height;

  List<Widget> _buttonbar = <Widget>[];

  InformationFootBarOrange(
      {this.height = 0.0,
      this.buttons,
      this.datas,
      this.padding = const EdgeInsets.symmetric(
          horizontal: ThemeSizeStyle.InformationFootBarHorizontalPadding)});

  @override
  Widget build(BuildContext context) {
    if (datas == null) datas = <Widget>[];
    //위젯들의 길이 계산
    if (height == 0.0) {
      height = ThemeSizeStyle.footerBtnHeight * (datas!.length + 1);
    }

    print(height.toString() +
        "/" +
        (ThemeSizeStyle.footerBtnHeight * (datas!.length + 1)).toString());

    //버튼위젯 만들기
    if (buttons != null) {
      var widgetCnt = buttons!.length;
      if (widgetCnt > 0) {
        for (int i = 0; i < widgetCnt; i++) {
          _buttonbar.add(Expanded(child: buttons![i]));
          if (i != widgetCnt - 1) {
            _buttonbar.add(new SizedBox(width: ThemeSizeStyle.size_16));
          }
        }
      }
    }
    if (_buttonbar.length > 0) {
      //통합 List 생성
      datas!.add(
        Container(
          height: ThemeSizeStyle.footerBtnHeight,
          padding: const EdgeInsets.only(
//            left: ThemeSizeStyle.bodyLRPadding,
//            right: ThemeSizeStyle.bodyLRPadding,
              top: 0,
              bottom: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: _buttonbar,
          ),
        ),
      );
      datas!.add(SizedBox(
        height: ThemeSizeStyle.InformationFootBarBottomPadding,
        width: ThemeSizeStyle.InformationFootBarBottomPadding,
      ));
    }
    return BottomAppBar(
      elevation: 0.0,
      color: Colors.transparent,
      child: Container(
        decoration: ThemeSizeStyle.footerShdow,
        padding: padding,
        height: height,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.end, children: datas!),
      ),
    );
  }
}

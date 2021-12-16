import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yollet/UI/template.dart';

//기본 Padding 만 사용함
//8dp, 4dp 단위로 패딩이 들어가야 함



class DefaultScrollBodyOrangeTabletSinglePage extends StatelessWidget {
  final Widget bodyWidget;
  final double paddingTop;
  final double paddingLR;
  final Widget? bottomWidget;

  DefaultScrollBodyOrangeTabletSinglePage(this.bodyWidget,
      {this.paddingTop = 25,
      this.paddingLR = ThemeSizeStyle.bodyLRPadding,
      this.bottomWidget});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: ThemeColors.slate,
        child: Padding(
            padding:
                EdgeInsets.only(top: 16, left: 384, right: 384, bottom: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  height: 680,
                  width: 512,
                  color: ThemeColors.white,
                  child: getBody(),
                ),
                Image(
                    width: 512,
                    height: 16,
                    fit: BoxFit.fill,
                    image: AssetImage('assets/img/pagecut.png')),
              ],
            )));
  }

  Widget getBody() {
    if (bottomWidget == null) {
      return SingleChildScrollView(
        padding: EdgeInsets.only(
            left: paddingLR, right: paddingLR, top: paddingTop, bottom: 0),
        child: bodyWidget,
      );
    } else {
      return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              height: 560,
              color: ThemeColors.white,
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                    left: paddingLR,
                    right: paddingLR,
                    top: paddingTop,
                    bottom: 0),
                child: bodyWidget,
              ),
            ),
            bottomWidget!
          ]);
    }
  }
}

//사용 안함
class DefaultWideScrollBodyOrange extends StatelessWidget {
  final Widget bodyWidget;
  final double paddingTop;
  final double paddingLR;

  DefaultWideScrollBodyOrange(this.bodyWidget,
      {this.paddingTop = ThemeSizeStyle.bodyTopPadding,
      this.paddingLR = ThemeSizeStyle.bodyLRPadding});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
          top: paddingTop, left: paddingLR, right: paddingLR, bottom: 0),
      child: Container(
          color: Colors.red,
          child: bodyWidget), //사용안함이라 붉은색 Body 로 표시함.. 나오면 뺄것
    );
  }
}

class ToproundScrollBodyOrange extends StatelessWidget {
  var _bodyWidget;
  double paddingTop;
  double paddingLR;

  ToproundScrollBodyOrange(bodyWidget,
      {this.paddingTop = ThemeSizeStyle.bodyTopPadding,
      this.paddingLR = ThemeSizeStyle.bodyLRPadding}) {
    //bodyWidget 위에 CustomSizedBox.divBodyTop 를 추가해 주세요
    _bodyWidget = bodyWidget;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultStackScrollBodyOrange(
      mainWidget: _bodyWidget,
      frontWidget: [
        Container(
          height: 16.0,
          color: ThemeColors.ReplyBlue,
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.only(
                      topLeft:  Radius.circular(16.0.w),
                      topRight:  Radius.circular(16.0.w))),
              child: Center(
                child: AutoSizeText("Hi modal sheet"),
              )),
        ),
      ],
    );
    /*
      SingleChildScrollView(
      padding: EdgeInsets.only(
          left: paddingLR, right: paddingLR, top: paddingTop, bottom: 0.0),
      child: _bodyWidget,
    );*/
  }
}

class DefaultStackBodyOrange extends StatelessWidget {
  List<Widget>? _bgWidget;
  List<Widget>? _frontWidget;
  var _bodyWidget;

  DefaultStackBodyOrange({
    List<Widget>? bgWidget,
    required Widget mainWidget,
    List<Widget>? frontWidget,
  })  : _bgWidget = bgWidget,
        _bodyWidget = mainWidget,
        _frontWidget = frontWidget;

  @override
  Widget build(BuildContext context) {
    List<Widget> _Widgets = <Widget>[];
    if (_bgWidget != null) {
      for (int i = 0; i < _bgWidget!.length; i++) {
        _Widgets.add(_bgWidget![i]);
      }
    }
    _Widgets.add(DefaultBody(_bodyWidget));
    if (_frontWidget != null) {
      for (int i = 0; i < _frontWidget!.length; i++) {
        _Widgets.add(_frontWidget![i]);
      }
    }

    return Stack(
      children: _Widgets,
    );
  }
}

class DefaultStackScrollBodyOrange extends StatelessWidget {
  List<Widget>? _bgWidget;
  List<Widget>? _frontWidget;
  var _bodyWidget;

  DefaultStackScrollBodyOrange({
    List<Widget>? bgWidget,
    required Widget? mainWidget,
    List<Widget>? frontWidget,
  })  : _bgWidget = bgWidget,
        _bodyWidget = mainWidget,
        _frontWidget = frontWidget;

  @override
  Widget build(BuildContext context) {
    List<Widget> _Widgets = <Widget>[];
    if (_bgWidget != null) {
      for (int i = 0; i < _bgWidget!.length; i++) {
        _Widgets.add(_bgWidget![i]);
      }
    }
    _Widgets.add(DefaultScrollBody(_bodyWidget));
    if (_frontWidget != null) {
      for (int i = 0; i < _frontWidget!.length; i++) {
        _Widgets.add(_frontWidget![i]);
      }
    }

    return Stack(
      children: _Widgets,
    );
  }
}

class QueryConditionBody2Orange extends StatelessWidget {
  Widget? child;
  Widget? leading;
  Widget? QueryCondigions;

  QueryConditionBody2Orange({this.child, this.leading, this.QueryCondigions});

  buildLeading(String txt) {
    leading =AutoSizeText(txt, style: ThemeTextStyles.Body1);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double bottomOpacity = 1;
    //QueryCondigions.insert(0, themeSpacingBox.div_underComponents);

    return CustomScrollView(slivers: <Widget>[
      SliverList(
        delegate: SliverChildListDelegate(
          [
            QueryCondigions!,
          ],
        ),
      ),
      SliverList(
        delegate: SliverChildListDelegate(
          [
            Container(
              color: ThemeColors.ReplyBlue,
              height: 24.0,
              child: PhysicalShape(
                elevation: 0,
                color: ThemeColors.ReplyBg,
                clipper: ShapeBorderClipper(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.0.w),
                      topRight: Radius.circular(16.0.w),
                    ),
                  ),
                ),
                child:AutoSizeText(""),
              ),
            ),
          ],
        ),
      ),
      SliverList(
        delegate: SliverChildListDelegate(
          [
            DefaultScrollBody(child),
          ],
        ),
      ),
    ]);
  }
}

class QueryConditionBodyOrange extends StatelessWidget {
  Widget? child;
  Widget? leading;
  Widget? QueryTitle;
  Widget? QuerySummary;
  Widget? QueryCondition;
  Widget? QueryBtn;
  Widget? QueryBottom;
  ValueChanged<bool>? onExpansionChanged;

  QueryConditionBodyOrange(
      {this.child,
      this.leading,
      this.QueryTitle,
      this.QuerySummary,
      this.QueryCondition,
      this.QueryBtn,
      this.QueryBottom,
      this.onExpansionChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomExpansionTile(
          backgroundColor: ThemeColors.slate,
          title: Container(
                  height: ThemeSizeStyle.QueryConditionHeight,
                  alignment: Alignment.centerLeft,
                  child: QueryTitle),
          children: [
//            (QuerySummary==null)
//              ?Container(width:0,height:0)
//              :QuerySummary,
            QueryCondition!,
            QueryBtn == null ? Container(width: 0, height: 0) : QueryBtn!,
          ],
          onExpansionChanged: onExpansionChanged,
        ),
        Expanded(
          child: DefaultScrollBody(child),
        ),
        (QueryBottom == null) ? Container(width: 0, height: 0) : QueryBottom!
      ],
    );
  }
}

//결제용 App호출화면에 사용되는 기본 Body
class PGBodyOrange extends StatelessWidget {
  Widget? body;
  String? title;
  Widget? buttons;
  double height;

  PGBodyOrange({this.title, this.body, this.buttons, this.height = 350.0}) {
    //bodyWidget 위에 CustomSizedBox.divBodyTop 를 추가해 주세요
  }

  @override
  Widget build(BuildContext context) {
    //Title 기본값 설정
    if (this.title == null || this.title!.length == 0) {
      this.title =
          AppLocalizations.of(context)!.getString("payment_popup_title");
    }

    //Butons 생성
    if (this.buttons == null) {
      buttons = SizedBox(height: 0);
    } else {
      buttons = Container(
          padding: EdgeInsets.only(top: 48),
          alignment: Alignment.bottomRight,
          child: this.buttons);
    }

    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.black87,
      child: Center(
        child: ConstrainedBox(
          //화면의 크기
          constraints:
              BoxConstraints(maxWidth: 312, minHeight: 300, maxHeight: height),
          child: Container(
            padding: EdgeInsets.only(
                left: 24.0, right: 24.0, top: 20.0, bottom: 16.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.w),
                ),
                color: Colors.white),
            child: Column(
              children: <Widget>[
                //Title
                Container(
                  height: 28,
                  alignment: Alignment.centerLeft,
                  child:AutoSizeText(
                    this.title!,
                    style: ThemeTextStyles.TablePageTableItemTitle,
                  ),
                ),
                SizedBox(height: 12), //Title과 내용의 여백
                Container(child: body),
                Expanded(flex: 1, child: Container(child:AutoSizeText(""))),
                buttons!,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//PGBody 하단의 버튼
class PGBodyBtnFooter extends StatelessWidget {
  var _widgets = <Widget>[];
  double? _height;
  Color? _footerColor;
  double _bottomPadding = 16;

  PGBodyBtnFooter(
    widgets, {
    double height = 24,
  }) {
    _height = height;

    //여기에서 버튼 Size(Width 도 잘 조정하면 화면에 꽉 차게 나옴)
    int widgetCnt = widgets.length;

    _widgets = <Widget>[];
    for (int i = 0; i < widgetCnt; i++) {
      _widgets.add(widgets[i]);
//      _widgets.add(widgets[i]);
      _widgets.add(SizedBox(width: _bottomPadding));
    }
    _widgets.removeLast(); //마지막 공백 제거
  }

  @override
  Widget build(BuildContext context) {
    //위젯들의 길이 계산

    return Container(
      child: Row(mainAxisAlignment: MainAxisAlignment.end, children: _widgets),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:yollet/UI/template.dart';
import 'package:yollet/UI/template/body/unit/BodyBG.dart';

//기본 Padding 만 사용함
//8dp, 4dp 단위로 패딩이 들어가야 함
class DecoBGBody extends StatefulWidget {
  Widget _body;
  Widget? _appBar;

  DecoBGBody({AppBar? appBar, required Widget body})
      : _appBar = appBar,
        _body = body;

  @override
  _DecoBGBodyState createState() => _DecoBGBodyState();
}

class _DecoBGBodyState extends State<DecoBGBody> {
  @override
  Widget build(BuildContext context) {
    var _children = <Widget>[];
    if (widget._appBar != null) {
      _children.add(widget._appBar!);
    }
    _children.add(Flexible(child: DefaultBody(widget._body)));

    return Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Stack(children: <Widget>[
          CircleBG(),
          Column(
            children: _children,
          )
          /*
          Container(
              child:
                  //Column(children: [_appBar, _body])
                  Column(children: [_appBar, _body]))*/
        ]));
  }
}

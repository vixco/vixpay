import 'package:flutter/material.dart';
import 'package:yollet/UI/template.dart';

class BulletListOrange extends StatelessWidget {
  Widget? bullet;
  Widget? child;
  Color dividerColor;

  EdgeInsetsGeometry? padding;
  bool isSelected;
  Color? selectedColor;
  BulletListOrange({this.bullet, this.child,this.padding,this.isSelected=false,this.selectedColor,this.dividerColor = ThemeColors.DividerLineColor});

  @override
  Widget build(BuildContext context) {
    if (bullet == null) {
      bullet = SizedBox(
        width: ThemeSizeStyle.margin_underCategory,
      );
    }
    return Padding(
      padding: padding??EdgeInsets.only(right: 0,),
      child:Container(
        color: (isSelected && selectedColor!=null)?selectedColor:null,
        child:
        Column(children:
        <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ThemeSpacingBox.div_underComponents,
              bullet!,
              Expanded(
                child: Container(
                  child: child
                ),
              )
            ]),
          const SizedBox(height: ThemeSizeStyle.bulletListOrangeDividerSpaceHeight),
          Divider(
          color: dividerColor,
            height: 2.0,
          ),
        ]
        )
      )
    );
  }
}

class IndexBulletOrange extends StatelessWidget {
  final int? index;
  final double topMargin;

  IndexBulletOrange({this.index, this.topMargin = 0});

  @override
  Widget build(BuildContext context) {
    String idxStr = "";
    if (index != null) {
      idxStr = index.toString() + ".";
    } else {
      idxStr = "";
    }

    return Container(
      width: 24,
      height: 32,
      alignment: Alignment.topLeft,
      padding: EdgeInsets.only(top : topMargin),
      child:AutoSizeText(
        idxStr,
        style: ThemeTextStyles.Caption.apply(color: ThemeColors.txtMediumBlack),
      ),
    );
  }
}

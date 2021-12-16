import 'package:flutter/material.dart';

class WidgetListViewVerticalBuilder {
  final double? width;
  final double? height;
  final int? columnCnt;
  final List<Widget>? children;
  final double vSpace;
  final double hSpace;
  final  EdgeInsetsGeometry padding;
  WidgetListViewVerticalBuilder({this.width,this.height,this.columnCnt,this.children,this.vSpace=0, this.hSpace=0,this.padding=const EdgeInsets.all(0)});

  Widget build(){

    if (children==null) return Container();

    List<Widget> columnList = <Widget>[];

    for(int i= 0; i< children!.length ; ){
      List<Widget> rowList = <Widget>[];

      for(int j=0;j<columnCnt!;j++){

        if(i < children!.length) {
          rowList.add(children![i]);
        }else{
          rowList.add(Text(""));
        }
        if(j!=(columnCnt!-1)){
          rowList.add(SizedBox(width: hSpace,height: hSpace,));
        }
        i++;
      }
      columnList.add(Row(children: rowList,));
      if(i!=children!.length){
        columnList.add(SizedBox(width: vSpace,height: vSpace,));
      }
    }

    return
    (width==0&&height==0)?
    Column(children: columnList,)
      :SizedBox(width: width,height: height,
        child:
        SingleChildScrollView(
          padding: padding,
          child:
          Column(children: columnList,)
        ));

  }

}


class WidgetListViewHorizontalBuilder {
  final double? width;
  final double? height;
  final int? rowCnt;
  final List<Widget>? children;
  final double vSpace;
  final double hSpace;
  final  EdgeInsetsGeometry padding;
  WidgetListViewHorizontalBuilder({this.width,this.height,this.rowCnt,this.children,this.vSpace=0, this.hSpace=0,this.padding=const EdgeInsets.all(0)});

  Widget build(){

    if (children==null) return Container();

    List<Widget> rowList = <Widget>[];

    for(int i= 0; i< children!.length ; ){
      List<Widget> columnList = <Widget>[];

      for(int j=0;j<rowCnt!;j++){

        if(i < children!.length) {
          columnList.add(children![i]);
        }else{
          columnList.add(Text(""));
        }
        if(j!=(rowCnt!-1)){
          columnList.add(SizedBox(width: hSpace,height: hSpace,));
        }
        i++;
      }
      rowList.add(Column(children: columnList,));
      if(i!=children!.length){
        rowList.add(SizedBox(width: vSpace,height: vSpace,));
      }
    }

    return
      (width==0&&height==0)?
      Row(children: rowList,)
        :SizedBox(width: width,height: height,
        child:
        SingleChildScrollView(
          scrollDirection : Axis.horizontal,
          padding: padding,
          child:
          Row(children: rowList,)
        ));

  }

}
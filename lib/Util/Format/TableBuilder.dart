import 'package:flutter/material.dart';

class TableBuilder {

  int? columnCnt;
  List<Widget>? children;

  TableBuilder({this.columnCnt,this.children});

  List<TableRow> build(){

    if (children==null) return [TableRow(children : [TableCell(child:Text(""))])];

    List<TableRow> rows = <TableRow>[];

    for(int i= 0; i< children!.length ; ){
      List<TableCell> cols = <TableCell>[];

      for(int j=0;j<columnCnt!;j++){
        if(i < children!.length) {
          cols.add(TableCell(child: children![i]));
        }else{
          cols.add(TableCell(child:Text("")));
        }
        i++;
      }
      rows.add(TableRow(children : cols));
    }

    return rows;

  }

}
import 'package:flutter/material.dart';
import 'package:yollet/UI/template.dart';


class RadioList extends StatefulWidget {
  final List<RadioModel>? radioList;
  final Color bgColor;
  double? width;
  final ValueChanged<String?>? onChanged;
  RadioList({this.radioList,this.bgColor = ThemeColors.white,this.width,this.onChanged}){
    this.width??=264.w;
  }

  @override
  _RadioListState createState() => _RadioListState();
}

class _RadioListState extends State<RadioList> {

  @override
  void initState() {
    super.initState();
    int isSelectedCount = 0;
    for(RadioModel item in widget.radioList!){
      if(item.isSelected){
        isSelectedCount++;
      }
    }
    if(isSelectedCount!=1){
      widget.radioList!.forEach((element) {element.isSelected=false;});
      widget.radioList!.first.isSelected=true;
    }
    // RadioModel selectedItem = widget.radioList.firstWhere((element) => element.isSelected);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width:widget.width,
        // height: 50.0.h*widget.radioList!.length,
        color:ThemeColors.white,
        child:
        Container(
            color: widget.bgColor,
            child: ListView.builder(
              itemCount: widget.radioList!.length,
              itemBuilder: (BuildContext context, int index) {
                return  InkWell(
                  // splashColor: ThemeColors.sub_color_orange,
                  onTap: () {
                    setState(() {
                      widget.radioList!.forEach((element) => element.isSelected = false);
                      widget.radioList![index].isSelected = true;
                      if(widget.onChanged!=null) {
                        widget.onChanged!(widget.radioList![index].value);
                      }
                    });
                  },
                  child:  RadioItem(widget.radioList![index],(v){
                    widget.radioList!.forEach((element) => element.isSelected = false);
                    widget.radioList![index].isSelected = true;
                    if(widget.onChanged!=null) {
                      widget.onChanged!(widget.radioList![index].value);
                    }
                  }),
                );
              },
            ))
    );
  }

}

class RadioItem extends StatelessWidget {
  final RadioModel _item;
  final ValueChanged<bool>? onChanged;
  RadioItem(this._item,this.onChanged);
  @override
  Widget build(BuildContext context) {
    return
      Container(
          height: 50.0.h,
         // width: 207.0,
        // decoration: BoxDecoration(
        //   border: Border(
        //     bottom: Divider.createBorderSide(context, width: 1.0, color:ThemeColors.gray_100),
        //   ),
        // ),
         padding: EdgeInsets.all(2.w),
        child: Row(children: [
          CircleCheckbox(
            buttonSize: 24.w,
            size: 20.w,
            value: _item.isSelected,
              activeColor:ThemeColors.theme_400,
              borderColor:ThemeColors.theme_400,
             onChanged: onChanged,
          ),
          SizedBox(width: 12.w),
          SizedText(height:18.h,text: _item.title,textStyle:ThemeTextStyles.SettingItem ,),
        ],),
      );
  }
}


class RadioModel {
  bool isSelected;
  final String? title;
  final String? value;

  RadioModel({this.isSelected=false, this.title,this.value});
}
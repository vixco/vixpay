import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:yollet/Data/Dataset/NotificationInfo.dart';
import 'package:yollet/Mgr/redux/state.dart';
import 'package:yollet/UI/template.dart';
import 'package:yollet/themeStyle.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultBody(Body(),appBarWidget: CustomAppBar(title: "notification",),paddingTop: 0,paddingLR: 0,),
      // bottomSheet: Footer(),
    );
  }
}

class Body extends StatefulWidget {

  @override
  BodyState createState() => BodyState();
}

class BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, YolletState>(
        converter: (store) => store.state.yolletState,
        builder: (_, YolletState state) =>Container(color:ThemeColors.white,
          child: Container(
//      width: 488,
            height:  MediaQuery.of(context).size.height-88.h,
            child:
            ListView(
              children: getList(state),
            ),
          ),
        )
    );
  }


  List<Widget> getList(state)  {
    List<Widget> list =[];
    for(NotificationInfo info in state.notificationList){
      list.add(
        NotificationItemWidget(
          date: info.date,
          title: info.title,
          contents: info.contents,
          onTap: () async {
            // await appStore.dispatch(SetNotificationID(id: info.id));
            // await appStore.dispatch(NavigateToAction(to: AppRoutes.notificationDetail));
          }
          ,),
      );
      list.add(Divider(height: 1.h, thickness: 1, color: ThemeColors.gray_100,));
    }

    // List dummy =[
    //   NotificationInfo(id:"2",title:"Welcome",contents:"Welcome \n Yollet App",date:"21. 03. 15. 10:00:05"),
    //   NotificationInfo(id:"1",title:"Open",contents:"Yollet App",date:"21. 03. 15. 10:00:03"),
    // ] ;
    //
    // for(NotificationInfo info in dummy){
    //   list.add(
    //     NotificationItemWidget(
    //       date: info.date,
    //       title: info.title,
    //       contents: info.contents,
    //       onTap: () async {
    //         // await appStore.dispatch(SetNotificationID(id: info.id));
    //         // await appStore.dispatch(NavigateToAction(to: AppRoutes.notificationDetail));
    //       }
    //       ,),
    //   );
    //   list.add(Divider(height: 1.h, thickness: 1, color: ThemeColors.gray_100,));
    // }
    return list;
  }
}



class NotificationItemWidget extends StatelessWidget {
  final String? date;
  final String? title;
  final String? contents;
  final GestureTapCallback? onTap;

  const NotificationItemWidget({Key? key, this.date, this.title, this.contents, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  InkWell(
        onTap:onTap,
        child:Container(
            width:MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(vertical: 20.w,horizontal: 20.h),
            child:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedText(height:15.h,text: date,textStyle:ThemeTextStyles.notificationItemDate ,),
                    SizedBox(height: 12.h,),
                    SizedText(height:21.h,text: title,textStyle:ThemeTextStyles.notificationItemTitle ,),
                    SizedText(width:286.w,text: contents,textStyle:ThemeTextStyles.notificationItemContents ,maxLines:2 ,overflow:TextOverflow.ellipsis),
                  ],),
                Padding(padding: EdgeInsets.only(left: 10.w),
                    child:SizedBox(width:20.w,height:20.h,child:
                    Icon(YolletIcons.right, color: ThemeColors.gray_300,size: 18.w,),)
                )
              ],
            )
        )
    );
  }
}

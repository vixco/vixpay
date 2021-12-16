import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import 'package:yollet/UI/template.dart';

class SampleWidget5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultBody(Body(),appBarWidget: CustomAppBar(title: "ddd",),paddingLR:0),
      bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }
}

class Body extends StatefulWidget {

  @override
  BodyState createState() => BodyState();
}

class BodyState extends State<Body> {
  @override
  void initState() {
    super.initState();
  }

  // @override
  //  Widget build(BuildContext context) {
  //    return Container(color:ThemeColors.cool_gray_500,
  //      child:          Column(
  //        children: <Widget>[
  //          Swiper(
  //            itemBuilder: (BuildContext context, int index) {
  //              return Image.network(
  //                "http://via.placeholder.com/288x188",
  //                fit: BoxFit.fill,
  //              );
  //            },
  //            itemCount: 10,
  //            viewportFraction: 0.8,
  //            scale: 0.9,
  //          )
  //        ],
  //      ),
  //      );
  //  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 400,
      // child:  CustomScrollView(
      //     slivers: <Widget>[
      //       SliverList(
      //           delegate: SliverChildBuilderDelegate((c, i) {
      //             return Column(
      //               mainAxisSize: MainAxisSize.min,
      //               children: <Widget>[
      //                 SizedBox(height: 50,),
      //                 SizedBox(
      //                   height: 200.0,
      //                   child: Swiper(
      //                       outer: true,
      //                       fade: 0.8,
      //                       viewportFraction: 0.8,
      //                       scale: 0.8,
      //                       itemBuilder: (c, i) {
      //                         return Container(
      //                           width: 50,
      //                           color: Colors.grey,
      //                           child: Text("$i"),
      //                         );
      //                       },
      //                       // pagination:
      //                       //     new SwiperPagination(alignment: Alignment.topCenter),
      //                       itemCount: 10),
      //                 ),
      //               ],
      //             );
      //           }, childCount: 1))
      //     ],
      //   ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(height: 50,),
          SizedBox(
            height: 200.0,
            child: Swiper(
                outer: true,
                fade: 0.8,
                viewportFraction: 0.8,
                scale: 0.8,
                itemBuilder: (c, i) {
                  return Container(key: GlobalKey(),
                    width: 50,
                    color: Colors.grey,
                    child: Text("$i"),
                  );
                },
                // pagination:
                //     new SwiperPagination(alignment: Alignment.topCenter),
                itemCount: 10),
          ),
        ],
      ),
    );
  }
}



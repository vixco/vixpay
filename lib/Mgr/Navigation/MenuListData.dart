import 'package:flutter/material.dart';
import 'package:yollet/Mgr/Navigation/app_routes.dart';
import 'package:yollet/UI/template.dart';

class MenuDataList {
  static List getMenuList(BuildContext context , {bool isDrawer = false}) {
    List menuList =[];
    menuList.clear();

    menuList.add(
      MenuData(menuTitle: "intro", menuLink: AppRoutes.intro, icon: YoshopIcons.y0605_config),
    );
    menuList.add(
      MenuData(menuTitle: "login", menuLink: AppRoutes.login ,icon: YoshopIcons.y0606_drawer ),
    );
    menuList.add(
      MenuData(menuTitle: "signup", menuLink: AppRoutes.signUp, icon: Icons.web),
    );
    menuList.add(
      MenuData(menuTitle: "main", menuLink: AppRoutes.home, icon: Icons.web),
    );
    menuList.add(
      MenuData(menuTitle: "create_account", menuLink: AppRoutes.createAccount, icon: Icons.web),
    );
    menuList.add(
      MenuData(menuTitle: "add_payment_method", menuLink: AppRoutes.createWallet, icon: Icons.web),
    );
    // menuList.add(
    //   MenuData(menuTitle: "sample_1", menuLink: AppRoutes.sample1, icon: YoshopIcons.y0604_border),
    // );
    // menuList.add(
    //   MenuData(menuTitle: "sample_2", menuLink: AppRoutes.sample2, icon: YoshopIcons.y0605_config),
    // );
    // menuList.add(
    //   MenuData(menuTitle: "sample_3", menuLink: AppRoutes.sample3 ,icon: YoshopIcons.y0606_drawer ),
    // );
    // menuList.add(
    //    MenuData(menuTitle: "sample_4", menuLink: AppRoutes.sample4, icon: Icons.web),
    //  );
    // menuList.add(
    //   MenuData(menuTitle: "sample_5", menuLink: AppRoutes.sample5, icon: YoshopIcons.y0604_border),
    // );
    menuList.add(
      MenuData(menuTitle: "sample_6", menuLink: AppRoutes.sample6, icon: YoshopIcons.y0604_border),
    );
    return menuList;
  }

}

class MenuData {
  //기본정보
  String menuTitle;
  String menuLink;
  Color bgColor;
  TextStyle? textStyle;
  IconData icon;


  MenuData(
      {this.menuTitle = "",
      this.menuLink = "",
      this.icon = Icons.blur_circular,
      this.bgColor = ThemeColors.theme_400,
      this.textStyle}){
    textStyle ??= ThemeTextStyles.BottomButton;
  }

}

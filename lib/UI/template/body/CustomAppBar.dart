import 'package:flutter/material.dart';
import 'package:yollet/Mgr/redux/action.dart';
import 'package:yollet/Mgr/redux/state.dart';
import 'package:yollet/UI/template.dart';

class OrangeAppBar extends AppBar {
  OrangeAppBar({
    required context,
    key,
    leading,
    automaticallyImplyLeading = true,
    titleText,
    actions,
    flexibleSpace,
    bottom,
    elevation = 4.0,
    shape,
    backgroundColor = ThemeColors.dark,
    brightness,
    iconTheme = ThemeTextStyles.APPBAR_TITLE_ICON,
    actionsIconTheme,
    textTheme,
    primary = true,
    centerTitle = true,
    titleSpacing = NavigationToolbar.kMiddleSpacing,
    toolbarOpacity = 1.0,
    bottomOpacity = 1.0,
  }) : super(
          key: key,
          leading: leading,
          automaticallyImplyLeading: automaticallyImplyLeading,
          title:AutoSizeText(
            AppLocalizations.of(context)!.getString(titleText),
            style: ThemeTextStyles.h5White33,
          ),
          actions: actions,
          flexibleSpace: flexibleSpace,
          bottom: bottom,
          elevation: elevation,
          shape: shape,
          backgroundColor: backgroundColor,
          brightness: brightness,
          iconTheme: iconTheme,
          actionsIconTheme: actionsIconTheme,
          textTheme: textTheme,
          primary: primary,
          centerTitle: centerTitle,
          titleSpacing: titleSpacing,
          toolbarOpacity: toolbarOpacity,
          bottomOpacity: bottomOpacity,
        );
}

class OrangeAppBarTablet extends AppBar with PreferredSizeWidget {
  //Tablet Default Appbar Size = 64
  @override
  get preferredSize => Size.fromHeight(36.0 * 2.0);

  OrangeAppBarTablet({
    required context,
    key,
    leading,
    automaticallyImplyLeading = true,
    titleText,
    actions,
    flexibleSpace,
    bottom,
    elevation = 4.0,
    shape,
    backgroundColor = ThemeColors.dark,
    brightness,
    iconTheme = ThemeTextStyles.APPBAR_TITLE_ICON,
    actionsIconTheme= ThemeTextStyles.APPBAR_TITLE_ICON,
    textTheme,
    primary = true,
    centerTitle = true,
    titleSpacing = NavigationToolbar.kMiddleSpacing,
    toolbarOpacity = 1.0,
    bottomOpacity = 1.0,
    onPressed,
  }) : super(
          key: key,
          leading: leading,
          /*
          leading: Container(
              padding: EdgeInsets.only(top: 4),
              child: IconButton(
                icon: Icon(Icons.menu, size: 44, color: Colors.white),
                onPressed: () {Scaffold.of(context).openDrawer();},
              )),
          */
          automaticallyImplyLeading: automaticallyImplyLeading,
          title: Container(
            padding: EdgeInsets.only(top: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                  iconSize: 24.0,
                  padding: EdgeInsets.only(right: 8),
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: ThemeColors.white,
                  ),
                  onPressed: onPressed ??
                      () {
                        appStore.dispatch(NavigateToAction(to: 'up'));
                      },
                ),
               AutoSizeText(
                  AppLocalizations.of(context)!.getString(titleText),
                  style: ThemeTextStyles.h5White33,
                )
              ],
            ),
          ),

          actions: actions ??
              <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 16.0),
                  child: IconButton(
                    iconSize: 40.0,
                    padding: EdgeInsets.only(right: 8),
                    icon: Icon(
                      YoshopIcons.y0204_numpad,
                      color: ThemeColors.brownish_grey,
                    ),
                    onPressed: () {
//          appStore.dispatch(NavigateToAction(to: 'up'));
                    },
                  ),
                ),
                Container(width: 20.0, child:AutoSizeText("")),
                Container(
                  padding: EdgeInsets.only(top: 16.0),
                  child: IconButton(
                    iconSize: 44.0,
                    padding: EdgeInsets.only(right: 8),
                    icon: Icon(
//                      Icons.help,
                      YoshopIcons.y0203_calculator,
                      color: ThemeColors.brownish_grey,
                    ),
                    onPressed: () {
//          appStore.dispatch(NavigateToAction(to: 'up'));
                    },
                  ),
                ),
                Container(width: 8.0, child:AutoSizeText("")),
              ],
          flexibleSpace: flexibleSpace,
          bottom: bottom,
          elevation: elevation,
          shape: shape,
          backgroundColor: backgroundColor,
          brightness: brightness,
          iconTheme: iconTheme,
          actionsIconTheme: actionsIconTheme,
          textTheme: textTheme,
          primary: primary,
          centerTitle: centerTitle,
          titleSpacing: titleSpacing,
          toolbarOpacity: toolbarOpacity,
          bottomOpacity: bottomOpacity,
        );
}

class transparentAppBar extends AppBar {
  transparentAppBar({
    key,
    leading,
    automaticallyImplyLeading = true,
    title,
    actions,
    flexibleSpace,
    bottom,
    elevation,
    shape,
    backgroundColor = Colors.transparent,
    brightness,
    iconTheme,
    actionsIconTheme,
    textTheme,
    primary = true,
    centerTitle,
    titleSpacing = NavigationToolbar.kMiddleSpacing,
    toolbarOpacity = 1.0,
    bottomOpacity = 1.0,
  }) : super(
          key: key,
          leading: leading,
          automaticallyImplyLeading: automaticallyImplyLeading,
          title: title,
          actions: actions,
          flexibleSpace: flexibleSpace,
          bottom: bottom,
          elevation: elevation,
          shape: shape,
          backgroundColor: backgroundColor,
          brightness: brightness,
          iconTheme: iconTheme,
          actionsIconTheme: actionsIconTheme,
          textTheme: textTheme,
          primary: primary,
          centerTitle: centerTitle,
          titleSpacing: titleSpacing,
          toolbarOpacity: toolbarOpacity,
          bottomOpacity: bottomOpacity,
        );
}

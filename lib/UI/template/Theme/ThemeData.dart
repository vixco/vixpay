import 'package:flutter/material.dart';
import 'package:yollet/UI/template.dart';

final ThemeData kTheme = _buildTheme().copyWith();

ThemeData _buildTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    //fontFamily: "NotoSans",
    accentColor: ThemeColors.white,
    primaryColor: ThemeColors.theme_500,
    backgroundColor: ThemeColors.BodyBg,
    scaffoldBackgroundColor: ThemeColors.BodyBg,
    cardColor: ThemeColors.white,
    textSelectionColor: ThemeColors.theme_500,
    errorColor: ThemeColors.error,
    textTheme: _buildShrineTextTheme(base.textTheme),
    primaryTextTheme: _buildShrineTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildShrineTextTheme(base.accentTextTheme),
    appBarTheme: _buildAppBarTheme(base.appBarTheme),
    // ignore: duplicate_named_argument
    buttonTheme: _buildButtonTheme(base.buttonTheme),
    inputDecorationTheme: _buildInputDecoTheme(base.inputDecorationTheme),
    cardTheme: _buildCardTheme(base.cardTheme),
    iconTheme: ThemeTextStyles.APPBAR_TITLE_ICON,

    // TODO: Add the text themes (103)
    // TODO: Add the icon themes (103)
    // TODO: Decorate the inputs (103)
  );
}

CardTheme _buildCardTheme(CardTheme base) {
  return base.copyWith(
    //clipBehavior: Clip.antiAlias,
    //elevation: 0.0,
    color: Colors.transparent,
    //margin: EdgeInsets.all(4.0),
  );
}

ButtonThemeData _buildButtonTheme(ButtonThemeData base) {
  return base.copyWith(
    buttonColor: ThemeColors.theme_500,
    //textTheme: ButtonTextTheme.normal,
    padding: EdgeInsets.only(top: 0, bottom: 0),
    //shape :  new CircleBorder(),
    shape:  RoundedRectangleBorder(
        borderRadius:  BorderRadius.circular(100.w)),
  );
}



InputDecorationTheme _buildInputDecoTheme(InputDecorationTheme base) {
  return base.copyWith(
    focusColor: ThemeColors.theme_400,
    fillColor: ThemeColors.gray_200,
      // focusedBorder : base.focusedBorder.copyWith(borderSide:BorderSide(color: ThemeColors.orange_400,) )
  );
}

AppBarTheme _buildAppBarTheme(AppBarTheme base) {
  return base.copyWith(
    color: ThemeColors.theme_500,
    elevation: ThemeSizeStyle.TopBottomElevation2,
    iconTheme: ThemeTextStyles.APPBAR_TITLE_ICON,
    //textTheme: base.textTheme.copyWith(
    //TextStyle display4,
    //TextStyle display3,
    //TextStyle display2,
    //TextStyle display1,
    //TextStyle headline,
    //TextStyle title,
    //TextStyle subhead,
    //TextStyle body2,
    //TextStyle body1,
    //TextStyle caption,
    //TextStyle button,
    //TextStyle subtitle,
    //TextStyle overline,
    //title: ThemeTextStyles.GRAYAPPBAR_TITLE,
    //     headline: ThemeTextStyles.DARK_APPBAR_TITLE));
  );
}

// TODO: Build a Shrine Text Theme (103)
TextTheme _buildShrineTextTheme(TextTheme base) {
  return base.copyWith(
    // headline: base.headline!.copyWith(
    //   fontWeight: FontWeight.w500,
    // ),
    caption: base.caption!.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 14.0,
    ),
    button: ThemeTextStyles.PopupButton.apply(fontSizeDelta: 2),
  )
      .apply(
    fontFamily: 'NotoSans',
    displayColor: ThemeColors.txtMainBlack,
    bodyColor: ThemeColors.txtMainBlack,
    //displayColor: ReplyOrange,
    //bodyColor: kShrineErrorRed,
  )
      .copyWith(
    headline6: ThemeTextStyles.Error.copyWith(color: ThemeColors.txtMainWhite),
  );
}
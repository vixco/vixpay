import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThemeValue {
  static String? language = "ko";
  static const bool isTablet = false;
}

class ThemeColors {
  static const black = const Color(0xff000000);
  static const white = const Color(0xffffffff);
  static const error = const Color(0xffef4444);
  static const gray_5 = const Color(0xfffafafa);
  static const gray_100 = const Color(0xfff4f4f5);
  static const gray_200 = const Color(0xffe4e4e7);
  static const gray_300 = const Color(0xffd4d4d8);
  static const gray_400 = const Color(0xffa1a1aa);
  static const gray_450 = const Color(0xff9b9b9b);
  static const gray_500 = const Color(0xff71717a);
  static const gray_600 = const Color(0xff52525b);
  static const gray_700 = const Color(0xff3f3f46);
  static const gray_800 = const Color(0xff27272a);
  static const gray_900 = const Color(0xff18181b);
  static const orange_50 = const Color(0xfffff7ed);
  static const orange_100 = const Color(0xffffedd5);
  static const orange_200 = const Color(0xfffed7aa);
  static const orange_300 = const Color(0xfffdba74);
  static const orange_400 = const Color(0xfffb923c);
  static const orange_500 = const Color(0xfff97316);
  static const orange_600 = const Color(0xffea580c);
  static const orange_700 = const Color(0xffc2410c);
  static const orange_800 = const Color(0xff9a3412);
  static const orange_900 = const Color(0xff7c2d12);
  static const green_400 = const Color(0xff34d399);
  static const indigo_500 = const Color(0xff6366f1);
  static const emerald_50 = const Color(0xffecfdf5);
  static const emerald_100 = const Color(0xffd1fae5);
  static const emerald_200 = const Color(0xffa7f3d0);
  static const emerald_300 = const Color(0xff6ee7b7);
  static const emerald_400 = const Color(0xff34d399);
  static const emerald_500 = const Color(0xff10b981);
  static const emerald_600 = const Color(0xff059669);
  static const emerald_700 = const Color(0xff047857);
  static const emerald_800 = const Color(0xff065f46);
  static const emerald_900 = const Color(0xff064e3b);
  static const cyan_50 = const Color(0xffecfeff);
  static const cyan_100 = const Color(0xffcffafe);
  static const cyan_200 = const Color(0xffa5f3fc);
  static const cyan_300 = const Color(0xff67e8f9);
  static const cyan_400 = const Color(0xff22d3ee);
  static const cyan_500 = const Color(0xff06b6d4);
  static const cyan_600 = const Color(0xff0891b2);
  static const cyan_700 = const Color(0xff0e7490);
  static const cyan_800 = const Color(0xff155e75);
  static const cyan_900 = const Color(0xff164e63);

  static const theme_50 = cyan_50;
  static const theme_100 = cyan_100;
  static const theme_200 = cyan_200;
  static const theme_300 = cyan_300;
  static const theme_400 = cyan_400;
  static const theme_500 = cyan_500;
  static const theme_600 = cyan_600;
  static const theme_700 = cyan_700;
  static const theme_800 = cyan_800;
  static const theme_900 = cyan_900;

  // static const sub_color_orange = const Color(0xffed8d35);
  // static const sub_color_sky_blue = const Color(0xff4eacb9);
  // static const sub_color_purple = const Color(0xff8948da);
  // static const sub_color_wine = const Color(0xffa00058);
  // static const sub_color_gray = const Color(0xffaeaeb4);
  // static const sub_color =  [ThemeColors.sub_color_orange,ThemeColors.sub_color_sky_blue,ThemeColors.sub_color_purple,ThemeColors.sub_color_wine,ThemeColors.sub_color_gray];
  static const sub_color_sky_blue = const Color(0xff72c5e7);
  static const sub_color_yellow = const Color(0xffFFAC38);
  static const sub_color_pink = const Color(0xfffb6666);
  static const sub_color_navy = const Color(0xff053b6d);
  static const sub_color_gray = const Color(0xffaeaeb4);
  static const sub_color_light_gray = const Color(0xfff1f1f1);

  static const sub_color = [
    ThemeColors.sub_color_sky_blue,
    ThemeColors.sub_color_yellow,
    ThemeColors.sub_color_pink,
    ThemeColors.sub_color_navy,
    ThemeColors.sub_color_gray
  ];

  static const cool_gray_500 = const Color(0xffaeaeb4);
  static const checkedCircle = theme_100;
  static const checked = theme_400;
  static const notiPoint = const Color(0xffff2060);
  static const dark_gray = const Color(0xff2e2e2e);
  static const transparent = const Color(0x00000000);
  static const received = const Color(0xff2dd4bf);
  static const toggleOn = const Color(0xff6bd6a0);
  static const popupContextBackGround = const Color(0xffc4c4c4);
  static const appName = const Color(0xff292524);

  // static const white = const Color(0xffffffff);
  static const orangey_red = const Color(0xfff44336);
  static const brownish_grey_shadow = const Color(0xff707070);
  static const slate = const Color(0xff607d8b); //bluegray - SubAppBar
  static const dark = const Color(0xff37474f); //charcoal_grey - AppBar등
  static const light_blue_grey = const Color(0xffcfd8dc);
  static const very_light_pink_box = const Color(0xffeeeeee);
  static const very_light_pink_two =
      const Color(0xffeeeeee); //<-- 이 변수를 없애고  pink_box로 사용(소스 수정)
  static const egg_shell = const Color(0xfffff9c4);
  static const tangerine = const Color(0xffff6f00);
  static const marigold = const Color(0xffffd740); //maize  : 선택된 버튼에 사용
  static const very_light_pink = const Color(0xffd8d8d8);
  static const brownish_grey = const Color(0xff757575);
  static const brown_grey = const Color(0xff9e9e9e);
  static const bluey_grey = const Color(0xff90a4ae); //bluey_grey : sub 버튼
  // static const black = const Color(0xff212121);
  static const black09 = const Color(0xcc000000); //Black 투명임.. 소스에서 사용하는곳 검토
  static const white_tab = const Color(0xfff5f5f5);
  static const blue_grey = const Color(0xff78909c);
  static const tangerine_two = const Color(0xffff8f00);
  static const turtle_green = const Color(0xff8bc34a);
  static const dark_mustard = const Color(0xffad8706);
  static const bluish_two = const Color(0xff2881a8);
  static const fill_ligiht_gray = brown_grey;
  static const fill_black = const Color(0xff212121);
  static const green_three = const Color(0xff6fcf97);

  static const marwhite_two = const Color(0xffffffff); //white

  static const ReplyBlue1000 = const Color(0xFF1A1B2F);
  static const ReplyBlue900 = const Color(0xFF2D2E4A);
  static const ReplyBlue800 = const Color(0xFF393E63);
  static const ReplyBlue700 = const Color(0xFF414770);
  static const ReplyBlue600 = const Color(0xFF49517C);
  static const ReplyBlue500 = const Color(0xFF505984);
  static const ReplyBlue400 = const Color(0xFF687194); //Divider Line Color로 사용함
  static const ReplyBlue300 = const Color(0xFF828AA6);
  static const ReplyBlue200 = const Color(0xFFA4ABC0);
  static const ReplyBlue100 = const Color(0xFFC7CCDA);
  static const ReplyBlue50 = const Color(0xFFE9EBEF);
  static const ReplyBlueYunTxt = const Color(0xFF7073FF);
  static const ReplyBlueYunSelectedBox = const Color(0xFFCECFF0);
  static const ReplyBlueYunTouchBg = const Color(0xFFDFE0FF);
  static const ReplyBlueYunMainFocus = const Color(0xFF3C3E70);
  static const txtMainWhite = const Color(0xFFFFFFFF);
  static const txtWhite70 = const Color(0xB3FFFFFF);
  static const txtMediumWhite = const Color(0x6BFFFFFF);
  static const txtDisableWhite = const Color(0x29FFFFFF);
  static const txtMainBlack = const Color(0xDE000000);
  static const txtBlack70 = const Color(0xB3000000);
  static const txtMediumBlack = const Color(0x6B000000);
  static const txtDisableBlack = const Color(0x29000000);
  static const ReplyBlue = ReplyBlue500; //800
  static const DividerLineColor = ReplyBlue200;
  static const BodyBg = txtMainWhite;
  static const ReplyBg = ReplyBlue50;
  static const ReplySurfaceWhite = txtMainWhite;

  static const black_212322 = const Color(0xff212322);
  static const black_3f3f46 = const Color(0xff3f3f46);
  static const grey_a1a1aa = const Color(0xffa1a1aa);
  static const black_3b3d3c = const Color(0xff3b3d3c);
  static const grey_c4c4c4 = const Color(0xffc4c4c4);
  static const grey_f6f6f6 = const Color(0xfff6f6f6);
  static const color_F9F9FA = const Color(0xfff9f9f4);
}

mixin ThemeFontWeight implements FontWeight {
  /// Thin, the least thick
  static const thin = FontWeight.w100;

  /// Extra-light
  static const extraLight = FontWeight.w200;

  /// Light
  static const light = FontWeight.w300;

  /// Normal / regular / plain
  static const normal = FontWeight.w400;
  static const regular = FontWeight.w400;
  static const plain = FontWeight.w400;

  /// Medium
  static const medium = FontWeight.w500;

  /// Semi-bold
  static const semiBold = FontWeight.w600;

  /// Bold
  static const bold = FontWeight.w700;

  /// Extra-bold
  static const extraBold = FontWeight.w800;

  /// Black, the most thick
  static const black = FontWeight.w900;

  /// The default font weight.
// static const FontWeight normal = w400;

  /// A commonly used font weight that is heavier than normal.
// static const FontWeight bold = w700;

}

class ThemeFontStylesKor {
  // static const size = 4;
  static TextStyle kr40Bold = TextStyle(
      color: ThemeColors.black,
      fontWeight: ThemeFontWeight.bold,
      fontFamily: "SpoqaBold",
      fontStyle: FontStyle.normal,
      fontSize: ScreenUtil().setSp(
        40,
      ));
  static TextStyle kr36Bold = TextStyle(
      color: ThemeColors.black,
      fontWeight: ThemeFontWeight.bold,
      fontFamily: "SpoqaBold",
      fontStyle: FontStyle.normal,
      fontSize: ScreenUtil().setSp(
        36,
      ));
  static TextStyle kr32Bold = TextStyle(
      color: ThemeColors.black,
      fontWeight: ThemeFontWeight.bold,
      fontFamily: "SpoqaBold",
      fontStyle: FontStyle.normal,
      fontSize: ScreenUtil().setSp(
        32,
      ));
  static TextStyle kr32Regular = TextStyle(
      color: ThemeColors.black,
      fontWeight: ThemeFontWeight.regular,
      fontFamily: "SpoqaRegular",
      fontStyle: FontStyle.normal,
      fontSize: ScreenUtil().setSp(
        32,
      ));
  static TextStyle kr28Bold = TextStyle(
      color: ThemeColors.black,
      fontWeight: ThemeFontWeight.bold,
      fontFamily: "SpoqaBold",
      fontStyle: FontStyle.normal,
      fontSize: ScreenUtil().setSp(
        28,
      ));
  static TextStyle kr28Medium = TextStyle(
      color: ThemeColors.black,
      fontWeight: ThemeFontWeight.medium,
      fontFamily: "SpoqaMedium",
      fontStyle: FontStyle.normal,
      fontSize: ScreenUtil().setSp(
        28,
      ));
  static TextStyle kr28Regular = TextStyle(
      color: ThemeColors.black,
      fontWeight: ThemeFontWeight.regular,
      fontFamily: "SpoqaRegular",
      fontStyle: FontStyle.normal,
      fontSize: ScreenUtil().setSp(
        28,
      ));
  static TextStyle kr24Regular = TextStyle(
      color: ThemeColors.black,
      fontWeight: ThemeFontWeight.regular,
      fontFamily: "SpoqaRegular",
      fontStyle: FontStyle.normal,
      fontSize: ScreenUtil().setSp(
        24,
      ));
  static TextStyle kr24Medium = TextStyle(
      color: ThemeColors.black,
      fontWeight: ThemeFontWeight.medium,
      fontFamily: "SpoqaMedium",
      fontStyle: FontStyle.normal,
      fontSize: ScreenUtil().setSp(
        24,
      ));
  static TextStyle kr24Bold = TextStyle(
      color: ThemeColors.black,
      fontWeight: ThemeFontWeight.bold,
      fontFamily: "SpoqaBold",
      fontStyle: FontStyle.normal,
      fontSize: ScreenUtil().setSp(
        24,
      ));

  static TextStyle kr22Medium = TextStyle(
      color: ThemeColors.black,
      fontWeight: ThemeFontWeight.medium,
      fontFamily: "SpoqaMedium",
      fontStyle: FontStyle.normal,
      fontSize: ScreenUtil().setSp(
        22,
      ));

  static TextStyle kr20Bold = TextStyle(
      color: ThemeColors.black,
      fontWeight: ThemeFontWeight.bold,
      fontFamily: "SpoqaBold",
      fontStyle: FontStyle.normal,
      fontSize: ScreenUtil().setSp(
        20,
      ));
  static TextStyle kr20Medium = TextStyle(
      color: ThemeColors.black,
      fontWeight: ThemeFontWeight.medium,
      fontFamily: "SpoqaMedium",
      fontStyle: FontStyle.normal,
      fontSize: ScreenUtil().setSp(
        20,
      ));

  static TextStyle kr18Bold = TextStyle(
      color: ThemeColors.black,
      fontWeight: ThemeFontWeight.bold,
      fontFamily: "SpoqaBold",
      fontStyle: FontStyle.normal,
      fontSize: ScreenUtil().setSp(
        18,
      ));
  static TextStyle kr18Medium = TextStyle(
      color: ThemeColors.black,
      fontWeight: ThemeFontWeight.medium,
      fontFamily: "SpoqaMedium",
      fontStyle: FontStyle.normal,
      fontSize: ScreenUtil().setSp(
        18,
      ));
  static TextStyle kr17Medium = TextStyle(
      color: ThemeColors.black,
      fontWeight: ThemeFontWeight.medium,
      fontFamily: "SpoqaMedium",
      fontStyle: FontStyle.normal,
      fontSize: ScreenUtil().setSp(
        17,
      ));
  static TextStyle kr16Medium = TextStyle(
      color: ThemeColors.black,
      fontWeight: ThemeFontWeight.medium,
      fontFamily: "SpoqaMedium",
      fontStyle: FontStyle.normal,
      fontSize: ScreenUtil().setSp(
        16,
      ));
  static TextStyle kr16Bold = TextStyle(
      color: ThemeColors.black,
      fontWeight: ThemeFontWeight.bold,
      fontFamily: "SpoqaBold",
      fontStyle: FontStyle.normal,
      fontSize: ScreenUtil().setSp(
        16,
      ));

  static TextStyle kr16Regular = TextStyle(
      color: ThemeColors.black,
      fontWeight: ThemeFontWeight.regular,
      fontFamily: "SpoqaRegular",
      fontStyle: FontStyle.normal,
      fontSize: ScreenUtil().setSp(
        16,
      ));

  static TextStyle kr14Bold = TextStyle(
      color: ThemeColors.black,
      fontWeight: ThemeFontWeight.bold,
      fontFamily: "SpoqaBold",
      fontStyle: FontStyle.normal,
      fontSize: ScreenUtil().setSp(
        14,
      ));

  static TextStyle kr13Bold = TextStyle(
      color: ThemeColors.black,
      fontWeight: ThemeFontWeight.bold,
      fontFamily: "SpoqaBold",
      fontStyle: FontStyle.normal,
      fontSize: ScreenUtil().setSp(
        13,
      ));

  static TextStyle kr14Regular = TextStyle(
      color: ThemeColors.black,
      fontWeight: ThemeFontWeight.regular,
      fontFamily: "SpoqaRegular",
      fontStyle: FontStyle.normal,
      fontSize: ScreenUtil().setSp(
        14,
      ));

  static TextStyle kr13Regular = TextStyle(
      color: ThemeColors.black,
      fontWeight: ThemeFontWeight.regular,
      fontFamily: "SpoqaRegular",
      fontStyle: FontStyle.normal,
      fontSize: ScreenUtil().setSp(
        13,
      ));

  static TextStyle kr12Regular = TextStyle(
      color: ThemeColors.black,
      fontWeight: ThemeFontWeight.regular,
      fontFamily: "SpoqaRegular",
      fontStyle: FontStyle.normal,
      fontSize: ScreenUtil().setSp(
        12,
      ));
  static TextStyle kr12Bold = TextStyle(
      color: ThemeColors.black,
      fontWeight: ThemeFontWeight.bold,
      fontFamily: "SpoqaBold",
      fontStyle: FontStyle.normal,
      fontSize: ScreenUtil().setSp(
        12,
      ));
}

class ThemeFontStylesEng {
  static TextStyle appName22Bold = TextStyle(
      color: ThemeColors.black,
      fontWeight: ThemeFontWeight.bold,
      fontFamily: "PoppinsBold",
      fontStyle: FontStyle.normal,
      fontSize: ScreenUtil().setSp(
        22,
      ));
  static TextStyle appName26Bold = TextStyle(
      color: ThemeColors.black,
      fontWeight: ThemeFontWeight.bold,
      fontFamily: "PoppinsBold",
      fontStyle: FontStyle.normal,
      fontSize: ScreenUtil().setSp(
        26,
      ));
  static TextStyle en40Bold = TextStyle(
      color: ThemeColors.black,
      fontWeight: ThemeFontWeight.bold,
      fontFamily: "RubikBold",
      fontStyle: FontStyle.normal,
      fontSize: ScreenUtil().setSp(
        40,
      ));
  static TextStyle en36Bold = TextStyle(
      color: ThemeColors.black,
      fontWeight: ThemeFontWeight.bold,
      fontFamily: "RubikBold",
      fontStyle: FontStyle.normal,
      fontSize: ScreenUtil().setSp(
        36,
      ));
  static TextStyle en32Bold = TextStyle(
      color: ThemeColors.black,
      fontWeight: ThemeFontWeight.bold,
      fontFamily: "RubikBold",
      fontStyle: FontStyle.normal,
      fontSize: ScreenUtil().setSp(
        32,
      ));
  static TextStyle en32Regular = TextStyle(
      color: ThemeColors.black,
      fontWeight: ThemeFontWeight.regular,
      fontFamily: "RubikRegular",
      fontStyle: FontStyle.normal,
      fontSize: ScreenUtil().setSp(
        32,
      ));
  static TextStyle en28Bold = TextStyle(
      color: ThemeColors.black,
      fontWeight: ThemeFontWeight.bold,
      fontFamily: "RubikBold",
      fontStyle: FontStyle.normal,
      fontSize: ScreenUtil().setSp(
        28,
      ));

  static TextStyle en28Medium = TextStyle(
      color: ThemeColors.black,
      fontWeight: ThemeFontWeight.medium,
      fontFamily: "RubikMedium",
      fontStyle: FontStyle.normal,
      fontSize: ScreenUtil().setSp(
        28,
      ));
  static TextStyle en28Regular = TextStyle(
      color: ThemeColors.black,
      fontWeight: ThemeFontWeight.regular,
      fontFamily: "RubikRegular",
      fontStyle: FontStyle.normal,
      fontSize: ScreenUtil().setSp(
        28,
      ));
  static TextStyle en24Regular = TextStyle(
      color: ThemeColors.black,
      fontWeight: ThemeFontWeight.regular,
      fontFamily: "RubikRegular",
      fontStyle: FontStyle.normal,
      fontSize: ScreenUtil().setSp(
        24,
      ));
  static TextStyle en24Medium = TextStyle(
      color: ThemeColors.black,
      fontWeight: ThemeFontWeight.medium,
      fontFamily: "RubikMedium",
      fontStyle: FontStyle.normal,
      fontSize: ScreenUtil().setSp(
        24,
      ));
  static TextStyle en24Bold = TextStyle(
      color: ThemeColors.black,
      fontWeight: ThemeFontWeight.bold,
      fontFamily: "RubikBold",
      fontStyle: FontStyle.normal,
      fontSize: ScreenUtil().setSp(
        24,
      ));
  static TextStyle en22Medium = TextStyle(
      color: ThemeColors.black,
      fontWeight: ThemeFontWeight.medium,
      fontFamily: "RubikMedium",
      fontStyle: FontStyle.normal,
      fontSize: ScreenUtil().setSp(
        22,
      ));
  static TextStyle en20Bold = TextStyle(
      color: ThemeColors.black,
      fontWeight: ThemeFontWeight.bold,
      fontFamily: "RubikBold",
      fontStyle: FontStyle.normal,
      fontSize: ScreenUtil().setSp(
        20,
      ));

  static TextStyle en20Medium = TextStyle(
      color: ThemeColors.black,
      fontWeight: ThemeFontWeight.medium,
      fontFamily: "RubikMedium",
      fontStyle: FontStyle.normal,
      fontSize: ScreenUtil().setSp(
        20,
      ));
  static TextStyle en18Medium = TextStyle(
      color: ThemeColors.black,
      fontWeight: ThemeFontWeight.medium,
      fontFamily: "RubikMedium",
      fontStyle: FontStyle.normal,
      fontSize: ScreenUtil().setSp(
        18,
      ));
  static TextStyle en18Bold = TextStyle(
      color: ThemeColors.black,
      fontWeight: ThemeFontWeight.bold,
      fontFamily: "RubikBold",
      fontStyle: FontStyle.normal,
      fontSize: ScreenUtil().setSp(
        18,
      ));
  static TextStyle en17Medium = TextStyle(
      color: ThemeColors.black,
      fontWeight: ThemeFontWeight.medium,
      fontFamily: "RubikMedium",
      fontStyle: FontStyle.normal,
      fontSize: ScreenUtil().setSp(
        17,
      ));
  static TextStyle en16Bold = TextStyle(
      color: ThemeColors.black,
      fontWeight: ThemeFontWeight.bold,
      fontFamily: "RubikBold",
      fontStyle: FontStyle.normal,
      fontSize: ScreenUtil().setSp(
        16,
      ));
  static TextStyle en16Medium = TextStyle(
      color: ThemeColors.black,
      fontWeight: ThemeFontWeight.medium,
      fontFamily: "RubikMedium",
      fontStyle: FontStyle.normal,
      fontSize: ScreenUtil().setSp(
        16,
      ));

  static TextStyle en16Regular = TextStyle(
      color: ThemeColors.black,
      fontWeight: ThemeFontWeight.regular,
      fontFamily: "RubikRegular",
      fontStyle: FontStyle.normal,
      fontSize: ScreenUtil().setSp(
        16,
      ));

  static TextStyle en14bold = TextStyle(
      color: ThemeColors.black,
      fontWeight: ThemeFontWeight.bold,
      fontFamily: "RubikBold",
      fontStyle: FontStyle.normal,
      fontSize: ScreenUtil().setSp(
        14,
      ));

  static TextStyle en14Medium = TextStyle(
      color: ThemeColors.black,
      fontWeight: ThemeFontWeight.medium,
      fontFamily: "RubikMedium",
      fontStyle: FontStyle.normal,
      fontSize: ScreenUtil().setSp(
        14,
      ));

  static TextStyle en14Regular = TextStyle(
      color: ThemeColors.black,
      fontWeight: ThemeFontWeight.regular,
      fontFamily: "RubikRegular",
      fontStyle: FontStyle.normal,
      fontSize: ScreenUtil().setSp(
        14,
      ));
  static TextStyle en13Regular = TextStyle(
      color: ThemeColors.black,
      fontWeight: ThemeFontWeight.regular,
      fontFamily: "RubikRegular",
      fontStyle: FontStyle.normal,
      fontSize: ScreenUtil().setSp(
        13,
      ));
  static TextStyle en12Regular = TextStyle(
      color: ThemeColors.black,
      fontWeight: ThemeFontWeight.regular,
      fontFamily: "RubikRegular",
      fontStyle: FontStyle.normal,
      fontSize: ScreenUtil().setSp(
        12,
      ));
  static TextStyle en12Bold = TextStyle(
      color: ThemeColors.black,
      fontWeight: ThemeFontWeight.bold,
      fontFamily: "RubikBold",
      fontStyle: FontStyle.normal,
      fontSize: ScreenUtil().setSp(
        12,
      ));
}

class ThemeFontStyles {
  static bool isKor() {
    return ThemeValue.language == "ko";
  }

  static TextStyle get bold32 =>
      isKor() ? ThemeFontStylesKor.kr32Bold : ThemeFontStylesEng.en32Bold;

  static TextStyle get regular32 =>
      isKor() ? ThemeFontStylesKor.kr32Regular : ThemeFontStylesEng.en32Regular;

  static TextStyle get bold28 =>
      isKor() ? ThemeFontStylesKor.kr28Bold : ThemeFontStylesEng.en28Bold;

  static TextStyle get medium28 =>
      isKor() ? ThemeFontStylesKor.kr28Medium : ThemeFontStylesEng.en28Medium;

  static TextStyle get regular28 =>
      isKor() ? ThemeFontStylesKor.kr28Regular : ThemeFontStylesEng.en28Regular;

  static TextStyle get regular24 =>
      isKor() ? ThemeFontStylesKor.kr24Regular : ThemeFontStylesEng.en24Regular;

  static TextStyle get medium24 =>
      isKor() ? ThemeFontStylesKor.kr24Medium : ThemeFontStylesEng.en24Medium;

  static TextStyle get bold24 =>
      isKor() ? ThemeFontStylesKor.kr24Bold : ThemeFontStylesEng.en24Bold;

  static TextStyle get medium22 =>
      isKor() ? ThemeFontStylesKor.kr22Medium : ThemeFontStylesEng.en22Medium;

  static TextStyle get bold20 =>
      isKor() ? ThemeFontStylesKor.kr20Bold : ThemeFontStylesEng.en20Bold;

  static TextStyle get medium20 =>
      isKor() ? ThemeFontStylesKor.kr20Bold : ThemeFontStylesEng.en20Medium;

  static TextStyle get medium18 =>
      isKor() ? ThemeFontStylesKor.kr18Bold : ThemeFontStylesEng.en18Medium;

  static TextStyle get bold18 =>
      isKor() ? ThemeFontStylesKor.kr18Bold : ThemeFontStylesEng.en18Bold;

  static TextStyle get medium17 =>
      isKor() ? ThemeFontStylesKor.kr17Medium : ThemeFontStylesEng.en17Medium;

  static TextStyle get medium16 =>
      isKor() ? ThemeFontStylesKor.kr16Medium : ThemeFontStylesEng.en16Medium;

  static TextStyle get bold16 =>
      isKor() ? ThemeFontStylesKor.kr16Bold : ThemeFontStylesEng.en16Bold;

  static TextStyle get regular16 =>
      isKor() ? ThemeFontStylesKor.kr16Regular : ThemeFontStylesEng.en16Regular;

  static TextStyle get bold14 =>
      isKor() ? ThemeFontStylesKor.kr14Bold : ThemeFontStylesEng.en14Medium;

  static TextStyle get medium14 =>
      isKor() ? ThemeFontStylesKor.kr14Bold : ThemeFontStylesEng.en14Medium;

  static TextStyle get regular14 =>
      isKor() ? ThemeFontStylesKor.kr14Regular : ThemeFontStylesEng.en14Regular;

  static TextStyle get regular13 =>
      isKor() ? ThemeFontStylesKor.kr13Regular : ThemeFontStylesEng.en13Regular;

  static TextStyle get bold12 =>
      isKor() ? ThemeFontStylesKor.kr12Bold : ThemeFontStylesEng.en12Bold;

  static TextStyle get regular12 =>
      isKor() ? ThemeFontStylesKor.kr12Regular : ThemeFontStylesEng.en12Regular;
}

class ThemeTextStyles {
  static TextStyle Headline = ThemeFontStyles.regular24;
  static TextStyle KeypadNum = ThemeFontStylesEng.en28Medium;
  static TextStyle AppbarTitle = ThemeFontStyles.medium16;
  static TextStyle AppbarTitleTransferComplete = ThemeFontStylesKor.kr16Bold;
  static TextStyle AppbarTitleWhite =
      ThemeFontStyles.medium16.apply(color: ThemeColors.white);
  static TextStyle AppbarMessage =
      ThemeFontStylesKor.kr16Bold.apply(color: ThemeColors.theme_400);
  static TextStyle AppbarActionText =
      ThemeFontStyles.medium16.apply(color: ThemeColors.gray_500);
  static TextStyle InputGroupSubject =
      ThemeFontStyles.medium14.apply(color: ThemeColors.gray_700);
  static TextStyle MainSubject =
      ThemeFontStyles.bold16.apply(color: ThemeColors.gray_700);
  static TextStyle Caption =
      ThemeFontStyles.regular12.apply(color: ThemeColors.gray_700);
  static TextStyle BottomButton =
      ThemeFontStyles.bold14.apply(color: ThemeColors.white);
  static TextStyle DeleteConfirmTitle =
      ThemeFontStyles.regular16.apply(color: ThemeColors.gray_700);
  static TextStyle AccountTransferMiddleButton =
      ThemeFontStyles.regular14.apply(color: ThemeColors.white);
  static TextStyle BtnCardDropdownText =
      ThemeFontStyles.regular14.apply(color: ThemeColors.white);
  static TextStyle PopupButton =
      ThemeFontStyles.medium14.apply(color: ThemeColors.theme_500);
  static TextStyle ToastMessage =
      ThemeFontStyles.medium16.apply(color: ThemeColors.white);
  static TextStyle Error =
      ThemeFontStyles.regular12.apply(color: ThemeColors.error);
  static TextStyle Date =
      ThemeFontStylesEng.en12Regular.apply(color: ThemeColors.gray_400);
  static TextStyle InputText = ThemeFontStyles.medium14;
  static TextStyle introLogin =
      ThemeFontStyles.medium14.apply(color: ThemeColors.theme_600);
  static TextStyle KeepMeLoggedIn = ThemeFontStyles.regular12;
  static TextStyle forgotPassword = ThemeFontStyles.bold12;
  static TextStyle NormalText = ThemeFontStyles.regular14;
  static TextStyle cardName =
      ThemeFontStyles.regular16.apply(color: ThemeColors.white);
  static TextStyle walletCardCurrentTradePrice =
      ThemeFontStyles.medium18.apply(color: ThemeColors.white);
  static TextStyle coinAddress =
      ThemeFontStylesEng.en14Regular.apply(color: ThemeColors.gray_700);
  static TextStyle cardBalance =
      ThemeFontStylesEng.en14Regular.apply(color: ThemeColors.white);
  static TextStyle cardAmount =
      ThemeFontStylesKor.kr28Bold.apply(color: ThemeColors.white);
  static TextStyle cardCurrency =
      ThemeFontStyles.medium20.apply(color: ThemeColors.white);
  static TextStyle WalletCopiedHeader =
      ThemeFontStyles.medium16.apply(color: ThemeColors.white);
  static TextStyle WalletCopiedBody = ThemeFontStyles.regular14.apply(
    color: ThemeColors.white,
  );
  static TextStyle cardCoinName =
      ThemeFontStylesEng.en16Regular.apply(color: ThemeColors.white);
  static TextStyle cardCoinAddress =
      ThemeFontStylesEng.en13Regular.apply(color: ThemeColors.white);
  static TextStyle mainPageAddItem =
      ThemeFontStylesKor.kr14Bold.apply(color: ThemeColors.theme_400);
  static TextStyle CoinListItemText =
      ThemeFontStyles.regular16.apply(color: ThemeColors.dark_gray);
  static TextStyle CoinListItemTextAbbreviation =
      ThemeFontStylesEng.en14Regular.apply(color: ThemeColors.gray_400);
  static TextStyle CoinItemCoinName =
      ThemeFontStylesEng.en14Regular.apply(color: ThemeColors.gray_400);
  static TextStyle CoinItemCoinNamePrice =
      ThemeFontStylesKor.kr14Bold.apply(color: ThemeColors.gray_400);
  static TextStyle CoinItemCoinNamePriceCoin =
      ThemeFontStylesEng.en14Regular.apply(color: ThemeColors.gray_400);
  static TextStyle CoinItemCoinTradePrice =
      ThemeFontStyles.regular12.apply(color: ThemeColors.gray_400);
  static TextStyle SettingGroup =
      ThemeFontStyles.regular14.apply(color: ThemeColors.gray_500);
  static TextStyle SettingAccount =
      ThemeFontStyles.medium14.apply(color: ThemeColors.gray_700);
  static TextStyle SettingItem =
      ThemeFontStyles.regular14.apply(color: ThemeColors.gray_700);
  static TextStyle SettingItemDesc =
      ThemeFontStyles.regular14.apply(color: ThemeColors.gray_400);
  static TextStyle SettingDeleteAccount =
      ThemeFontStyles.regular14.apply(color: ThemeColors.error);

  static TextStyle cardAdd =
      ThemeFontStyles.medium14.apply(color: ThemeColors.white);
  static TextStyle cardMyAccountEmpty =
      ThemeFontStyles.medium14.apply(color: ThemeColors.gray_500);

  static TextStyle mainAccountItemName =
      ThemeFontStyles.regular12.apply(color: ThemeColors.gray_500);
  static TextStyle mainAccountItemBalance = ThemeFontStylesKor.kr18Bold
      .apply(color: ThemeColors.gray_700.withOpacity(0.9));
  static TextStyle mainAccountItemBalanceEmpty =
      ThemeFontStyles.regular14.apply(color: ThemeColors.gray_700);
  static TextStyle mainAccountItemCoinName = ThemeFontStylesEng.en12Regular
      .apply(color: ThemeColors.gray_400); //eng font
  static TextStyle mainAccountItemCurrentBalance =
      ThemeFontStylesEng.en12Regular.apply(color: ThemeColors.gray_400);
  static TextStyle AccountInfoBalance =
      ThemeFontStylesKor.kr36Bold.apply(color: ThemeColors.white);
  static TextStyle AccountInfoBalanceCoin =
      ThemeFontStylesEng.en32Regular.apply(color: ThemeColors.white);
  static TextStyle AccountInfoCurrentBalanceCoin =
      ThemeFontStylesEng.en20Bold.apply(color: ThemeColors.white);
  static TextStyle AccountInfoCurrentBalanceCoinDone =
      ThemeFontStylesKor.kr24Bold;
  static TextStyle AccountInfoCurrentCurrencyBalanceCoin =
      ThemeFontStyles.regular16.apply(color: ThemeColors.white);
  static TextStyle AccountInfoAddress =
      ThemeFontStylesEng.en12Regular.apply(color: ThemeColors.gray_700);
  static TextStyle TransferDetailPopupAddress =
      ThemeFontStylesEng.en14Medium.apply(color: ThemeColors.gray_700);
  static TextStyle transferToggleSelected =
      ThemeFontStyles.medium14.apply(color: ThemeColors.theme_500);
  static TextStyle transferToggleUnselected =
      ThemeFontStyles.regular14.apply(color: ThemeColors.gray_450);

  static TextStyle InputHint =
      ThemeFontStyles.regular12.apply(color: ThemeColors.gray_400);
  static TextStyle TransferType =
      ThemeFontStyles.medium16.apply(color: ThemeColors.gray_700);
  static TextStyle TransferMemo =
      ThemeFontStyles.regular14.apply(color: ThemeColors.theme_400);
  static TextStyle TransferBalance =
      ThemeFontStylesKor.kr16Regular.apply(color: ThemeColors.gray_700);
  static TextStyle TransferCurrentBalance =
      ThemeFontStylesEng.en12Regular.apply(color: ThemeColors.gray_400);
  static TextStyle AccountTransferBalanceZero =
      ThemeFontStylesKor.kr40Bold.apply(color: ThemeColors.gray_300);
  static TextStyle AccountTransferBalance =
      ThemeFontStylesKor.kr40Bold.apply(color: ThemeColors.gray_700);
  static TextStyle AccountTransferBalanceCoin =
      ThemeFontStylesEng.en32Regular.apply(color: ThemeColors.gray_400);

  static TextStyle AccountTransferPopupBalance =
      ThemeFontStylesKor.kr36Bold.apply(color: ThemeColors.gray_700);
  static TextStyle AccountTransferPopupBalanceCoin =
      ThemeFontStylesEng.en28Regular.apply(color: ThemeColors.gray_400);
  static TextStyle AccountTransferPopupAddress =
      ThemeFontStylesEng.en13Regular.apply(color: ThemeColors.gray_500);
  static TextStyle AccountTransferCurrentInfoCurrentTradePrice =
      ThemeFontStylesEng.en12Regular.apply(color: ThemeColors.gray_400);
  static TextStyle AccountTransferPopupSubject =
      ThemeFontStylesEng.en14Regular.apply(color: ThemeColors.gray_400);
  static TextStyle AccountTransferCompletePopupSubject =
      ThemeFontStylesEng.en14Medium.apply(color: ThemeColors.gray_400);
  static TextStyle AccountTransferDetailBalance =
      ThemeFontStylesEng.en24Medium.apply(color: ThemeColors.gray_700);
  static TextStyle AccountTransferDetailTradeBalance =
      ThemeFontStylesEng.en14Regular.apply(color: ThemeColors.gray_400);
  static TextStyle AccountTransferDetailToken =
      ThemeFontStylesEng.en24Regular.apply(color: ThemeColors.gray_400);
  static TextStyle AccountTransferCompleteBalance =
      ThemeFontStylesKor.kr24Bold.apply(color: ThemeColors.gray_700);
  static TextStyle AccountTransferCompleteCoin =
      ThemeFontStylesEng.en24Regular.apply(color: ThemeColors.gray_400);
  static TextStyle AccountTransferCompleteTradePrice =
      ThemeFontStylesKor.kr16Bold.apply(color: ThemeColors.gray_400);
  static TextStyle AccountTransferCompleteTradeCurrency =
      ThemeFontStyles.regular14.apply(color: ThemeColors.gray_400);
  static TextStyle notificationItemDate =
      ThemeFontStylesEng.en12Regular.apply(color: ThemeColors.gray_400);
  static TextStyle notificationItemTitle =
      ThemeFontStyles.medium16.apply(color: ThemeColors.gray_700);
  static TextStyle notificationItemContents =
      ThemeFontStyles.regular14.apply(color: ThemeColors.gray_700);
  static TextStyle inputText13 =
      ThemeFontStyles.regular13.apply(color: ThemeColors.gray_500);
  static TextStyle splashAppName =
      ThemeFontStylesEng.appName22Bold.apply(color: ThemeColors.white);
  static TextStyle loginAppName =
      ThemeFontStylesEng.appName26Bold.apply(color: ThemeColors.appName);
  static TextStyle mainAppBarAppName =
      ThemeFontStylesEng.appName22Bold.apply(color: ThemeColors.appName);
  static TextStyle mainAppBottomCoinName =
      ThemeFontStyles.bold18.apply(color: ThemeColors.gray_700);
  static TextStyle mainAppBottomTokenId =
      ThemeFontStyles.bold20.apply(color: ThemeColors.gray_700);
  static TextStyle mainAppBottomCoinBalance =
      ThemeFontStylesKor.kr24Bold.apply(color: ThemeColors.gray_700);
  static TextStyle mainAppBottomCoinTokenName =
      ThemeFontStylesEng.en14Medium.apply(color: ThemeColors.gray_500);
  static TextStyle mainAppBottomCurrentTradePrice =
      ThemeFontStylesKor.kr20Bold.apply(color: ThemeColors.gray_400);
  static TextStyle mainAppBottomCurrentTradeCurrency =
      ThemeFontStylesKor.kr16Regular.apply(color: ThemeColors.gray_400);
  static TextStyle accountListCurrentTradePrice =
      ThemeFontStylesKor.kr16Medium.apply(color: ThemeColors.gray_400);
  static TextStyle accountListCurrentTradeCurrency =
      ThemeFontStylesKor.kr12Regular.apply(color: ThemeColors.gray_400);
  static TextStyle mainAppBottomButtonName =
      ThemeFontStylesEng.en12Bold.apply(color: ThemeColors.white);
  static TextStyle signupRemainTime =
      ThemeFontStyles.regular14.apply(color: ThemeColors.gray_700);
  static TextStyle cardCurrentTradePrice =
      ThemeFontStylesKor.kr18Bold.apply(color: ThemeColors.white);
  static TextStyle cardCurrentTradeCurrency =
      ThemeFontStylesEng.en14Regular.apply(color: ThemeColors.white);
  static TextStyle ExchangeRatePrice =
      ThemeFontStylesEng.en16Medium.apply(color: ThemeColors.theme_400);
  static TextStyle ExchangeRateCurrency =
      ThemeFontStylesEng.en16Regular.apply(color: ThemeColors.theme_400);
  static TextStyle stakingAddress =
      ThemeFontStylesKor.kr13Regular.apply(color: ThemeColors.gray_500);
  static TextStyle stakingAmount =
      ThemeFontStylesKor.kr16Bold.apply(color: ThemeColors.gray_700);
  static TextStyle stakingTokenName =
      ThemeFontStylesKor.kr14Regular.apply(color: ThemeColors.gray_400);
  static TextStyle stakingTitle =
      ThemeFontStylesKor.kr13Bold.apply(color: ThemeColors.theme_500);
  static TextStyle AccountInfoFilter =
      ThemeFontStylesEng.en14Regular.apply(color: ThemeColors.gray_400);

  static TextStyle CustomDrpDownButtonLabel =
      ThemeFontStyles.regular13.apply(color: ThemeColors.gray_400);
  static TextStyle CustomDrpDownButtonItem =
      ThemeFontStyles.regular13.apply(color: ThemeColors.black);

  static TextStyle AppbarTitleMerchantAuthCompleteAppbar =
      ThemeFontStylesEng.en16Medium.apply(color: ThemeColors.black);
  static TextStyle MerchantRegistrationPageMiddle =
      ThemeFontStylesEng.en14Regular.apply(color: ThemeColors.gray_700);
  static TextStyle MerchantRegistrationCompletePageBody =
      ThemeFontStylesEng.en14Regular.apply(color: ThemeColors.gray_700);
  static TextStyle MerchantRegistrationVerifyPageResend =
      ThemeFontStyles.regular14.apply(color: ThemeColors.cyan_500);

  static TextStyle AppbarTitleCreateAccountConfirmMnemonic =
      ThemeFontStyles.regular16.apply(color: ThemeColors.gray_700);
  static TextStyle AppbarSubTitleCreateAccountConfirmMnemonic =
      ThemeFontStyles.bold14.apply(color: ThemeColors.gray_700);
  static TextStyle AppbarSubTitleMessageCreateAccountConfirmMnemonic =
      ThemeFontStyles.regular14.apply(color: ThemeColors.gray_700);
  static TextStyle AppbarSubTitleMessageEthCreateAccountConfirmMnemonic =
      ThemeFontStyles.regular13.apply(color: ThemeColors.gray_700);
  static TextStyle CustomTableNumberCreateAccountConfirmMnemonic =
      ThemeFontStyles.regular14.apply(color: ThemeColors.gray_400);
  static TextStyle CustomTableTextCreateAccountConfirmMnemonic =
      ThemeFontStylesEng.en14Medium.apply(color: ThemeColors.gray_700);
  static TextStyle ImportEthAccountCompleteGuide =
      ThemeFontStyles.regular14.apply(color: ThemeColors.gray_700);
  static TextStyle ImportMnemonicPhaseGuide1 =
      ThemeFontStyles.bold14.apply(color: ThemeColors.gray_700);
  static TextStyle ImportMnemonicPhaseGuide2 =
      ThemeFontStyles.regular14.apply(color: ThemeColors.gray_700);
  static TextStyle ImportMnemonicPhaseGuide3 =
      ThemeFontStyles.regular14.apply(color: ThemeColors.gray_700);
  static TextStyle ImportCautionGuide1 =
      ThemeFontStyles.bold16.apply(color: ThemeColors.sub_color_pink);
  static TextStyle ImportCautionGuide2 =
      ThemeFontStyles.bold14.apply(color: ThemeColors.gray_700);
  static TextStyle CreateVixcoAddressPassCodePageGuide =
      ThemeFontStyles.regular14.apply(color: ThemeColors.gray_700);
  static TextStyle ExportCautionGuide1 =
      ThemeFontStyles.medium16.apply(color: ThemeColors.sub_color_pink);
  static TextStyle ExportCautionGuide2 =
      ThemeFontStyles.regular14.apply(color: ThemeColors.gray_700);
  static TextStyle ExportCautionGuide3 =
      ThemeFontStyles.regular13.apply(color: ThemeColors.gray_700);
  static TextStyle FindPassAppBarTitle =
      ThemeFontStyles.bold16.apply(color: ThemeColors.gray_700);
  static TextStyle FindPasswordCompleteTempPassword =
      ThemeFontStyles.bold14.apply(color: ThemeColors.gray_700);
  static TextStyle FindPasswordCompleteTempPasswordLabel =
      ThemeFontStyles.bold14.apply(color: ThemeColors.gray_700);
  static TextStyle FindPassVerifyPageTitle =
      ThemeFontStylesEng.en14Regular.apply(color: ThemeColors.gray_700);

  //
  //
  //
  // static const paymentNum = const TextStyle(
  //     color: ThemeColors.fill_black,
  //     fontWeight: FontWeight.w700,
  //     fontFamily: "NotoSansBold",
  //     fontStyle: FontStyle.normal,
  //     fontSize: 40.0);
  //
  // static const screenPWNum = const TextStyle(
  //     color: ThemeColors.brown_grey,
  //     fontWeight: FontWeight.w400,
  //     fontFamily: "NotoSansRegular",
  //     fontStyle: FontStyle.normal,
  //     fontSize: 60.0);
  static const keypadNum = const TextStyle(
      color: ThemeColors.black,
      fontWeight: FontWeight.w400,
      fontFamily: "NotoSansRegular",
      fontStyle: FontStyle.normal,
      fontSize: 35.0);

  // static const h1White58 = const TextStyle(
  //     color: ThemeColors.marwhite_two,
  //     fontWeight: FontWeight.w500,
  //     fontFamily: "NotoSansMedium",
  //     fontStyle: FontStyle.normal,
  //     fontSize: 29.0);
  // static const h1BlackM58 = const TextStyle(
  //     color: ThemeColors.black,
  //     fontWeight: FontWeight.w500,
  //     fontFamily: "NotoSansMedium",
  //     fontStyle: FontStyle.normal,
  //     fontSize: 29.0);
  // static const h2OrangeM47 = const TextStyle(
  //     color: ThemeColors.tangerine,
  //     fontWeight: FontWeight.w500,
  //     fontFamily: "NotoSansMedium",
  //     fontStyle: FontStyle.normal,
  //     fontSize: 23.5);
  // static const h2BlackM47 = const TextStyle(
  //     color: ThemeColors.black,
  //     fontWeight: FontWeight.w500,
  //     fontFamily: "NotoSansMedium",
  //     fontStyle: FontStyle.normal,
  //     fontSize: 23.5);
  static const h2Black47 = const TextStyle(
      color: const Color(0xff000000),
      fontWeight: FontWeight.w400,
      fontFamily: "NotoSansKRRegular",
      fontStyle: FontStyle.normal,
      fontSize: 23.5);

  // static const h2LGray47 = const TextStyle(
  //     color: ThemeColors.very_light_pink_two,
  //     fontWeight: FontWeight.w400,
  //     fontFamily: "NotoSansRegular",
  //     fontStyle: FontStyle.normal,
  //     fontSize: 23.5);
  // static const h2White47 = const TextStyle(
  //     color: ThemeColors.marwhite_two,
  //     fontWeight: FontWeight.w400,
  //     fontFamily: "NotoSansRegular",
  //     fontStyle: FontStyle.normal,
  //     fontSize: 23.5);
  // static const h3Black40 = const TextStyle(
  //     color: const Color(0xff000000),
  //     fontWeight: FontWeight.w400,
  //     fontFamily: "NotoSansRegular",
  //     fontStyle: FontStyle.normal,
  //     fontSize: 20.0);
  // static const h3Gray40 = const TextStyle(
  //     color: ThemeColors.brown_grey,
  //     fontWeight: FontWeight.w400,
  //     fontFamily: "NotoSansRegular",
  //     fontStyle: FontStyle.normal,
  //     fontSize: 20.0);
  static const h4BlackB36 = const TextStyle(
      color: const Color(0xff000000),
      fontWeight: FontWeight.w700,
      fontFamily: "NotoSansKRBold",
      fontStyle: FontStyle.normal,
      fontSize: 18.0);

  // static const h4Black36 = const TextStyle(
  //     color: const Color(0xff000000),
  //     fontWeight: FontWeight.w400,
  //     fontFamily: "NotoSansRegular",
  //     fontStyle: FontStyle.normal,
  //     fontSize: 18.0);
  // static const h4Gary36 = const TextStyle(
  //     color: ThemeColors.brown_grey,
  //     fontWeight: FontWeight.w400,
  //     fontFamily: "NotoSansRegular",
  //     fontStyle: FontStyle.normal,
  //     fontSize: 18.0);
  // static const h5BlackB33 = const TextStyle(
  //     color: const Color(0xff000000),
  //     fontWeight: FontWeight.w700,
  //     fontFamily: "NotoSansBold",
  //     fontStyle: FontStyle.normal,
  //     fontSize: 16.5);
  // static const h5BlueGrayB33 = const TextStyle(
  //     color: ThemeColors.dark,
  //     fontWeight: FontWeight.w700,
  //     fontFamily: "NotoSansBold",
  //     fontStyle: FontStyle.normal,
  //     fontSize: 16.5);
//  static const h5BlueGrayB33 = const TextStyle(
//    color:  ThemeColors.fill_primary_deep,
//    fontWeight: FontWeight.w700,
//    fontFamily: "NotoSansBold",
//    fontStyle:  FontStyle.normal,
//    fontSize: 16.5
//  );
//   static const h5OrangeB33 = const TextStyle(
//       color: ThemeColors.tangerine,
//       fontWeight: FontWeight.w700,
//       fontFamily: "NotoSansBold",
//       fontStyle: FontStyle.normal,
//       fontSize: 16.5);
  static const h5Black33 = const TextStyle(
      color: const Color(0xff000000),
      fontWeight: FontWeight.w400,
      fontFamily: "NotoSansKRRegular",
      fontStyle: FontStyle.normal,
      fontSize: 16.5);

//   static const h5DGray33 = const TextStyle(
//       color: ThemeColors.brownish_grey,
//       fontWeight: FontWeight.w400,
//       fontFamily: "NotoSansRegular",
//       fontStyle: FontStyle.normal,
//       fontSize: 16.5);
  static const h5Gray33 = const TextStyle(
      color: ThemeColors.brown_grey,
      fontWeight: FontWeight.w400,
      fontFamily: "NotoSansKRRegular",
      fontStyle: FontStyle.normal,
      fontSize: 16.5);

//   static const h5Orange33 = const TextStyle(
//       color: ThemeColors.tangerine,
//       fontWeight: FontWeight.w400,
//       fontFamily: "NotoSansRegular",
//       fontStyle: FontStyle.normal,
//       fontSize: 16.5);
//   static const h5Red33 = const TextStyle(
//       color: ThemeColors.orangey_red,
//       fontWeight: FontWeight.w400,
//       fontFamily: "NotoSansRegular",
//       fontStyle: FontStyle.normal,
//       fontSize: 16.5);
  static const h5White33 = const TextStyle(
      color: ThemeColors.marwhite_two,
      fontWeight: FontWeight.w400,
      fontFamily: "NotoSansKRRegular",
      fontStyle: FontStyle.normal,
      fontSize: 16.5);

//   static const h5BlueGray33 = const TextStyle(
//       color: ThemeColors.blue_grey,
//       fontWeight: FontWeight.w400,
//       fontFamily: "NotoSansRegular",
//       fontStyle: FontStyle.normal,
//       fontSize: 16.5);
//   static const bodyBlack29 = const TextStyle(
//       color: const Color(0xff000000),
//       fontWeight: FontWeight.w400,
//       fontFamily: "NotoSansRegular",
//       fontStyle: FontStyle.normal,
//       fontSize: 14.5);
//   static const bodyBlueGrayB26 = const TextStyle(
//       color: ThemeColors.dark,
//       fontWeight: FontWeight.w700,
//       fontFamily: "NotoSansBold",
//       fontStyle: FontStyle.normal,
//       fontSize: 13.0);
//   static const bodyGray26 = const TextStyle(
//       color: ThemeColors.brown_grey,
//       fontWeight: FontWeight.w500,
//       fontFamily: "NotoSansMedium",
//       fontStyle: FontStyle.normal,
//       fontSize: 13.0);
//   static const bodyRed26 = const TextStyle(
//       color: ThemeColors.orangey_red,
//       fontWeight: FontWeight.w500,
//       fontFamily: "NotoSansMedium",
//       fontStyle: FontStyle.normal,
//       fontSize: 13.0);
  static const bodyBlack26 = const TextStyle(
      color: const Color(0xff000000),
      fontWeight: FontWeight.w400,
      fontFamily: "NotoSansKRRegular",
      fontStyle: FontStyle.normal,
      fontSize: 13.0);

//   static const smallGrayM24 = const TextStyle(
//       color: ThemeColors.brown_grey,
//       fontWeight: FontWeight.w500,
//       fontFamily: "NotoSansMedium",
//       fontStyle: FontStyle.normal,
//       fontSize: 12.0);
//   static const smallGray24 = const TextStyle(
//       color: ThemeColors.brown_grey,
//       fontWeight: FontWeight.w400,
//       fontFamily: "NotoSansRegular",
//       fontStyle: FontStyle.normal,
//       fontSize: 12.0);
//   static const smallRed24 = const TextStyle(
//       color: ThemeColors.orangey_red,
//       fontWeight: FontWeight.w400,
//       fontFamily: "NotoSansRegular",
//       fontStyle: FontStyle.normal,
//       fontSize: 12.0);
//   static const smallWhite24 = const TextStyle(
//       color: ThemeColors.marwhite_two,
//       fontWeight: FontWeight.w400,
//       fontFamily: "NotoSansRegular",
//       fontStyle: FontStyle.normal,
//       fontSize: 12.0);
//   static const snallBlack24 = const TextStyle(
//       color: const Color(0xff000000),
//       fontWeight: FontWeight.w400,
//       fontFamily: "NotoSansRegular",
//       fontStyle: FontStyle.normal,
//       fontSize: 12.0);

//
//  //추가
//   static const keyPadNumWhite = const TextStyle(
//       color: ThemeColors.white,
//       fontWeight: FontWeight.w400,
//       fontFamily: "NotoSansRegular",
//       fontStyle: FontStyle.normal,
//       fontSize: 35.0);
//   static const keyPadNumBlack = const TextStyle(
//       color: ThemeColors.black,
//       fontWeight: FontWeight.w400,
//       fontFamily: "NotoSansRegular",
//       fontStyle: FontStyle.normal,
//       fontSize: 35.0);
//   static const keyPadNumRed = const TextStyle(
//       color: ThemeColors.orangey_red,
//       fontWeight: FontWeight.w400,
//       fontFamily: "NotoSansRegular",
//       fontStyle: FontStyle.normal,
//       fontSize: 35.0);
  static const keyPadNum = keypadNum;

  // static const h1WhiteM58 = const TextStyle(
  //     color: ThemeColors.white,
  //     fontWeight: FontWeight.w500,
  //     fontFamily: "NotoSansMedium",
  //     fontStyle: FontStyle.normal,
  //     fontSize: 29.0);
  // static const h1Black58 = const TextStyle(
  //     color: ThemeColors.black,
  //     fontWeight: FontWeight.w400,
  //     fontFamily: "NotoSansRegular",
  //     fontStyle: FontStyle.normal,
  //     fontSize: 29.0);
  //
  // static const h2Orange47 = const TextStyle(
  //     color: ThemeColors.tangerine,
  //     fontWeight: FontWeight.w400,
  //     fontFamily: "NotoSansRegular",
  //     fontStyle: FontStyle.normal,
  //     fontSize: 23.5);

  // static const h2Gray47 = const TextStyle(
  //     color: ThemeColors.brown_grey,
  //     fontWeight: FontWeight.w400,
  //     fontFamily: "NotoSansRegular",
  //     fontStyle: FontStyle.normal,
  //     fontSize: 23.5);
  // static const h4OrangeB36 = const TextStyle(
  //     color: ThemeColors.tangerine,
  //     fontWeight: FontWeight.w700,
  //     fontFamily: "NotoSansBold",
  //     fontStyle: FontStyle.normal,
  //     fontSize: 18.0);
  // static const h4WhitweB36 = const TextStyle(
  //     color: ThemeColors.white,
  //     fontWeight: FontWeight.w700,
  //     fontFamily: "NotoSansBold",
  //     fontStyle: FontStyle.normal,
  //     fontSize: 18.0);
  // static const h4BlackM36 = const TextStyle(
  //     color: ThemeColors.black,
  //     fontWeight: FontWeight.w500,
  //     fontFamily: "NotoSansMedium",
  //     fontStyle: FontStyle.normal,
  //     fontSize: 18.0);
  // static const h4DGray36 = const TextStyle(
  //     color: ThemeColors.brownish_grey,
  //     fontWeight: FontWeight.w500,
  //     fontFamily: "NotoSansMedium",
  //     fontStyle: FontStyle.normal,
  //     fontSize: 18.0);
  // static const h4BlueGrey36 = const TextStyle(
  //     color: ThemeColors.slate,
  //     fontWeight: FontWeight.w500,
  //     fontFamily: "NotoSansMedium",
  //     fontStyle: FontStyle.normal,
  //     fontSize: 18.0);
  //
  // static const h4White36 = const TextStyle(
  //     color: ThemeColors.white,
  //     fontWeight: FontWeight.w400,
  //     fontFamily: "NotoSansRegular",
  //     fontStyle: FontStyle.normal,
  //     fontSize: 18.0);
  // static const h5LightGray33 = const TextStyle(
  //     color: ThemeColors.very_light_pink,
  //     fontWeight: FontWeight.w400,
  //     fontFamily: "NotoSansRegular",
  //     fontStyle: FontStyle.normal,
  //     fontSize: 16.5);
  static const bodyBlackB26 = const TextStyle(
      color: ThemeColors.black,
      fontWeight: FontWeight.w700,
      fontFamily: "NotoSansKRBold",
      fontStyle: FontStyle.normal,
      fontSize: 13.0);

  // static const h1BlackM24 = const TextStyle(
  //     color: ThemeColors.black,
  //     fontWeight: FontWeight.w500,
  //     fontFamily: "SourceHanSansKR",
  //     fontStyle: FontStyle.normal,
  //     fontSize: 24.0);
  // static const h4Gray16 = const TextStyle(
  //     color: ThemeColors.brown_grey,
  //     fontWeight: FontWeight.w400,
  //     fontFamily: "SourceHanSansKR",
  //     fontStyle: FontStyle.normal,
  //     fontSize: 16.0);
  // static const h3GrayM18 = const TextStyle(
  //     color: ThemeColors.brown_grey,
  //     fontWeight: FontWeight.w500,
  //     fontFamily: "SourceHanSansKR",
  //     fontStyle: FontStyle.normal,
  //     fontSize: 18.0);
  static const APPBAR_TITLE_ICON = IconThemeData(
      color: ThemeColors.white, size: ThemeSizeStyle.categoryIconSize);
  static const Body1 = ThemeTextStyles.h5Black33;

  //
  // static const Body1Value = ThemeTextStyles.h5Black33;
  //
  // static const Body2 = ThemeTextStyles.bodyBlack29;
  static TextStyle TablePageTableItemTitle = ThemeTextStyles.bodyBlackB26;
  static const TextStyle KVTextTitleText = ThemeTextStyles.h5Gray33;
  static const TextStyle KVTextHorizontalTitleText = ThemeTextStyles.h5Gray33;
  static const TextStyle KVTextValueText = ThemeTextStyles.h2Black47;
}

class ThemeSizeStyle {
  static const double spacing_s = 8;
  static const double spacing_m = 16;
  static const double spacing_l = 24;
  static const double spacing_xl = 32;

  //기본 Body의 Layout 구성
  static const double paddingBodySide = spacing_l;
  static const double paddingBodyTop = 12; //기본 24, 이전 16이였음

  static const double spacingXxs = 4;

  static const double footerBtnHeight = 60.0;
  static const double buttonHeight = 56.0;
  static const double bodyLRPadding = 24.0; //16 -> 8
  static const double bodyTopPadding = 16.0;
  static const double margin_underCategory = 32.0;
  static const double AppbarUnitLRPadding = 24.0;

//temp
  static const double size_16 = 16.0;
  static const double margin_underTitle = 12.0;
  static const double margin_underComponents = 12.0;
  static const double margin_underComponentsKVText = 5.0;

//  static const double footerMargin = 8.0;
  static const double minUnit = 8.0;
  static const double microUnit = 4.0;
  static const double leftListMargin = 16.0;
  static const double TopBottomElevation = 8.0;
  static const double InformationFootBarHorizontalPadding = 21.0;

//  static const double InformationFootBarHorizontalPadding = 24.0;
  static const double InformationFootBarBottomPadding = 12.0;

//  static const double InformationFootBarBottomPadding = 24.0;
  static const double KVTextValueLeftPadding = 0.0;

//  static const double KVTextValueLeftPadding = 8.0;

  //2Depth 화면 Title Bar 높이
  static const double subBarHeight = 56;

  //Footer의 입체감 표현을 위한 Shadow
  //Elevation을 사용하지 않고 적용용
  static const BoxDecoration footerShdow = BoxDecoration(boxShadow: [
    BoxShadow(
        color: const Color(0x66263238),
        offset: Offset(2, 1),
        blurRadius: 6,
        spreadRadius: 0)
  ], color: ThemeColors.white);

  static const double categoryIconSize = 44.0; //36.0
  static const double footerBarHeight = 112.0;
  static const double footerBarPadding = 24.0;
  static const double ActionBtnFooterBarLoginWidthSpace = 48.0; //16

  static const double popupWidth = 312.0;
  static const double popupInnerWidth = 264.0;
  static const double popupInnerPaddingWidth = 0.0;
  static const double popupButtonWidthDouble = 128.0;
  static const double popupButtonWidthSingle = 264.0;
  static const double popupButtonWidthDoubleSpace = 8.0;

  static const double numberKeypadWidth = 112.0;
  static const double numberKeypadHeight = 96.0;

  static const double orderPageItemListTitlePaddingLeft = 12.0;
  static const double orderPageItemListBadgeRadius = 15.0;
  static const double orderPageCategoryHeight = 96.0;
  static const double orderPageCategoryBadgeRadius = 13;
  static const double orderPageOverlayCategoryListHeight = 640;
  static const double orderPageOverlayCategoryRadius = 16;

  static const double tablePageTableItemWidth = 296;
  static const double tablePageTableItemTitleBarHeight = 40;
  static const double tablePageTableItemTitleBarWidth = 264;
  static const double tablePageTableItemTitleTextWidth = 166;

  static const double headerSearchFormPaddingBottom = 16.0;
  static const double headerSearchFormButtonBarHeight = 104.0;
  static const double headerSearchFormButtonBarPaddingBottom = 16.0;

  // static const double customSwitchTrackWidth = 80.0;
  // static const double customSwitchTrackHeight  = 32.0;
  // static const double customSwitchWidth = 96.0;
  // static const double customSwitchHeight  = 40.0;
  // static const double customSwitchThumbRadius  = 12.0;
  static const double customSwitchTrackWidth = 47.0;
  static const double customSwitchTrackHeight = 27.0;
  static const double customSwitchWidth = 51.0;
  static const double customSwitchHeight = 31.0;
  static const double customSwitchThumbRadius = 12.0;

  // 27*27
  // 51*31

  static const double bulletListOrangeDividerSpaceHeight = 12.0;

  static const double cartItemWidgetOrangeHeight = 77;

  static const double defaultDropdownButtonDividerSpace = 14;

  static const double dividerThickness = 2;
  static const double TopBottomElevation2 = 0.0; //4.0
  static const double QueryConditionHeight = 72.0; // 48.0;

  static const double ButtonRadius = 16.0; // 8.0;
  static const double textFieldUnderPadding = 24.0;
} //ThemeSizeStyle.

class ThemeSpacingBox {
  static var spacing_s = SizedBox(
    width: ThemeSizeStyle.spacing_s.w,
    height: ThemeSizeStyle.spacing_s.h,
  );
  static var spacing_m = SizedBox(
    width: ThemeSizeStyle.spacing_m.w,
    height: ThemeSizeStyle.spacing_m.h,
  );
  static var spacing_l = SizedBox(
    width: ThemeSizeStyle.spacing_l.w,
    height: ThemeSizeStyle.spacing_l.h,
  );
  static var spacing_xl = SizedBox(
    width: ThemeSizeStyle.spacing_xl.w,
    height: ThemeSizeStyle.spacing_xl.h.h,
  );

//
// //  //40.0
//   static var divBodyTop = SizedBox(
//     height: ThemeSizeStyle.bodyTopPadding,
//   );
//
// //
//
//   //살짝 띄우기
//   static var divMinLine = SizedBox(
//     height: 8.0,
//     width: 8.0,
//   );
//
//   //살짝 띄우기
//   static var zero = SizedBox(
//     height: 0,
//     width: 0.0,
//   );

// //  //Title과 Container간 Size Divider(12)
//   static var div_underSubTitle = SizedBox(
//     height: ThemeSizeStyle.margin_underTitle,
//     width: ThemeSizeStyle.margin_underTitle,
//   );
//
  //데이터 구분자간 Size Divider (30)
  static var div_underCategory = SizedBox(
    height: ThemeSizeStyle.margin_underCategory.h,
  );

//
//   //16
//   //한 Group 내에서 라인 Divider
  static var div_underComponents =
      SizedBox(height: ThemeSizeStyle.margin_underComponents.h);
}

class ThemeBoxDeco {
  static BoxDecoration whiteRound = BoxDecoration(
      color: ThemeColors.white, borderRadius: BorderRadius.circular(8.0));
  static BoxDecoration guideBoxDeco = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      boxShadow: [
        BoxShadow(
          color: ThemeColors.theme_500,
          blurRadius: 2.0,
        ),
      ]);
}

class ThemeBoxShadow {
  static List<BoxShadow> shadow_sm = [
    BoxShadow(
        color: ThemeColors.black.withOpacity(0.07),
        offset: Offset(0, 0.3),
        blurRadius: 0.5,
        spreadRadius: 0)
  ];
  static List<BoxShadow> shadow = [
    BoxShadow(
        color: ThemeColors.black.withOpacity(0.06),
        offset: Offset(0, 0.3),
        blurRadius: 0.5,
        spreadRadius: 0),
    BoxShadow(
        color: ThemeColors.black.withOpacity(0.08),
        offset: Offset(0, 0.3),
        blurRadius: 0.8,
        spreadRadius: 0),
  ];
  static List<BoxShadow> shadow_md = [
    BoxShadow(
        color: ThemeColors.black.withOpacity(0.10),
        offset: Offset(0, 1),
        blurRadius: 1.5,
        spreadRadius: -0.3),
    BoxShadow(
        color: ThemeColors.black.withOpacity(0.06),
        offset: Offset(0, 0.5),
        blurRadius: 1.3,
        spreadRadius: 0),
  ];
  static List<BoxShadow> shadow_lg = [
    BoxShadow(
        color: ThemeColors.black.withOpacity(0.10),
        offset: Offset(0, 2.5),
        blurRadius: 3.8,
        spreadRadius: -0.8),
    BoxShadow(
        color: ThemeColors.black.withOpacity(0.06),
        offset: Offset(0, 1),
        blurRadius: 1.5,
        spreadRadius: -0.5),
  ];
  static List<BoxShadow> shadow_xl = [
    BoxShadow(
        color: ThemeColors.black.withOpacity(0.10),
        offset: Offset(0, 5),
        blurRadius: 6.3,
        spreadRadius: -1.3),
    BoxShadow(
        color: ThemeColors.black.withOpacity(0.06),
        offset: Offset(0, 2.5),
        blurRadius: 2.5,
        spreadRadius: -1.3),
  ];
  static List<BoxShadow> shadow_2xl = [
    BoxShadow(
        color: ThemeColors.black.withOpacity(0.25),
        offset: Offset(0, 6.3),
        blurRadius: 12.5,
        spreadRadius: -3),
    BoxShadow(
        color: ThemeColors.black.withOpacity(0.06),
        offset: Offset(0, 1),
        blurRadius: 1.5,
        spreadRadius: -0.5),
  ];
  static List<BoxShadow> bottomButton = [
    BoxShadow(
        color: ThemeColors.theme_400.withOpacity(0.2),
        offset: Offset(0, 3.8),
        blurRadius: 3.8,
        spreadRadius: 0)
  ];
  static List<BoxShadow> copiedAlert = [
    BoxShadow(
        color: Color(0xff52d700).withOpacity(0.1),
        offset: Offset(0.0, 2.0),
        blurRadius: 3.8,
        spreadRadius: 0)
  ];
  static List<BoxShadow> mainBottom = [
    BoxShadow(
        color: ThemeColors.black.withOpacity(0.13),
        offset: Offset(0, -3),
        blurRadius: 3.8,
        spreadRadius: 0)
  ];
}

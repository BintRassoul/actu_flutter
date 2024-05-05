import 'package:flutter/material.dart';
import 'package:my_actu/core/theme/colors.dart';

class Style {
  /// @@@@@@@@@@@@@@@@@ Fonts @@@@@@@@@@@@@@@@@@@@@@@@

  TextStyle textStyle({
    double size = 14,
   // Color color = AppColors.darkGray,
    FontWeight fontWeight = FontWeight.w400,
    decoration = TextDecoration.none,
  //  decorationColor = AppColors.golden,
  }) =>
      TextStyle(
        fontFamily: "Inter",
        fontSize: size,
        fontWeight: fontWeight,
    //    color: color,
      );
  TextStyle selectedLabelStyle({
    double size = 13,
   // Color color = AppColors.golden,
    FontWeight fontWeight = FontWeight.w500,
  }) =>
      TextStyle(
        fontFamily: "Inter",
        fontSize: size,
        fontWeight: fontWeight,
  //      color: color,
      );
  TextStyle unselectedLabelStyle({
    double size = 13,
  //  Color color = AppColors.gray,
    FontWeight fontWeight = FontWeight.w500,
  }) =>
      TextStyle(
        fontFamily: "Inter",
        fontSize: size,
        fontWeight: fontWeight,
    //    color: color,
      );
  TextStyle drawerItemUnSelectedTextStyle({
    double size = 15,
  //  Color color = AppColors.darkGray,
    FontWeight fontWeight = FontWeight.w500,
  }) =>
      TextStyle(
        fontFamily: "Inter",
        fontSize: size,
        fontWeight: fontWeight,
  //      color: color,
      );
  TextStyle drawerItemSelectedTextStyle({
    BuildContext? context,
    double size = 15,
  //  Color color = AppColors.golden,
    FontWeight fontWeight = FontWeight.w500,
    decoration = TextDecoration.none,
  //  decorationColor = AppColors.golden,
  }) =>
      TextStyle(
        fontFamily: "Inter",
        fontSize: size,
        fontWeight: fontWeight,
   //     color: color,
        decoration: decoration,
  //      decorationColor: decorationColor,
      );

  TextStyle titleTextStyle({
    double size = 18,
 //   Color color = AppColors.white,
    FontWeight fontWeight = FontWeight.w700,
  }) =>
      TextStyle(
        fontFamily: "Poppins",
        fontSize: size,
        fontWeight: fontWeight,
  //      color: color,
        fontStyle: FontStyle.normal,
      );

  TextStyle bigTitleTextStyle({
    double size = 24,
 //   Color color = AppColors.white,
    FontWeight fontWeight = FontWeight.w800,
  }) =>
      TextStyle(
        fontFamily: "Poppins",
        fontSize: size,
        fontWeight: fontWeight,
   //     color: color,
        fontStyle: FontStyle.normal,
      );
}

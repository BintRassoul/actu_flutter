import 'package:flutter/material.dart';
import 'package:my_actu/core/theme/colors.dart';

class AppStyle {
  /// @@@@@@@@@@@@@@@@@ Fonts @@@@@@@@@@@@@@@@@@@@@@@@

  TextStyle sectionTitleStyle({
    double size = 16,
    Color color = AppColors.black,
    FontWeight fontWeight = FontWeight.w600,
    decoration = TextDecoration.none,
    //  decorationColor = AppColors.golden,
  }) =>
      TextStyle(
        fontFamily: 'Poppins',
        fontSize: size,
        fontWeight: fontWeight,
        color: color,
      );

  TextStyle tinyLabelStyle({
    double size = 12,
    Color color = AppColors.black,
    FontWeight fontWeight = FontWeight.w400,
  }) =>
      TextStyle(
        fontFamily: "ABeeZee",
        fontSize: size,
        fontWeight: fontWeight,
        color: color,
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

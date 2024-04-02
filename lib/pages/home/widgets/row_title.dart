import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/app_constants.dart';
import '../../../routes/app_routes.dart';

Widget rowTitle(
    {required String title, required String goTo, String? sectionType}) {
  return InkWell(
    // splashColor: mainHexColor,
    highlightColor: secondColor,
    onTap: () {
      if (goTo == 'FAVORITES')
        Get.toNamed(AppRoutes.FAVORITES, arguments: [sectionType, title]);
      else
        Get.toNamed(AppRoutes.TOP_HEADLINES, arguments: [sectionType, title]);
    },
    child: Container(
      height: .04 * height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontFamily: 'Segoe UI',
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
              color: blackColor,
            ),
          ),
          Align(
            alignment: Alignment(0.84, -0.84),
            child:
                Icon(Icons.double_arrow_rounded, size: 24, color: blackColor),
          ),
        ],
      ),
    ),
  );
}

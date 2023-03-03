import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/app_constants.dart';
import '../../../routes/app_routes.dart';

Row rowTitle(
    {required String title, required String goTo, String? sectionType}) {
  return Row(
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
        child: InkWell(
            onTap: () {
              if (goTo == 'FAVORITES')
                Get.toNamed(AppRoutes.FAVORITES,
                    arguments: [sectionType, title]);
              else
                Get.toNamed(AppRoutes.TOP_HEADLINES,
                    arguments: [sectionType, title]);
            },
            splashColor: secondColor,
            borderRadius: BorderRadius.circular(32.0),
            child:
                Icon(Icons.double_arrow_rounded, size: 24, color: blackColor)),
      ),
    ],
  );
}

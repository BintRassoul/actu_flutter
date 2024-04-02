import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/app_constants.dart';

Container appBarWidget() {
  return Container(
    // margin: EdgeInsets.only(top: 20),
    padding: EdgeInsets.symmetric(horizontal: 15),
    width: Get.width,
    height: (.12 * Get.height),
    decoration: BoxDecoration(
        color: mainHexColor,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))),
    child: Padding(
      padding: const EdgeInsets.only(
        top: 30.0, // bottom: 15
      ),
      child: Row(
        //  crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            height: 23,
            width: 14,
            alignment: Alignment.bottomLeft,
            // padding: EdgeInsets.only(top: ),
            child: Image.asset(
              "assets/images/worldwide.png",
              fit: BoxFit.fitWidth,
            ),
          ),
          SizedBox(
            width: 0,
          ),
          Text(
            'TopActu',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.normal,
                fontFamily: "Bruno Ace",
                color: whiteColor),
          ),
        ],
      ),
    ),
  );
}

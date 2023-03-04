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
            bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))),
    child: Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Row(
        children: [
          Container(
            height: 15,
            width: 15,
            child: Image.asset(
              "assets/images/worldwide.png",
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            'TopActu',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: "Bruno Ace",
                color: Colors.white),
          ),
        ],
      ),
    ),
  );
}

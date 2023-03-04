import 'package:flutter/material.dart';

import '../../../constants/app_constants.dart';
import '../../top_headlines/top_headlines_controller.dart';

Widget tryButton(TopHeadLinesController controller) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(
        height: 20,
      ),
      Center(
        child: Text('Oups!! Nous détectons un problème avec le réseau.'),
      ),
      SizedBox(
        height: 20,
      ),
      GestureDetector(
        onTap: () {
          controller.onInit();
          controller.update();
        },
        child: Container(
            // margin: EdgeInsets.all(55),
            width: 140,
            height: 40,
            decoration: BoxDecoration(
                color: mainHexColor,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Center(
              child: Text(
                "Ressayer",
                style: TextStyle(color: Colors.white),
              ),
            )),
      ),
    ],
  );
}

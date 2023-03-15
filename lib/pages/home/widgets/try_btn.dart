import 'package:flutter/material.dart';
import 'package:my_actu/pages/home/widgets/row_title.dart';

import '../../../constants/app_constants.dart';
import '../../top_headlines/top_headlines_controller.dart';

Widget tryButton(TopHeadLinesController controller) {
  return Padding(
    padding: EdgeInsets.only(top: 20.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        rowTitle(
            title: "L'actualité dans le monde",
            goTo: "TOP_HEADLINES",
            sectionType: "world"),
        SizedBox(
          height: 50,
        ),
        Center(
          child: Text('Oups!! Nous détectons un problème avec le réseau.'),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
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
      ],
    ),
  );
}

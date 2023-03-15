import 'package:flutter/material.dart';
import 'package:my_actu/pages/home/widgets/row_title.dart';
import 'package:lottie/lottie.dart';
import '../../../constants/app_constants.dart';

Widget noInternetSection() {
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
        lottieElements()
      ],
    ),
  );
}

Widget lottieElements() {
  return Padding(
    padding: EdgeInsets.only(top: 10, bottom: 20),
    child: Column(
      children: [
        Lottie.asset(
          'assets/lotties/no_internet.json',
          width: 200,
          height: 200,
          fit: BoxFit.fill,
        ),
        Center(
          child: Text('Oups!! Nous détectons un problème avec le réseau.'),
        ),
      ],
    ),
  );
}

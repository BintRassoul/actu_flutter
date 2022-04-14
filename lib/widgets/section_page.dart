import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/app_constants.dart';
import '../pages/components/loading_overlay.dart';
import '../pages/favorites/favorites_controller.dart';
import '../pages/top_headlines/top_headlines_controller.dart';
import '../routes/app_routes.dart';
import 'item_actu.dart';

var controller;
Widget sectionPage(GetxController c, String controllerType, String sectionType,
    String title, Axis axe) {
  return Padding(
    padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 20.0),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 21.0,
                color: mainHexColor.withOpacity(0.54),
              ),
            ),
            Align(
              alignment: Alignment(0.84, -0.84),
              child: InkWell(
                  onTap: () => Get.toNamed(AppRoutes.TOP_HEADLINES,
                      arguments: [sectionType, title]),
                  splashColor: secondColor,
                  borderRadius: BorderRadius.circular(32.0),
                  child: Icon(Icons.double_arrow_rounded,
                      size: 25.0, color: mainHexColor)),
            ),
          ],
        ),
        Container(
          // margin: EdgeInsets.only(bottom: 50.0),
          // padding: EdgeInsets.only(top: 5.0),
          height: 235.0,
          child: Obx(() {
            if (controllerType == 'fav') {
              controller = c as FavoritesController;
              return loadChild(controller, controllerType, sectionType, axe);
            }

            controller = c as TopHeadLinesController;
            if (controller.hasInternet.value)
              return loadChild(controller, controllerType, sectionType, axe);

            return noIternet();
          }),
        ),
      ],
    ),
  );
}

Widget loadChild(GetxController c, String cType, String sectionType, Axis axe) {
  var articles;
  var isLoading;
  if (cType == 'fav') {
    controller = c as FavoritesController;
    isLoading = false;
  } else {
    controller = c as TopHeadLinesController;
    isLoading = controller.isLoading.value;
  }
  print(controller);
  switch (sectionType) {
    case 'world':
      articles = controller.articlesList;
      break;
    case 'afrique':
      articles = controller.afriqueArticlesList;
      break;
    case 'amerique':
      articles = controller.ameriqueArticlesList;
      break;
    case 'europe':
      articles = controller.europeArticlesList;
      break;
    case 'asie':
      articles = controller.asieArticlesList;
      break;
  }

  return LoadingOverlay(isLoading,
      child: ListView.builder(
          scrollDirection: axe,
          itemCount: articles.length,
          itemBuilder: (context, index) {
            //   log('ELEMENT : ${controller.articlesList[index]} &&&&&&&  ${controller.articlesList[index].title}');

            return ActuItem(
              widthCard: widthHomeCard,
              sizeTitle: sizeHomeTitle,
              sizeLink: sizeHomeLink,
              article: articles[index],
            );
          }));
}

Widget noIternet() {
  return Center(
    child: Text('Oups!! Nous détectons un problème avec le réseau.'),
  );
}

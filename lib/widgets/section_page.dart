import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_actu/pages/home/widgets/row_title.dart';
import 'package:my_actu/pages/home/widgets/try_btn.dart';

import '../constants/app_constants.dart';
import '../pages/components/loading_overlay.dart';
import '../pages/favorites/favorites_controller.dart';
import '../pages/top_headlines/top_headlines_controller.dart';
import '../routes/app_routes.dart';
import 'item_actu.dart';

Widget sectionPage(TopHeadLinesController controller, String sectionType,
    String title, Axis axe) {
  bool isThereInternet = controller.hasInternet.value;

  return Padding(
    padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 20.0),
    child: Column(
      children: [
        rowTitle(title: title, goTo: "TOP_HEADLINES", sectionType: sectionType),
        Container(
            // margin: EdgeInsets.only(bottom: 50.0),
            padding: EdgeInsets.only(top: 5.0),
            height: isThereInternet ? 235.0 : 150,
            child: (isThereInternet)
                ? loadChild(controller, "top", sectionType, title, axe, false)
                : tryButton(controller)),
      ],
    ),
  );
}

Widget loadChild(dynamic controller, String cType, String sectionType,
    String title, Axis axe, bool loadingAll) {
  var articles;
  var isLoading;
  if (cType == 'fav') {
    //controller = c as FavoritesController;
    isLoading = false;
  } else {
    //  controller = c as TopHeadLinesController;
    isLoading = controller.isLoading.value;
  }
  // print(controller);
  if (loadingAll) {
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
  } else {
    switch (sectionType) {
      case 'world':
        articles = controller.articlesTopList;
        break;
      case 'afrique':
        articles = controller.afriqueArticlesTopList;
        break;
      case 'amerique':
        articles = controller.ameriqueArticlesTopList;
        break;
      case 'europe':
        articles = controller.europeArticlesTopList;
        break;
      case 'asie':
        articles = controller.asieArticlesTopList;
        break;
    }
  }
  if (loadingAll) {
    return LoadingOverlay(isLoading,
        child: ListView.builder(
            scrollDirection: axe,
            itemCount: articles.length,
            itemBuilder: (context, index) {
              return ActuItem(
                widthCard: widthHomeCard,
                sizeTitle: sizeHomeTitle,
                sizeLink: sizeHomeLink,
                article: articles[index],
              );
            }));
  }
  return LoadingOverlay(isLoading,
      child: ListView.builder(
          scrollDirection: axe,
          itemCount: articles.length + 1,
          itemBuilder: (context, index) {
            if (index == 5) {
              return InkWell(
                  customBorder: CircleBorder(
                      side: BorderSide(
                          color: mainHexColor, style: BorderStyle.solid)),
                  onTap: () => Get.toNamed(AppRoutes.TOP_HEADLINES,
                      arguments: [sectionType, title]),
                  splashColor: secondColor,
                  borderRadius: BorderRadius.circular(32.0),
                  child: Icon(Icons.double_arrow_rounded,
                      size: 50.0, color: mainHexColor));
            }
            return ActuItem(
              widthCard: widthHomeCard,
              sizeTitle: sizeHomeTitle,
              sizeLink: sizeHomeLink,
              article: articles[index],
            );
          }));
}

Widget noIternet() {
  return Column(
    children: [
      Center(
        child: Text('Oups!! Nous détectons un problème avec le réseau.'),
      ),
      SizedBox(
        height: 7,
      ),
    ],
  );
}

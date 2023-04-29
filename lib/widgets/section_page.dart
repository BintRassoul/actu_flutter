import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_actu/pages/home/widgets/row_title.dart';
import 'package:my_actu/widgets/shimmer_item_actu.dart';

import '../constants/app_constants.dart';
import '../pages/components/loading_overlay.dart';
import '../pages/favorites/favorites_controller.dart';
import '../pages/top_headlines/top_headlines_controller.dart';
import '../routes/app_routes.dart';
import 'item_actu.dart';

final TopHeadLinesController topheadlinesController =
    Get.find<TopHeadLinesController>();
Widget sectionPage(
    {required String sectionType,
    required bool isLoading,
    required String title,
    required String category,
    required Axis axe}) {
  // bool isThereInternet = controller.hasInternet.value;
  return Padding(
    padding: EdgeInsets.only(top: 20.0),
    child: Column(
      children: [
        rowTitle(title: title, goTo: "TOP_HEADLINES", sectionType: sectionType),
        Container(
            // margin: EdgeInsets.only(bottom: 50.0),
            padding: EdgeInsets.only(top: 5.0),
            height: 235.0,
            child: FutureBuilder(
                future: topheadlinesController.getArticles(
                    sectionType, category, false),
                builder: (context, snapshot) {
                  if (snapshot.data != null && snapshot.hasData) {
                    return loadChild(
                        controller: topheadlinesController,
                        isLoading: false,
                        cType: "top",
                        articles: snapshot.data as List,
                        sectionType: sectionType,
                        title: title,
                        axe: axe,
                        loadingAll: false);
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting)
                    return shimmerActuItem(widthHomeCard);
                  return SizedBox
                      .shrink(); //noInternetSection(); // In the fututre, replace it by a problemWidget
                }))
      ],
    ),
  );
}

Widget loadChild(
    {required dynamic controller,
    required bool isLoading,
    required String cType,
    required List<dynamic> articles,
    required String sectionType,
    required String title,
    required Axis axe,
    required bool loadingAll}) {
  // articles = articles as List<Article>;
  print('-------- Section Page  :  ' + sectionType);

  if (cType == 'fav') {
    controller = controller as FavoritesController;
    if (loadingAll) {
      //  articles = controller.articlesList;

      return displayAllFavItems(isLoading, axe, articles);
    }
    //  articles = controller.articlesTopList;
    return displalTopFavItems(isLoading, axe, articles);
  }
  //cType=='top'
  else {
    controller = controller as TopHeadLinesController;
    // isLoading = controller.isLoading.value;
    var newArticles;
    if (loadingAll) {
      switch (sectionType) {
        case 'world':
          newArticles = controller.articlesList;
          break;
        case 'afrique':
          newArticles = controller.afriqueArticlesList;
          break;
        case 'amerique':
          newArticles = controller.ameriqueArticlesList;
          break;
        case 'europe':
          newArticles = controller.europeArticlesList;
          break;
        case 'asie':
          newArticles = controller.asieArticlesList;
          break;
      }
      articles = newArticles.value;

      return displayAllTopItems(isLoading, axe, articles);
    } else {
      /*    RxList topArticle = [].obs;
      switch (sectionType) {
        case 'world':
          topArticle = controller.articlesTopList;
          break;
        case 'afrique':
          topArticle = controller.afriqueArticlesTopList;
          break;
        case 'amerique':
          topArticle = controller.ameriqueArticlesTopList;
          break;
        case 'europe':
          topArticle = controller.europeArticlesTopList;
          break;
        case 'asie':
          topArticle = controller.asieArticlesTopList;
          break;
      } 
      articles = topArticle.toList();*/

      return displayFiveTopItems(isLoading, axe, articles, sectionType, title);
    }
  }
}

LoadingOverlay displalTopFavItems(bool isLoading, Axis axe, List articles) {
  return LoadingOverlay(isLoading,
      child: ListView.builder(
          scrollDirection: axe,
          itemCount: articles.length + 1,
          itemBuilder: (context, index) {
            //Index staarts o partir e°
            if (index == 5) {
              return GestureDetector(
                onTap: () =>
                    Get.toNamed(AppRoutes.FAVORITES, arguments: ['world', '']),
                child: CircleAvatar(
                  backgroundColor: mainHexColor,
                  radius: 20,
                  child: Icon(Icons.double_arrow_rounded,
                      size: 24.0, color: whiteColor),
                ),
              );
            }
            return FavActuItem(
              widthCard: widthHomeCard,
              sizeTitle: sizeHomeTitle,
              sizeLink: sizeHomeLink,
              article: articles[index],
              file: articles[index].imageFile!,
            );
          }));
}

LoadingOverlay displayAllFavItems(bool isLoading, Axis axe, List articles) {
  return LoadingOverlay(isLoading,
      child: ListView.builder(
          scrollDirection: axe,
          itemCount: articles.length,
          itemBuilder: (context, index) {
            return FavActuItem(
              widthCard: widthHomeCard,
              sizeTitle: sizeHomeTitle,
              sizeLink: sizeHomeLink,
              article: articles[index],
              file: articles[index].imageFile,
            );
          }));
}

LoadingOverlay displayAllTopItems(bool isLoading, Axis axe, List articles) {
  log('ALL articles.length' + articles.length.toString());
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

LoadingOverlay displayFiveTopItems(bool isLoading, Axis axe,
    List<dynamic> articles, String sectionType, String title) {
  log('TOP 5 articles.length' + articles.length.toString());

  return LoadingOverlay(isLoading,
      child: ListView.builder(
          scrollDirection: axe,
          itemCount: articles.length + 1,
          itemBuilder: (context, index) {
            if (index == 5) {
              return GestureDetector(
                onTap: () => Get.toNamed(AppRoutes.TOP_HEADLINES,
                    arguments: [sectionType, title]),
                child: CircleAvatar(
                  backgroundColor: mainHexColor,
                  radius: 20,
                  child: Icon(Icons.double_arrow_rounded,
                      size: 24.0, color: whiteColor),
                ),
              );
            }
            return ActuItem(
              widthCard: widthHomeCard,
              sizeTitle: sizeHomeTitle,
              sizeLink: sizeHomeLink,
              article: articles[index],
            );
          }));
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_actu/pages/favorites/favorites_controller.dart';
import 'package:my_actu/pages/top_headlines/top_headlines_controller.dart';
import 'package:my_actu/widgets/search_widget.dart';

var controller;
var controllerType;
var sectionType;
Widget buildSearch(GetxController c, String cType, String sType) => Obx(() {
      // var controller;
      controllerType = cType;
      sectionType = sType;
      if (controllerType == 'fav')
        controller = c as FavoritesController;
      else {
        controller = c as TopHeadLinesController;
      }
      return SearchWidget(
        text: controller.query.value,
        hintText: ' Titre/Source/Auteur',
        onChanged: searchArticle,
      );
    });

void searchArticle(String query) {
  var articlesList;
  print(controllerType);
  switch (sectionType) {
    case 'world':
      articlesList = controller.articlesList;
      break;
    case 'afrique':
      articlesList = controller.afriqueArticlesList;
      break;
    case 'amerique':
      articlesList = controller.ameriqueArticlesList;
      break;
    case 'europe':
      articlesList = controller.europeArticlesList;
      break;
    case 'asie':
      articlesList = controller.asieArticlesList;
      break;
  }
  final searchListArticles = articlesList.where((article) {
    final titleLower = article.title.toLowerCase();
    final sourceLower = article.source.name;
    final authorLower = article.author ?? '';
    final searchLower = query.toLowerCase();

    return titleLower.contains(searchLower) ||
        sourceLower.toLowerCase().contains(searchLower) ||
        authorLower.toLowerCase().contains(searchLower);
  }).toList();

  controller.query.value = query;
  switch (sectionType) {
    case 'world':
      controller.articlesList.value = searchListArticles;
      break;
    case 'afrique':
      controller.afriqueArticlesList.value = searchListArticles;
      break;
    case 'amerique':
      controller.ameriqueArticlesList.value = searchListArticles;
      break;
    case 'europe':
      controller.europeArticlesList.value = searchListArticles;
      break;
    case 'asie':
      controller.asieArticlesList.value = searchListArticles;
      break;
  }
  controller.update();
}

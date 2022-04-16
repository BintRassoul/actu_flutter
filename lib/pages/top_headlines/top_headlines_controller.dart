import 'dart:async';
import 'dart:ui';

import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:my_actu/constants/app_constants.dart';

import '../../services/api_request.dart';

class TopHeadLinesController extends GetxController {
  var articlesList = [].obs;
  var europeArticlesList = [].obs;
  var afriqueArticlesList = [].obs;
  var ameriqueArticlesList = [].obs;
  var asieArticlesList = [].obs;
  var articlesTopList = [].obs;
  var europeArticlesTopList = [].obs;
  var ameriqueArticlesTopList = [].obs;
  var afriqueArticlesTopList = [].obs;
  var asieArticlesTopList = [].obs;
  var isLoading = true.obs;

  RxString query = ''.obs;
  RxString place = 'general'.obs;
  RxString ctg = 'general'.obs;
  Rx<Color> color2 = Color.fromARGB(255, 255, 255, 255).obs;
  Rx<Color> color1 = Color(0xFFA7BFE8).obs;

  var categories = [].obs;
  final europeCountries = countriesList['europe']?.keys.toList(growable: false);
  final afriqueCountries =
      countriesList['afrique']?.keys.toList(growable: false);
  final ameriqueCountries =
      countriesList['amerique']?.keys.toList(growable: false);
  final asieCountries = countriesList['asie']?.keys.toList(growable: false);

  RxBool hasInternet = false.obs;
  late StreamSubscription internetSubscription;

  @override
  void onInit() {
    this.internetSubscription =
        InternetConnectionChecker().onStatusChange.listen((status) {
      final hasInternet = status == InternetConnectionStatus.connected;
      this.hasInternet.value = hasInternet;
    });
    fetchArticles('general');
    super.onInit();
  }
//-------------------------------------------------------

  @override
  void onClose() {
    internetSubscription.cancel();
    print('---------CLOSE-connection-------');
  }
//-------------------------------------------------------

  void fetchArticles(String category) async {
    getArticles('world', category, false);
    getArticles('afrique', 'Egypte', false);
    getArticles('amerique', 'USA', false);
    getArticles('europe', 'France', false);
    getArticles('asie', 'Arabie Saoudite', false);
  }

//-------------------------------------------------------
  void getArticles(String sType, String category, bool loadingAll) async {
    ctg.value = category;
    var articles;
    if (sType == 'world') {
      if (category == 'technologie') {
        category = 'technology';
      } else if (category == 'sante') {
        category = 'health';
      }
      articles = await ApiRequest(null,
              url:
                  'https://newsapi.org/v2/top-headlines?category=$category&language=fr&apiKey=$API_KEY')
          .getData();
    } else {
      category = countriesList[sType]?[category] ?? '';

      articles = await ApiRequest(null,
              url:
                  'https://newsapi.org/v2/top-headlines?country=$category&category=general&apiKey=$API_KEY')
          .getData();
    }
    if (articles != null) {
      isLoading(false);
      switch (sType) {
        case 'world':
          articlesList.value = articles;
          if (!loadingAll) {
            for (int i = 0; i < 5; i++) {
              articlesTopList.add(articles[i]);
            }
          }
          break;
        case 'afrique':
          afriqueArticlesList.value = articles;
          if (!loadingAll) {
            for (int i = 0; i < 5; i++) {
              afriqueArticlesTopList.add(articles[i]);
            }
          }
          break;
        case 'amerique':
          ameriqueArticlesList.value = articles;
          if (!loadingAll) {
            for (int i = 0; i < 5; i++) {
              ameriqueArticlesTopList.add(articles[i]);
            }
          }
          break;
        case 'europe':
          europeArticlesList.value = articles;
          if (!loadingAll) {
            for (int i = 0; i < 5; i++) {
              europeArticlesTopList.add(articles[i]);
            }
          }
          break;
        case 'asie':
          asieArticlesList.value = articles;
          if (!loadingAll) {
            for (int i = 0; i < 5; i++) {
              asieArticlesTopList.add(articles[i]);
            }
          }
          break;
      }

      update();
    }
  }

  //---------------------------
  RxList getCategories(String sType) {
    switch (sType) {
      case 'world':
        categories = categoriesList.obs;
        break;
      case 'afrique':
        categories = afriqueCountries!.obs;
        break;
      case 'amerique':
        categories = ameriqueCountries!.obs;
        break;
      case 'europe':
        categories = europeCountries!.obs;
        break;
      case 'asie':
        categories = asieCountries!.obs;
        break;
    }
    return categories;
  }
}

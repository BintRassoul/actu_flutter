import 'dart:async';
import 'dart:developer';
import 'dart:ui';

import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:my_actu/constants/app_constants.dart';

import '../../models/top_headlines.dart';
import '../../services/api_request.dart';
import '../../services/config_reader.dart';

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
  RxBool checkingInternet = false.obs;

  RxBool hasInternet = false.obs;
  late StreamSubscription internetSubscription;

  @override
  void onInit() {
    checkConnection();
    // fetchArticles('general');
    log('----------------fetch articles');
    log('----------------isLoading topheadlines----' +
        isLoading.value.toString());
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
    getArticles('europe', 'France', false);
    getArticles('afrique', 'Egypte', false);
    getArticles('amerique', 'USA', false);
    getArticles('asie', 'Arabie Saoudite', false);
  }

//-------------------------------------------------------
  void checkConnection() {
    this.internetSubscription =
        InternetConnectionChecker().onStatusChange.listen((status) {
      final isThereConnection = status == InternetConnectionStatus.connected;
      log('status ' + status.toString());
      log('InternetConnectionStatus.connected ' +
          InternetConnectionStatus.connected.toString());
      log('isThereConnection' + isThereConnection.toString());

      this.hasInternet.value = isThereConnection;
      //log('hasInternet' + hasInternet.value.toString());
      if (hasInternet.value) {
        //This boolean "checkingInternet" allows us to update our state when connection is OK and keep it even connection is lost
        //Unless the page is refresh
        this.checkingInternet(true);
        update();
        // this.checkingInternet.update((value) => value = true);
        log('checkingInternet1 ' + checkingInternet.value.toString());
        if (articlesList.length == 0 || articlesTopList.length == 0)
          fetchArticles('general');
      } /* else {
        this.checkingInternet(false);
        update();
        //  this.checkingInternet.update((value) => value = false);
        log('checkingInternet2 ' + checkingInternet.value.toString());
      } */
      //  isLoading(false);

      update();
    });
  }

//-------------------------------------------------------
  Future<List> getArticles(
      String sType, String category, bool loadingAll) async {
    ctg.value = category;
    var articles;
    String apiKey = ConfigReader.getApiKey();

    if (sType == 'world') {
      if (category == 'technologie') {
        category = 'technology';
      } else if (category == 'sante') {
        category = 'health';
      }
      articles = await ApiRequest(null,
              url:
                  'https://newsapi.org/v2/top-headlines?category=$category&language=fr&apiKey=$apiKey')
          .getData();
    } else {
      category = countriesList[sType]?[category] ?? '';

      articles = await ApiRequest(null,
              url:
                  'https://newsapi.org/v2/top-headlines?country=$category&category=general&apiKey=$apiKey')
          .getData();
    }
    if (articles != null) {
      isLoading(false);
      switch (sType) {
        case 'world':
          articlesList.value = articles;
          if (articlesTopList.length != 0) articlesTopList = [].obs;
          for (int i = 0; i < 5; i++) {
            articlesTopList.add(articles[i]);
          }
          update();

          return loadingAll ? articles : articlesTopList.toList();
        //break;
        case 'afrique':
          afriqueArticlesList.value = articles;
          if (afriqueArticlesTopList.length != 0)
            afriqueArticlesTopList = [].obs;

          for (int i = 0; i < 5; i++) {
            afriqueArticlesTopList.add(articles[i]);
          }
          update();

          return loadingAll ? articles : afriqueArticlesTopList.toList();

        case 'amerique':
          ameriqueArticlesList.value = articles;
          if (ameriqueArticlesTopList.length != 0)
            ameriqueArticlesTopList = [].obs;

          for (int i = 0; i < 5; i++) {
            ameriqueArticlesTopList.add(articles[i]);
          }
          update();

          return loadingAll ? articles : ameriqueArticlesTopList.toList();

        case 'europe':
          europeArticlesList.value = articles;
          if (europeArticlesTopList.length != 0) europeArticlesTopList = [].obs;

          for (int i = 0; i < 5; i++) {
            europeArticlesTopList.add(articles[i]);
          }
          update();

          return loadingAll ? articles : europeArticlesTopList.toList();

        case 'asie':
          asieArticlesList.value = articles;
          if (asieArticlesTopList.length != 0) asieArticlesTopList = [].obs;

          for (int i = 0; i < 5; i++) {
            asieArticlesTopList.add(articles[i]);
          }
          update();

          return loadingAll ? articles : asieArticlesTopList.toList();
      }
    }
    return articles;
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

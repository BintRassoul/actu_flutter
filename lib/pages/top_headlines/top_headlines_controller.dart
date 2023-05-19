import 'dart:async';
import 'dart:developer';
import 'dart:ui';

import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:my_actu/constants/app_constants.dart';

import '../../models/news_data_io_model.dart';
import '../../services/api_request.dart';
import '../../services/config_reader.dart';

class TopHeadLinesController extends GetxController {
  RxList<Result> articlesList = RxList();
  RxList<Result> europeArticlesList = RxList();
  RxList<Result> afriqueArticlesList = RxList();
  RxList<Result> ameriqueArticlesList = RxList();
  RxList<Result> asieArticlesList = RxList();
  RxList<Result> articlesTopList = RxList();
  RxList<Result> europeArticlesTopList = RxList();
  RxList<Result> ameriqueArticlesTopList = RxList();
  RxList<Result> afriqueArticlesTopList = RxList();
  RxList<Result> asieArticlesTopList = RxList();
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
    getArticles(
        sType: 'world', category: category, country: "", loadingAll: false);
    getArticles(
        sType: 'europe', category: "", country: "fr", loadingAll: false);
    getArticles(
        sType: 'afrique', category: "", country: "sa", loadingAll: false);
    getArticles(
        sType: 'amerique', category: "", country: "us", loadingAll: false);
    getArticles(sType: 'asie', category: "", country: "cn", loadingAll: false);
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

        /*   if (articlesList.length == 0 || articlesTopList.length == 0)
          fetchArticles('general'); */
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
  Future<List<Result>?> getArticles(
      {required String sType,
      required String country,
      required String category,
      required bool loadingAll}) async {
    ctg.value = category;
    late List<Result>? articles;
    String apiKey = ConfigReader.getApiKey();
/*     Map<String, String> headers = {
      'X-RapidAPI-Key': apiKey,
      'X-RapidAPI-Host': 'real-time-news-data.p.rapidapi.com'
    }; */
    if (sType == 'world') {
      articles = await ApiRequest.fetchAlbum(
          "https://newsdata.io/api/1/news?apikey=$apiKey&category=$category&language=en",
          null);
    } else {
      articles = await ApiRequest.fetchAlbum(
          "https://newsdata.io/api/1/news?apikey=$apiKey&country=$country",
          null);
    }
    if (articles != null) {
      isLoading(false);
      switch (sType) {
        case 'world':
          articlesList.value = articles;
          if (articlesTopList.length != 0) articlesTopList.value = [];
          for (int i = 0; i < 5; i++) {
            articlesTopList.add(articles[i]);
          }
          update();

          return loadingAll ? articles : articlesTopList.toList();
        //break;
        case 'afrique':
          afriqueArticlesList.value = articles;
          if (afriqueArticlesTopList.length != 0)
            afriqueArticlesTopList.value = [];

          for (int i = 0; i < 5; i++) {
            afriqueArticlesTopList.add(articles[i]);
          }
          update();

          return loadingAll ? articles : afriqueArticlesTopList.toList();

        case 'amerique':
          ameriqueArticlesList.value = articles;
          if (ameriqueArticlesTopList.length != 0)
            ameriqueArticlesTopList.value = [];

          for (int i = 0; i < 5; i++) {
            ameriqueArticlesTopList.add(articles[i]);
          }
          update();

          return loadingAll ? articles : ameriqueArticlesTopList.toList();

        case 'europe':
          europeArticlesList.value = articles;
          if (europeArticlesTopList.length != 0)
            europeArticlesTopList.value = [];

          for (int i = 0; i < 5; i++) {
            europeArticlesTopList.add(articles[i]);
          }
          update();

          return loadingAll ? articles : europeArticlesTopList.toList();

        case 'asie':
          asieArticlesList.value = articles;
          if (asieArticlesTopList.length != 0) asieArticlesTopList.value = [];

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

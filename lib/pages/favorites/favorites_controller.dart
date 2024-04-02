import 'dart:developer';

import 'package:get/get.dart';
import 'package:my_actu/constants/app_constants.dart';
import 'package:my_actu/models/news_data_io_model.dart';

class FavoritesController extends GetxController {
  var articlesList = [].obs;
  var articlesTopList = [].obs;
  RxString query = ''.obs;

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  void getData() {
    dynamic favKeys = storage.getKeys();
    List<Result> listFav = [];
    if (favKeys != null) {
      log('SOME FAVS');

      for (String i in favKeys) {
        // log('storage.read ::::' + storage.read(i).toString());

        final Map<String, dynamic> map = storage.read(i);
        Result article = Result.fromJson(map);
        // article.imageFile = await getFile(article.title);

        listFav.add(article);
      }
      listFav.sort((a, b) => b.saveAt!.compareTo(a.saveAt!));

      this.articlesList.value = listFav;
      this.articlesTopList.value =
          (listFav.length < 6) ? listFav : listFav.sublist(0, 5);
      update();
    } else
      log('NOTHING IN FAV');
  }
}

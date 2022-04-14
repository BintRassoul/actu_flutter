import 'package:get/get.dart';
import 'package:my_actu/constants/app_constants.dart';
import 'package:my_actu/models/top_headlines.dart';

class FavoritesController extends GetxController {
  var articlesList = [].obs;
  RxString query = ''.obs;

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  void getData() {
    dynamic favKeys = storage.getKeys();

    var listFav = [];
    if (favKeys != null) {
      for (String i in favKeys) {
        print(storage.read(i).toString());

        final map = storage.read(i);
        listFav.add(Article.fromJson(map));
      }
      this.articlesList.value = listFav;
      update();
    }
  }
}

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../constants/app_constants.dart';
import '../../models/top_headlines.dart';
import '../../utils/file_functions.dart';

class DetailsController extends GetxController {
  Article article = Get.arguments;
  Rx<Color> favColorIcon = Color.fromRGBO(57, 182, 245, 1).obs;
  // var imageFile;
  @override
  void onInit() {
    colorInit();
    super.onInit();
  }

  @override
  void onClose() {
    // called just before the Controller is deleted from memory
    //TO DO
    super.onClose();
  }

  void colorInit() {
    if (storage.read(article.title) == null) {
      favColorIcon.value = Color.fromRGBO(57, 182, 245, 1);
    } else {
      favColorIcon.value = Color.fromARGB(255, 231, 18, 178);
    }
    update();
  }

  Future<void> saveAsFavorite() async {
    /*   var file = await ApiRequest(null, url: article.urlToImage!)
        .getImage(article.urlToImage!);
    imageFile = file;
    storage.write('article.urlToImage!', imageFile); */

    article.imageFile = await getFile(article.title);
    storage.write(article.title, article.toJson());
    favColorIcon.value = Color.fromARGB(255, 231, 18, 178);
    Get.snackbar('Favoris', "L'article est bien ajouté aux favoris");

    print('--------------STORE--------------');

    print(storage.read(article.title).toString());
    print('--------------STORE--------------');
    print('--------------STORE--------------');
    print('--------------STORE--------------');

    await saveImage(article.urlToImage, article.title);

    update();
  }

  Future<void> removeAsFavorite() async {
    if (article.imageFile != null) {
      await removeImage(article.title);
    }

    storage.remove(article.title);
    print('--------------REMOVE-STORE--------------');
    favColorIcon.value = mainHexColor;
    update();
    Get.snackbar('Favoris', "L'article a bien été supprimé des favoris");
  }
}

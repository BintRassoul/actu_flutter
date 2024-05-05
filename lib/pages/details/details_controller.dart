import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:my_actu/models/news_data_io_model.dart';
import '../../constants/app_constants.dart';
import '../../utils/file_functions.dart';

class DetailsController extends GetxController {
  Result article = Get.arguments;
  Rx<Color> favColorIcon = mainHexColor.obs;
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
      favColorIcon.value = mainHexColor;
    } else {
      favColorIcon.value = redColor;
    }
    update();
  }

  Future<void> saveAsFavorite() async {
    /*   var file = await ApiRequest(null, url: article.urlToImage!)
        .getImage(article.urlToImage!);
    imageFile = file;
    storage.write('article.urlToImage!', imageFile); */

    if (article.imageUrl == '')
      article.imageFile = null;
    else {
      File? file = await saveImage(article.imageUrl!, article.title);
      article.imageFile = file!;
    }
    log('imageFile  ' + article.imageFile.toString());
    //save date for
    article.saveAt = DateTime.now().millisecondsSinceEpoch;

    // update();

    // article.imageFile = await getFile(article.title);
    storage.write(article.title, article.toJson());

    favColorIcon.value = redColor;
    Get.snackbar('Favoris', "L'article est bien ajouté aux favoris");

    print('--------------STORE--------------');

    print(storage.read(article.title).toString());
    print('--------------STORE ');
    print('--------------STORE ');
    print('--------------STORE--------------');

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

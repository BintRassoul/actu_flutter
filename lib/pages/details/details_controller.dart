import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:my_actu/models/bing_news_model.dart' as bnm;
import '../../constants/app_constants.dart';
import '../../utils/file_functions.dart';

class DetailsController extends GetxController {
  bnm.Value article = Get.arguments;
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
    if (storage.read(article.name) == null) {
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

    if (article.image!.thumbnail.contentUrl == '')
      article.imageFile = null;
    else {
      File? file =
          await saveImage(article.image!.thumbnail.contentUrl, article.name);
      article.imageFile = file!;
    }
    log('imageFile  ' + article.imageFile.toString());
    //save date for
    article.saveAt = DateTime.now().millisecondsSinceEpoch;

    // update();

    // article.imageFile = await getFile(article.title);
    storage.write(article.name, article.toJson());

    favColorIcon.value = redColor;
    Get.snackbar('Favoris', "L'article est bien ajouté aux favoris");

    print('--------------STORE--------------');

    print(storage.read(article.name).toString());
    print('--------------STORE ');
    print('--------------STORE ');
    print('--------------STORE--------------');

    update();
  }

  Future<void> removeAsFavorite() async {
    if (article.imageFile != null) {
      await removeImage(article.name);
    }

    storage.remove(article.name);
    print('--------------REMOVE-STORE--------------');
    favColorIcon.value = mainHexColor;
    update();
    Get.snackbar('Favoris', "L'article a bien été supprimé des favoris");
  }
}

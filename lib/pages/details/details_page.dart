import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';
import 'package:my_actu/constants/app_constants.dart';
import 'package:my_actu/models/news_data_io_model.dart';
import 'package:my_actu/pages/favorites/favorites_controller.dart';
import 'package:my_actu/pages/top_headlines/top_headlines_controller.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'details_controller.dart';

class DetailPage extends StatefulWidget {
  /*  Article article;
  DetailPage({required this.article});
 */
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Result article = Get.arguments;

  _launchURL() async {
    Uri url = Uri.parse(article.link);
    print(url);
    try {
      if (await canLaunchUrl(url)) {
        //LaunchMode.externalApplication allows us to open the url through browser
        await launchUrl(url, mode: LaunchMode.externalApplication);
      }
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final DetailsController detailsController = Get.put(DetailsController());
    log('article.url : ' + article.link);
    log('article.imageUrl! : ' + article.imageUrl!);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
//APP_MENU
          (article.imageFile == null)
              ? (article.imageUrl! == '')
                  ? Stack(
                      children: [
                        Container(
                          width: Get.width,
                          height: .455 * Get.height,
                          decoration: BoxDecoration(
                              color: mainHexColor,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(40.0),
                                  bottomRight: Radius.circular(40.0))),
                          child: Image.asset(
                            'assets/images/worldwide.png',
                            width: .27 * width,
                            height: .13 * height,
                            //fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                            top: 0.025 * height,
                            child: rowIcons(detailsController)),
                      ],
                    )
                  : Container(
                      width: Get.width,
                      color: Colors.white,
                      child: CachedNetworkImage(
                        // fit: BoxFit.cover,
                        cacheManager: CacheManager(Config(
                          article.imageUrl!,
                          // stalePeriod: const Duration(days: 364),
                        )),
                        imageUrl: article.imageUrl!,
                        width: Get.width,
                        imageBuilder: (context, imageProvider) => Container(
                          height: 350.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(40.0),
                                  bottomRight: Radius.circular(40.0)),
                              image: DecorationImage(
                                onError: (exception, stackTrace) =>
                                    new Icon(Icons.error_outline),
                                image: imageProvider,
                                fit: BoxFit.cover,
                              )),
                          child: rowIcons(detailsController),
                        ),
                        placeholder: (context, urlToImage) =>
                            Center(child: CircularProgressIndicator()),
                        errorWidget: (context, urlToImage, error) =>
                            new Icon(Icons.error),
                      ),
                    )
              : Stack(
                  children: [
                    Container(
                      width: Get.width,
                      height: .455 * Get.height,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: FileImage(article.imageFile!),
                            fit: BoxFit.cover),
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40.0),
                            bottomRight: Radius.circular(40.0)),
                      ),
                    ),
                    rowIcons(detailsController),
                  ],
                ),
          Container(
            height: 140.0,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Color.fromRGBO(247, 247, 249, 1),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40.0),
                    bottomRight: Radius.circular(40.0))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 100,
                  //color: blackColor,
                  padding: EdgeInsets.only(left: 30, top: 10, right: 10),
                  child: Text(
                    article.title,
                    maxLines: 5,
                    textScaleFactor: 1.5,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 13,
                      color: Color.fromRGBO(19, 33, 70, 1),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(
                        left: 30, top: 8, right: 40, bottom: 10),
                    child: Text('Publié le : ${article.pubDate}'))
              ],
            ),
          ),

          Expanded(
              child: ListView(
            children: [
              Container(
                //color: Colors.green,
                padding: EdgeInsets.only(left: 40, right: 40, bottom: 20),
                child: Text(
                  article.description == ""
                      ? article.content!
                      : article.description,
                  style: TextStyle(
                    fontSize: 15.2,
                  ),
                  maxLines: 10,
                ),
              ),
              GestureDetector(
                onTap: () => _launchURL(),
                child: Container(
                  padding: EdgeInsets.only(left: 40.0, bottom: 50),
                  child: Text(
                    'En savoir plus',
                    style: TextStyle(
                        color: mainHexColor,
                        fontSize: 17.4,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          )),
        ],
      ),
    );
  }

  Padding rowIcons(DetailsController detailsController) {
    return Padding(
      padding: EdgeInsets.only(top: .04 * height),
      child: Container(
        //color: blackColor,
        width: width,
        height: 50,
        alignment: Alignment.center,
        child: Stack(
          //crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            /* Align(
                alignment: Alignment(-0.84, -0.84), */
            Positioned(
                left: 0.0,
                child: RawMaterialButton(
                  onPressed: () {
                    //favController.getData();
                    final FavoritesController favController =
                        Get.find<FavoritesController>();

                    favController.onInit();
                    Get.back();
                  },
                  shape: new CircleBorder(),
                  elevation: 2.0,
                  fillColor: Colors.white,
                  padding: const EdgeInsets.all(5.0),
                  child: Icon(
                    Icons.arrow_back,
                    color: mainHexColor,
                    size: 30.0,
                  ),
                )),
            /*   Align(
              alignment: Alignment(0.84, -0.84),
              child: */
            Positioned(
              right: 55,
              child: Obx(() {
                return RawMaterialButton(
                  onPressed: () {
                    if (storage.read(article.title) == null) {
                      final TopHeadLinesController topHeadLinesController =
                          Get.find<TopHeadLinesController>();
                      if (topHeadLinesController.hasInternet.value)
                        detailsController.saveAsFavorite();
                      else
                        Get.snackbar('Favoris',
                            "Oups! Impossible, la connexion ne passe pas",
                            backgroundColor: Colors.redAccent,
                            colorText: whiteColor);
                    } else {
                      detailsController.removeAsFavorite();
                    }
                  },
                  child: new Icon(
                    Icons.favorite,
                    color: detailsController.favColorIcon.value,
                    size: 30.0,
                  ),
                  shape: new CircleBorder(),
                  elevation: 2.0,
                  fillColor: Colors.white,
                  padding: const EdgeInsets.all(5.0),
                );
              }),
            ),
            Positioned(
              right: 0.0,
              child: RawMaterialButton(
                onPressed: () async {
                  final urlPreview = article.link;
                  await Share.share("Top News : $urlPreview");
                },
                child: new Icon(
                  Icons.share,
                  color: mainHexColor,
                  size: 30.0,
                ),
                shape: new CircleBorder(),
                elevation: 2.0,
                fillColor: Colors.white,
                padding: const EdgeInsets.all(5.0),
              ),
            ),
            // )
          ],
        ),
      ),
    );
  }
}

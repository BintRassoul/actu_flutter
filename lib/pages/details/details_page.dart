import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';
import 'package:my_actu/constants/app_constants.dart';
import 'package:my_actu/models/top_headlines.dart';
import 'package:my_actu/pages/favorites/favorites_controller.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import 'details_controller.dart';

class DetailPage extends StatefulWidget {
  /*  Article article;
  DetailPage({required this.article});
 */
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Article article = Get.arguments;
  String url = '';

  _launchURL() async {
    url = article.url;
    print(url);
    try {
      if (await canLaunch(url)) {
        await launch(url);
      }
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final DetailsController detailsController = Get.put(DetailsController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
//APP_MENU
          Container(
            width: Get.width,
            color: Color.fromRGBO(247, 247, 249, 1),
            child: CachedNetworkImage(
              // fit: BoxFit.cover,
              cacheManager: CacheManager(Config(
                article.urlToImage ?? '',
                stalePeriod: const Duration(days: 364),
              )),
              imageUrl: article.urlToImage ?? '',
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
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15, top: 40),
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40.0)),
                      child: RawMaterialButton(
                        onPressed: () {
                          final FavoritesController favController =
                              Get.find<FavoritesController>();
                          favController.getData();
                          Get.back();
                        },
                        child: new Icon(
                          Icons.arrow_back,
                          color: Color.fromRGBO(57, 182, 245, 1),
                          size: 30.0,
                        ),
                        shape: new CircleBorder(),
                        elevation: 2.0,
                        fillColor: Colors.white,
                        padding: const EdgeInsets.all(5.0),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 21, top: 40),
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40.0)),
                            child: Obx(() {
                              return RawMaterialButton(
                                onPressed: () {
                                  if (storage.read(article.title) == null) {
                                    detailsController.saveAsFavorite();
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
                          Container(
                            margin:
                                EdgeInsets.only(left: 10.0, top: 40, right: 15),
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40.0)),
                            child: RawMaterialButton(
                              onPressed: () async {
                                final urlPreview = article.url;
                                await Share.share("Top News : $urlPreview");
                              },
                              child: new Icon(
                                Icons.share,
                                color: Color.fromRGBO(57, 182, 245, 1),
                                size: 30.0,
                              ),
                              shape: new CircleBorder(),
                              elevation: 2.0,
                              fillColor: Colors.white,
                              padding: const EdgeInsets.all(5.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              placeholder: (context, urlToImage) =>
                  Center(child: CircularProgressIndicator()),
              errorWidget: (context, urlToImage, error) =>
                  new Icon(Icons.error_outline),
            ),
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
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    height: 100,
                    padding: EdgeInsets.only(left: 30, top: 20, right: 10),
                    child: Text(
                      article.title,
                      maxLines: 3,
                      textScaleFactor: 1.5,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        //fontSize: 15,
                        color: Color.fromRGBO(19, 33, 70, 1),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                      padding: EdgeInsets.only(
                          left: 40, top: 8, right: 40, bottom: 10),
                      child: Text('Publié le : ${article.publishedAt}')),
                )
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
                  article.content ?? '',
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
}

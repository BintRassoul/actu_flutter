import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';
import 'package:my_actu/constants/app_constants.dart';
import 'package:my_actu/routes/app_router.dart';

import 'package:my_actu/models/news_data_io_model.dart';
import 'customized_progress_indicator.dart';

class ActuItem extends StatelessWidget {
  final double widthCard;
  final double sizeTitle;
  final double sizeLink;

  final Result article;

  //late Directory _appDocsDir;
  //String path = '';
  const ActuItem(
      {required this.widthCard,
      required this.sizeTitle,
      required this.sizeLink,
      required this.article});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() => Get.toNamed(AppRoutes.DETAILS_NEWS,
              arguments: this
                  .article) /*  Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                
                return DetailPage(article: this.article);
              },
            ),
          ) */
          ),
      child: Container(
        width: this.widthCard,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            //boxShadow: [ shadow ],
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 9,
                  offset: Offset(0, 3))
            ]),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _getChild(
                context: context,
                urlToImage: article.imageUrl == null ? "" : article.imageUrl!),

            // ),

            SizedBox(
              height: 7.0,
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 10.0,
                left: 10.0,
                right: 10.0,
              ),
              child: Text(
                article.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontFamily: 'avenir', fontWeight: FontWeight.w800),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                article.link,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: this.sizeLink,
                  color: mainHexColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _getChild({required BuildContext context, required String? urlToImage}) {
    //  getDirectory();
    // log(" article.urlToImage,   " + article.urlToImage);
    return urlToImage == null
        ? imageContainer(
            child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/images/worldwide.png',
              width: .27 * width,
              height: .13 * height,
              color: mainHexColor,
              //fit: BoxFit.cover,
            ),
          ))
        : imageContainer(
            child: CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: urlToImage,
            filterQuality: FilterQuality.high,
            width: Get.width,
            cacheManager: CacheManager(Config(
              urlToImage,
              stalePeriod: const Duration(days: 364),
              //one week cache period
            )),
            placeholder: (context, urlToImage) => custumizedProgressIndicator(),
            errorWidget: (context, urlToImage, error) =>
                new Icon(Icons.error_outline),
          ));
  }
}

Flexible imageContainer({required Widget child}) {
  return Flexible(
    fit: FlexFit.loose,
    child: Container(width: Get.width, height: 250, child: child),
  );
}

class FavActuItem extends StatelessWidget {
  final double widthCard;
  final double sizeTitle;
  final double sizeLink;
  final File? file;
  final Result article;

  //late Directory _appDocsDir;
  //String path = '';
  const FavActuItem(
      {required this.widthCard,
      required this.sizeTitle,
      required this.sizeLink,
      required this.article,
      required this.file});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() =>
          Get.toNamed(AppRoutes.DETAILS_NEWS, arguments: this.article)),
      child: Container(
        width: this.widthCard,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            //boxShadow: [ shadow ],
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 9,
                  offset: Offset(0, 3))
            ]),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            imageContainer(
              child: file == null
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'assets/images/worldwide.png',
                        width: .27 * width,
                        height: .13 * height,
                        color: mainHexColor,
                        //fit: BoxFit.cover,
                      ),
                    )
                  : Image.file(
                      file!,
                      fit: BoxFit.cover,
                    ),
            ),
            SizedBox(
              height: 7.0,
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 10.0,
                left: 10.0,
                right: 10.0,
              ),
              child: Text(
                article.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontFamily: 'avenir', fontWeight: FontWeight.w800),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                article.link,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: this.sizeLink,
                  color: mainHexColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

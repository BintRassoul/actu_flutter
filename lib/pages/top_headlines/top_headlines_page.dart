import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_actu/constants/app_constants.dart';
import 'package:my_actu/widgets/section_page.dart';

import '../../widgets/utils.dart';
import 'top_headlines_controller.dart';

class TopHeadLinesPage extends StatelessWidget {
  final TopHeadLinesController topheadlinesController =
      Get.find<TopHeadLinesController>();

  @override
  Widget build(BuildContext context) {
    var args = Get.arguments;
    log(args.toString());
    String sType = args[0];

    String title = args[1];
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            //APP_MENU
            Padding(
              padding: EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 45.0, bottom: 18.0),
              child: Row(children: [
                Align(
                  alignment: Alignment(-0.84, -0.3),
                  child: InkWell(
                      onTap: () {
                        topheadlinesController.fetchArticles('general');
                        Get.back();
                      },
                      splashColor: secondColor,
                      borderRadius: BorderRadius.circular(32.0),
                      child: Icon(Icons.arrow_back_ios_rounded,
                          size: 30.0, color: iconHexColor)),
                ),
                SizedBox(
                  width: 13,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 25.0,
                    color: const Color(0xFF060606).withOpacity(0.87),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ]),
            ),

            //------------------------SEARCH BAR-----------------
            buildSearch(topheadlinesController, 'top', sType),

            //------------------------CATEGORIES-----------------

            Container(
              height: 60,
              child: ListView.builder(
                  itemCount: topheadlinesController.getCategories(sType).length,
                  padding: EdgeInsets.all(5),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Obx(() {
                      return Container(
                        margin: EdgeInsets.all(3),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              //side: BorderSide(width: 1.0),
                              minimumSize: Size(90, 33),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              primary:
                                  topheadlinesController.categories[index] ==
                                          topheadlinesController.ctg.value
                                      ? topheadlinesController.color1.value
                                      : topheadlinesController.color2.value,
                              padding: EdgeInsets.symmetric(horizontal: 5),
                            ),
                            onPressed: () {
                              topheadlinesController.isLoading.value = true;

                              topheadlinesController.getArticles(sType,
                                  topheadlinesController.categories[index]);
                            },
                            child: Center(
                                child: Text(
                              topheadlinesController.categories[index],
                              style: TextStyle(color: Colors.black),
                            ))),
                      );
                    });
                  }),
            ),

//-----------TOPHEADLINES NEWS------------

            Expanded(
              child: Container(
                margin: EdgeInsets.only(bottom: 10.0),
                padding: EdgeInsets.only(top: 5.0),
                //height: 900.0,
                child: Obx(() {
                  if (topheadlinesController.hasInternet.value) {
                    return loadChild(
                        topheadlinesController, 'top', sType, Axis.vertical);
                  }
                  return noIternet();
                }),
              ),
            ),
          ],
        ));
  }
}

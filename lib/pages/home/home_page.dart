import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_actu/constants/app_constants.dart';
import 'package:my_actu/pages/home/widgets/app_bar.dart';
import 'package:my_actu/pages/home/widgets/no_internet_lottie.dart';
import 'package:my_actu/pages/home/widgets/row_title.dart';
import 'package:my_actu/pages/home/widgets/try_btn.dart';
import 'package:my_actu/routes/app_routes.dart';
import 'package:my_actu/widgets/item_actu.dart';
import 'package:my_actu/widgets/section_page.dart';

import '../favorites/favorites_controller.dart';
import '../top_headlines/top_headlines_controller.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TopHeadLinesController topheadlinesController =
      Get.put(TopHeadLinesController());

  final FavoritesController favController = Get.put(FavoritesController());

  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      /*  appBar: AppBar(
        backgroundColor: mainHexColor,
        title: Row(
          children: [
            Container(
              height: 20,
              width: 20,
              child: Image.asset(
                "assets/images/worldwide.png",
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              'TopActu',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Bruno Ace",
                  color: Colors.white),
            ),
          ],
        ),
      ),
       */
      body: RefreshIndicator(
        onRefresh: () async {
          // setState(() async {
          favController.onInit();
          topheadlinesController.checkConnection();
          if (!topheadlinesController.hasInternet.value) {
            topheadlinesController.checkingInternet(false);
            log('checkingInternet3 ' +
                topheadlinesController.checkingInternet.value.toString());

            topheadlinesController.update();
          }
          Navigator.pushReplacementNamed(context, AppRoutes.HOME);
          //  homeController.checkConnection();
          //return Future.value(true);
          // });
        },
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              //-------------------APP BAR-------------

              appBarWidget(),
              //-------------------FAVORITES NEWS-------------

              Padding(
                padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 20.0),
                child: Column(
                  children: [
                    rowTitle(title: 'Mes Favoris', goTo: "FAVORITES"),
                    Obx(() {
                      return (favController.articlesTopList.length != 0)
                          ? Container(
                              padding: EdgeInsets.only(top: 5.0),
                              //color: Colors.amber,
                              width: width,
                              height: 235,
                              child: loadChild(
                                  controller: favController,
                                  isLoading: false,
                                  cType: "fav",
                                  sectionType: 'world',
                                  title: "",
                                  articles: favController.articlesTopList,
                                  axe: Axis.horizontal,
                                  loadingAll:
                                      favController.articlesList.length < 6
                                          ? true
                                          : false)
                              /*   ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount:
                                          favController.articlesTopList.length,
                                      itemBuilder: (context, index) {
                                        //   log('ELEMENT : ${topheadlinesController.articlesList[index]} &&&&&&&  ${topheadlinesController.articlesList[index].title}');
                                        print(
                                            favController.articlesList.length);
                                        return ActuItem(
                                          widthCard: widthHomeCard,
                                          sizeTitle: sizeHomeTitle,
                                          sizeLink: sizeHomeLink,
                                          article:
                                              favController.articlesList[index],
                                        );
                                      }) */
                              )
                          : Container(
                              padding: EdgeInsets.only(top: 5.0),
                              //color: Colors.amber,
                              height: 100,
                              child: Center(
                                child: Text("Pas d'éléments dans ce dossier"),
                              ));
                    }),

                    //-------------------TOPHEADLINES NEWS-------------

                    Obx(() {
                      bool isLoading = topheadlinesController.isLoading.value;
                      return (topheadlinesController.checkingInternet.value)
                          ? Column(
                              children: [
                                sectionPage(
                                    sectionType: 'world',
                                    title: "L'actualité dans le monde",
                                    country: 'world',
                                    axe: Axis.horizontal,
                                    isLoading: isLoading),
                                sectionPage(
                                    sectionType: 'europe',
                                    title: "En Europe",
                                    country: 'fr',
                                    axe: Axis.horizontal,
                                    isLoading: isLoading),
                                sectionPage(
                                    sectionType: 'afrique',
                                    title: "En Afrique",
                                    country: 'sa',
                                    axe: Axis.horizontal,
                                    isLoading: isLoading),
                                sectionPage(
                                    sectionType: 'amerique',
                                    title: "En Amérique",
                                    country: 'us',
                                    axe: Axis.horizontal,
                                    isLoading: isLoading),
                                sectionPage(
                                    sectionType: 'asie',
                                    title: "En Asie",
                                    country: 'cn',
                                    axe: Axis.horizontal,
                                    isLoading: isLoading),
                              ],
                            )
                          : /* GestureDetector(
                              onTap: () {
                                homeController.checkConnection();
                              },
                              child: tryButton(
                                topheadlinesController,
                              ),
                            ); */
                          noInternetSection();
                    }),
                    SizedBox(
                      height: 50,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

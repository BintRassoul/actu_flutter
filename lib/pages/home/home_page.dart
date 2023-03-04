import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_actu/constants/app_constants.dart';
import 'package:my_actu/pages/home/widgets/app_bar.dart';
import 'package:my_actu/pages/home/widgets/row_title.dart';
import 'package:my_actu/widgets/item_actu.dart';
import 'package:my_actu/widgets/section_page.dart';

import '../favorites/favorites_controller.dart';
import '../top_headlines/top_headlines_controller.dart';
import 'home_controller.dart';

class HomePage extends StatelessWidget {
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
          topheadlinesController.onInit();
          topheadlinesController.update();
          return Future.value(true);
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              appBarWidget(),
              //-------------------FAVORITES NEWS-------------

              Padding(
                padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 20.0),
                child: Column(
                  children: [
                    rowTitle(title: 'Mes Favoris', goTo: "FAVORITES"),
                    Container(
                        padding: EdgeInsets.only(top: 5.0),
                        //color: Colors.amber,
                        height:
                            favController.articlesList.length != 0 ? 235 : 100,
                        child: (favController.articlesList.length != 0)
                            ? ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: favController.articlesList.length,
                                itemBuilder: (context, index) {
                                  //   log('ELEMENT : ${topheadlinesController.articlesList[index]} &&&&&&&  ${topheadlinesController.articlesList[index].title}');
                                  print(favController.articlesList.length);
                                  return ActuItem(
                                    widthCard: widthHomeCard,
                                    sizeTitle: sizeHomeTitle,
                                    sizeLink: sizeHomeLink,
                                    article: favController.articlesList[index],
                                  );
                                })
                            : Center(
                                child: Text("Pas d'éléments dans ce dossier"),
                              )),
                  ],
                ),
              ),

              //-------------------TOPHEADLINES NEWS-------------
              sectionPage(topheadlinesController, 'world',
                  "L'actualité dans le monde", Axis.horizontal),

              (homeController.hasInternet.value)
                  ? Column(
                      children: [
                        sectionPage(topheadlinesController, 'europe',
                            'En Europe', Axis.horizontal),
                        sectionPage(topheadlinesController, 'afrique',
                            'En Afrique', Axis.horizontal),
                        sectionPage(topheadlinesController, 'amerique',
                            'En Amérique', Axis.horizontal),
                        sectionPage(topheadlinesController, 'asie', 'En Asie',
                            Axis.horizontal)
                      ],
                    )
                  : SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}

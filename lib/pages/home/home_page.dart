import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_actu/constants/app_constants.dart';
import 'package:my_actu/routes/app_routes.dart';
import 'package:my_actu/widgets/item_actu.dart';
import 'package:my_actu/widgets/section_page.dart';

import '../favorites/favorites_controller.dart';
import '../top_headlines/top_headlines_controller.dart';

class HomePage extends StatelessWidget {
  final TopHeadLinesController topheadlinesController =
      Get.put(TopHeadLinesController());
  final FavoritesController favController = Get.put(FavoritesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                //APP_MENU
                Padding(
                  padding: EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 45.0, bottom: 18.0),
                  child: Align(
                    alignment: Alignment(-1.0, -0.84),
                    child: Text(
                      'Accueil',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 25.0,
                        color: const Color(0xFF060606).withOpacity(0.87),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.grey[200],
                  width: MediaQuery.of(context).size.width,
                  height: 3,
                ),

                //FAVORITES
                Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 20.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Mes Favoris',
                            style: TextStyle(
                              fontFamily: 'Segoe UI',
                              fontSize: 21.0,
                              color: mainHexColor.withOpacity(0.54),
                            ),
                          ),
                          Align(
                            alignment: Alignment(0.84, -0.84),
                            child: InkWell(
                                onTap: () => Get.toNamed(AppRoutes.FAVORITES),
                                splashColor: secondColor,
                                borderRadius: BorderRadius.circular(32.0),
                                child: Icon(Icons.double_arrow_rounded,
                                    size: 25.0, color: mainHexColor)),
                          ),
                        ],
                      ),
                      Container(
                          padding: EdgeInsets.only(top: 5.0),
                          //color: Colors.amber,
                          height: 235.5,
                          child: Obx(() {
                            if (favController.articlesList.length != 0) {
                              return ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: favController.articlesList.length,
                                  itemBuilder: (context, index) {
                                    //   log('ELEMENT : ${topheadlinesController.articlesList[index]} &&&&&&&  ${topheadlinesController.articlesList[index].title}');
                                    print(favController.articlesList.length);
                                    return ActuItem(
                                      widthCard: widthHomeCard,
                                      sizeTitle: sizeHomeTitle,
                                      sizeLink: sizeHomeLink,
                                      article:
                                          favController.articlesList[index],
                                    );
                                  });
                            }
                            return Center(
                              child: Text("Pas d'éléments dans ce dossier"),
                            );
                          })),
                    ],
                  ),
                ),

                //-------------------TOPHEADLINES NEWS-------------
                sectionPage(topheadlinesController, 'top', 'world',
                    "L'actualité dans le monde", Axis.horizontal),
                sectionPage(topheadlinesController, 'top', 'europe',
                    'En Europe', Axis.horizontal),
                sectionPage(topheadlinesController, 'top', 'afrique',
                    'En Afrique', Axis.horizontal),
                sectionPage(topheadlinesController, 'top', 'amerique',
                    'En Amérique', Axis.horizontal),
                sectionPage(topheadlinesController, 'top', 'asie', 'En Asie',
                    Axis.horizontal)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

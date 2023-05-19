import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_actu/constants/app_constants.dart';
import 'package:my_actu/pages/home/widgets/app_bar.dart';

import '../../widgets/section_page.dart';
import '../../widgets/utils.dart';
import 'favorites_controller.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final FavoritesController favController = Get.find<FavoritesController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
//APP_MENU
          appBarWidget(),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Row(children: [
              GestureDetector(
                  onTap: () {
                    favController.getData();
                    Get.back();
                  },
                  child: SvgPicture.asset(
                    "assets/svg/icon_expand_left.svg",
                    //height: 100,
                    fit: BoxFit.cover,
                  )
                  /*   Icon(Icons.keyboard_double_arrow_left,
                          size: 33.0, color: blackColor) */
                  ),
              SizedBox(
                width: 8,
              ),
              Text(
                "Mes Favoris",
                style: TextStyle(
                  fontSize: 24.0,
                  color: blackColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ]),
          ),

          //------------------------SEARCH BAR-----------------
          buildSearch(favController, 'fav', 'world'),
          /*    SizedBox(
            height: 10,
          ), */
          //----------------------------------------
          Expanded(
            child: (favController.articlesList.length == 0)
                ? Container(
                    margin: EdgeInsets.only(top: 40.0, bottom: 50),
                    // padding: EdgeInsets.only(top: 5.0),
                    child: Text("Pas d'éléments dans ce dossier"))
                : Obx(() {
                    return Container(
                        margin: EdgeInsets.only(bottom: 50),
                        // padding: EdgeInsets.only(top: 5.0),
                        child: loadChild(
                            controller: favController,
                            isLoading: false,
                            cType: "fav",
                            sectionType: 'world',
                            title: "",
                            articles: favController.articlesList,
                            axe: Axis.vertical,
                            loadingAll: true));
                  }),
          ),
        ],
      ),
    );
  }
}

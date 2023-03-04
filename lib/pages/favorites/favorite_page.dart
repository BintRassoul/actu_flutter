import 'package:flutter/material.dart';
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
              Align(
                alignment: Alignment(-0.84, -0.3),
                child: InkWell(
                    onTap: () {
                      favController.getData();
                      Get.back();
                    },
                    splashColor: secondColor,
                    borderRadius: BorderRadius.circular(32.0),
                    child: /* SvgPicture.asset(
                                          "assets/svg/icon_expand_left.svg",
                                        ) */
                        Icon(Icons.keyboard_double_arrow_left,
                            size: 33.0, color: blackColor)),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "Mes Favoris",
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 24.0,
                  color: blackColor,
                  fontWeight: FontWeight.w700,
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
                : Container(
                    margin: EdgeInsets.only(bottom: 50),
                    // padding: EdgeInsets.only(top: 5.0),
                    child: loadChild(
                        favController, 'fav', 'world', '', Axis.vertical, true),
                  ),
          ),
        ],
      ),
    );
  }
}

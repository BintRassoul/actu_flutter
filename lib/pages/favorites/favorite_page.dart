import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_actu/constants/app_constants.dart';

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
          Padding(
            padding: EdgeInsets.only(
                left: 15.0, right: 15.0, top: 45.0, bottom: 18.0),
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
                    child: Icon(Icons.arrow_back_ios_rounded,
                        size: 30.0, color: iconHexColor)),
              ),
              SizedBox(
                width: 13,
              ),
              Text(
                "Mes Favoris",
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
          buildSearch(favController, 'fav', 'world'),
          SizedBox(
            height: 10,
          ),
          //----------------------------------------
          Expanded(
            child: Container(
              margin: EdgeInsets.only(bottom: 50.0),
              padding: EdgeInsets.only(top: 5.0),
              //height: 900.0,
              child: Obx(() {
                return loadChild(favController, 'fav', 'world', Axis.vertical);
              }),
            ),
          ),
        ],
      ),
    );
  }
}

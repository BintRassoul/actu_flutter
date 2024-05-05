import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_actu/features/commun/presentation/widgets/logo.dart';
import 'package:my_actu/routes/app_routes.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final scaffoldKey =
      GlobalKey<ScaffoldState>(debugLabel: 'GlobalKey #CheckPage');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      key: scaffoldKey,
      //   bottomNavigationBar: bottomNavBar(),
      // appBar: appBar(title: 'Chèques', key: scaffoldKey),
      // drawer: navigDrawer(),
      body: Padding(
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
            top: 40,
            bottom: 50,
          ),
          child: RefreshIndicator(
            onRefresh: () async {},
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  LogoApp(),
                ],
              ),
            ),
          )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:my_actu/features/commun/presentation/widgets/logo_widget.dart';
import 'package:my_actu/features/home/presentation/widgets/latest_section_widget.dart';
import 'package:my_actu/features/home/presentation/widgets/mainland_section_widget.dart';

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
            top: 63,
            bottom: 50,
          ),
          child: RefreshIndicator(
            onRefresh: () async {},
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LogoWidget(),
                  SizedBox(
                    height: 30,
                  ),

                  LatestSectionWidget(),
                  SizedBox(
                    height: 25,
                  ),
                  MainlandSectionWidget(title: "En Amérique"),
                  SizedBox(
                    height: 25,
                  ),
                  MainlandSectionWidget(title: "En Afrique"),
                  SizedBox(
                    height: 25,
                  ),
                  MainlandSectionWidget(title: "En Europe"),
                  SizedBox(
                    height: 25,
                  ),
                  MainlandSectionWidget(title: "En Asie"),
                  // Text('Signets', style: AppStyle().sectionTitleStyle())
                ],
              ),
            ),
          )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_actu/constants/app_constants.dart';
import 'package:my_actu/core/theme/styles.dart';
import 'package:my_actu/features/commun/presentation/widgets/back_widget.dart';
import 'package:my_actu/features/commun/presentation/widgets/bottom_navbar.dart';
import 'package:my_actu/features/commun/presentation/widgets/display_text_button.dart';
import 'package:my_actu/features/commun/presentation/widgets/search_filter.dart';
import 'package:my_actu/features/home/presentation/widgets/latest_section_widget.dart';
import 'package:my_actu/features/home/presentation/widgets/mainland_section_widget.dart';

class LatestNewsPage extends StatelessWidget {
  LatestNewsPage({super.key});

  final scaffoldKey =
      GlobalKey<ScaffoldState>(debugLabel: 'GlobalKey #latestPage');

  @override
  Widget build(BuildContext context) {
    var items = [
      LatestItem(),
      LatestItem(),
      LatestItem(),
      LatestItem(),
      LatestItem(),
      LatestItem()
    ];
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      key: scaffoldKey,
      bottomNavigationBar: BottomNavBar(),
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
                  //LogoWidget(),
                  /*   IconButton(
                    padding: EdgeInsets.zero,
                    visualDensity: VisualDensity(horizontal: -4),
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'assets/icons/svg/arrow_left.svg',
                      width: 34,
                      height: 34,
                      colorFilter:
                          ColorFilter.mode(AppColors.mallow, BlendMode.srcIn),
                    ),
                  ), */
                  BackWidget(),

                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Quoi de neuf',
                    style: AppStyle().hugeTitleTextStyle(),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SearchFilterRowWidget(),

                  SizedBox(
                    height: 15,
                  ),

                  Obx(
                    () => (allController.countriesListFiltered.isNotEmpty)
                        ? Container(
                            height: 30,
                            // color: Colors.amber,
                            child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: allController.countriesListFiltered
                                    .asMap()
                                    .entries
                                    .map(
                                      (e) => Padding(
                                        padding: EdgeInsets.only(right: 3.0),
                                        child: DisplayTextButton(
                                            text: e.value.name,
                                            textSize: 10,
                                            spaceBetween: 5,
                                            suffixIcon: Icon(
                                              Icons.close_rounded,
                                              size: 12,
                                            ),
                                            backgroundColor:
                                                e.value.colors!.first,
                                            textColor: e.value.colors![1],
                                            onTap: () =>
                                                allController.filterByCountry(
                                                    e.value.name,
                                                    e.value.continent!)),
                                      ),
                                    )
                                    .toList()),
                          )
                        : SizedBox.shrink(),
                  ),

                  SizedBox(
                    height: 15,
                  ),
                  Column(
                    children: items
                        .asMap()
                        .entries
                        .map((entry) => Padding(
                              padding: EdgeInsets.only(bottom: 15.0),
                              child: MainlandItem(
                                widthContainer: width,
                                heightContainer: 270,
                                heightImageInPercent: .67,
                                titleSize: 14,
                                subTitleSize: 10,
                                heightSpace: 35,
                                isDayDisplayed: true,
                              ),
                            ))
                        .toList(),
                  ),
                  /*    Container(
                    color: Colors.amber,
                    height: height * .8,
                    alignment: Alignment.topLeft,
                    child: ListView.builder(
                        //   scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 15.0),
                            child: MainlandItem(
                              widthContainer: width,
                              heightContainer: 270,
                              heightImageInPercent: .67,
                              titleSize: 14,
                              subTitleSize: 10,
                              heightSpace: 35,
                              isDayDisplayed: true,
                            ),
                          );
                        }),
                  ),
               */
                ],
              ),
            ),
          )),
    );
  }
}

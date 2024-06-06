import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_actu/constants/app_constants.dart';
import 'package:my_actu/core/theme/colors.dart';
import 'package:my_actu/features/commun/presentation/widgets/row_title.dart';

class MainlandSectionWidget extends StatelessWidget {
  final String title;
  final String route;

  const MainlandSectionWidget(
      {super.key, required this.title, required this.route});

  @override
  Widget build(BuildContext context) {
    final double widthContainer = width * .4;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RowTitleSection(
          title: title,
          route: route,
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          height: 180,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: MainlandItem(
                    widthContainer: widthContainer,
                    heightContainer: 180,
                    heightImageInPercent: .6,
                    titleSize: 10,
                    subTitleSize: 8,
                    heightSpace: 30,
                    isDayDisplayed: false,
                  ),
                );
              }),
        ),
      ],
    );
  }
}

class MainlandItem extends StatelessWidget {
  const MainlandItem(
      {super.key,
      required this.widthContainer,
      required this.heightContainer,
      required this.heightImageInPercent,
      required this.titleSize,
      required this.subTitleSize,
      required this.heightSpace,
      required this.isDayDisplayed});

  final double widthContainer;
  final double heightContainer;
  final double heightImageInPercent;
  final double titleSize;
  final double subTitleSize;
  final double heightSpace;
  final bool isDayDisplayed;

  @override
  Widget build(BuildContext context) {
    final double iconSize = isDayDisplayed ? 40 : 24;

    return Container(
      width: widthContainer,
      height: heightContainer,
      // padding: EdgeInsets.all(15),
      alignment: Alignment.bottomLeft,
      decoration: ShapeDecoration(
        color: AppColors.veryLightGray,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: //Image.network(
                  Container(
                      width: widthContainer,
                      height: heightContainer * heightImageInPercent,
                      decoration: ShapeDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              "https://dims.apnews.com/dims4/default/2f1313b/2147483647/strip/true/crop/6885x3873+0+359/resize/1440x810!/quality/90/?url=https%3A%2F%2Fassets.apnews.com%2F96%2F59%2F48b57bf6c7d6e13c68ca7a770daa%2F082edbab333345878e61058d778622eb"),
                          fit: BoxFit.cover,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                        ),
                      )
                      //fit: BoxFit.cover
                      )),
          Positioned(
            left: 0,
            bottom: heightSpace,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(7.0),
              child: Text(
                'Men’s Sweet 16: Duke humilie Houston et un autre numéro 1 tombe un autre numéro 1 tombe',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: titleSize, // 10,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
              right: 5,
              top: 10,
              child: Container(
                width: iconSize,
                height: iconSize,
                child: FloatingActionButton.small(
                  heroTag: null,
                  onPressed: () {},
                  backgroundColor: AppColors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: SvgPicture.asset('assets/icons/svg/bookmark.svg',
                      width: iconSize / 2,
                      height: iconSize / 2,
                      colorFilter:
                          ColorFilter.mode(AppColors.mallow, BlendMode.srcIn),
                      semanticsLabel: 'A red up arrow'),
                ),
              ) /* Container(
                width: 24,
                height: 24,
                decoration: ShapeDecoration(
                  color: AppColors.white,
                  shape: OvalBorder(),
                ),
                child: SvgPicture.asset('assets/icons/svg/bookmark.svg',
                    width: 6,
                    height: 6,
                    colorFilter:
                        ColorFilter.mode(AppColors.mallow, BlendMode.srcIn),
                    semanticsLabel: 'A red up arrow')), */
              ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.all(7.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: ShapeDecoration(
                      color: Color(0xFFD38106),
                      shape: OvalBorder(),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'New York Times',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: AppColors.black,
                              fontSize: subTitleSize, // 8,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 1),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          'Emma Lee',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: subTitleSize, // 8,
                            fontFamily: 'ABeeZee',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (isDayDisplayed)
            Positioned(
              bottom: 12,
              right: 0,
              child: Text(
                '12 Dec 2024—10h:18',
                style: TextStyle(
                  color: AppColors.darkGray,
                  fontSize: 10,
                  fontFamily: 'ABeeZee',
                  fontWeight: FontWeight.w400,
                ),
              ),
            )
        ],
      ),
    );
  }
}

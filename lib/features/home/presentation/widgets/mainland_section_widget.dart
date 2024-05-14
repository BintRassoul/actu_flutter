import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_actu/constants/app_constants.dart';
import 'package:my_actu/core/theme/colors.dart';
import 'package:my_actu/features/commun/presentation/widgets/row_title.dart';

class MainlandSectionWidget extends StatelessWidget {
  final String title;

  const MainlandSectionWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final double widthContainer = width * .4;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RowTitleSection(title: title),
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
                  child: MainlandItem(widthContainer: widthContainer),
                );
              }),
        ),
      ],
    );
  }
}

class MainlandItem extends StatelessWidget {
  const MainlandItem({
    super.key,
    required this.widthContainer,
  });

  final double widthContainer;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthContainer,
      height: 180,
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
              child: //Image.network(
                  Container(
                      width: widthContainer,
                      height: 180 * .6,
                      decoration: ShapeDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            "https://s.france24.com/media/display/404b6be0-06cc-11ef-98d4-005056a97e36/w:980/p:16x9/AP24076834131919.webp",
                          ),
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
            bottom: 30,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(7.0),
              child: Text(
                'Men’s Sweet 16: Duke humilie Houston et un autre numéro 1 tombe un autre numéro 1 tombe',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 10,
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
                width: 24,
                height: 24,
                child: FloatingActionButton.small(
                  heroTag: null,
                  onPressed: () {},
                  backgroundColor: AppColors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: SvgPicture.asset('assets/icons/svg/bookmark.svg',
                      width: 12,
                      height: 12,
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
                              fontSize: 8,
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
                            fontSize: 8,
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
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:my_actu/constants/app_constants.dart';
import 'package:my_actu/core/theme/colors.dart';
import 'package:my_actu/features/commun/presentation/widgets/row_title.dart';

class LatestSectionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RowTitleSection(title: 'Quoi de neuf'),
        SizedBox(
          height: 15,
        ),
        LatestItem(),
      ],
    );
  }
}

class LatestItem extends StatelessWidget {
  const LatestItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 230,
      padding: EdgeInsets.all(15),
      alignment: Alignment.bottomLeft,
      decoration: ShapeDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.18, 0.98),
          end: Alignment(-0.18, -0.98),
          colors: [
            Color(0xFF090909),
            Colors.black,
            Color(0x44141414),
            Color(0x35EFEFEF)
          ],
        ),
        image: DecorationImage(
          image: NetworkImage(
              "https://dims.apnews.com/dims4/default/b2b9157/2147483647/strip/true/crop/3002x1689+0+156/resize/1440x810!/quality/90/?url=https%3A%2F%2Fassets.apnews.com%2Fa6%2F10%2Fad508186a74e4e6bbf0c24553614%2F5a100a9efdc14fa8a7048b66b800e48d"),
          fit: BoxFit.fill,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 40,
            child: Text(
              'Men’s Sweet 16: Duke humilie Houston et un autre numéro 1 tombe un autre numéro 1 tombe',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 14,
                  height: 14,
                  decoration: ShapeDecoration(
                    color: Color(0xFFD38106),
                    shape: OvalBorder(),
                  ),
                ),
                SizedBox(
                  width: 15,
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
                          color: Colors.white,
                          fontSize: 11,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                          height: 1,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        'Emma Lee',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: AppColors.lightGray,
                          fontSize: 10,
                          fontFamily: 'ABeeZee',
                          fontWeight: FontWeight.w400,
                          // height: 0.16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 12,
            right: 0,
            child: Text(
              '12 Dec 2024—10h:18',
              style: TextStyle(
                color: AppColors.lightGray,
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

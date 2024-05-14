import 'package:flutter/material.dart';
import 'package:my_actu/constants/app_constants.dart';
import 'package:my_actu/core/theme/colors.dart';

class LogoWidget extends StatelessWidget {
  final bool isWithDate;
  const LogoWidget({super.key, this.isWithDate = true});

  @override
  Container build(BuildContext context) {
    return Container(
      // color: Colors.amber,
      width: width,
      height: 50,
      child: Stack(
        children: [
          Positioned(
            left: 8.22,
            top: 0,
            child: SizedBox(
              child: Text(
                'TopActu',
                style: TextStyle(
                  color: AppColors.darkMallow,
                  fontSize: 14,
                  fontFamily: 'Bruno Ace',
                  fontWeight: FontWeight.w400,
                  height: 0,
                  letterSpacing: 0.84,
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 12,
            child: Container(
              width: 7,
              height: 7,
              decoration: ShapeDecoration(
                color: AppColors.darkMallow,
                shape: OvalBorder(),
              ),
            ),
          ),
          if (isWithDate)
            Positioned(
              left: 10,
              top: 18,
              child: Text(
                'Lundi 12 Mars 2024',
                style: TextStyle(
                  color: AppColors.darkGray,
                  fontSize: 12,
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

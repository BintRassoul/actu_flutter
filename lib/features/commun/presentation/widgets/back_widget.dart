import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_actu/core/theme/colors.dart';

class BackWidget extends StatelessWidget {
  const BackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      visualDensity: VisualDensity(horizontal: -4),
      onPressed: () => Navigator.pop(context),
      icon: SvgPicture.asset(
        'assets/icons/svg/arrow_left.svg',
        width: 34,
        height: 34,
        colorFilter: ColorFilter.mode(AppColors.mallow, BlendMode.srcIn),
      ),
    );
  }
}

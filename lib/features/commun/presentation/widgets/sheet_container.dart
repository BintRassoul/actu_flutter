import 'package:flutter/material.dart';
import 'package:my_actu/core/theme/colors.dart';

class SheetContainer extends StatelessWidget {
  final Widget child;
  final double? containerWidth;
  final double? containerHeight;
  final EdgeInsetsGeometry? padding;

  SheetContainer(
      {super.key,
      required this.child,
      this.containerWidth,
      this.padding,
      this.containerHeight});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: containerWidth,
      height: containerHeight,
      padding: padding,
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: AppColors.darkGray,
            blurRadius: 10,
          ),
        ],
        color: AppColors.white,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
      ),
      child: child,
    );
  }
}

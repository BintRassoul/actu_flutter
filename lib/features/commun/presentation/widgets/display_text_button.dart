import 'package:flutter/material.dart';
import 'package:my_actu/core/theme/colors.dart';
import 'package:my_actu/core/theme/styles.dart';

class DisplayTextButton extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  final double textSize;
  final Color? textColor;
  final Color? backgroundColor;
  final FontWeight fontWeight;
  final TextDecoration decoration;
  final Color? decorationColor;
  final EdgeInsetsGeometry? padding;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double spaceBetween;
  final double? width;
  final double height;
  final bool isActive;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;

  const DisplayTextButton({
    Key? key,
    this.onTap,
    required this.text,
    this.textSize = 14,
    this.textColor = AppColors.black,
    this.backgroundColor = Colors.transparent,
    this.fontWeight = FontWeight.w400,
    this.decoration = TextDecoration.none,
    this.decorationColor,
    this.padding,
    this.prefixIcon,
    this.suffixIcon,
    this.spaceBetween = 10,
    this.width,
    this.height = 30,
    this.isActive = false,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisAlignment = MainAxisAlignment.center,
  }) : super(key: key);

  @override
  TextButton build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: ButtonStyle(
          padding: MaterialStateProperty.all(padding),
          visualDensity: const VisualDensity(vertical: -4),
          backgroundColor: MaterialStateProperty.all(
            isActive ? AppColors.darkMallow : backgroundColor!,
          ),
          textStyle: MaterialStateProperty.all(AppStyle().tinyLabelStyle(
            // color: isActive ? AppColors.lightGray : textColor!,
            fontWeight: fontWeight,
            size: textSize,
            // decoration: decoration,
            //decorationColor: isActive ? AppColors.gray : decorationColor,
          )),
          foregroundColor: MaterialStateProperty.all(
            isActive ? AppColors.white : textColor!,
          )),
      child: SizedBox(
        //  color: Colors.amber,
        width: width,
        height: height,
        child: prefixIcon == null && suffixIcon == null
            ? Center(
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            : prefixIcon != null && suffixIcon != null
                ? Row(
                    crossAxisAlignment: crossAxisAlignment,
                    mainAxisAlignment: mainAxisAlignment,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(right: spaceBetween),
                          child: prefixIcon),
                      Text(
                        text,
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: spaceBetween),
                          child: suffixIcon),
                    ],
                    // ),
                  )
                : suffixIcon == null
                    ? Row(
                        crossAxisAlignment: crossAxisAlignment,
                        mainAxisAlignment: mainAxisAlignment,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(right: spaceBetween),
                              child: prefixIcon),
                          Text(
                            text,
                          ),
                        ],
                        // ),
                      )
                    : Row(
                        crossAxisAlignment: crossAxisAlignment,
                        mainAxisAlignment: mainAxisAlignment,
                        children: [
                          Text(
                            text,
                          ),
                          Container(
                              padding: EdgeInsets.only(left: spaceBetween),
                              child: suffixIcon),
                        ],
                      ),
      ),
    );
  }
}

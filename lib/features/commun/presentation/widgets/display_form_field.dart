import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_actu/core/theme/colors.dart';
import 'package:my_actu/core/theme/styles.dart';

class DisplayFormField extends StatelessWidget {
  final BuildContext context;
  final TextEditingController? controller;
  final String? hintText;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final TextStyle? labelStyle;
  final String? iconInPng;
  //String? prefixIconInPng;
  final EdgeInsetsGeometry? margin;
  final double? height;
  final double? width;
  final double radius;
  final String? helperText;
  final String? errorText;
  final String? label;
  final int? maxLength;
  final int maxLines;
  final bool obscureText;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final ValueSetter<String>? onChanged;
  final Function()? onPressed;
  final Function()? onTap;
  final ValueSetter<String>? onSubmitted;
  final double? labelSize;
  final EdgeInsetsGeometry? contentPadding;
  final bool readOnly;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? suffixIconInSvg;
  final String? prefixIconInSvg;
  final double svgSize;
  final Color? borderColor;
  final List<TextInputFormatter>? inputFormatters;
  const DisplayFormField({
    Key? key,
    required this.context,
    this.controller,
    this.hintText,
    this.hintStyle,
    this.style,
    this.labelStyle,
    this.iconInPng,
    this.margin,
    this.height,
    this.width,
    this.radius = 8.0,
    this.helperText,
    this.errorText,
    this.label,
    this.maxLength,
    this.maxLines = 1,
    this.obscureText = false,
    this.textInputAction,
    this.keyboardType,
    this.validator,
    this.onChanged,
    this.onPressed,
    this.onTap,
    this.onSubmitted,
    this.labelSize,
    this.contentPadding,
    this.readOnly = false,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixIconInSvg,
    this.prefixIconInSvg,
    this.svgSize = 36,
    this.borderColor = AppColors.veryLightGray,
    this.inputFormatters,
  }) : super(key: key);

  @override
  Column build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: Text(
              label!,
              style: labelStyle ?? Theme.of(context).textTheme.labelSmall,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        //: const SizedBox.shrink(),

        Container(
          margin: margin,
          height: height,
          width: width,
          child: TextFormField(
            controller: controller,
            validator: validator,
            onChanged: onChanged,
            onFieldSubmitted: onSubmitted,
            keyboardType: keyboardType,
            maxLines: maxLines,
            obscureText: obscureText,
            maxLength: maxLength,
            readOnly: readOnly,
            textInputAction: textInputAction,
            onTap: onTap,
            obscuringCharacter: '*',
            inputFormatters: inputFormatters ??
                (keyboardType == TextInputType.number
                    ? <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ]
                    : <TextInputFormatter>[]),
            autofocus: false,
            cursorColor: borderColor,
            style: style ??
                AppStyle().tinyLabelStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.w600,
                ),
            decoration: InputDecoration(
              filled: true,

              fillColor: AppColors.lightGray,
              // counterText: '',
              suffixIcon: suffixIconInSvg == null && suffixIcon == null
                  ? null
                  : suffixIconInSvg != null
                      ? GestureDetector(
                          onTap: onPressed,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 15.0),
                            child: SvgPicture.asset(
                              suffixIconInSvg!,
                              colorFilter: ColorFilter.mode(
                                Theme.of(context).hintColor,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        )
                      : suffixIcon,
              suffixIconConstraints: BoxConstraints(
                maxHeight: svgSize,
                maxWidth: svgSize,
              ),
              prefixIconConstraints: BoxConstraints(
                maxHeight: svgSize,
                maxWidth: svgSize,
              ),
              prefixIcon: prefixIconInSvg == null && prefixIcon == null
                  ? null
                  : prefixIconInSvg != null
                      ? GestureDetector(
                          onTap: onPressed,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: SvgPicture.asset(
                              prefixIconInSvg!,
                              colorFilter: ColorFilter.mode(
                                Theme.of(context).hintColor,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        )
                      : prefixIcon,
              hintText: hintText,
              contentPadding: contentPadding ??
                  const EdgeInsets.only(
                    top: 18.0,
                    bottom: 18,
                    right: 15.0,
                  ),
              prefix: const Padding(
                padding: EdgeInsets.only(left: 15.0),
              ),
              hintStyle: hintStyle ??
                  AppStyle().tinyLabelStyle(
                    color: Theme.of(context).hintColor,
                    fontWeight: FontWeight.w500,
                  ),
              labelStyle: AppStyle().tinyLabelStyle(
                color: AppColors.black, //Theme.of(context).hintColor,
                fontWeight: FontWeight.w500,
              ),
              errorText: errorText != '' ? errorText : null,
              helperText: helperText,
              helperStyle: AppStyle().tinyLabelStyle(
                color: Theme.of(context).primaryColor,
                size: 12,
              ),
              errorStyle: const TextStyle(
                height: 0.0,
                fontSize: 12,
              ),
              errorMaxLines: 1,
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius),
                borderSide: const BorderSide(
                  color: AppColors.red,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(radius),
                ),
                borderSide: BorderSide(
                  color: borderColor ?? AppColors.veryLightGray,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(radius),
                ),
                borderSide: BorderSide(
                  color: borderColor ?? AppColors.veryLightGray,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(radius),
                ),
                borderSide: BorderSide(
                  color: borderColor ?? Theme.of(context).hintColor,
                  width: 1.5,
                ),
              ),
            ),
          ),
        ),
      ],
    );
    /* }
  throw Exception(
      "You can't create displayFormField with Widget? prefixIcon and or String? prefixIconInSvg at the same time");
 */
  }
}

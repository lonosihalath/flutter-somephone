import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:hrplatform/app/config/constants/app_colors.dart';
import 'package:hrplatform/app/config/constants/app_text_styles.dart';

class AppTextFormFieldWidget extends StatelessWidget {
  final String? label;
  final String hintText;
  final String? validator;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatter;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final String? icon;
  final Widget? perfixIcon;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool readOnly;
  final int? maxLines;
  final double? fontSize;
  final FontWeight? fontWeight;
  final bool? isMobile;
  final Function(String)? onChanged;
  final Function()? onFieldSubmitted;
  final BorderRadius? borderRadius;
  final BorderSide? borderSide;
  final TextAlign? textAlign;
  final Callback? ontap;
  final FocusNode? focusNode;
  final Color? fillColor;
  final TextStyle? hintStyle;
  final TextStyle? style;

  const AppTextFormFieldWidget(
      {super.key,
      required this.hintText,
      this.label,
      this.validator,
      this.textInputType,
      this.inputFormatter,
      this.controller,
      this.suffixIcon,
      this.obscureText,
      this.icon,
      this.keyboardType,
      this.textInputAction,
      this.readOnly = false,
      this.maxLines,
      this.fontSize = 14,
      this.fontWeight,
      this.isMobile = true,
      this.onChanged,
      this.onFieldSubmitted,
      this.borderRadius,
      this.borderSide,
      this.textAlign = TextAlign.start,
      this.ontap,
      this.perfixIcon,
      this.focusNode,
      this.fillColor,
      this.hintStyle,
      this.style});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: inputFormatter ?? [],
      cursorColor: AppColors.kPrimaryColor,
      focusNode: focusNode,
      controller: controller,
      obscureText: obscureText ?? false,
      onTap: ontap,
      style: style,
      validator: validator == null
          ? null
          : (String? val) {
              if (val!.isEmpty) {
                return validator;
              }
              return null;
            },
      readOnly: readOnly,
      onChanged: onChanged,
      onEditingComplete: onFieldSubmitted,
      textAlign: textAlign ?? TextAlign.start,
      keyboardType: keyboardType,
      maxLines: maxLines ?? 1,
      decoration: InputDecoration(
        labelText: label,
        contentPadding: EdgeInsets.only(
            left: 20,
            top: isTablet ? 18 : 10,
            bottom: isTablet ? 18 : 10,
            right: 20),
        hintText: hintText,
        hintStyle: hintStyle,
        prefixIcon: perfixIcon,
        fillColor: fillColor ?? AppColors.kBackground,
        filled: true,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(10),
          borderSide: borderSide ?? const BorderSide(),
        ),
        errorStyle: AppTextStyles.textSize13(context: context, isBold: false)
            .copyWith(color: AppColors.kPrimaryColor),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(
          borderSide: borderSide ??
              BorderSide(
                width: .5,
                color: AppColors.kTextInput,
              ),
          borderRadius: borderRadius ??
              BorderRadius.circular(
                isTablet ? 10 : 5,
              ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: borderSide ??
              BorderSide(
                width: .5,
                color: AppColors.kPrimaryColor,
              ),
          borderRadius: borderRadius ??
              BorderRadius.circular(
                isTablet ? 10 : 5,
              ),
        ),
      ),
    );
  }
}

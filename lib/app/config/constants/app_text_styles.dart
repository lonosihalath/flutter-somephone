import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrplatform/app/config/constants/app_fonts.dart';
import 'app_colors.dart';

final bool isTablet = Get.context!.isTablet;
final bool isPhone = Get.context!.isPhone;
final bool isSmallPhone = Get.context!.width < 380;

class AppTextStyles {
  // Method to get a TextStyle based on provided parameters and context
  static TextStyle getTextStyle({
    required BuildContext context,
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? letterSpacing,
  }) {
    return TextStyle(
      fontFamily: appFontFamily(),
      fontSize: fontSize ?? 10,
      fontWeight: fontWeight ?? FontWeight.w400,
      color: color ?? AppColors.kTextBlack,
      letterSpacing: letterSpacing ?? 0,
    );
  }

  // Function to create a text style with dynamic sizing and boldness
  static TextStyle textStyleBySize({
    required BuildContext context,
    required int baseSize,
    required bool isBold,
  }) {
    double fontSize = isTablet
        ? baseSize + 5
        : isSmallPhone
            ? baseSize - 1
            : baseSize.toDouble();
    return getTextStyle(
      context: context,
      fontSize: fontSize,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
    );
  }

  static TextStyle textSize10(
          {required BuildContext context, required bool isBold}) =>
      textStyleBySize(context: context, baseSize: 10, isBold: isBold);
  static TextStyle textSize11(
          {required BuildContext context, required bool isBold}) =>
      textStyleBySize(context: context, baseSize: 11, isBold: isBold);
  static TextStyle textSize12(
          {required BuildContext context, required bool isBold}) =>
      textStyleBySize(context: context, baseSize: 12, isBold: isBold);
  static TextStyle textSize13(
          {required BuildContext context, required bool isBold}) =>
      textStyleBySize(context: context, baseSize: 13, isBold: isBold);
  static TextStyle textSize14(
          {required BuildContext context, required bool isBold}) =>
      textStyleBySize(context: context, baseSize: 14, isBold: isBold);
  static TextStyle textSize15(
          {required BuildContext context, required bool isBold}) =>
      textStyleBySize(context: context, baseSize: 15, isBold: isBold);
  static TextStyle textSize16(
          {required BuildContext context, required bool isBold}) =>
      textStyleBySize(context: context, baseSize: 16, isBold: isBold);
  static TextStyle textSize17(
          {required BuildContext context, required bool isBold}) =>
      textStyleBySize(context: context, baseSize: 17, isBold: isBold);
  static TextStyle textSize18(
          {required BuildContext context, required bool isBold}) =>
      textStyleBySize(context: context, baseSize: 18, isBold: isBold);
  static TextStyle textSize19(
          {required BuildContext context, required bool isBold}) =>
      textStyleBySize(context: context, baseSize: 19, isBold: isBold);
  static TextStyle textSize20(
          {required BuildContext context, required bool isBold}) =>
      textStyleBySize(context: context, baseSize: 20, isBold: isBold);
  static TextStyle textSize21(
          {required BuildContext context, required bool isBold}) =>
      textStyleBySize(context: context, baseSize: 21, isBold: isBold);
  static TextStyle textSize22(
          {required BuildContext context, required bool isBold}) =>
      textStyleBySize(context: context, baseSize: 22, isBold: isBold);
  static TextStyle textSize23(
          {required BuildContext context, required bool isBold}) =>
      textStyleBySize(context: context, baseSize: 23, isBold: isBold);
  static TextStyle textSize24(
          {required BuildContext context, required bool isBold}) =>
      textStyleBySize(context: context, baseSize: 24, isBold: isBold);
  static TextStyle textSize25(
          {required BuildContext context, required bool isBold}) =>
      textStyleBySize(context: context, baseSize: 25, isBold: isBold);
  static TextStyle textSize26(
          {required BuildContext context, required bool isBold}) =>
      textStyleBySize(context: context, baseSize: 26, isBold: isBold);
  static TextStyle textSize27(
          {required BuildContext context, required bool isBold}) =>
      textStyleBySize(context: context, baseSize: 27, isBold: isBold);
  static TextStyle textSize28(
          {required BuildContext context, required bool isBold}) =>
      textStyleBySize(context: context, baseSize: 28, isBold: isBold);
  static TextStyle textSize29(
          {required BuildContext context, required bool isBold}) =>
      textStyleBySize(context: context, baseSize: 29, isBold: isBold);
  static TextStyle textSize30(
          {required BuildContext context, required bool isBold}) =>
      textStyleBySize(context: context, baseSize: 30, isBold: isBold);
  static TextStyle textSize31(
          {required BuildContext context, required bool isBold}) =>
      textStyleBySize(context: context, baseSize: 31, isBold: isBold);
  static TextStyle textSize32(
          {required BuildContext context, required bool isBold}) =>
      textStyleBySize(context: context, baseSize: 32, isBold: isBold);
  static TextStyle textSize33(
          {required BuildContext context, required bool isBold}) =>
      textStyleBySize(context: context, baseSize: 33, isBold: isBold);
}

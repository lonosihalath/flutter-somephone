import 'package:flutter/material.dart';

class AppSizeConfig {
  static double? screenWidth;
  static double? screenHeight;
  static double? width;
  static double? height;
  static double? textMultiplier;
  static double? imageSizeMultiplier;
  static double? defaultPadding;

  void init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    width = screenWidth! / 100;
    height = screenHeight! / 100;
    textMultiplier = height;
    imageSizeMultiplier = width;
    defaultPadding = AppSizeConfig.width! * 4;
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hrplatform/app/config/constants/app_text_styles.dart';
import 'package:hrplatform/app/config/widgets/close_page.dart';

AppBar appbarApp(
    {required String title,
    bool showLeading = true,
    Color? bgColor,
    Widget? acction,
    Color arrowColor = Colors.black}) {
  return AppBar(
    systemOverlayStyle: bgColor == null
        ? SystemUiOverlayStyle.dark
        : SystemUiOverlayStyle.light,
    leading: showLeading
        ? IconButton(
            onPressed: () => close(),
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              size: isTablet ? 12 : 8,
            ),
          )
        : null,
    title: Text(
      title.tr,
      style: AppTextStyles.textSize16(context: Get.context!, isBold: false)
          .copyWith(
        color: bgColor == null ? Colors.black : Colors.white,
        fontWeight: FontWeight.w600,
      ),
    ),
    centerTitle: true,
    elevation: 0,
    backgroundColor: bgColor ?? Colors.transparent,
    surfaceTintColor: bgColor ?? Colors.transparent,
    toolbarHeight: HomeSizeWidget.sizeAppBar(), //height of appbar 80,
    actions: acction != null ? [acction] : null,
  );
}

abstract class HomeSizeWidget {
  static double sizeAppBar() {
    if (isTablet) {
      return 90;
    }
    return 70;
  }

  static double sizeCard() {
    if (isTablet) {
      return 150;
    }
    return isSmallPhone ? 80 : 100;
  }

  static double sizeIcon() {
    if (isTablet) {
      return 50;
    }
    return isSmallPhone ? 25 : 30;
  }
}

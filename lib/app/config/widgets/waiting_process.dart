import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:hrplatform/app/config/constants/app_colors.dart';
import 'package:hrplatform/app/config/constants/app_sizeconfig.dart';
import 'package:hrplatform/app/config/constants/app_text_styles.dart';

class Waiting {
  static void show() {
    Get.dialog(
        barrierDismissible: false,
        transitionDuration: const Duration(milliseconds: 200),
        AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor: Colors.transparent,
          contentPadding: const EdgeInsetsDirectional.all(0),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  width: isTablet ? 400 : 300,
                  decoration: BoxDecoration(
                      color: AppColors.kLigth,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20),
                        SpinKitCircle(
                          color: AppColors.kPrimaryColor,
                          size: isTablet ? 70 : 50.0,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Please wait...'.tr,
                          style: AppTextStyles.textSize14(
                                  context: Get.context!, isBold: false)
                              .copyWith(color: Colors.grey.shade700),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  )),
            ],
          ),
        ));
  }

  static void hide() {
    if (Get.isDialogOpen!) Get.back();
  }

  static showBody() {
    return Padding(
      padding: EdgeInsets.only(top: AppSizeConfig.height! * 25),
      child: SpinKitCircle(
        color: AppColors.kPrimaryColor,
        size: 50.0,
      ),
    );
  }
}

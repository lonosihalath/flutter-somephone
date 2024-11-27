import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hrplatform/app/config/constants/app_assets.dart';
import 'package:hrplatform/app/config/constants/app_colors.dart';
import 'package:hrplatform/app/config/constants/app_sizeconfig.dart';
import 'package:hrplatform/app/config/constants/app_text_styles.dart';
import 'package:hrplatform/app/config/widgets/button_custom.dart';

class DialogHelper {
  static void showDialog({
    required String message,
    required String assetPath,
    required String title,
    required Color titleColor,
    required Color buttonColor,
  }) {
    Get.dialog(
      barrierDismissible: false,
      AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: Colors.transparent,
        contentPadding: const EdgeInsetsDirectional.all(0),
        content: Container(
          width: 300,
          decoration: BoxDecoration(
            color: AppColors.kLigth,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.all(AppSizeConfig.defaultPadding!),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset(assetPath),
                      const SizedBox(height: 10),
                      Text(
                        title.tr,
                        style: AppTextStyles.textSize25(
                                context: Get.context!, isBold: true)
                            .copyWith(color: titleColor),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        message.tr,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.textSize15(
                                context: Get.context!, isBold: false)
                            .copyWith(color: AppColors.kLigth[800]),
                      ),
                      const SizedBox(height: 35),
                      ButtonCustomWidget(
                        width: AppSizeConfig.width! * 100,
                        radius: 10,
                        backgroundColor: buttonColor,
                        height: 50,
                        text: 'Ok'.tr,
                        onTap: () => closeDialog(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static void showSuccessDialog({required String message}) {
    showDialog(
      message: message.tr,
      assetPath: AppAssets.success,
      title: 'Successfully'.tr,
      titleColor: AppColors.colorSuccess,
      buttonColor: AppColors.colorSuccess,
    );
  }

  static void showWarningDialog({required String message}) {
    showDialog(
      message: message.tr,
      assetPath: AppAssets.warning,
      title: 'Warning'.tr,
      titleColor: Colors.amber,
      buttonColor: Colors.amber,
    );
  }

  static void showErrorDialog({required String message}) {
    showDialog(
      message: message.tr,
      assetPath: AppAssets.close,
      title: 'Sorry'.tr,
      titleColor: AppColors.kPrimaryColor,
      buttonColor: AppColors.kPrimaryColor,
    );
  }

  static void closeDialog() {
    Get.back();
  }
}

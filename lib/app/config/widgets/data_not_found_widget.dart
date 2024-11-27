import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrplatform/app/config/constants/app_sizeconfig.dart';
import 'package:hrplatform/app/config/constants/app_text_styles.dart';
import 'package:lottie/lottie.dart';

class AppDataNotFound extends StatelessWidget {
  final String? message;
  final String? note;
  final bool? isPadding;

  const AppDataNotFound(
      {super.key, this.message, this.isPadding = true, this.note});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: isPadding! ? AppSizeConfig.width! * 30 : 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset('assets/animation/data_not_found.json',
              width: 130, repeat: false),
          Text(message ?? 'No contract information'.tr,
              style: AppTextStyles.textSize16(context: context, isBold: false)),
          const SizedBox(height: 10),
          Text(note ?? "",
              style: AppTextStyles.textSize14(context: context, isBold: false)),
        ],
      ),
    );
  }
}

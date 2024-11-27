// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hrplatform/app/config/constants/app_colors.dart';
import 'package:hrplatform/app/config/constants/app_text_styles.dart';

class ButtonCustomWidget extends StatelessWidget {
  final double height;
  final double width;
  final double fontSize;
  final String text;
  final double? radius;
  final double? elevation;
  final VoidCallback onTap;
  final Widget? icon;
  final Widget? iconImage;
  final Color? backgroundColor;
  final bool? fontBold;
  const ButtonCustomWidget({
    super.key,
    this.height = 56,
    this.width = 150,
    this.radius = 15,
    this.elevation = 0,
    this.fontSize = 16,
    this.fontBold = true,
    this.icon,
    this.iconImage,
    this.backgroundColor,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              elevation: elevation,
              padding: const EdgeInsets.all(0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius!)),
              backgroundColor: backgroundColor ?? AppColors.kPrimaryColor),
          onPressed: () {
            onTap();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              iconImage ?? const SizedBox(),
              iconImage != null ? const SizedBox(width: 10) : const SizedBox(),
              Text(text,
                  style: AppTextStyles.textSize16(
                          context: context, isBold: fontBold ?? false)
                      .copyWith(color: AppColors.kLigth)),
              icon == null ? const SizedBox() : const SizedBox(width: 15),
              icon ?? const SizedBox(),
            ],
          )),
    );
  }
}

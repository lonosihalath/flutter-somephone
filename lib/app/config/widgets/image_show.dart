import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:hrplatform/app/config/constants/app_assets.dart';
import 'package:hrplatform/app/config/constants/app_colors.dart';
import 'package:hrplatform/app/config/widgets/view_image.dart';

Widget imageWidget({
  required String url,
  bool showImage = true,
  VoidCallback? onTap,
}) {
  bool isValidUrl = Uri.tryParse(url)?.hasAbsolutePath ?? false;

  if (!isValidUrl) {
    return GestureDetector(
      onTap: () {
        if (showImage) {
          Get.to(
            () => ShowImageView(
              url: url,
              image: null,
            ),
            duration: Duration.zero,
          );
        } else {
          onTap?.call();
        }
      },
      child: Center(
        child: Image.asset(AppAssets.logo), 
      ),
    );
  }

  return CachedNetworkImage(
    imageUrl: url,
    imageBuilder: (context, imageProvider) => GestureDetector(
      onTap: () {
        if (showImage) {
          Get.to(
            () => ShowImageView(
              url: url,
              image: null,
            ),
            duration: Duration.zero,
          );
        } else {
          onTap?.call();
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
    ),
    placeholder: (context, url) => SpinKitCircle(
      color: AppColors.kPrimaryColor,
      size: 50.0,
    ),
    errorWidget: (context, url, error) => Center(
      child: Image.asset(AppAssets.logo), 
    ),
  );
}

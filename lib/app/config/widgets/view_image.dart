import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrplatform/app/config/constants/app_Appbar.dart';
import 'package:hrplatform/app/config/constants/app_assets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_view/photo_view.dart';

class ShowImageView extends StatelessWidget {
  final String url;
  final XFile? image;
  const ShowImageView({super.key, required this.url, required this.image});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appbarApp(title: 'Image'.tr, showLeading: true),
      body: image != null
          ? Center(
              child: SizedBox(
                width: context.width,
                child: Image.file(File(image!.path), fit: BoxFit.cover),
              ),
            )
          : url.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.only(),
                  child: Hero(
                    tag: url,
                    child: Center(
                      child: PhotoView(
                        imageProvider: CachedNetworkImageProvider(url),
                        minScale: PhotoViewComputedScale.contained * 0.8,
                        maxScale: PhotoViewComputedScale.covered * 1.8,
                        initialScale: PhotoViewComputedScale.contained,
                        backgroundDecoration: const BoxDecoration(
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                  ),
                )
              : Center(
                  child: Image.asset(AppAssets.logo),
                ),
    );
  }
}

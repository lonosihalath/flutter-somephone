import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrplatform/app/config/services/main_services.dart';

import '../localStore/dataStorage.dart';

bool isLandscape() {
  return Get.context!.orientation == Orientation.landscape;
}

bool isPortrait() {
  return Get.context!.orientation == Orientation.portrait;
}

bool haveInternet() {
  final statusNet = Storage.getStatusNet;
  if (statusNet == 'false') {
    MainServices.dialogInternetChecker();
  }
  return statusNet == 'true';
}

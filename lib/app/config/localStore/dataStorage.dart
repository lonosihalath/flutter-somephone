import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'storageKey.dart';

final boxStorage = GetStorage();

class Storage {
  Storage._();

  static setBaseURL(String value) => boxStorage.write(StoreKey.baseURL, value);
  static String? get getBaseURL => boxStorage.read(StoreKey.baseURL);

  static Future removeToken() {
    boxStorage.remove(StoreKey.token);
    boxStorage.remove(StoreKey.imageProfile);
    return Future.value();
  }

  static bool getThemeMode() =>
      boxStorage.read(StoreKey.isDarkMode) == "true" ? true : false;

  static Future<void> setThemeMode(bool value) =>
      boxStorage.write(StoreKey.isDarkMode, value);

  static Future setRememberMe(bool value) =>
      boxStorage.write(StoreKey.rememberMe, value);

  static bool get getRememberMe =>
      boxStorage.hasData(StoreKey.rememberMe) == true
          ? boxStorage.read(StoreKey.rememberMe)
          : false;

  static String? get getLocale => boxStorage.hasData(StoreKey.locale) == true
      ? boxStorage.read(StoreKey.locale)
      : 'lo';
  static Set<Future<void>> setLocale(String value) => {
        boxStorage.write(StoreKey.locale, value),
        Get.updateLocale(Locale(getLocale.toString())),
      };
  static setOnborad() => boxStorage.write(StoreKey.onboard, "true");
  static String? get getOnborad => boxStorage.read(StoreKey.onboard);

  // ////////////// RememberMe ///////////////////////////////////////////////
  // static setAuthData({required LoginRequest data}) =>
  //     boxStorage.write(StoreKey.authentication, jsonEncode(data));

  // static LoginRequest? get getAuthData =>
  //     boxStorage.hasData(StoreKey.authentication) == true
  //         ? LoginRequest.fromJson(
  //             json.decode(boxStorage.read(StoreKey.authentication).toString()))
  //         : LoginRequest(password: null, username: null);

  static void setStatusNet(String? status) {
    boxStorage.write(StoreKey.statusnet, status ?? "true");
  }

  static String get getStatusNet {
    return boxStorage.read(StoreKey.statusnet) ?? "true";
  }

  static setPageRoot(status) => boxStorage.write(StoreKey.pageRoot, status);
  static String? get getPageRoot => boxStorage.read(StoreKey.pageRoot);

  static setImageProfile(XFile? image) {
    if (image != null) {
      boxStorage.write(StoreKey.imageProfile, image.path);
    } else {
      boxStorage.remove(StoreKey.imageProfile);
    }
  }
}

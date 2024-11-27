import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrplatform/app/config/constants/app_colors.dart';
import 'package:hrplatform/app/config/localStore/dataStorage.dart';
import 'package:hrplatform/app/config/localStore/storageKey.dart';

class ThemeController extends GetxController {
  static final light = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(color: AppColors.kTextBlack),
        iconTheme: IconThemeData(color: AppColors.kTextBlack),
        surfaceTintColor: AppColors.kLigth),
    scaffoldBackgroundColor: AppColors.kLigth,
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
        TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
      },
    ),
  );
  static final dark = ThemeData(
    colorScheme: const ColorScheme.dark(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: AppColors.kLigth,
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(color: AppColors.kTextBlack),
        iconTheme: IconThemeData(color: AppColors.kTextBlack),
        surfaceTintColor: AppColors.kLigth),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
        TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
      },
    ),
  );

  // final boxStorage = GetStorage();
  late RxBool isDarkMode = false.obs;
  late RxString versionApp = "".obs;

  ThemeMode get theme => isDarkMode.isTrue ? ThemeMode.dark : ThemeMode.light;

  void loadTheme() => isDarkMode(Storage.getThemeMode());

  void changeThemeMode(ThemeMode themeMode) => Get.changeThemeMode(themeMode);

  void saveTheme(bool isDark) => {
        Storage.setThemeMode(!isDark),
        isDarkMode.value = !isDark,
        changeThemeMode(
            isDarkMode.value == false ? ThemeMode.light : ThemeMode.dark),
      };

  void changeLngContext(String newLocale) {
    if (newLocale.isNotEmpty) {
      Storage.setLocale(newLocale);
      Get.updateLocale(Locale(newLocale));
    }
  }

  void loadLng() => {
        Get.updateLocale(Locale(Storage.getLocale ?? "en")),
      };

  String get locale => boxStorage.read(StoreKey.locale) ?? "en";

  @override
  void onInit() {
    changeLngContext(Storage.getLocale ?? "en");
    loadTheme();
    loadLng();
    super.onInit();
  }
}

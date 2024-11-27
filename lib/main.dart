import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hrplatform/app/config/constants/app_sizeconfig.dart';
import 'package:hrplatform/app/config/services/main_services.dart';
import 'package:hrplatform/app/config/theme/app_translations.dart';
import 'package:hrplatform/app/config/theme/themeController.dart';
import 'package:hrplatform/app/modules/root/bindings/root_binding.dart';
import 'package:hrplatform/app/routes/app_pages.dart';
import 'package:hrplatform/app/services/auth_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "env/.main.env");
  await GetStorage.init();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends GetMaterialApp {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ThemeController());
    final themeController = Get.find<ThemeController>();
    AppSizeConfig().init(context);
    return GetMaterialApp(
      initialRoute: AppPages.INITIAL,
      initialBinding: RootBinding(),
      getPages: AppPages.routes,
      themeMode: themeController.theme,
      theme: ThemeController.light,
      darkTheme: ThemeController.dark,
      translations: AppTranslations(),
      locale: Locale(themeController.locale),
      debugShowCheckedModeBanner: false,
      checkerboardRasterCacheImages: false,
      checkerboardOffscreenLayers: false,
      title: 'HR Platform',
      useInheritedMediaQuery: true,
      onInit: () {
        Get.put(AuthServices());
        Get.put(MainServices());
      },
    );
  }
}

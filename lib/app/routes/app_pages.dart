import 'package:get/get.dart';

import '../modules/root/auth/bindings/auth_binding.dart';
import '../modules/root/auth/views/auth_view.dart';
import '../modules/root/bindings/root_binding.dart';
import '../modules/root/views/root_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.ROOT;

  static final routes = [
    GetPage(
      name: _Paths.ROOT,
      page: () => const RootView(),
      binding: RootBinding(),
      children: [
        GetPage(
          name: _Paths.AUTH,
          page: () => const AuthView(),
          binding: AuthBinding(),
        ),
      ],
    ),
  ];
}

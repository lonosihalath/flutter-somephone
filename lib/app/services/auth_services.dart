import 'package:get/get.dart';
import 'package:hrplatform/app/repository/auth/auth_Imp.dart';
import 'package:hrplatform/app/repository/auth/auth_Repo.dart';
import 'package:hrplatform/app/state/auth_state.dart';
class AuthServices extends GetxService {
  late AuthRepo authRepo;
  late AuthState authState;

  AuthServices() {
    authRepo = Get.put(AuthImp());
    authState = Get.put(AuthState());
  }
}

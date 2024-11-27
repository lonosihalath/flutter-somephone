import 'package:get/get.dart';

void close() {
  Get.back();
}

void closeTwo() {
  List.generate(2, (index) {
    Get.back();
  });
}

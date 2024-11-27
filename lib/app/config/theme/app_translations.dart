import 'package:get/get.dart';
import 'package:hrplatform/app/config/constants/app_assets.dart';

class LanguageList {
  static List<LanguageModel> language = [
    LanguageModel(name: 'ລາວ', code: 'lo', id: 1, flag: AppAssets.flagLao),
    LanguageModel(name: 'English', code: 'en', id: 2, flag: AppAssets.flagEn),
  ];
}

class LanguageModel {
  final int id;
  final String name;
  final String code;
  final String flag;
  LanguageModel(
      {required this.name,
      required this.code,
      required this.id,
      required this.flag});
}

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "lo": {
          "ContractsFollowsPayments": "ລະບົບຕິດຕາມສັນຍາ",
          "Welcome": "ຍິນດີຕ້ອນຮັບ",
          
        },
        'en_US': {
           "Welcome": "Welcome",
        },
      };
}

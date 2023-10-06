import 'package:classRanker/core/services/services.dart';
import 'package:get/get.dart';
import 'dart:ui';

class LocalizationController extends GetxController {
  MyServices myServices = Get.find();
  Locale? language;

  void changeLanguage(String code) {
    var local = Locale(code);
    myServices.sharedPreferences.setString("lang", code);
    Get.updateLocale(local);
  }

  @override
  void onInit() {
    String? savedLang = myServices.sharedPreferences.getString("lang");
    if (savedLang == "ar") {
      changeLanguage("ar");
    } else if (savedLang == "en") {
      changeLanguage("en");
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      myServices.sharedPreferences
          .setString("lang", Get.deviceLocale!.languageCode);
    }

    super.onInit();
  }
}

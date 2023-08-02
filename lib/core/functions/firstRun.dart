import 'package:get/get.dart';
import 'dart:ui';
import '../services/services.dart';

Future logout() async {
  Locale? language;
  MyServices myServices = Get.find();
  String? savedLang = myServices.sharedPreferences.getString("lang");
  myServices.sharedPreferences.clear();
  myServices.sharedPreferences.setString("step", "1");
  print("the current language is: $savedLang");
  if (savedLang != null && savedLang != "") {
    myServices.sharedPreferences.setString("lang", savedLang!);
  } else {
    language = Locale(Get.deviceLocale!.languageCode);
  }

  //Get.offAllNamed(ConsRoutes.profileType);
}

import 'package:classRanker/core/constant/consRoutes.dart';
import 'package:classRanker/core/services/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  MyServices myServices = Get.find();

  logout() {
    FirebaseMessaging.instance.unsubscribeFromTopic("users");
    myServices.sharedPreferences.clear();
    Get.offAllNamed(ConsRoutes.loginScrren);
  }
}

import 'package:ecommerce_store/core/functions/fcmConfig.dart';
import 'package:ecommerce_store/core/services/services.dart';
import 'package:get/get.dart';

import '../core/functions/getLocalizationPermession.dart';

class LocalController extends GetxController {
  MyServices myServices = Get.find();

  @override
  void onInit() {
    checkLocationPermission();
    requestPermessionNotification();
    fcmController();
    super.onInit();
  }
}

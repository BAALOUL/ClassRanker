import 'package:ecommerce_store/core/functions/fcmConfig.dart';
import 'package:ecommerce_store/core/services/services.dart';
import 'package:get/get.dart';

class LocalController extends GetxController {
  MyServices myServices = Get.find();

  @override
  void onInit() {
    requestPermessionNotification();
    fcmController();
    super.onInit();
  }
}

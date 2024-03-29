import 'package:classRanker/core/services/services.dart';
import 'package:get/get.dart';

abstract class FirstRowController extends GetxController {
  initData();
}

class FirstRowControllerImp extends FirstRowController {
  MyServices myServices = Get.find();
  late String providerImg;
  late String mode;

  @override
  initData() {
    providerImg = myServices.sharedPreferences.get('providerImg').toString();
    mode = myServices.sharedPreferences.get('mode').toString();
    update();
  }

  @override
  void onInit() {
    initData();
    super.onInit();
  }
}

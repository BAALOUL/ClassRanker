import 'package:ecommerce_store/core/services/services.dart';
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
    print("S5 the mode is: $mode");
    update();
    print("In the FirstRow the image is : $providerImg");
  }

  @override
  void onInit() {
    initData();
    super.onInit();
  }
}

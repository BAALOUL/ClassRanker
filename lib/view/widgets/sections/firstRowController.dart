import 'package:ecommerce_store/core/services/services.dart';
import 'package:get/get.dart';

abstract class FirstRowController extends GetxController {
  getDataFromShared();
  initData();
}

class FirstRowControllerImp extends FirstRowController {
  MyServices myServices = Get.find();
  late String providerImg;

  @override
  getDataFromShared() {
    throw UnimplementedError();
  }

  @override
  initData() {
    providerImg = myServices.sharedPreferences.get('providerImg').toString();
    update();
    print("In the FirstRow the image is : $providerImg");
  }

  @override
  void onInit() {
    initData();
    super.onInit();
  }
}

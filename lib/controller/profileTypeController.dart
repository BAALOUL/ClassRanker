import 'package:ecommerce_store/core/constant/consRoutes.dart';
import 'package:get/get.dart';

abstract class ProfileTypeController extends GetxController {
  goToProviderTrack();
  goToCustomerTrack();
}

class ProfileTypeControllerImp extends ProfileTypeController {
  @override
  goToProviderTrack() {
    Get.toNamed(ConsRoutes.loginAsProviderScrren);
  }

  @override
  goToCustomerTrack() {
    Get.toNamed(ConsRoutes.loginScrren);
  }

  @override
  void onInit() {
    super.onInit();
  }
}

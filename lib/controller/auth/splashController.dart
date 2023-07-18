import 'package:ecommerce_store/core/constant/consRoutes.dart';
import 'package:get/get.dart';

import '../../core/services/services.dart';

abstract class SplashController extends GetxController {
  goToProviderTrack();
  goToCustomerTrack();
  goToGuestTrack();
}

class SplashControllerImp extends SplashController {
  MyServices myServices = Get.find();

  @override
  goToProviderTrack() {
    Get.toNamed(ConsRoutes.homeProvider);
  }

  @override
  goToCustomerTrack() {
    Get.toNamed(ConsRoutes.homeUser);
  }

  @override
  goToGuestTrack() {
    myServices.sharedPreferences.setString("mode", "guestMode");
    Get.toNamed(ConsRoutes.profileType);
  }
}

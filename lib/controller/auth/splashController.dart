import 'package:classRanker/core/constant/consRoutes.dart';
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
    Get.toNamed(ConsRoutes.getstudentsListScreen);
  }

  @override
  goToCustomerTrack() {
    Get.toNamed(ConsRoutes.getstudentsListScreen);
  }

  @override
  goToGuestTrack() {
    myServices.sharedPreferences.setString("mode", "guestMode");
    Get.toNamed(ConsRoutes.profileType);
  }
}

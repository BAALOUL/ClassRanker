import 'package:ecommerce_store/core/constant/consRoutes.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../core/services/services.dart';

abstract class ProfileTypeController extends GetxController {
  goToProviderTrack();
  goToCustomerTrack();
  goToGuestTrack();
}

class ProfileTypeControllerImp extends ProfileTypeController {
  MyServices myServices = Get.find();
  late String mode = "";

  @override
  goToProviderTrack() {
    print("mode is : $mode");
    mode == ""
        ? Get.toNamed(ConsRoutes.loginScrren)
        : WidgetsBinding.instance?.addPostFrameCallback((_) {
            Get.toNamed(ConsRoutes.homeProvider);
          });
  }

  @override
  goToCustomerTrack() {
    print("mode is : $mode");
    if (mode == "") {
      Get.toNamed(ConsRoutes.loginScrren);
    } else {
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        Get.toNamed(ConsRoutes.homeUser);
      });
    }
  }

  @override
  goToGuestTrack() {
    //myServices.sharedPreferences.setString("mode", "guestMode");
    Get.toNamed(ConsRoutes.homeGuest);
  }

  @override
  void onInit() {
    mode = myServices.sharedPreferences.get('mode').toString();

    super.onInit();
  }
}

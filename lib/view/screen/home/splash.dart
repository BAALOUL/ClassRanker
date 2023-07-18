import 'package:ecommerce_store/core/constant/consColors.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/constant/consRoutes.dart';
import '../../../core/services/services.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SplashController controller = Get.put(SplashController());
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Scaffold(
      backgroundColor: ConsColors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo/playstore.png',
              width: 150,
              height: 200,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}

class SplashController extends GetxController {
  MyServices myServices = Get.find();
  late String mode = "";

  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 2), () {
      navigateToNextScreen();
    });
    update();
  }

  void navigateToNextScreen() {
    mode = myServices.sharedPreferences.get('mode').toString();
    switch (mode) {
      case "guestMode":
        print("guest");
        break;
      case "userMode":
        print("user mode");
        Get.toNamed(ConsRoutes.homeUser);
        break;
      case "providerMode":
        print("provider mode");
        Get.toNamed(ConsRoutes.homeProvider);
        break;
      default:
        myServices.sharedPreferences.setString("mode", "");
        mode = "";
        print("no mode $mode");
        Get.toNamed(ConsRoutes.profileType);
    }
  }

  // Add any other methods or variables needed for the controller
}

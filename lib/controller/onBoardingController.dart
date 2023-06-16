import 'package:ecommerce_store/core/constant/consRoutes.dart';
import 'package:ecommerce_store/core/services/services.dart';
import 'package:ecommerce_store/data/dataSources/static/static.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class OnBoardingController extends GetxController {
  nextPage();
  onChangePage(int ind);
}

class OnBoardingControllerImp extends OnBoardingController {
  late PageController pageController;
  int currentPage = 0;

  MyServices myServices = Get.find();

  @override
  nextPage() {
    currentPage++;
    if (currentPage >= onboardingList.length) {
      myServices.sharedPreferences.setString("step", "1");
      Get.offAllNamed(ConsRoutes.profileType);
    } else {
      pageController.animateToPage(currentPage,
          duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
    }
  }

  @override
  onChangePage(int ind) {
    currentPage = ind;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}

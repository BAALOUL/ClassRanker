import 'package:classRanker/core/constant/consRoutes.dart';
import 'package:get/get.dart';

abstract class SuccessSignUpController extends GetxController {
  goToPageLogin();
  goToProfile();
  initData();
}

class SuccessSignUpControllerImp extends SuccessSignUpController {
  String? role;

  @override
  goToPageLogin() {
    Get.offAllNamed(ConsRoutes.login);
  }

  @override
  goToProfile() {
    if (role == "Admin") {
      Get.offAllNamed(ConsRoutes.getstudentsListScreen);
    } else {
      Get.offAllNamed(ConsRoutes.studentHomeScreen);
    }
  }

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  @override
  initData() {
    role = Get.arguments['role'];
  }
}

import 'package:classRanker/core/constant/consRoutes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class VerefyCodeController extends GetxController {
  login();
  toSignUp();
}

class VerefyCodeControllerImp extends VerefyCodeController {
  late TextEditingController username;
  late TextEditingController phone;
  late TextEditingController email;
  late TextEditingController password;

  @override
  login() {}

  @override
  toSignUp() {
    Get.toNamed(ConsRoutes.signUp);
  }

  @override
  void onInit() {
    username = TextEditingController();
    phone = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    phone.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }
}

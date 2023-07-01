import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/consRoutes.dart';

abstract class LoginScreenController extends GetxController {
  toOTPscreen(String ph);
}

class LoginScreenControllerIMP extends LoginScreenController {
  TextEditingController phoneNumberController = TextEditingController();
  // String phone = '';

  @override
  toOTPscreen(String ph) {
    Get.offAllNamed(ConsRoutes.otpScreen, arguments: {'phone': ph});
  }
}

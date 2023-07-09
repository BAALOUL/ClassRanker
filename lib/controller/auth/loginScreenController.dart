import 'package:ecommerce_store/data/remote/auth/signUpOTPData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/consRoutes.dart';
import 'package:ecommerce_store/core/class/statusRequest.dart';
import 'package:ecommerce_store/core/functions/handingDataController.dart';
import 'package:ecommerce_store/data/remote/auth/signupUser.dart';
import 'package:flutter/cupertino.dart';

abstract class LoginScreenController extends GetxController {
  toOTPscreen(String ph);
  signUp();
}

class LoginScreenControllerIMP extends LoginScreenController {
  TextEditingController phoneNumberController = TextEditingController();
  SignUpOTPData signUpOTPData = SignUpOTPData(Get.find());

  SignupUser signupuser = SignupUser(Get.find());

  StatusRequest? statusRequest;
  List data = [];

  @override
  toOTPscreen(String ph) {
    Get.offAllNamed(ConsRoutes.otpScreen, arguments: {'phone': ph});
  }

  @override
  signUp() async {
    statusRequest = StatusRequest.loading;
    update();
    print(phoneNumberController.text);
    var response = await signUpOTPData.postOTP(phoneNumberController.text);
    statusRequest = handingData(response);
    if (StatusRequest.success == statusRequest) {
      toOTPscreen(phoneNumberController.text);
      if (response['status'] == "success") {
      } else {}
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    phoneNumberController.dispose();
    super.dispose();
  }
}

// ignore: file_names
import 'package:ecommerce_store/core/class/statusRequest.dart';
import 'package:ecommerce_store/core/constant/consRoutes.dart';
import 'package:ecommerce_store/core/functions/handingDataController.dart';
import 'package:ecommerce_store/data/remote/auth/verifyCodeSignup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class VerifyOTPController extends GetxController {
  checkCode(String verificationCode);
  toSignUp();
}

class VerifyOTPControllerImp extends VerifyOTPController {
  VerifyCodeData verifyCodeData = VerifyCodeData(Get.find());
  late TextEditingController verifycode;
  String? email = Get.arguments['email'];
  StatusRequest? statusRequest;

  @override
  checkCode(String verificationCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await verifyCodeData.checkVerifyCode(email!, verificationCode);
    statusRequest = handingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offNamed(ConsRoutes.successSignUp);
      } else {
        Get.defaultDialog(
            title: "ُWarning", middleText: "Verify Code Not Correct");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  toSignUp() {}
}

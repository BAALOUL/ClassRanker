// ignore: file_names
import 'package:classRanker/core/class/statusRequest.dart';
import 'package:classRanker/core/constant/consRoutes.dart';
import 'package:classRanker/core/functions/handingDataController.dart';
import 'package:classRanker/data/remote/auth/verifyCodeSignup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class VerifyCodeController extends GetxController {
  checkCode(String verificationCode);
  toSignUp();
}

class VerifyCodeControllerImp extends VerifyCodeController {
  VerifyCodeData verifyCodeData = VerifyCodeData(Get.find());
  late TextEditingController verifycode;
  String? email = Get.arguments['email'];
  String? role = Get.arguments['role'];
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
        Get.offNamed(ConsRoutes.successSignUp, arguments: {"role": role});
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

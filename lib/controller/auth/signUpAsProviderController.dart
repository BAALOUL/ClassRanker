import 'package:ecommerce_store/core/class/statusRequest.dart';
import 'package:ecommerce_store/core/constant/consRoutes.dart';
import 'package:ecommerce_store/core/functions/handingDataController.dart';
import 'package:ecommerce_store/data/remote/auth/signUpAsProviderData.dart';
import 'package:ecommerce_store/data/remote/auth/verifyOtpSignUpData.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class SignUpAsProviderController extends GetxController {
  login();
  toSignIn();
  signUp();
  verefyOTP();
}

class SinUpAsProviderControllerImp extends SignUpAsProviderController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  SignUpAsProviderData signUpAsProviderData = SignUpAsProviderData(Get.find());
  VerifyOtpSignUpData verifyOtpSignUpData = VerifyOtpSignUpData(Get.find());

  late TextEditingController phone;
  late TextEditingController otp;
  StatusRequest? statusRequest;

  List data = [];

  @override
  login() {}

  @override
  toSignIn() {
    Get.toNamed(ConsRoutes.login);
  }

  @override
  void onInit() {
    phone = TextEditingController();
    otp = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    phone.dispose();
    super.dispose();
  }

  @override
  signUp() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      //print(username);
      var response =
          await signUpAsProviderData.postProvider(phone.text, otp.text);

      statusRequest = handingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          //data.addAll(response['data']);
          //Get.offNamed(ConsRoutes.verefyCode, arguments: {"email": email.text});
          //Get.offNamed(ConsRoutes.verefyCode);
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {}
  }

  @override
  verefyOTP() async {}

  /*@override
  signUp() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      //print(username);
      var response = await signupuser.postuser(
          username.text, password.text, email.text, phone.text);
      statusRequest = handingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          //data.addAll(response['data']);
          Get.offNamed(ConsRoutes.verefyCode, arguments: {"email": email.text});
          //Get.offNamed(ConsRoutes.verefyCode);
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {}
  }*/
}

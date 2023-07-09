import 'package:ecommerce_store/core/class/statusRequest.dart';
import 'package:ecommerce_store/core/constant/consRoutes.dart';
import 'package:ecommerce_store/core/functions/handingDataController.dart';
import 'package:ecommerce_store/core/services/services.dart';
import 'package:ecommerce_store/data/remote/auth/loginData.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class SignInController extends GetxController {
  login();
  toSignUp();
  toForgetPassword();
  toHome();
}

class SinInControllerImp extends SignInController {
  GlobalKey<FormState> formstatelogin = GlobalKey<FormState>();
  LoginData loginData = LoginData(Get.find());

  MyServices myServices = Get.find();
  late TextEditingController email;
  late TextEditingController password;

  StatusRequest? statusRequest;
  List data = [];

  @override
  login() async {
    if (formstatelogin.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      //print(username);
      var response = await loginData.postuser(email.text, password.text);
      statusRequest = handingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          myServices.sharedPreferences.setString("id", response['data']['id']);
          myServices.sharedPreferences
              .setString("username", response['data']['username']);
          myServices.sharedPreferences
              .setString("email", response['data']['email']);
          myServices.sharedPreferences
              .setString("phone", response['data']['phone']);
          myServices.sharedPreferences.setString("step", "2");
          //data.addAll(response['data']);
          Get.offNamed(ConsRoutes.home);
          //Get.offNamed(ConsRoutes.verefyCode);
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {}
  }

  @override
  toSignUp() {
    Get.toNamed(ConsRoutes.signUp);
  }

  @override
  toForgetPassword() {
    Get.toNamed(ConsRoutes.forgetPassWord);
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) {
      print(value);
      String? tocken = value;
    });

    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  toHome() {
    Get.offAllNamed(ConsRoutes.homeProvider);
  }
}

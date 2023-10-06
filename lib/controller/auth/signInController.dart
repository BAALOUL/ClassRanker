import 'package:classRanker/core/class/statusRequest.dart';
import 'package:classRanker/core/constant/consRoutes.dart';
import 'package:classRanker/core/functions/handingDataController.dart';
import 'package:classRanker/core/services/services.dart';
import 'package:classRanker/data/remote/auth/loginData.dart';
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

  late String role;

  StatusRequest? statusRequest;
  List data = [];

  @override
  login() async {
    if (formstatelogin.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      //print(username);
      var response = await loginData.postuser(email.text, password.text);
      print(response);
      statusRequest = handingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          myServices.sharedPreferences
              .setString("user_id", response['data']['user_id']);
          role = response['data']['role'];
          myServices.sharedPreferences.setString("role", role);

          if (role == "student") {
            myServices.sharedPreferences
                .setString("student_id", response['data']['student_id']);
            myServices.sharedPreferences
                .setString("username", response['data']['username']);
            myServices.sharedPreferences
                .setString("email", response['data']['email']);
            myServices.sharedPreferences
                .setString("phone", response['data']['phone']);
          }

          myServices.sharedPreferences.setString("step", "2");
          //data.addAll(response['data']);
          toHome();
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
    if (role == "student") {
      Get.offAllNamed(ConsRoutes.studentHomeScreen);
    } else if (role == "admin") {
      Get.offAllNamed(ConsRoutes.getstudentsListScreen);
    }
  }
}

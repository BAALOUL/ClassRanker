import 'dart:convert';

import 'package:classRanker/controller/auth/authController.dart';
import 'package:classRanker/core/class/statusRequest.dart';
import 'package:classRanker/core/constant/consRoutes.dart';
import 'package:classRanker/core/functions/handingDataController.dart';
import 'package:classRanker/data/remote/auth/signupUser.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SignUpController extends GetxController {
  login();
  toSignIn();
  signUp();
}

class SinUpControllerImp extends SignUpController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  AuthController authController = Get.put(AuthController());

  SignupUser signupuser = SignupUser(Get.find());
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController password;
  StatusRequest? statusRequest;

  @override
  login() {}

  @override
  toSignIn() {
    Get.toNamed(ConsRoutes.login);
  }

  @override
  void onInit() {
    username = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  signUp() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response =
          await signupuser.postuser(username.text, email.text, password.text);
      statusRequest = handingData(response);
      if (response.isNotEmpty) {
        final token = await authController.getToken(email.text, password.text);

        if (token) {
          //grab user data here
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          final tokenValue = prefs.getString('token') ?? '';

          if (tokenValue.isNotEmpty && tokenValue != '') {
            //get user data
            final response = await authController.getUserToken(tokenValue);
            if (response != null) {
              //json decode
              Map<String, dynamic> appointment = {};
              final user = json.decode(response);

              //check if any appointment today
              for (var doctorData in user['doctor']) {
                //if there is appointment return for today

                if (doctorData['appointments'] != null) {
                  appointment = doctorData;
                }
              }

              authController.loginSuccess(user, appointment);
              Get.toNamed(ConsRoutes.mainLayout);
            }
          }
        }

        //Get.offNamed(ConsRoutes.verefyCode);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }
}

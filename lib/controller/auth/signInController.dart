import 'dart:convert';

import 'package:classRanker/controller/auth/authController.dart';
import 'package:classRanker/core/class/statusRequest.dart';
import 'package:classRanker/core/constant/consRoutes.dart';
import 'package:classRanker/core/functions/handingDataController.dart';
import 'package:classRanker/core/services/services.dart';
import 'package:classRanker/data/remote/auth/loginData.dart';
import 'package:classRanker/view/screen/home/homePage.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../links.dart';

abstract class SignInController extends GetxController {
  login();
  toSignUp();
  toForgetPassword();
  toHome();
}

class SinInControllerImp extends SignInController {
  GlobalKey<FormState> formstatelogin = GlobalKey<FormState>();
  LoginData loginData = LoginData(Get.find());
  AuthController auth = Get.put(AuthController());

  MyServices myServices = Get.find();
  late TextEditingController email;
  late TextEditingController password;

  final String defaultEmail = 'user@gmail.com';
  final String defaultPassword = '12345678';
  late String role;

  StatusRequest? statusRequest;
  List data = [];

  @override
  login() async {
    //login here
    final token = await auth.getToken(email.text, password.text);

    if (token) {
      //grab user data here
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final tokenValue = prefs.getString('token') ?? '';

      if (tokenValue.isNotEmpty && tokenValue != '') {
        //get user data
        final response = await auth.getUserToken(tokenValue);
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

          auth.loginSuccess(user, appointment);
          Get.toNamed(ConsRoutes.mainLayout);
        }
      }
    }
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
    email = TextEditingController(text: defaultEmail);
    password = TextEditingController(text: defaultPassword);
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  toHome() {}
}

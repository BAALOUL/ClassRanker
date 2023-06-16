import 'package:ecommerce_store/data/remote/auth/loginOtpData.dart';
import 'package:ecommerce_store/view/widgets/auth/customButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/class/statusRequest.dart';
import '../../../core/constant/consRoutes.dart';
import '../../../core/functions/handingDataController.dart';
import '../../../core/services/services.dart';
import '../../../data/remote/providers/getProviderIdData.dart';

class LoginController extends GetxController {
  LoginOtpData loginOtpData = LoginOtpData(Get.find());
  GetProviderIdData getProviderIdData = GetProviderIdData(Get.find());

  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  MyServices myServices = Get.find();
  late String providerid;

  StatusRequest? statusRequest;
  void getProviderId(String Userid) async {
    statusRequest = StatusRequest.loading;
    update();
    //print(username);
    var response = await getProviderIdData.getProviderIdData(Userid);
    statusRequest = handingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        providerid = response['data'][0]['provider_id'];
        myServices.sharedPreferences.setString("providerId", providerid);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  void login() async {
    String phoneNumber = phoneNumberController.text;
    String otp = otpController.text;

    statusRequest = StatusRequest.loading;
    update();

    var response = await loginOtpData.postuser(phoneNumber, otp);
    statusRequest = handingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        print(response);
        myServices.sharedPreferences
            .setString("userId", response['data']['id']);
        myServices.sharedPreferences
            .setString("username", response['data']['username']);
        myServices.sharedPreferences
            .setString("email", response['data']['email']);
        myServices.sharedPreferences
            .setString("phone", response['data']['phone']);
        Get.offNamed(ConsRoutes.homescreen);
        getProviderId(response['data']['id']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}

class LoginScreen extends StatelessWidget {
  final LoginController _loginController = Get.put(LoginController());

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _loginController.phoneNumberController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Phone Number',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _loginController.otpController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'OTP',
              ),
            ),
            const SizedBox(height: 16.0),
            CustomButton(
              text: 'Login',
              onPressed: () {
                _loginController.login();
              },
            )
          ],
        ),
      ),
    );
  }
}

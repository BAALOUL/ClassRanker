import 'package:ecommerce_store/data/remote/auth/loginAsProviderData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/class/statusRequest.dart';
import '../../../core/constant/consRoutes.dart';
import '../../../core/functions/handingDataController.dart';
import '../../../core/functions/validinput.dart';
import '../../../core/services/services.dart';
import '../../widgets/auth/customButton.dart';
import '../../widgets/auth/customTextFormField.dart';
import '../../widgets/auth/customTextSignUp.dart';

class LoginAsProviderController extends GetxController {
  LoginAsProviderpData loginAsProviderData = LoginAsProviderpData(Get.find());

  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  MyServices myServices = Get.find();

  StatusRequest? statusRequest;

  void login() async {
    // Perform your login logic here
    // You can access the entered phone number and OTP using the controller values
    String phoneNumber = phoneNumberController.text;
    String otp = otpController.text;

    statusRequest = StatusRequest.loading;
    update();
    //print(username);
    var response = await loginAsProviderData.postuser(phoneNumber, otp);
    statusRequest = handingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        if (response['data']['provider_user_id'] != null) {
          myServices.sharedPreferences.setString("id", response['data']['id']);
          myServices.sharedPreferences
              .setString("providerId", response['data']['provider_id']);
          myServices.sharedPreferences
              .setString("username", response['data']['username']);
          myServices.sharedPreferences
              .setString("email", response['data']['email']);
          myServices.sharedPreferences
              .setString("phone", response['data']['phone']);
          //myServices.sharedPreferences.setString("step", "2");
          //data.addAll(response['data']);
          Get.offNamed(ConsRoutes.homescreen);
          //Get.offNamed(ConsRoutes.verefyCode);}
          //print(' provider **** ${response['data']['provider_user_id']}');
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }
}

class LoginAsProviderScreen extends StatelessWidget {
  final LoginAsProviderController _loginController =
      Get.put(LoginAsProviderController());

  LoginAsProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextFormField(
              isNumber: true,
              valid: (val) {
                return validInput(val!, 2, 30, "Phone Number");
              },
              hintText: 'Enter your phone number',
              labelText: "Phone Number",
              iconData: Icons.lock_outline,
              mycontroller: _loginController.phoneNumberController,
            ),
            const SizedBox(height: 16.0),
            CustomTextFormField(
              isNumber: true,
              valid: (val) {
                return validInput(val!, 2, 30, "OTP");
              },
              hintText: 'Enter your OTP',
              labelText: "OTP",
              iconData: Icons.lock_outline,
              mycontroller: _loginController.otpController,
            ),
            /*TextField(
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
            */
            const SizedBox(
              height: 40,
            ),
            CustomButton(
                text: "Continue",
                onPressed: () {
                  _loginController.login();
                }),
            const SizedBox(
              height: 20,
            ),
            CustomTextSignUp(
              text1: "  Don't you have an account?   ",
              text2: "  Sign Up",
              ontap: () {
                //controller.toSignUp();
              },
            ),
            const SizedBox(height: 16.0),
            /*Container(
              height: 50,
              width: 150,
              child: ElevatedButton(
                onPressed: () {
                  _loginController.login();
                },
                child: const Text('Login'),
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}

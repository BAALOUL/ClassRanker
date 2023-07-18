import 'package:ecommerce_store/view/widgets/auth/customButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../../controller/auth/loginScreenController.dart';
import '../../../core/constant/consColors.dart';

class LoginScreen extends StatelessWidget {
  final loginController = Get.put(LoginScreenControllerIMP());

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginScreenControllerIMP());
    return SafeArea(
      child: Scaffold(
          body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: ListView(
            shrinkWrap: true,
            children: [
              const SizedBox(
                height: 0,
              ),
              Container(
                padding: const EdgeInsets.all(0),
                child: const Icon(
                  Icons.person,
                  size: 150,
                  color: ConsColors.blue,
                ),
              ),
              IntlPhoneField(
                controller: loginController.phoneNumberController,
                decoration: InputDecoration(
                  labelText: 'Phone Number'.tr,
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
                initialCountryCode: 'QA',
                onChanged: (phone) {
                  print(phone.completeNumber);
                },
              ),
              //const SizedBox(height: 15),
              /* Container(
                height: 50,
                margin: const EdgeInsets.only(bottom: 20),
                child: TextField(
                  controller: loginController.phoneNumberController,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.phone),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    labelText: 'Phone number',
                  ),
                ),
              ),*/
              CustomButton(
                text: 'SEND OTP'.tr,
                onPressed: () {
                  loginController.signUp();
                },
              ),
            ],
          ),
        ),
      )),
    );
  }
}
/*class LoginScreen extends StatelessWidget {
  final loginController = Get.put(LoginScreenControllerIMP());

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginScreenControllerIMP());
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                color: ConsColors.blueWhite,
                height: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    /*SizedBox(height: 8),
                              Text(
                                'Booking Completed',
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: ConsColors.blue),
                              ),*/
                    SizedBox(height: 8),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(50),
              margin: const EdgeInsets.only(top: 100),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: ListView(
                children: [
                  const SizedBox(
                    height: 0,
                  ),
                  Container(
                      padding: const EdgeInsets.all(0),
                      child: const Icon(
                        Icons.person,
                        size: 150,
                        color: ConsColors.blue,
                      )
                      /*Image.asset(
                      'assets/screens/sections/otp.png', // Replace with your image asset path
                      fit: BoxFit.contain,
                      height: 120,
                    ),*/
                      ),
                  const SizedBox(height: 15),
                  Container(
                    height: 50,
                    margin: const EdgeInsets.only(bottom: 20),
                    child: TextField(
                      controller: loginController.phoneNumberController,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                      decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.phone),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        labelText: 'Phone number',
                      ),
                    ),
                  ),
                  CustomButton(
                    text: 'SEND OTP',
                    onPressed: () {
                      loginController.signUp();
                    },
                  )
                ],
              ),
            ), //*** */
          ],
        ),
      ),
    );
  }
}*/

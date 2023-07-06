import 'package:ecommerce_store/view/screen/home/titleCustom.dart';
import 'package:ecommerce_store/view/widgets/auth/customButton.dart';
import 'package:ecommerce_store/view/widgets/titleCustomBig.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/auth/loginScreenController.dart';
import '../../../core/constant/consColors.dart';

class LoginScreen extends StatelessWidget {
  final loginController = Get.put(LoginScreenControllerIMP());

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                height: 100,
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
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.only(top: 50),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Image.asset(
                      'assets/screens/sections/otp.png', // Replace with your image asset path
                      fit: BoxFit.contain,
                      height: 150,
                    ),
                  ),
                  const TitleCustomBig(title: "Continue with phone", size: 20),
                  Container(
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
                    fontWeight: FontWeight.bold,
                    onPressed: () {
                      String ph = '';
                      ph = loginController.phoneNumberController.text;
                      loginController.toOTPscreen(ph);
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:ecommerce_store/view/screen/home/titleCustom.dart';
import 'package:ecommerce_store/view/widgets/auth/customButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/auth/loginScreenController.dart';

class LoginScreen extends StatelessWidget {
  final loginController = Get.put(LoginScreenControllerIMP());

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
            const TitleCustom(title: "Continue with phone"),
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: TextField(
                controller: loginController.phoneNumberController,
                keyboardType: TextInputType.number,
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
                String ph = '';
                ph = loginController.phoneNumberController.text;
                print(ph);
                loginController.toOTPscreen(ph);
                //
              },
            )
          ],
        ),
      ),
    );
  }
}

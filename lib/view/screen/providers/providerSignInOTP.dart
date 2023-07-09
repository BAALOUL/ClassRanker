import 'package:ecommerce_store/core/constant/consRoutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProviderSignInView extends StatelessWidget {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  final RxBool loading = false.obs;

  ProviderSignInView({super.key});

  bool get otpVerified => true;

  void signInWithOtp() async {
    loading.value = true;
    // call API to generate OTP and send it to the provider's phone number
    // wait for the response and verify OTP
    loading.value = true;
    if (otpVerified) {
      // navigate to home screen
      Get.toNamed(ConsRoutes.homeProvider); //offallnamed
    } else {
      Get.snackbar('Error', 'Invalid OTP');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Sign In'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      labelText: 'Phone Number',
                      hintText: 'Enter your phone number',
                      prefixIcon: Icon(Icons.phone),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Phone number is required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: otpController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'OTP',
                      hintText: 'Enter OTP received via SMS',
                      prefixIcon: Icon(Icons.lock),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'OTP is required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 38.0,
                  ),
                  SizedBox(
                    height: 38,
                    width: 150,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(const Size(
                            200, 50)), // Set the desired width and height
                      ),
                      onPressed: () {
                        signInWithOtp();
                      }, // SignIn button
                      child: Obx(() => loading.value
                          ? const CircularProgressIndicator()
                          : const Text('Sign In')),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

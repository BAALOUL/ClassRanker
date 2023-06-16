import 'package:ecommerce_store/controller/testDataController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TestDataController());
    return Scaffold(
      appBar: AppBar(title: const Text("Test data")),
      body: OtpTextField(
        fieldWidth: 50.0,
        borderRadius: BorderRadius.circular(20),
        numberOfFields: 5,
        borderColor: const Color.fromARGB(255, 1, 0, 4),
        //set to true to show as box or false to show as dash
        showFieldAsBox: true,
        //runs when a code is typed in
        onCodeChanged: (String code) {
          //handle validation or checks here
        },
        //runs when every textfield is filled
        onSubmit: (String verificationCode) {
          //controller.goToSuccessSignUp(verificationCode);
        }, // end onSubmit
      ),

      /* GetBuilder<TestDataController>(builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: ((context, index) {
                  return Text("${controller.data}");
                })),
          );
        })  */
    );
  }
}

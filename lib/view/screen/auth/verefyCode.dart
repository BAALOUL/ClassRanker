import 'package:classRanker/controller/auth/verifycodeController.dart';
import 'package:classRanker/core/class/statusRequest.dart';
import 'package:classRanker/core/constant/consColors.dart';
import 'package:classRanker/view/widgets/auth/customButton.dart';
import 'package:classRanker/view/widgets/auth/customTextSignUp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class VerefyCode extends StatelessWidget {
  String? code;
  VerefyCode({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: ConsColors.white,
          elevation: 0.0,
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.back_hand,
                  color: ConsColors.black,
                ))
          ],
          title: Text(
            "Check information",
            style: Theme.of(context)
                .textTheme
                .headline1
                ?.copyWith(color: Colors.grey),
          ),
        ),
        body: GetBuilder<VerifyCodeControllerImp>(
          builder: (controller) => controller.statusRequest ==
                  StatusRequest.loading
              ? const Center(
                  child: Text("Loading"),
                )
              : Container(
                  padding: const EdgeInsets.all(25),
                  child: Form(
                    child: ListView(
                      children: [
                        Text(
                          "Check your mail",
                          style: Theme.of(context).textTheme.headline2,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          "We have sent a password recover instructions to your email",
                          style: Theme.of(context).textTheme.bodyText1,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        OtpTextField(
                          fieldWidth: 50.0,
                          borderRadius: BorderRadius.circular(20),
                          numberOfFields: 5,
                          borderColor: const Color(0xFF512DA8),
                          //set to true to show as box or false to show as dash
                          showFieldAsBox: true,
                          //runs when a code is typed in
                          onCodeChanged: (String code) {
                            //handle validation or checks here
                          },
                          //runs when every textfield is filled
                          onSubmit: (String verificationCode) {
                            controller.checkCode(verificationCode);
                          }, // end onSubmit
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        CustomButton(text: "Open your email", onPressed: () {}),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomButton(text: "Check the email", onPressed: () {}),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextSignUp(
                          text1: "  I will confirm later  ",
                          text2: "  skip",
                          ontap: () {
                            controller.toSignUp();
                          },
                        )
                      ],
                    ),
                  ),
                ),
        ));
  }
}

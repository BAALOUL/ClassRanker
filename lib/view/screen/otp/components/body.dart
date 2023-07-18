import 'package:flutter/material.dart';
import 'package:ecommerce_store/view/constants.dart';
import 'package:ecommerce_store/view/size_config.dart';
import 'package:get/get.dart';

import '../../../../controller/auth/loginOTPController.dart';
import '../../../../core/constant/consColors.dart';
import 'otp_form.dart';

class Body extends StatelessWidget {
  final loginController = Get.put(LoginOTPControllerIMP());

  Body({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.08),
              Text(
                "OTP Verification".tr,
                style: headingStyle,
              ),
              Text("We sent your code to +974 4455 ***".tr),
              buildTimer(),
              const OtpForm(),
              SizedBox(height: SizeConfig.screenHeight * 0.03),
              GestureDetector(
                onTap: () {
                  // OTP code resend
                },
                child: Text(
                  "Resend OTP Code".tr,
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("This code will expired in ".tr),
        TweenAnimationBuilder(
          tween: Tween(begin: 30.0, end: 0.0),
          duration: const Duration(seconds: 60),
          builder: (_, dynamic value, child) => Text(
            "00:${value.toInt()}",
            style: const TextStyle(
              color: ConsColors.yellow,
            ),
          ),
        ),
      ],
    );
  }
}

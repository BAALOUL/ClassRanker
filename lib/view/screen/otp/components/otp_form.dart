import 'package:ecommerce_store/controller/auth/loginOTPController.dart';
import 'package:ecommerce_store/view/widgets/auth/customButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/consRoutes.dart';
import '../../../components/default_button.dart';
import '../../../size_config.dart';
import '../../../constants.dart';

class OtpForm extends GetWidget<LoginOTPControllerIMP> {
  const OtpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          SizedBox(height: SizeConfig.screenHeight * 0.08),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (int i = 0; i < 4; i++)
                SizedBox(
                  width: getProportionateScreenWidth(60),
                  child: TextFormField(
                    controller: controller.getOtpController(i),
                    focusNode: controller.getOtpFocusNode(i),
                    autofocus: i == 0,
                    obscureText: true,
                    style: const TextStyle(fontSize: 24),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: otpInputDecoration,
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        if (value.length > 1) {
                          controller.getOtpController(i).text =
                              value.substring(0, 1);
                        }
                        controller.moveToNextField(i);
                        controller.moveToNextField(i);
                        if (i == 3) {
                          controller.getotp();
                        }
                      }
                    },
                  ),
                ),
            ],
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.07),
          SizedBox(
            width: 250,
            child: CustomButton(
                text: "Continue",
                fontWeight: FontWeight.bold,
                onPressed: () async {
                  await controller.login();
                  Get.offNamed(ConsRoutes.homescreen);
                }),
          ),
        ],
      ),
    );
  }
}

import 'package:classRanker/controller/forgetPassword/forgetPasswordController.dart';
import 'package:classRanker/core/constant/consColors.dart';
import 'package:classRanker/core/functions/validinput.dart';
import 'package:classRanker/view/widgets/auth/customButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/auth/customTextFormField.dart';

class ForgetPassWord extends StatelessWidget {
  const ForgetPassWord({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetPasswordControllerImp controller =
        Get.put(ForgetPasswordControllerImp());
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
          "Sign in".tr,
          style: Theme.of(context)
              .textTheme
              .headline1
              ?.copyWith(color: Colors.grey),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(25),
        child: ListView(
          children: [
            Text(
              "Reset password".tr,
              style: Theme.of(context).textTheme.headline2,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "Enter the email associated with your account and we'll send an email with instructions to reset your password."
                  .tr,
              style: Theme.of(context).textTheme.bodyText1,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 40.0,
            ),
            CustomTextFormField(
              isNumber: false,
              valid: (val) {
                return validInput(val!, 5, 30, "email");
              },
              hintText: 'your email'.tr,
              labelText: "Email address".tr,
              iconData: Icons.email_outlined,
              mycontroller: controller.email,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
                text: "Send Instructions".tr,
                onPressed: () {
                  controller.toVerefyCode();
                }),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:classRanker/controller/auth/signInController.dart';
import 'package:classRanker/core/constant/consColors.dart';
import 'package:classRanker/core/functions/validinput.dart';
import 'package:classRanker/view/widgets/auth/customButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/auth/customTextFormField.dart';

class ResetPassWord extends StatelessWidget {
  const ResetPassWord({super.key});

  @override
  Widget build(BuildContext context) {
    SinInControllerImp controller = Get.put(SinInControllerImp());
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
          "Reset password".tr,
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
              "Create new password".tr,
              style: Theme.of(context).textTheme.headline2,
              textAlign: TextAlign.center,
            ),
            Text(
              "Your new password must be different from previous used passwords."
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
                return validInput(val!, 5, 30, "password");
              },
              hintText: 'Enter your new password'.tr,
              labelText: "Password".tr,
              iconData: Icons.email_outlined,
              mycontroller: controller.email,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextFormField(
              isNumber: false,
              valid: (val) {
                return validInput(val!, 5, 30, "password");
              },
              hintText: 'Confirm password'.tr,
              labelText: "Password".tr,
              iconData: Icons.lock_outline,
              mycontroller: controller.password,
            ),
            const SizedBox(
              height: 20,
            ),
            Text("Both passwords must match.".tr),
            const SizedBox(
              height: 40,
            ),
            CustomButton(text: "Reset Password".tr, onPressed: () {}),
          ],
        ),
      ),
    );
  }
}

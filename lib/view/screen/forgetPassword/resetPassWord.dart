import 'package:ecommerce_store/controller/auth/signInController.dart';
import 'package:ecommerce_store/core/constant/consColors.dart';
import 'package:ecommerce_store/core/constant/consRoutes.dart';
import 'package:ecommerce_store/core/functions/validinput.dart';
import 'package:ecommerce_store/view/widgets/auth/customButton.dart';
import 'package:ecommerce_store/view/widgets/auth/customForgetPassword.dart';
import 'package:ecommerce_store/view/widgets/auth/customTextSignUp.dart';
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
          "Reset password",
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
              "Create new password",
              style: Theme.of(context).textTheme.headline2,
              textAlign: TextAlign.center,
            ),
            Text(
              "Your new password must be different from previous used passwords.",
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
              hintText: 'Enter your new password',
              labelText: "Password",
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
              hintText: 'Confirm password',
              labelText: "Password",
              iconData: Icons.lock_outline,
              mycontroller: controller.password,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text("Both passwords must match."),
            const SizedBox(
              height: 40,
            ),
            CustomButton(text: "Reset Password", onPressed: () {}),
          ],
        ),
      ),
    );
  }
}

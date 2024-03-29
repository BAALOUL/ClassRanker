import 'package:classRanker/controller/auth/signInController.dart';
import 'package:classRanker/core/class/statusRequest.dart';
import 'package:classRanker/core/constant/consColors.dart';
import 'package:classRanker/core/functions/validinput.dart';
import 'package:classRanker/view/widgets/auth/customButton.dart';
import 'package:classRanker/view/widgets/auth/customForgetPassword.dart';
import 'package:classRanker/view/widgets/auth/customTextSignUp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../core/constant/consImageAssets.dart';
import '../../widgets/auth/customTextFormField.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SinInControllerImp());
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
            "Sign in",
            style: Theme.of(context)
                .textTheme
                .headline1
                ?.copyWith(color: Colors.grey),
          ),
        ),
        body: GetBuilder<SinInControllerImp>(
          builder: (controller) =>
              controller.statusRequest == StatusRequest.loading
                  ? Center(
                      child: Lottie.asset(ConsImageAssets.loading,
                          width: 300, height: 300),
                    )
                  : Container(
                      padding: const EdgeInsets.all(25),
                      child: Form(
                        key: controller.formstatelogin,
                        child: ListView(
                          children: [
                            Text(
                              "Welcome back",
                              style: Theme.of(context).textTheme.headline2,
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "sign in with your email an password or continue with your social media",
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
                              hintText: 'Enter your email',
                              labelText: "Email",
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
                              hintText: 'Enter your password',
                              labelText: "Password",
                              iconData: Icons.lock_outline,
                              mycontroller: controller.password,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomForgetPassword(
                              text: "Forget your password ?",
                              onTap: () {
                                controller.toForgetPassword();
                              },
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            CustomButton(
                                text: "Continue",
                                onPressed: () {
                                  controller.login();
                                }),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomTextSignUp(
                              text1: "  Don't you have an account?   ",
                              text2: "  Sign Up",
                              ontap: () {
                                controller.toSignUp();
                              },
                            ),
                            /*MaterialButton(
                              onPressed: () {
                                Get.to(const TestView());
                              },
                              color: Colors.amber,
                              child: const Text("test"),
                            )*/
                          ],
                        ),
                      ),
                    ),
        ));
  }
}

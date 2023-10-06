import 'package:classRanker/controller/auth/signUpController.dart';
import 'package:classRanker/core/class/statusRequest.dart';
import 'package:classRanker/core/constant/consColors.dart';
import 'package:classRanker/core/constant/consRoutes.dart';
import 'package:classRanker/core/functions/alertExitApp.dart';
import 'package:classRanker/core/functions/validinput.dart';
import 'package:classRanker/view/students/components/selectRole.dart';
import 'package:classRanker/view/widgets/auth/customButton.dart';
import 'package:classRanker/view/widgets/auth/customTextSignUp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/auth/customTextFormField.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SinUpControllerImp());
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
          "Sign up",
          style: Theme.of(context)
              .textTheme
              .headline1
              ?.copyWith(color: Colors.grey),
        ),
      ),
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: GetBuilder<SinUpControllerImp>(
          builder: (controller) =>
              controller.statusRequest == StatusRequest.loading
                  ? const Center(child: Text("Loading"))
                  : Container(
                      padding: const EdgeInsets.all(20),
                      child: Form(
                        key: controller.formstate,
                        child: ListView(
                          children: [
                            Text(
                              "Welcome back",
                              style: Theme.of(context).textTheme.headline2,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              "sign up with your username, email, phone and an password or continue with your social media",
                              style: Theme.of(context).textTheme.bodyText1,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 30.0,
                            ),
                            CustomTextFormField(
                              isNumber: false,
                              valid: (val) {
                                return validInput(val!, 3, 20, "username");
                              },
                              hintText: 'Enter your username',
                              labelText: "Username",
                              iconData: Icons.person_outline,
                              mycontroller: controller.username,
                            ),

                            CustomTextFormField(
                              isNumber: false,
                              hintText: 'Enter your full name',
                              labelText: "Full name",
                              iconData: Icons.person_outline,
                              mycontroller: controller.fullname,
                            ),

                            CustomTextFormField(
                              isNumber: true,
                              valid: (val) {
                                return validInput(val!, 4, 12, "phone");
                              },
                              hintText: 'Enter your phone',
                              labelText: "phone",
                              iconData: Icons.phone_outlined,
                              mycontroller: controller.phone,
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

                            CustomTextFormField(
                              isNumber: false,
                              valid: (val) {
                                return validInput(val!, 5, 40, "password");
                              },
                              hintText: 'Enter your password',
                              labelText: "Password",
                              iconData: Icons.lock_outline,
                              mycontroller: controller.password,
                            ),

                            const SelectRole(),

                            //const CustomForgetPassword(text: "Forget your password ?"),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomButton(
                                text: "Continue",
                                onPressed: () {
                                  controller.signUp();
                                }),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomTextSignUp(
                              text1: "  Do you have an account?   ",
                              text2: "  Sign In",
                              ontap: () {
                                controller.toSignIn();
                              },
                            ),
                            /*CustomTextSignUp(
                              text1: "  Go to student   ",
                              text2: "  admin dashboard ",
                              ontap: () {
                                Get.toNamed(ConsRoutes.getstudentsListScreen);
                              },
                            )*/
                            //CustomTextFormField(hintText: 'Enter your email', labelText: "Email",iconData: Icons.email_outlined,mycontroller: ,)
                          ],
                        ),
                      ),
                    ),
        ),
      ),
    );
  }
}

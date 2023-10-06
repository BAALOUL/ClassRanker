import 'package:classRanker/controller/auth/successSignUpController.dart';
import 'package:classRanker/core/constant/consColors.dart';
import 'package:classRanker/view/widgets/auth/customButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SuccessSignUpControllerImp controller =
        Get.put(SuccessSignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ConsColors.white,
        elevation: 0.0,
        title: Text("Success",
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: ConsColors.grey)),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(children: [
          const Center(
              child: Icon(
            Icons.check_circle_outline,
            size: 200,
            color: ConsColors.primary,
          )),
          Text("Success",
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(fontSize: 30)),
          const Text("Congratulations"),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: CustomButton(
                text: "Continue".tr,
                onPressed: () {
                  controller.goToProfile();
                }),
          ),
          const SizedBox(height: 30)
        ]),
      ),
    );
  }
}

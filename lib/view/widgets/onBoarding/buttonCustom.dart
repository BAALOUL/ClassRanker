import 'package:ecommerce_store/controller/onBoardingController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/consColors.dart';

class CustomButtonOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomButtonOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 130,
        height: 40,
        decoration: BoxDecoration(
            color: ConsColors.primary, borderRadius: BorderRadius.circular(15)),
        child: MaterialButton(
          onPressed: () {
            controller.nextPage();
          },
          child: const Text(
            "Contunue",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ));
  }
}

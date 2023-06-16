import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/onBoardingController.dart';
import '../../../core/constant/consColors.dart';
import '../../../data/dataSources/static/static.dart';

class DotOnBoarding extends StatelessWidget {
  const DotOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
        builder: (controller) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                    onboardingList.length,
                    (index) => AnimatedContainer(
                          margin: const EdgeInsets.only(right: 5),
                          duration: const Duration(milliseconds: 900),
                          width: controller.currentPage == index ? 20 : 5,
                          height: 6,
                          decoration: BoxDecoration(
                              color: ConsColors.primary,
                              borderRadius: BorderRadius.circular(10)),
                        ))
              ],
            ));
  }
}

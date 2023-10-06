import 'package:classRanker/view/widgets/onBoarding/pageViewer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/onBoardingController.dart';
import '../widgets/auth/customButton.dart';
import '../widgets/onBoarding/dotOnBoarding.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    OnBoardingControllerImp controller = Get.put(OnBoardingControllerImp());
    return Scaffold(
        body: Column(
      children: [
        const Expanded(
          flex: 6,
          child: PageViewer(),
        ),
        Expanded(
            flex: 1,
            child: Column(
              children: [
                const DotOnBoarding(),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  text: "Contunue",
                  size: 14,
                  width: 170,
                  height: 45,
                  fontWeight: FontWeight.bold,
                  onPressed: () {
                    controller.nextPage();
                  },
                ),
              ],
            ))
      ],
    ));
  }
}

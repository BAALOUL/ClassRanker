import 'package:ecommerce_store/test.dart';
import 'package:ecommerce_store/view/widgets/onBoarding/pageViewer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/onBoardingController.dart';
import '../widgets/onBoarding/buttonCustom.dart';
import '../widgets/onBoarding/dotOnBoarding.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp);
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
              children: const [
                DotOnBoarding(),
                SizedBox(
                  height: 20,
                ),
                CustomButtonOnBoarding(),
              ],
            ))
      ],
    ));
  }
}

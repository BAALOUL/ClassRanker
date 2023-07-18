import 'package:ecommerce_store/controller/onBoardingController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/dataSources/static/static.dart';

class PageViewer extends GetView<OnBoardingControllerImp> {
  const PageViewer({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return PageView.builder(
        controller: controller.pageController,
        onPageChanged: (value) {
          controller.onChangePage(value);
        },
        itemCount: onboardingList.length,
        itemBuilder: ((context, i) => Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Image.asset(
                  "${onboardingList[i].image}",
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text("${onboardingList[i].title}",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline2),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text("${onboardingList[i].content}",
                    style: Theme.of(context).textTheme.bodyText2),
              ],
            )));
  }
}

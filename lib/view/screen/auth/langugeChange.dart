import 'package:ecommerce_store/core/constant/consRoutes.dart';
import 'package:ecommerce_store/core/localization/localizationController.dart';
import 'package:ecommerce_store/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LangugeChange extends GetView<LocalizationController> {
  const LangugeChange({super.key});

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();
    String? mode = myServices.sharedPreferences.getString("mode");
    return Scaffold(
      body: Container(
        height: 1000,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Choose language".tr,
              style: Theme.of(context).textTheme.headline1,
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                InkWell(
                  onTap: () {
                    controller.changeLanguage("en");
                    switch (mode) {
                      case "":
                        Get.offAllNamed(ConsRoutes.homeGuest);
                        break;
                      case "userMode":
                        Get.offAllNamed(ConsRoutes.homeUser);
                        break;
                      case "providerMode":
                        Get.offAllNamed(ConsRoutes.homeProvider);
                        break;
                      default:
                    }
                  },
                  child: Column(
                    children: [
                      SizedBox(
                        height: 111,
                        child: Container(
                          padding: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey[300],
                          ),
                          child: const CircleAvatar(
                            radius: 60,
                            backgroundImage:
                                AssetImage('assets/images/english.png'),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'English'.tr,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                /*CustomButtonLang(
                    title: "Arabic".tr,
                    onPressed: () {
                      controller.changeLanguage("ar");
                      Get.toNamed(ConsRoutes.onBoarding);
                    })*/
                const SizedBox(
                  width: 30,
                ),

                InkWell(
                  onTap: () {
                    controller.changeLanguage("ar");
                    switch (mode) {
                      case "":
                        Get.offAllNamed(ConsRoutes.homeGuest);
                        break;
                      case "userMode":
                        Get.offAllNamed(ConsRoutes.homeUser);
                        break;
                      case "providerMode":
                        Get.offAllNamed(ConsRoutes.homeProvider);
                        break;
                      default:
                    }
                  },
                  child: Column(
                    children: [
                      SizedBox(
                          height: 111,
                          child: Container(
                            padding: const EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey[300],
                            ),
                            child: const CircleAvatar(
                              radius: 60,
                              backgroundImage:
                                  AssetImage('assets/images/Qatar.jpg'),
                            ),
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Text('Arabic'.tr,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ))
                    ],
                  ),
                )

                /*CustomButtonLang(
                  title: "English".tr,
                  onPressed: () {
                    controller.changeLanguage("en");
                    Get.toNamed(ConsRoutes.onBoarding);
                  },
                ),*/
                //MaterialButton(
                //onPressed: () {
                //  Get.to(const TestView());
                //},
                // color: Colors.amber,
                //child: const Text("test"),
                // )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

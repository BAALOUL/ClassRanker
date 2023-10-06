import 'package:classRanker/core/constant/consColors.dart';
import 'package:classRanker/view/widgets/auth/customButton.dart';
import 'package:classRanker/view/widgets/appBar/firstRowController.dart';
import 'package:classRanker/view/widgets/spacingBar.dart';
import 'package:classRanker/view/widgets/titleCustomBig.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/consRoutes.dart';
import '../../core/services/services.dart';
import '../../links.dart';

class FirstRow extends StatelessWidget {
  const FirstRow({Key? key});

  @override
  Widget build(BuildContext context) {
    final FirstRowControllerImp controller = Get.put(FirstRowControllerImp());

    MyServices myServices = Get.find();
    String? savedLang = myServices.sharedPreferences.getString("lang");
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Image.asset('assets/screens/sections/bells.png'),
            onPressed: () {},
          ),
          //const Spacer(), // Adds flexible space between icons

          GetBuilder<FirstRowControllerImp>(
            builder: (controller) {
              String text;
              switch (controller.mode) {
                case 'userMode':
                  text = savedLang == "en" ? 'User' : 'مستخدم';
                  break;
                case 'providerMode':
                  text = savedLang == "en" ? 'Provider' : 'مقدم خدمة';
                  break;
                default:
                  text = savedLang == "en" ? 'Guest' : 'ضيف';
                  break;
              }
              return Text(
                text,
                style: TextStyle(
                  color: ConsColors.blue,
                  fontSize: savedLang == 'en' ? 13 : 16,
                ),
              );
            },
          ),

          InkWell(
              onTap: () {
                Get.bottomSheet(
                  Container(
                      height: 300,
                      padding: const EdgeInsets.all(15),
                      decoration: const BoxDecoration(
                        color: ConsColors.blueWhite,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Center(child: GetBuilder<FirstRowControllerImp>(
                          builder: (controller) {
                        switch (controller.mode) {
                          case 'guestMode':
                            return const guestMode();
                          case 'userMode':
                            return const userMode();
                          case 'providerMode':
                            return const providerMode();
                          default:
                            return const guestMode();
                        }
                      }))),
                );
              },
              child: GetBuilder<FirstRowControllerImp>(
                builder: (controller) => Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey, width: 1),
                  ),
                  child: CircleAvatar(
                    backgroundImage:
                        controller.providerImg.isEmpty || controller.mode == ""
                            ? const AssetImage(
                                'assets/screens/sections/account.png',
                              )
                            : NetworkImage(
                                '${Links.providers}/${controller.providerImg}',
                              ) as ImageProvider<Object>?,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}

class guestMode extends StatelessWidget {
  const guestMode({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleCustomBig(
          title:
              "Please register to benefit from the application's services.".tr,
          size: 15,
        ),
        const SizedBox(
          height: 20,
        ),
        CustomButton(
          text: "Create your account".tr,
          width: 300,
          onPressed: () {
            Get.toNamed(ConsRoutes.loginScrren);
          },
        )
      ],
    );
  }
}

class userMode extends StatelessWidget {
  const userMode({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleCustomBig(
          title:
              'You have not a provider account.\n do you want to create it now ?'
                  .tr,
          size: 15,
        ),
        const SizedBox(
          height: 20,
        ),
        CustomButton(
          text: "Create provider account".tr,
          width: 300,
          onPressed: () {
            // Get.toNamed(ConsRoutes.providerAcountWelcome);
          },
        )
      ],
    );
  }
}

class providerMode extends StatelessWidget {
  const providerMode({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleCustomBig(
          title: 'do you want to update your provider profile now'.tr,
          size: 15,
        ),
        const SizedBox(
          height: 20,
        ),
        CustomButton(
          text: "Update your personal".tr,
          width: 270,
          height: 40,
          size: 16,
          iconAssetPath: 'assets/screens/sections/infosUpdate.png',
          onPressed: () {
            // Get.toNamed(ConsRoutes.providerInfosScreen, arguments: {});
          },
        ),
        const SpacingBar(),
        CustomButton(
          text: "Update your photo".tr,
          width: 270,
          height: 40,
          size: 16,
          iconAssetPath: 'assets/screens/sections/photoUpdate.png',
          onPressed: () {
            // Get.toNamed(ConsRoutes.providerImageZoneScreen, arguments: {});
          },
        ),
        const SpacingBar(),
        CustomButton(
          text: "Update your services".tr,
          width: 270,
          height: 40,
          size: 16,
          iconAssetPath: 'assets/screens/sections/servicesUpdate.png',
          onPressed: () {
            // Get.toNamed(ConsRoutes.providerServicesUpdateScreen, arguments: {});
          },
        )
      ],
    );
  }
}


/*

                      
                        child: controller.mode != "providerMode"
                            ? Column(
                                children: [
                                  const TitleCustomBig(
                                    title:
                                        'You have not a provider account.\n do you want to create it now ?',
                                    size: 15,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  CustomButton(
                                    text: "Create provider account",
                                    width: 300,
                                    onPressed: () {
                                      Get.toNamed(
                                          ConsRoutes.providerAcountWelcome);
                                    },
                                  )
                                ],
                              )
                            : Column(
                                children: [
                                  const TitleCustomBig(
                                    title:
                                        ' do you want to update \n your provider profile now ?',
                                    size: 15,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  CustomButton(
                                    text: "Update your personal",
                                    width: 270,
                                    height: 40,
                                    size: 16,
                                    iconAssetPath:
                                        'assets/screens/sections/infosUpdate.png',
                                    onPressed: () {
                                      Get.toNamed(
                                          ConsRoutes.providerInfosScreen,
                                          arguments: {});
                                    },
                                  ),
                                  const SpacingBar(),
                                  CustomButton(
                                    text: "Update your photo",
                                    width: 270,
                                    height: 40,
                                    size: 16,
                                    iconAssetPath:
                                        'assets/screens/sections/photoUpdate.png',
                                    onPressed: () {
                                      Get.toNamed(
                                          ConsRoutes.providerImageZoneScreen,
                                          arguments: {});
                                    },
                                  ),
                                  const SpacingBar(),
                                  CustomButton(
                                    text: "Update your services",
                                    width: 270,
                                    height: 40,
                                    size: 16,
                                    iconAssetPath:
                                        'assets/screens/sections/servicesUpdate.png',
                                    onPressed: () {
                                      Get.toNamed(
                                          ConsRoutes
                                              .providerServicesUpdateScreen,
                                          arguments: {});
                                    },
                                  )
                                ],
                              )*/
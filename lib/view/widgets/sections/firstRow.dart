import 'package:ecommerce_store/core/constant/consColors.dart';
import 'package:ecommerce_store/view/widgets/auth/customButton.dart';
import 'package:ecommerce_store/view/widgets/sections/firstRowController.dart';
import 'package:ecommerce_store/view/widgets/spacingBar.dart';
import 'package:ecommerce_store/view/widgets/titleCustomBig.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/consRoutes.dart';
import '../../../core/services/services.dart';
import '../../../links.dart';

class FirstRow extends StatelessWidget {
  const FirstRow({Key? key});

  @override
  Widget build(BuildContext context) {
    final FirstRowControllerImp controller = Get.put(FirstRowControllerImp());
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          IconButton(
            icon: Image.asset('assets/screens/sections/bells.png'),
            onPressed: () {},
          ),
          const Spacer(), // Adds flexible space between icons
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
                  child: Center(
                      child: controller.providerImg.isEmpty
                          ? Column(
                              children: const [
                                TitleCustomBig(
                                  title:
                                      'You have not a provider account.\n do you want to create it now ?',
                                  size: 15,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                CustomButton(
                                  text: "Create provider account",
                                  width: 300,
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
                                  width: 300,
                                  height: 40,
                                  size: 16,
                                  onPressed: () {
                                    Get.toNamed(ConsRoutes.providerInfosScreen,
                                        arguments: {});
                                  },
                                ),
                                const SpacingBar(),
                                CustomButton(
                                  text: "Update your photo",
                                  width: 300,
                                  height: 40,
                                  size: 16,
                                  onPressed: () {
                                    Get.toNamed(
                                        ConsRoutes.providerImageZoneScreen,
                                        arguments: {});
                                  },
                                ),
                                const SpacingBar(),
                                CustomButton(
                                  text: "Update your services",
                                  width: 300,
                                  height: 40,
                                  size: 16,
                                  onPressed: () {
                                    Get.toNamed(
                                        ConsRoutes.providerServicesUpdateScreen,
                                        arguments: {});
                                  },
                                )
                              ],
                            )),
                ),
              );
            },
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey, width: 1),
              ),
              child: CircleAvatar(
                backgroundImage: controller.providerImg.isEmpty
                    ? const AssetImage(
                        'assets/screens/sections/account.png',
                      )
                    : NetworkImage(
                        '${Links.providers}/${controller.providerImg}',
                      ) as ImageProvider<Object>?,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

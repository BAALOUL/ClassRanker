import 'package:classRanker/core/constant/consColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/services/services.dart';
import '../titleCustomBig.dart';
import '../titleCustomSecond.dart';

class GetStartStack extends StatelessWidget {
  const GetStartStack({Key? key});

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();
    String? savedLang = myServices.sharedPreferences.getString("lang");
    return SizedBox(
        // Adjust the height as needed
        child: Stack(
      children: [
        Positioned(
          left: savedLang == 'ar' ? 0 : null,
          right: savedLang == 'ar' ? null : 0,
          top: 0,
          bottom: 0,
          width: Get.size.width * 0.45,
          child: Image.asset(
            'assets/screens/sections/2-4.png', // Replace with your image asset path
            fit: BoxFit.fill,
          ),
        ),
        Align(
          alignment:
              savedLang == "en" ? Alignment.bottomLeft : Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleCustomSecond(title: 'Hi!'.tr),
                TitleCustomBig(
                  title: 'What service do \n you need?'.tr,
                  size: savedLang == 'ar' ? 28 : 24,
                  fontWeight: FontWeight.bold,
                ),
                ElevatedButton(
                  onPressed: () {
                    // Add your onPressed logic here
                  },
                  style: ElevatedButton.styleFrom(
                    primary:
                        ConsColors.yellow, // Set the custom background color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Text(
                    'Get Started'.tr,
                    style: const TextStyle(
                      color: ConsColors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}

import 'package:ecommerce_store/core/constant/consColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/services/sectionController.dart';
import '../titleCustomBig.dart';
import '../titleCustomSecond.dart';

class GetStartStack extends StatelessWidget {
  const GetStartStack({Key? key});

  @override
  Widget build(BuildContext context) {
    final SectionsControllerImp controller = Get.put(SectionsControllerImp());
    return SizedBox(
      height: 250, // Adjust the height as needed
      child: Stack(
        children: [
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            width: Get.size.width * 0.45,
            child: Image.asset(
              'assets/screens/sections/2-4.png', // Replace with your image asset path
              fit: BoxFit.fill,
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleCustomSecond(title: 'Hi! ${controller.username}'),
                  const TitleCustomBig(
                    title: 'What service do \n you need?',
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
                    child: const Text(
                      'Get Started',
                      style: TextStyle(
                        color: ConsColors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

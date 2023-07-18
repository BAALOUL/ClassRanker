import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/services/servicesController.dart';
import '../../../core/services/services.dart';
import '../titleCustomBig.dart';

class ServicesStack extends StatelessWidget {
  const ServicesStack({super.key});

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();
    String? savedLang = myServices.sharedPreferences.getString("lang");
    final ServicesControllerImp controller = Get.put(ServicesControllerImp());
    return SizedBox(
      height: 250, // Adjust the height as needed
      child: Stack(
        children: [
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            width: Get.size.width * 0.5,
            child: Image.asset(
              'assets/screens/services/man.png', // Replace with your image asset path
              fit: BoxFit.fill,
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: Get.size.width * 0.5,
                    child: TitleCustomBig(
                      title: savedLang == "en"
                          ? controller.sectionName + "services".tr
                          : "services".tr + controller.sectionNameAr,
                      size: savedLang == "en" ? 24 : 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

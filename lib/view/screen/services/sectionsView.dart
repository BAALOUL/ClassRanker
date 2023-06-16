import 'package:ecommerce_store/core/class/handlingDataView.dart';
import 'package:ecommerce_store/view/screen/services/showSections.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/services/sectionController.dart';
import '../../../core/shared/appBarCustom.dart';

class SectionsView extends StatelessWidget {
  const SectionsView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SectionsControllerImp());
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<SectionsControllerImp>(
            builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: ListView(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        controller.username,
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 53, 52, 52)),
                      ),
                      const AppBarCustom(),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "or select from sections",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 53, 52, 52)),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const ShowSections(),
                    ],
                  ),
                ))),
      ),
    );
  }
}

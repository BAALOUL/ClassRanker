import 'package:ecommerce_store/core/class/handlingDataView.dart';
import 'package:ecommerce_store/view/screen/services/showSections.dart';
import 'package:ecommerce_store/view/widgets/sections/firstRow.dart';
import 'package:ecommerce_store/view/widgets/textFieldCustom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/services/sectionController.dart';
import '../../../core/constant/consColors.dart';
import '../../widgets/sections/getStartStack.dart';

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
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: ListView(
                    children: [
                      const FirstRow(),
                      const GetStartStack(),
                      //************************** search service********************** */
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: const TextFieldCustom()),
                      //********************end search service *********************************** */
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Text(
                          "or select from sections",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: ConsColors.blue,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: const ShowSections()),
                    ],
                  ),
                ))),
      ),
    );
  }
}

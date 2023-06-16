import 'package:ecommerce_store/controller/homeController/homeController.dart';
import 'package:ecommerce_store/core/class/handlingDataView.dart';
import 'package:ecommerce_store/core/shared/appBarCustom.dart';
import 'package:ecommerce_store/view/screen/home/offerZoneCustom.dart';
import 'package:ecommerce_store/view/screen/home/titleCustom.dart';
import 'package:ecommerce_store/view/screen/services/showSections.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/services/sectionController.dart';

class HomeUser extends StatelessWidget {
  const HomeUser({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SectionsControllerImp());
    return GetBuilder<SectionsControllerImp>(
        builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ListView(
                children: const [
                  AppBarCustom(),
                  OfferZoneCustom(),
                  TitleCustom(
                    title: "Sections",
                  ),
                  //ShowSections(),
                ],
              ),
            )));
  }
}

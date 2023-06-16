// ignore_for_file: unnecessary_const

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_store/controller/properties/propertiesController.dart';
import 'package:ecommerce_store/core/class/handlingDataView.dart';
import 'package:ecommerce_store/core/shared/appBarCustom.dart';
import 'package:ecommerce_store/data/model/propertiesModels.dart';
import 'package:ecommerce_store/view/screen/propertie/customListProperties.dart';
import 'package:ecommerce_store/view/screen/propertie/listCategoriesProperties.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Properties extends StatelessWidget {
  const Properties({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PropertiesControllerImp());
    return Scaffold(
        body: GetBuilder<PropertiesControllerImp>(
      builder: (controller) => Container(
          padding: const EdgeInsets.all(15),
          child: GetBuilder<PropertiesControllerImp>(
            builder: (controller) => ListView(children: [
              const AppBarCustom(),
              const ListCategoriesProperties(),
              HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: GridView.builder(
                      itemCount: controller.properties.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 0.7),
                      itemBuilder: (BuildContext context, index) {
                        return CustomListProperties(
                            propertiesModel: PropertiesModel.fromJson(
                                controller.properties[index]));
                      }))
            ]),
          )),
    ));
  }
}

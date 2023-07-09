import 'package:ecommerce_store/controller/homeController/homeUserController.dart';
import 'package:ecommerce_store/controller/properties/propertiesController.dart';
import 'package:ecommerce_store/core/constant/consColors.dart';
import 'package:ecommerce_store/links.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListCategoriesProperties extends GetView<PropertiesControllerImp> {
  const ListCategoriesProperties({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListView.separated(
          separatorBuilder: (context, index) {
            return const SizedBox(
              width: 15,
            );
          },
          scrollDirection: Axis.horizontal,
          itemCount: controller.categories.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                controller.changeCategories(index);
              },
              child: Column(
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  GetBuilder<PropertiesControllerImp>(
                      builder: (controller) => Container(
                            padding: const EdgeInsets.only(
                                left: 8, right: 8, bottom: 5),
                            // ignore: prefer_const_constructors
                            decoration: index == controller.selectedcat
                                ? const BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            width: 3,
                                            color: ConsColors.secondPrimary)))
                                : null,
                            child: Text(
                              "${controller.categories[index]['name_en_categories']}",
                              style: const TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                          )),
                ],
              ),
            );
          }),
    );
  }
}

import 'package:ecommerce_store/controller/homeController/homeController.dart';
import 'package:ecommerce_store/links.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowCategories extends GetView<HomeControllerImp> {
  const ShowCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
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
                controller.goToProperties(controller.categories, index,
                    controller.categories[index]['name_en_categories']);
              },
              child: Column(
                children: [
                  Container(
                      width: 80,
                      height: 60,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.amber[100],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.network(
                          "${Links.categories}/${controller.categories[index]['image_categories']}")),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "${controller.categories[index]['name_en_categories']}",
                    style: const TextStyle(
                        fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            );
          }),
    );
  }
}

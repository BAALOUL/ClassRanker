import 'package:ecommerce_store/controller/services/categoryController.dart';
import 'package:ecommerce_store/core/class/handlingDataView.dart';
import 'package:ecommerce_store/view/screen/home/titleCustom.dart';
import 'package:ecommerce_store/view/screen/services/showCategory.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CategoryControllerImp());
    return Scaffold(
      body: GetBuilder<CategoryControllerImp>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ListView(
                  children: const [
                    TitleCustom(
                      title: "Categories",
                    ),
                    ShowCategory(),
                  ],
                ),
              ))),
    );
  }
}

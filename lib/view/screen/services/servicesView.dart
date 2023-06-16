import 'package:ecommerce_store/controller/services/servicesController.dart';
import 'package:ecommerce_store/core/class/handlingDataView.dart';
import 'package:ecommerce_store/view/screen/home/titleCustom.dart';
import 'package:ecommerce_store/view/screen/services/showServices.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServicesView extends StatelessWidget {
  const ServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ServicesControllerImp());
    ////print("view");
    return Scaffold(
      body: GetBuilder<ServicesControllerImp>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ListView(
                  children: const [
                    TitleCustom(
                      title: "Services",
                    ),
                    ShowServices(),
                  ],
                ),
              ))),
    );
  }
}

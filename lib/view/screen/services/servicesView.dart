import 'package:ecommerce_store/controller/services/servicesController.dart';
import 'package:ecommerce_store/core/class/handlingDataView.dart';
import 'package:ecommerce_store/view/screen/services/showServices.dart';
import 'package:ecommerce_store/view/widgets/services/servicesStack.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/consColors.dart';
import '../../widgets/sections/firstRowBackArrow.dart';

class ServicesView extends StatelessWidget {
  const ServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ServicesControllerImp());
    ////print("view");
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<ServicesControllerImp>(
            builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: Stack(
                    children: [
                      // Second Container (above the first)
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          color: ConsColors.blueWhite,
                          height: 380,
                          child: Column(
                            children: const [
                              FirstRowBackArrow(),
                              ServicesStack(),
                            ],
                          ),
                        ),
                      ),

                      // First Container
                      Container(
                        padding: const EdgeInsets.all(15),
                        margin: const EdgeInsets.only(top: 315),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                        ), // Adjust the margin as needed
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: Text(
                                "Select service".tr,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: ConsColors.blue,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: const ShowServices(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ))),
      ),
    );
  }
}


/*
Scaffold(
      body: GetBuilder<ServicesControllerImp>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ListView(
                  children: [
                    const FirstRowBackArrow(),
                    const ServicesStack(),
                    const Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "Select service",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: ConsColors.blue,
                        ),
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: const ShowServices()),
                  ],
                ),
              ))),
    );
    */
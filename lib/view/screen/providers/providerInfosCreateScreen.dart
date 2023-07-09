import 'package:ecommerce_store/core/class/handlingDataView.dart';
import 'package:ecommerce_store/core/class/statusRequest.dart';
import 'package:ecommerce_store/core/constant/consRoutes.dart';
import 'package:ecommerce_store/view/screen/providers/controllers/providerInfosCreateController.dart';
import 'package:ecommerce_store/view/widgets/auth/customButton.dart';
import 'package:ecommerce_store/view/widgets/titleCustomBig.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/consColors.dart';
import '../../widgets/sections/firstRowBackArrow.dart';

class ProviderInfosCreateScreen
    extends GetView<ProviderInfosCreatControllerImp> {
  const ProviderInfosCreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProviderInfosCreatControllerImp());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const FirstRowBackArrow(),
          backgroundColor: ConsColors.blueWhite,
          elevation: 0.0,
          automaticallyImplyLeading: false,
        ),
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                color: ConsColors.blueWhite,
                height: 150,
                child: const TitleCustomBig(
                  title: "Provider Informations",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            GetBuilder<ProviderInfosCreatControllerImp>(
              builder: ((controller) => HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: SingleChildScrollView(
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        margin: const EdgeInsets.only(top: 70),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const TitleCustomBig(
                              title: "Arabic name",
                              size: 18,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.grey[200],
                              ),
                              child: TextField(
                                controller: controller.nameArController,
                                decoration: const InputDecoration(
                                  //labelText: 'Name',
                                  border: InputBorder
                                      .none, // Remove the default border
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 16.0),
                                ),
                              ),
                            ),
                            // Rest of the code...

                            const TitleCustomBig(
                              title: "Name",
                              size: 18,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.grey[200],
                              ),
                              child: TextField(
                                controller: controller.nameController,
                                decoration: const InputDecoration(
                                  //labelText: 'Name',
                                  border: InputBorder
                                      .none, // Remove the default border
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 16.0),
                                ),
                              ),
                            ),
                            const TitleCustomBig(
                              title: "Whatsapp",
                              size: 18,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.grey[200],
                              ),
                              child: TextField(
                                controller: controller.whatsappController,
                                decoration: const InputDecoration(
                                  //labelText: 'Name',
                                  border: InputBorder
                                      .none, // Remove the default border
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 16.0),
                                ),
                              ),
                            ),
                            const TitleCustomBig(
                              title: "Website",
                              size: 18,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.grey[200],
                              ),
                              child: TextField(
                                controller: controller.websiteController,
                                decoration: const InputDecoration(
                                  //labelText: 'Name',
                                  border: InputBorder
                                      .none, // Remove the default border
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 16.0),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomButton(
                                  text: "Save     ",
                                  onPressed: () async {
                                    await controller.createProvider();
                                    Get.toNamed(
                                        ConsRoutes.providerImageZoneScreen);
                                  },
                                ),
                              ],
                            ),
                            Obx(() {
                              // Show error message if form is invalid
                              if (controller.showErrorMessage.value) {
                                return const Text('Please fill all fields.');
                              }
                              return const SizedBox.shrink();
                            }),
                          ],
                        ),
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

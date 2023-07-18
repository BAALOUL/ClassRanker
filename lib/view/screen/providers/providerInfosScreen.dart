import 'package:ecommerce_store/core/class/handlingDataView.dart';
import 'package:ecommerce_store/view/widgets/auth/customButton.dart';
import 'package:ecommerce_store/view/widgets/firstRow.dart';
import 'package:ecommerce_store/view/widgets/sections/firstRowBackArrow.dart';
import 'package:ecommerce_store/view/widgets/titleCustomBig.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/consColors.dart';
import 'controllers/providerInfosController.dart';

class ProviderInfosScreen extends GetView<ProviderInfosControllerImp> {
  const ProviderInfosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProviderInfosControllerImp());
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
                child: TitleCustomBig(
                  title: "Provider Informations".tr,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            GetBuilder<ProviderInfosControllerImp>(
                builder: ((controller) => HandlingDataView(
                      statusRequest: controller.statusRequest,
                      widget: Container(
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
                            TitleCustomBig(
                              title: "Arabic name".tr,
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
                            TitleCustomBig(
                              title: "Name".tr,
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
                            TitleCustomBig(
                              title: "Whatsapp".tr,
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
                            TitleCustomBig(
                              title: "Website".tr,
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
                                  text: "Save".tr,
                                  onPressed: () {
                                    print("I am here");
                                    controller.saveProviderInformation();
                                  },
                                ),
                              ],
                            ),
                            Obx(() {
                              // Show error message if form is invalid
                              if (controller.showErrorMessage.value) {
                                return Text('Please fill all fields.'.tr);
                              }
                              return SizedBox.shrink();
                            }),
                          ],
                        ),
                      ),
                    )))
          ],
        ),
      ),
    );
  }
}

import 'package:ecommerce_store/controller/providers/providerByIDController.dart';
import 'package:ecommerce_store/core/class/handlingDataView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Reviews extends GetView<ProviderByIdControllerImp> {
  //final ProviderModel providerModel;
  const Reviews({
    super.key,
    /*required this.providerModel*/
  });

  @override
  Widget build(BuildContext context) {
    ProviderByIdControllerImp controllerImp =
        Get.put(ProviderByIdControllerImp());
    return GetBuilder<ProviderByIdControllerImp>(
        builder: (controller) => HandlingDataView(
            statusRequest: controllerImp.statusRequest,
            widget: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.reviewsList.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage("assets/images/m3.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.star,
                                    color: Colors.yellow, size: 16),
                                const SizedBox(width: 5),
                                Text(
                                  controller.reviewsList[index]['review_rating']
                                      .toString(),
                                  style: const TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Text(
                              controller.reviewsList[index]['review_comment']
                                  .toString(),
                              style: const TextStyle(fontSize: 14),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              controller.reviewsList[index]['review_date']
                                  .toString(),
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            )));
  }
}

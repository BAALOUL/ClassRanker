import 'package:ecommerce_store/data/model/providerModel.dart';
import 'package:ecommerce_store/view/widgets/auth/customButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/providers/providersByServiceController.dart';
import '../../../core/class/handlingDataView.dart';
import '../../../core/constant/consColors.dart';
import '../../../links.dart';
import '../../widgets/sections/firstRowBackArrow.dart';
import '../home/titleCustom.dart';

class ProvidersByServiceView extends GetView<ProviderByServiceControllerImp> {
  const ProvidersByServiceView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ProviderByServiceControllerImp());
    //
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<ProviderByServiceControllerImp>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      color: ConsColors.blueWhite,
                      height: 220,
                      child: Column(
                        children: [
                          const FirstRowBackArrow(),
                          TitleCustom(
                            title: "Providers for ${controller.serviceName}",
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(top: 50, left: 20, right: 20),
                    margin: const EdgeInsets.only(top: 185),
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
                        const Text(
                          "Select your provider",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: ConsColors.blue,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Expanded(
                          child: ListView.separated(
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                                    height: 14), // Add space between tiles
                            itemCount: controller.providersList.length,
                            itemBuilder: (context, index) {
                              final provider = controller.providersList[index];

                              return InkWell(
                                onTap: () {
                                  controller.providerModel =
                                      ProviderModel.fromJson(
                                          controller.providersList[index]);
                                  controller.goToProviderDetails(
                                      controller.providerModel,
                                      controller.serviceName);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: ConsColors.grey,
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      ListTile(
                                        leading: ClipOval(
                                          child: Image.network(
                                            '${Links.providers}/${provider['provider_image']}',
                                            width: 50,
                                            height: 50,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        title: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "${provider['provider_name']}",
                                              style: const TextStyle(
                                                color: ConsColors.blue,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                const Icon(Icons.star,
                                                    color: Colors.yellow),
                                                Text(
                                                    "${provider['provider_rating']}"),
                                              ],
                                            ),
                                          ],
                                        ),
                                        subtitle: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              "The provider",
                                              style: TextStyle(
                                                color: ConsColors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(
                                            left: 15, right: 15, bottom: 8),
                                        child: Text(
                                          "Here we can to insert description about the provider to test the design",
                                          style: TextStyle(
                                            color: ConsColors.blue,
                                            fontSize: 14,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

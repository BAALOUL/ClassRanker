import 'package:ecommerce_store/data/model/providerModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/providers/providersByServiceController.dart';
import '../../../core/class/handlingDataView.dart';
import '../../../links.dart';
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
        body: GetBuilder<ProviderByServiceControllerImp>(
            builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: ListView(
                    children: [
                      TitleCustom(
                        title: "Providers for ${controller.serviceName}",
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.separated(
                          separatorBuilder: (context, index) => const Divider(),
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
                              child: ListTile(
                                leading: ClipOval(
                                  child: Image.network(
                                    '${Links.providers}/${provider['provider_image']}',
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                title: Text("${provider['provider_name']}"),
                                subtitle: Row(
                                  children: const [
                                    Icon(Icons.star, color: Colors.yellow),
                                    Text("5.0"),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ))));
  }
}

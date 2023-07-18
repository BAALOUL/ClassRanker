import 'package:ecommerce_store/controller/providers/providersByServiceController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowProviders extends GetView<ProviderByServiceController> {
  const ShowProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Providers'.tr),
      ),
      body: Text('Providers'.tr),

      /* ListView.separated(
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemCount: controller.providersList.length,
          itemBuilder: (context, index) {
            final provider = controller.providersList[index];
            return ListTile(
              leading: CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(provider.image),
              ),
              title: Text(provider.name),
              subtitle: Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.yellow[700],
                    size: 16,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    provider.rating.toString(),
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
              onTap: () {
                //controller.goToProviderDetails(provider.id);
              },
            );
          },
        )
        */
    );
  }
}

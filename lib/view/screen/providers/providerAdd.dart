import 'package:ecommerce_store/view/screen/providers/widgets/providerInfos.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/providers/providerInformationsController.dart';

class ProviderInformationView
    extends GetView<ProviderInformationControllerImp> {
  const ProviderInformationView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProviderInformationControllerImp());
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text(
                'Choose Services',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: GetBuilder<ProviderInformationControllerImp>(
                  builder: (controller) {
                    return ListView.builder(
                      itemCount: controller.sections.length,
                      itemBuilder: (context, sectionIndex) {
                        final section = controller.sections[sectionIndex];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              section.sectionName,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 5,
                              ),
                              itemCount: section.services.length,
                              itemBuilder: (context, serviceIndex) {
                                final service = section.services[serviceIndex];
                                return GestureDetector(
                                  onTap: () {
                                    controller.selectService(service);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: service.isSelected.value
                                          ? Colors.green
                                          : Colors.grey,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    padding: const EdgeInsets.all(3),
                                    child: SizedBox(
                                      height: 60,
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.check,
                                            color: Colors.white,
                                            size: 16,
                                          ),
                                          const SizedBox(width: 8),
                                          Flexible(
                                            child: Text(
                                              service.servicename,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              maxLines: null, // Allow multiline
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 16),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
              const ProviderInfos(),
              ElevatedButton(
                onPressed: () {
                  controller.saveProviderInformation();
                  //controller.fetchSectionsAndServices();
                  controller.update(); // Manually trigger an update
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

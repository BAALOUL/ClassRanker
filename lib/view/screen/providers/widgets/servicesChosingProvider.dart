import 'package:ecommerce_store/view/widgets/titleCustomBig.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/providers/providerServicesUpdateController.dart';
import '../../../../core/constant/consColors.dart';

class ServicesChosingProvider
    extends GetView<ProviderServicesUpdateControllerImp> {
  const ServicesChosingProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /*
        const TitleCustomBig(
          title: "Choose Services",
          fontWeight: FontWeight.bold,
        ),*/
        GetBuilder<ProviderServicesUpdateControllerImp>(
          builder: (controller) {
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
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
                        crossAxisCount: 2,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        childAspectRatio: 4.3,
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
                                  ? ConsColors.yellow
                                  : ConsColors.blueWhite,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: const EdgeInsets.all(3),
                            child: Center(
                              child: Text(
                                service.servicename,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: ConsColors.blue,
                                  fontSize: 12,
                                ),
                                maxLines: null, // Allow multiline
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
      ],
    );
  }
}

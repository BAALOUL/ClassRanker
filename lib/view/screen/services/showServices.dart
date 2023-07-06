import 'package:ecommerce_store/controller/services/servicesController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/consColors.dart';
import '../../../links.dart';

class ShowServices extends GetView<ServicesControllerImp> {
  const ShowServices({super.key});

  @override
  Widget build(BuildContext context) {
    // //print("view");
    return Container(
      height: Get.size.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: SingleChildScrollView(
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.servicesList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 0.75, // Adjust the aspect ratio as needed
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                controller.geToProviders(
                  controller.servicesList[index]['service_id'],
                  controller.servicesList[index]['service_name'],
                );
              },
              child: ListView(
                children: [
                  SizedBox(
                    height: 100,
                    child: Card(
                      color: ConsColors.blueWhite,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: const BorderSide(
                          color: ConsColors.grey,
                        ), // Set the border color to yellow
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(28),
                        child: Image.network(
                          '${Links.services}/${controller.servicesList[index]['service_image']}',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                      height: 8), // Add spacing between the image and the text
                  Text(
                    "${controller.servicesList[index]['service_name']}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: ConsColors.blue,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );

    /*Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: GridView.builder(
          itemCount: controller.servicesList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                controller.geToProviders(
                    controller.servicesList[index]['service_id'],
                    controller.servicesList[index]['service_name']);
              },
              child: Card(
                color: const Color.fromARGB(45, 210, 84, 139),
                shadowColor: const Color.fromARGB(44, 20, 19, 19),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: controller.servicesList[index]
                                            ['service_image'] !=
                                        null &&
                                    controller
                                        .servicesList[index]['service_image']
                                        .isNotEmpty
                                ? NetworkImage(
                                    "${Links.services}/${controller.servicesList[index]['service_image']}",
                                  )
                                : const AssetImage('assets/images/m5.jpg')
                                    as ImageProvider<Object>,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          textAlign: TextAlign.center,
                          "${controller.servicesList[index]['service_name']}",
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );*/
  }
}

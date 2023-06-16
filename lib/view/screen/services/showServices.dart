import 'package:ecommerce_store/controller/services/servicesController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../links.dart';

class ShowServices extends GetView<ServicesControllerImp> {
  const ShowServices({super.key});

  @override
  Widget build(BuildContext context) {
    // //print("view");
    return Container(
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
    );
  }
}

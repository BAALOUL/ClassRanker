import 'package:ecommerce_store/controller/services/servicesController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowServices extends GetView<ServicesControllerImp> {
  const ShowServices({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListView.separated(
          separatorBuilder: (context, index) {
            return const SizedBox(
              width: 15,
            );
          },
          scrollDirection: Axis.horizontal,
          itemCount: controller.servicesList.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Text(
                  "${controller.servicesList[index]['service_name']}",
                  style: const TextStyle(
                      fontSize: 13, fontWeight: FontWeight.bold),
                ),
              ],
            );
          }),
    );
  }
}

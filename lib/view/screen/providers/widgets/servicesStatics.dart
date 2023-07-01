import 'package:ecommerce_store/core/constant/consColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/providers/providerByIDController.dart';

class ServiceStatics extends GetView<ProviderByIdControllerImp> {
  const ServiceStatics({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //padding: EdgeInsets.symmetric(vertical: 10),
        const Text(
          'Services statistics',
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: ConsColors.blue),
        ),
        const SizedBox(
          height: 8,
        ),
        Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Row(
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Completed successfuly',
                    style: TextStyle(fontSize: 14),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "${controller.providerModel.providercompleted}",
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Row(
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.yellow,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'In progression',
                    style: TextStyle(fontSize: 14),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    '${controller.providerModel.providercurrent}',
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Row(
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Canceled',
                    style: TextStyle(fontSize: 14),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    '${controller.providerModel.providercanceled}',
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

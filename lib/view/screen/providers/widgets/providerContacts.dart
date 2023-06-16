import 'package:ecommerce_store/controller/providers/providerByIDController.dart';
import 'package:ecommerce_store/data/model/providerModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProviderContacts extends GetView<ProviderByIdControllerImp> {
  const ProviderContacts({super.key});

  @override
  Widget build(BuildContext context) {
    late ProviderModel provider = controller.providerModel;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 7,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.grey[600]),
                    const SizedBox(width: 10),
                    const Text(
                      '1234 Main Street, Doha, Qatar',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Row(
                  children: [
                    Icon(Icons.phone, color: Colors.grey[600]),
                    const SizedBox(width: 10),
                    const Text(
                      '(974) 55 33 67 53',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Icon(Icons.message, color: Colors.green),
                    const SizedBox(width: 10),
                    Text(
                      provider.providerwhatsapp.toString(),
                      //'${controller.providerDetailList.first['provider_whatsapp']}',
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Row(
                  children: [
                    Icon(Icons.language, color: Colors.grey[600]),
                    const SizedBox(width: 10),
                    Text(
                      "${controller.providerModel.providerwebsite}",
                      //" ${controller.providerDetailList.first['provider_website']}",
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[300],
            ),
            child: const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/images/person.png'),
            ),
          ),
        ),
      ],
    );
  }
}

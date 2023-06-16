import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/providers/providerInformationsController.dart';

class ProviderInfos extends GetView<ProviderInformationControllerImp> {
  const ProviderInfos({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 30,
        ),
        const Text(
          'Provider infos',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            const CircleAvatar(
              radius: 12,
              backgroundColor: Color.fromARGB(255, 148, 64, 72),
              child: Icon(Icons.person, color: Colors.white, size: 14),
            ),
            const SizedBox(width: 8),
            const SizedBox(width: 80, child: Text("Name")),
            const SizedBox(width: 20),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 120,
                  height: 35,
                  child: TextField(
                    controller: controller.nameController,
                    //keyboardType: TextInputType.number,
                    onChanged: (value) {},
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            const CircleAvatar(
              radius: 12,
              backgroundColor: Color.fromARGB(255, 148, 64, 72),
              child: Icon(Icons.whatsapp, color: Colors.white, size: 14),
            ),
            const SizedBox(width: 8),
            const SizedBox(width: 80, child: Text("WhatsApp")),
            const SizedBox(width: 20),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 120,
                  height: 35,
                  child: TextField(
                    controller: controller.whatsappController,
                    //keyboardType: TextInputType.number,
                    onChanged: (value) {},
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            const CircleAvatar(
              radius: 12,
              backgroundColor: Color.fromARGB(255, 148, 64, 72),
              child: Icon(Icons.public, color: Colors.white, size: 16),
            ),
            const SizedBox(width: 8),
            const SizedBox(width: 80, child: Text("Website")),
            const SizedBox(width: 20),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 120,
                  height: 35,
                  child: TextField(
                    controller: controller.websiteController,
                    //keyboardType: TextInputType.number,
                    onChanged: (value) {},
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Obx(
          () => Visibility(
            visible: controller.showErrorMessage.value,
            child: const Text(
              'Please fill in all fields and select up to 3 services.',
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/services/services.dart';
import '../../../links.dart';

class FirstRowBackArrow extends StatelessWidget {
  const FirstRowBackArrow({super.key});
  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          IconButton(
            icon: Image.asset(
              'assets/screens/sections/arrow.png',
              width: 35,
              height: 35,
            ),
            onPressed: () {
              Get.back(); // Navigate back to the previous screen
            },
          ),
          const Spacer(), // Adds flexible space between icons
          InkWell(
            onTap: () {
              // Handle onTap action
            },
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey, width: 1),
              ),
              child: const CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/screens/sections/account.png')),
            ),
          ),
        ],
      ),
    );
  }
}

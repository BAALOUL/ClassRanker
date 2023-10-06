import 'package:classRanker/view/widgets/auth/customButton.dart';
import 'package:classRanker/view/widgets/appBar/firstRowController.dart';
import 'package:classRanker/view/widgets/spacingBar.dart';
import 'package:classRanker/view/widgets/titleCustomBig.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/consRoutes.dart';
import '../../core/services/services.dart';

class FirstRow extends StatelessWidget {
  const FirstRow({Key? key});

  @override
  Widget build(BuildContext context) {
    final FirstRowControllerImp controller = Get.put(FirstRowControllerImp());

    MyServices myServices = Get.find();
    String? savedLang = myServices.sharedPreferences.getString("lang");
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Image.asset('assets/screens/sections/bells.png'),
            onPressed: () {},
          ),
          const Spacer(), // Adds flexible space between icons

          InkWell(
              onTap: () {},
              child: GetBuilder<FirstRowControllerImp>(
                builder: (controller) => Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey, width: 1),
                  ),
                  child: const CircleAvatar(
                      backgroundImage: AssetImage(
                    'assets/screens/sections/account.png',
                  )),
                ),
              )),
        ],
      ),
    );
  }
}
